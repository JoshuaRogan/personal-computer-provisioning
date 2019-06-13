function getUUID(url) {
    const VIGNETTE_UUID_REGEX = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/;
    const found = url.match(VIGNETTE_UUID_REGEX);
    return found[0] || '';
}
