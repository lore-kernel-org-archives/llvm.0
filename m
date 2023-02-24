Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF35BA40
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 22:28:31 +0000 (UTC)
Received: from leknes.fjasle.eu ([46.142.98.255]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MGz9p-1pIi6W0NaV-00E2KS; Fri, 24 Feb 2023 23:28:07 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 7165A3C1C6; Fri, 24 Feb 2023 23:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1677277684; bh=Qr9Rh8mEgCS6tzAaiMB4V/R7VMy98bKOrCWpNky4h1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLjzINgZSffBHjbUaC/RDRx5BmBjUD7WpBNoqtUebNguxgATq486EvKbWTyUsdNSq
	 NwYVst+uKDPbmtffF4V6Bk6xV0CfAy1DeuTB0J6keNkPPfyEc4sB+JLnCe2tXCIzbL
	 zRSL2eO/oKMuLZGIm6U6mDuhFukih590oiXYH7HE=
Date: Fri, 24 Feb 2023 23:28:03 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v6 02/12] kbuild: deb-pkg: create source package without
 cleaning
Message-ID: <Y/k581SSyLfe/V9H@fjasle.eu>
References: <20230215012034.403356-1-masahiroy@kernel.org>
 <20230215012034.403356-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QtXaFqz8UY0FWo22"
Content-Disposition: inline
In-Reply-To: <20230215012034.403356-2-masahiroy@kernel.org>
X-Provags-ID: V03:K1:1Aug/5eRU5bhZxZwCsKqTrt4c+eBIAB/YT4uPEGxxfVh+mZRvA9
 xleGHdaXDk7TrhFZhcHyb50aMQsaihSYUnHRMaB7ZwHgF8YUa//LNipkTY0gep1RugBNRtP
 QxwUsAzLnipmAza9xI/xITCyZzpuFDOF4q+G6xAevL1ivQ6Tgf3+KuC2KGyXWQzI9qxMYdF
 eleUyFfH5m/WNkfNGSYAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iSpGjzbC2gw=;2i4S2n3+ypMWMuFFBhIcD2+wHpa
 vMqbSohVg9Xuj1XIlcBFFol/OkUtOves/eCJU3f78/sqrg32MJQ8rTvaOaMcvLTrtj1ND91vY
 cxpbLqIVKtYRukbQNybolLPwDr1Cf7Bvwqy6/S3ktbrHpkLa0VVYXBwptbOuET4cHeAtab3sr
 pJYYySwYftsQ7xsppc+fRtq34GiTwLHEDfhTXVxJHRrLfvvhBheItLzsTia/EsmQ9emZ3Ji0P
 dNPH8+vZ/v2ijhnulqAFXAtc5OFJPI3ETbSUpGAmLQa3WchGgehlkZMp/U8qC4k3leHBqyuAx
 1/JuEE6UKgwcUTwuqAEIwjN6lXNcDIBHZbjUnZlsuR4lbEb0naVS/ZypBhZBkYp3L+e2iC4+5
 Sw+2sGkGOjedE0hXTPIwg+9Za+9oa9MKamW2IRxiSpVk7JmJy7Bv5fvjwv9xyhQam6c6uiXxf
 4K9RYOTCzCIKy69ifak30VcHkXj9n1zvJEW2RL7lV4MUVbJaawaaC/AGR7N2v7D6rSk2Fa5Vn
 khZhb0LEbjWdWEgaegqxF8xM9/M9tjI8gy3YsfwfWLMtvRk/M2HWc5tnPcCeLUyY3jEeW8242
 NS0zaXg1eijZuxAZT05jUdjbz/xmkN66uJIuHQ7KJm4YXLSqDnpAAQqAoiobti9c93LUFbQP9
 RXtyEah22t19hpLvbfa+W02UsWYwPxu11512VgajRw==


--QtXaFqz8UY0FWo22
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 10:20:24AM +0900 Masahiro Yamada wrote:
> If you run 'make deb-pkg', all objects are lost due to 'make clean',
> which makes the incremental builds impossible.
>=20
> Instead of cleaning, pass the exclude list to tar's --exclude-from
> option.
>=20
> Previously, *.diff.gz contained some check-in files such as
> .clang-format, .cocciconfig.
>=20
> With this commit, *.diff.gz will only contain the .config and debian/.
> The other source files will go into the .orig tarball.
>=20
> linux.tar.gz is rebuilt only when the source files that would go into
> the tarball are changed.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
> Changes in v6:
>   - Add more stubs to cmd_tar so I can reuse it for the other rules
>=20
> Changes in v5:
>   - Avoid unneeded rebuild of the tarball when nothing in the source tree
>     is changed.
>=20
> Changes in v4:
>   - Fix a typo in comment
>=20
> Changes in v3:
>   - Add --extra-pattern=3D'*.rej'
>   - Exclude symlinks at the toplevel
>   - Add --sort=3Dname tar option
>=20
>  scripts/Makefile.package | 48 +++++++++++++++++++++++++++++++++++-----
>  scripts/package/mkdebian | 24 ++++++++++++++++++++
>  2 files changed, 66 insertions(+), 6 deletions(-)
>=20
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index dfbf40454a99..f0002ace4156 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -43,13 +43,47 @@ if test "$(objtree)" !=3D "$(srctree)"; then \
>  	echo >&2 "  ERROR:"; \
>  	echo >&2 "  Building source tarball is not possible outside the"; \
>  	echo >&2 "  kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
> -	echo >&2 "  binrpm-pkg or bindeb-pkg target instead."; \
> +	echo >&2 "  binrpm-pkg target instead."; \
>  	echo >&2; \
>  	false; \
>  fi ; \
>  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3)
> =20
> +# .tmp_filelist .tmp_filelist_exclude
> +# ----------------------------------------------------------------------=
-----
> +
> +scripts/list-gitignored: FORCE
> +	$(Q)$(MAKE) -f $(srctree)/Makefile scripts_package
> +
> +# 1f5d3a6b6532e25a5cdf1f311956b2b03d343a48 removed '*.rej' from .gitigno=
re,
> +# but it is definitely a generated file.
> +filechk_filelist =3D \
> +	$< --exclude=3D'*.rej' --output=3D$@_exclude --prefix=3D./ --rootdir=3D=
$(srctree) --stat=3D-
> +
> +.tmp_filelist: scripts/list-gitignored FORCE
> +	$(call filechk,filelist)
> +
> +# tarball
> +# ----------------------------------------------------------------------=
-----
> +
> +quiet_cmd_tar =3D TAR     $@
> +      cmd_tar =3D tar -c -f $@ $(tar-compress-opt) $(tar-exclude-opt) \
> +                --owner=3D0 --group=3D0 --sort=3Dname \
> +                --transform 's:^\.:$*:S' -C $(tar-rootdir) .
> +
> +tar-rootdir :=3D $(srctree)
> +
> +%.tar.gz: private tar-compress-opt :=3D -I $(KGZIP)
> +%.tar.gz:
> +	$(call cmd,tar)
> +
> +# Linux source tarball
> +# ----------------------------------------------------------------------=
-----
> +
> +linux.tar.gz: tar-exclude-opt =3D --exclude=3D./$@ --exclude-from=3D$<_e=
xclude
> +linux.tar.gz: .tmp_filelist
> +
>  # rpm-pkg
>  # ----------------------------------------------------------------------=
-----
>  PHONY +=3D rpm-pkg
> @@ -80,13 +114,12 @@ binrpm-pkg:
>  		$(UTS_MACHINE)-linux -bb $(objtree)/binkernel.spec
> =20
>  PHONY +=3D deb-pkg
> -deb-pkg:
> -	$(MAKE) clean
> +deb-pkg: linux.tar.gz
>  	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> -	$(call cmd,src_tar,$(KDEB_SOURCENAME))
>  	origversion=3D$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> -		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.ori=
g.tar.gz
> -	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG=
_FLAGS) --source-option=3D-sP -i.git -us -uc
> +		cp linux.tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> +	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG=
_FLAGS) \
> +		--build=3Dsource,binary --source-option=3D-sP -nc -us -uc
> =20
>  PHONY +=3D bindeb-pkg
>  bindeb-pkg:
> @@ -174,4 +207,7 @@ help:
>  	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
>  	@echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source tarball'
> =20
> +PHONY +=3D FORCE
> +FORCE:
> +
>  .PHONY: $(PHONY)
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index c3bbef7a6754..68b13ef590ba 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -84,6 +84,8 @@ set_debarch() {
>  	fi
>  }
> =20
> +rm -rf debian
> +
>  # Some variables and settings used throughout the script
>  version=3D$KERNELRELEASE
>  if [ -n "$KDEB_PKGVERSION" ]; then
> @@ -135,6 +137,28 @@ fi
>  mkdir -p debian/source/
>  echo "1.0" > debian/source/format
> =20
> +# Ugly: ignore anything except .config or debian/
> +cat<<'EOF' > debian/source/local-options
> +diff-ignore
> +
> +extend-diff-ignore =3D ^[^.d]
> +
> +extend-diff-ignore =3D ^\.[^c]
> +extend-diff-ignore =3D ^\.c($|[^o])
> +extend-diff-ignore =3D ^\.co($|[^n])
> +extend-diff-ignore =3D ^\.con($|[^f])
> +extend-diff-ignore =3D ^\.conf($|[^i])
> +extend-diff-ignore =3D ^\.confi($|[^g])
> +extend-diff-ignore =3D ^\.config.
> +
> +extend-diff-ignore =3D ^d($|[^e])
> +extend-diff-ignore =3D ^de($|[^b])
> +extend-diff-ignore =3D ^deb($|[^i])
> +extend-diff-ignore =3D ^debi($|[^a])
> +extend-diff-ignore =3D ^debia($|[^n])
> +extend-diff-ignore =3D ^debian[^/]
> +EOF
> +
>  echo $debarch > debian/arch
>  extra_build_depends=3D", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-de=
v:native)"
>  extra_build_depends=3D"$extra_build_depends, $(if_enabled_echo CONFIG_SY=
STEM_TRUSTED_KEYRING libssl-dev:native)"

ah, nice.  When I attempted to build with current Debian amd64 kernel confi=
g,
python3 was missing as build-depencendy (due to some BPF kconfig).

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> --=20
> 2.34.1

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--QtXaFqz8UY0FWo22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmP5OfIACgkQB1IKcBYm
Emkfcw/+KcDu+6uwfWy0e8Sai2Q1NX3fYkaG+pzRE7RmPBjeRlGUnhDknk5MwQly
85qfE21/94CY+DFlUiMBuqqWa0Yq+jcPrIhdSL6gQ5jNYbiKh11QJipmlBpkRqb4
IyCdV1Ad1Qkhf+zQbT8deTo4KKkjeHbskfRaukTr9DPHQT+DrOiSDptC/aP20fI7
JWTM0y3O/en5HFzFyplWy3evUHKDs4T/4FYt3Z/wki2zNK7f8UoM9tt5+QxJxfSa
1mcyn/aguxLOP1rzmxmg/3o5pJ3WeyyjNavtixc1AfnRgQ+PY0wvkTIMie46YoW2
miCwu9Gs2KyuKtgtXKZf57aJSTmD2xSgDadfzIErmYX5mQ8C3cAm1v2Y2tjPohGi
2fffcGzVLr1Xgl1g3sQDN9mf7DA9xMCUCzd1RrVfJ+EuzAy7zmwDgu5+pb2P3LY8
vAB+F+UbmZi92YgwQP0qIBRseiFNUEcvg3SW5m5V9wdHEto8HnBDY2N8AiN+T3Bw
KCle1/hI2BPTSJdv9tybnT7lyHijDDUuPMp6MKu/BR5gXkFDpHKjeGCncRqyPONy
Qv71XA9jLsuBFOk8JYjibuHXtOPhQHnEPXe04rBAU8JzXiEoYiWdQzvT6xhBII4i
+ben9szqRuufqSzAaSztxytMvpBG7sGXq1MNvo3vYf8BFeGlmn8=
=MqnB
-----END PGP SIGNATURE-----

--QtXaFqz8UY0FWo22--
