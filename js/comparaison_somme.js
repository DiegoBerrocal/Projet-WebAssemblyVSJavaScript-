function iterSum(until) {
    let total = 0;
    while (until > 0) {
        total += until--;
    }
    return total;
}

function recursSum(until) {
    if (until === 1) {
        return 1;
    } else {
        return until + recursSum(until - 1);
    }
}

function main() {
    let result = 0;

    let iterStart = performance.now();
    result = iterSum(150);
    let iterEnd = performance.now();
    let iterNs = iterEnd - iterStart;

    let recursStart = performance.now();
    result = recursSum(150);
    let recursEnd = performance.now();
    let recursNs = recursEnd - recursStart;

    console.log("la fonctions itérative a pris " + iterNs + " millisecondes, la fonction récursive a pris " + recursNs + " millisecondes.");
}

main();
