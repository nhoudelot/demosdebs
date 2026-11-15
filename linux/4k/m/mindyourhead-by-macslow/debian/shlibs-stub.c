/*
 * Stand-in for the dpkg-shlibdeps run of debian/rules.
 *
 * The packed upstream executable has no section header table, so
 * dpkg-shlibdeps cannot read its dynamic symbols ("cannot parse dynamic
 * symbol definition: no symbols") and ${shlibs:Depends} stays empty.
 * This stub needs the same libraries (libdl.so.2, libc.so.6) and imports
 * the same symbols (__libc_start_main, dlopen, dlsym, dlclose): the shlibs
 * computed on it are the ones of the intro. It is not installed.
 *
 * Written by Claude Opus 5.5 <noreply@anthropic.com>, reviewed by Nicolas HOUDELOT.
 */
#include <dlfcn.h>

int main(void)
{
	int ok = 0;
	void *h = dlopen("libSDL2-2.0.so", RTLD_LAZY);

	if (h != 0) {
		ok = dlsym(h, "SDL_Init") != 0;
		dlclose(h);
	}
	return ok;
}
