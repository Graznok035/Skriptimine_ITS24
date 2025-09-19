#!/bin/bash
# grupp käsureast või vaikimisi "kylaline"
g=${1:-kylaline}

# küsi kasutajanimi
read -rp "Sisesta kasutajanimi: " u

# küsi parool
read -rsp "Sisesta parool (ei kuvata): " p; echo

# kui gruppi pole, loo see
getent group "$g" >/dev/null || groupadd "$kylaline"

# kui kasutaja juba olemas, lõpeta
getent passwd "$u" >/dev/null && { echo "Kasutaja juba olemas."; exit 1; }

# loo kasutaja
useradd -m -s /bin/bash -G "$g" "$u" || exit 1

# pane parool
echo "$u:$p" | chpasswd || exit 1

# loo kataloog
install -d -o "$u" -g "$g" "/home/$u/kataloog"

# kirjuta tervitusfail
echo "Tere tulemast, $u!" > "/home/$u/kataloog/teretulemast_${u}.txt"

# õigused paika
chown "$u:$g" "/home/$u/kataloog/teretulemast_${u}.txt"

# lõputeade
echo "Valmis kasutaja ja fail olemas"
