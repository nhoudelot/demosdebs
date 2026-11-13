/*
 * Stand-in for the dpkg-shlibdeps run of debian/rules.
 *
 * The upstream executable has no section header table, so dpkg-shlibdeps
 * cannot read its dynamic symbols ("cannot parse dynamic symbol
 * definition: no symbols") and ${shlibs:Depends} stays empty. Besides
 * libSDL-1.2.so.0 and libGL.so.1 (declared by hand in debian/control),
 * the intro needs libc.so.6 and libm.so.6 and imports __libc_start_main
 * and sinf (GLIBC_2.2.5): this stub does the same, so the shlibs computed
 * on it are the ones of the intro. It is not installed.
 *
 * Written by Claude Opus 5.5 <noreply@anthropic.com>, reviewed by Nicolas HOUDELOT.
 */
#include <math.h>

int main(int argc, char **argv)
{
	volatile float x = (float)argc;
	(void)argv;
	return sinf(x) > 2.0f;
}
