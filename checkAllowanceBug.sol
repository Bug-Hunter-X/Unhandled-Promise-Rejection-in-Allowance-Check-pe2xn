function checkAllowance(token, owner, spender, amount) {
  return new Promise(async (resolve, reject) => {
    try {
      const allowance = await token.allowance(owner, spender);
      if (allowance.gte(amount)) {
        resolve(true);
      } else {
        reject(new Error('Allowance too low'));
      }
    } catch (error) {
      reject(error);
    }
  });
}