const arrayPertama = [
    {
        total_keseluruhan: 6,
        total_kelas: {
            "X TO 1": 2,
            "X TM 3": 2,
            "X TO 2": 1,
            "X TM 2": 1,
        },
        jumlah_kelas: 4,
    },
];

const arrayKedua = [
    {
        total_keseluruhan: 4,
        total_kelas: {
            "X TO 1": 1,
            "X TO 2": 1,
            "X TM 2": 1,
            "X TM 3": 1,
        },
        jumlah_kelas: 4,
    },
];

const gabungkanArray = [...arrayPertama, ...arrayKedua];

console.log(gabungkanArray);
