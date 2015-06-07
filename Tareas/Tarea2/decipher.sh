#!/bin/bash
#Método para descifrar
#Se borran los archivos temporales
rm archivo.txt
cat $1 >> archivo.txt

#Se crea el bucle que itere 10 veces.
for i in {1..10}
do
#Se borran archivos temporales
rm a.txt
rm b.txt
rm c.txt
rm d.txt
rm e.txt
rm f.txt
rm g.txt
rm h.txt
rm i.txt
rm j.txt
rm k.txt
rm l.txt
rm m.txt
rm n.txt
rm o.txt
rm p.txt
rm q.txt
rm r.txt
rm s.txt
rm t.txt
rm u.txt
rm v.txt
rm w.txt
rm x.txt
rm y.txt

#Se ejecutan los intercambios de letras al reves de lo que dice la tarea.
./flip.sh z v archivo.txt >> a.txt
./flip.sh y h a.txt >> b.txt
./flip.sh x p b.txt >> c.txt
./flip.sh w u c.txt >> d.txt
./flip.sh v z d.txt >> e.txt
./flip.sh u s e.txt >> f.txt
./flip.sh t f f.txt >> g.txt
./flip.sh s g g.txt >> h.txt
./flip.sh r x h.txt >> i.txt
./flip.sh q e i.txt >> j.txt
./flip.sh p d j.txt >> k.txt
./flip.sh o r k.txt >> l.txt
./flip.sh n m l.txt >> m.txt
./flip.sh m b m.txt >> n.txt
./flip.sh l j n.txt >> o.txt
./flip.sh k a o.txt >> p.txt
./flip.sh j c p.txt >> q.txt
./flip.sh i y q.txt >> r.txt
./flip.sh h k r.txt >> s.txt
./flip.sh g t s.txt >> t.txt
./flip.sh f q t.txt >> u.txt
./flip.sh e o u.txt >> v.txt
./flip.sh d l v.txt >> w.txt
./flip.sh c w w.txt >> x.txt
./flip.sh b n x.txt >> y.txt
./flip.sh a i y.txt > archivo.txt
done

#Se imprime el resultado.
cat archivo.txt
