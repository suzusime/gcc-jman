#!/bin/sh

(echo "@set version-GCC 9.2.0"; \
 if [ "" = "experimental" ]; \
 then echo "@set DEVELOPMENT"; \
 else echo "@clear DEVELOPMENT"; \
 fi) > gcc-vers.texiT
echo @set srcdir `pwd` >> gcc-vers.texiT
if [ -n "(GCC) " ]; then \
  echo "@set VERSION_PACKAGE (GCC) " >> gcc-vers.texiT; \
fi
echo "@set BUGURL @uref{https://gcc.gnu.org/bugs/}" >> gcc-vers.texiT; \
mv -f gcc-vers.texiT gcc-vers.texi
echo timestamp > gcc.pod
perl ./../contrib/texi2pod.pl ./doc/invoke.texi > gcc.pod
echo timestamp > doc/gcc.1
(pod2man -u --center="GNU" --release="gcc-9.2.0" --date=2019-08-12 --section=1 gcc.pod > doc/gcc.1.T$$ && \
        mv -f doc/gcc.1.T$$ doc/gcc.1) || \
        (rm -f doc/gcc.1.T$$ && exit 1)
rm gcc.pod

