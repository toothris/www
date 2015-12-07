# Archlinux Archive date.
AA_YEAR='2015'
AA_MONTH='09'
AA_DAY='01'
AA_ROOT='http://ala.seblu.net'

fetch-aur() {
    mkdir -p /toothris-www/setup/aur
    cd /toothris-www/setup/aur
    git clone https://aur.archlinux.org/${1}.git
    cd ${1}
    REV=$(git rev-list -n 1 --before ${AA_YEAR}-${AA_MONTH}-${AA_DAY} master)
    git checkout $REV
}

