#!/bin/bash -e

# Install Clojure 1.9.0-alpha14
echo "================= Installing Clojure-1.8.0 ==================="
sudo wget http://repo1.maven.org/maven2/org/clojure/clojure/1.9.0-alpha14/clojure-1.9.0-alpha14.zip
sudo unzip clojure-1.9.0-alpha14.zip
mkdir $HOME/lib && cp clojure-1.9.0-alpha14/clojure-1.9.0-alpha14.jar $HOME/lib
sudo rm -rf clojure-1.9.0-alpha14*
cat >/usr/local/bin/clj <<EOF
#!/bin/bash
if [[ $# -eq 0 ]]; then
  java -server -cp $HOME/lib/clojure-1.9.0-alpha14.jar clojure.main
else
  java -server -cp $HOME/lib/clojure-1.9.0-alpha14.jar clojure.main $1 -- "$@"
fi
EOF
sudo chmod a+x /usr/local/bin/clj
