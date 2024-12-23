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
      reject(error); // Proper error handling
    }
  }).catch(error => {
    console.error('Allowance check failed:', error);
    // Perform additional error handling or fallback actions here
  });
} 