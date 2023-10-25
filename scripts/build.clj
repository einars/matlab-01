#!/usr/bin/env bb

(require '[clojure.string :as str])
(require '[babashka.process :refer [shell]])
(require '[babashka.fs :as fs])

(def current-image (atom 1))

(defn space-to-br [s]
  (str/replace s "\n\n" "<br>\n"))

(defn run-octave [octave-source]
  (spit "src/.tmp.m" octave-source)
  (->
    (shell {:dir "src", :out :string, :err :out}  "octave .tmp.m")
    :out))

(defn append-file-name [file-name s]
  (if-not file-name
    s
    (str/replace 
      s
      "<div class=\"highlight\">"
      (format "<div class=\"highlight code\"><div class=\"file-name\">%s</div>" file-name))))

(defn format-matlab [s file-name]
  (->>
    (shell {:in s
            :out :string}
      "pygmentize -l octave -f html")
    :out
    str/trim
    (space-to-br)
    (append-file-name file-name)))

(defn run-script [l]
  (let [[_ filename] (str/split l #" ")]
    (str
      (format-matlab (slurp filename) filename)
      (format-matlab (run-octave (slurp filename)) nil))))

(defn run-script-and-insert-plot [l output?]
  (let [[_ filename] (str/split l #" ")
        image-file (format "plot-%d.png" @current-image)
        out (run-octave (format "
%s
print(\"../out/%s\")"
                          (slurp filename)
                          image-file))]
    (swap! current-image inc)
    (format "<div class=\"with-plot\">%s<div class=\"plot\"><img src=\"%s\"></div></div>%s"
      (format-matlab (slurp filename) filename)
      image-file
      (if output? (format-matlab out nil) ""))))


(defn transform-line [l]
  (cond
    (str/starts-with? l "#include") (run-script l)
    (str/starts-with? l "#plot+") (run-script-and-insert-plot l true)
    (str/starts-with? l "#plot ") (run-script-and-insert-plot l false)
    :else l))

(defn parse-special [file]
  (str/join "\n" (mapv transform-line (str/split (slurp file) #"\n"))))

(fs/create-dirs "out")

(->>
  (format "
<html>
<head>
  <meta charset=\"utf-8\">
  <style type=\"text/css\">
%s
%s
  </style>
</head>
<body>
  %s
</body>
</html>
"
    (slurp "./style/main.css")
    (slurp "./style/pygments.css")
    (-> (shell 
          {:out :string, 
           :in (parse-special "./iesk-01.md")} 
          "md2html")
      :out))
  (spit "./out/index.html"))
