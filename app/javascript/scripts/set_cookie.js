/**
 * Create a cookie with the supplied key:value pair
 *
 * @param {string} key
 * @param {string} value
 */
export default (key, value) => {
  const expires = new Date();
  expires.setTime(expires.getTime() + (24 * 60 * 60 * 1000));
  document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}
