import jstz from 'jstz';
import setCookie from './set_cookie';

export default () => {
  const oldIntl = window.Intl;

  try {
    window.Intl = undefined;
    const tz = jstz.determine().name();
    window.Intl = oldIntl;
    setCookie('timezone', tz);
  } catch (e) {
    // sometimes (on android) you can't override intl
    setCookie('timezone', jstz.determine().name());
  }
}
