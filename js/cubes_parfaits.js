function main() {
  const max = 1500;
  const lim = Math.cbrt(max);
  console.log("Cubes parfaits en bas de 1500");
  for (let i = 1; i < lim; i++) {
      console.log(`${i} ^ 3  : ${String(i ** 3).padStart(3, '0')}`);
  }
}
main();
