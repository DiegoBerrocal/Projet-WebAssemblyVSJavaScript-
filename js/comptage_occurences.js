class RepeatedStr {
    constructor(literal, factor) {
        this.pattern = literal;
        this.repeat = factor;
        this.patternSize = this.pattern.length;
        this.data = this.makeRepeat(this.pattern, this.patternSize, this.repeat);
    }

    makeRepeat(base, baseSize, factor) {
        let totalSize = factor * baseSize;
        let newString = '';
        for (let i = 0; i < totalSize; i += baseSize) {
            newString += base;
        }
        return newString;
    }

    size() {
        return this.repeat * this.patternSize;
    }

    get(index) {
        return this.data.charAt(index);
    }

    destroy() {
        this.data = '';
    }
}

function countPatternsTest(factor) {
    const PATT = '$$$@';
    const SPATT = '$$$';
    let total = 0;
    let s = new RepeatedStr(PATT, factor);
    for (let i = 0; i < s.size() - 2; i++) {
        if (s.get(i) === SPATT[0] && s.get(i + 1) === SPATT[1] && s.get(i + 2) === SPATT[2]) {
            total++;
        }
    }
    s.destroy();
    return total;
}

function main() {
    const times = 20;
    let total = 0.0;
    for (let j = 0; j < times; j++) {
        let countStart = performance.now();
        countPatternsTest(50);
        let countEnd = performance.now();
        total += countEnd - countStart;
    }
    let averaged = total / times;
    console.log(`le test à été exécuté ${times}  fois avec une moyenne de ${averaged.toFixed(3)} ms`);
}

main();