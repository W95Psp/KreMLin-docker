opam install -y ocamlbuild ppx_deriving_yojson zarith pprint menhir ulex process fix wasm visitors

cd /home/FStar/FStar/ulib/ml
eval `opam config env`
make

export FSTAR_HOME=/home/FStar/FStar/
export PATH="$PATH:$FSTAR_HOME/bin"

make -C /home/FStar/FStar/ulib

cd /home/FStar/
git clone https://github.com/FStarLang/kremlin
cd kremlin
make
