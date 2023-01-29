Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A49BD33
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 08:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9C7C4339E
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674979690;
	bh=Do6LjpDaodPNp3HrcKOeUhxTwV4BHrDlrnMcJaSM8oA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mRnl76Mq/10OoUB6LEQa8t0m6l6m+T8J+3WIBy9kPIXwTP0A8ShLCLHGTRmRNhCI4
	 T6Z4zD5K2BLMp9O9lur/7Khqpp5JPRyqMUknYpKUTH0gjMdbsnAqr+Fv+leTi+UXfL
	 h/Fk1dsjkAYbzACHqctrCWEtv1TYaqxbI3CtE9XhSKfjyptddY3AQV9BMtQOKNNIw5
	 21Ec+OBNPYW/bk01V3gmUtxLXRjfZazPSS8FV3eCukXq9Lp/d1IklSoxpCfjUkhXdR
	 QMcAna1s/4xV+1PYv5diW/RT9nlcqHzJgTMcMCkTAdA1509MxFpGL2iQ/aLHvKExAf
	 JhGD1TNr4jolQ==
Received: by mail-ot1-f49.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so229327oty.7
        for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 00:08:09 -0800 (PST)
X-Gm-Message-State: AFqh2koUgkZfHwexlrDCIdPP0VeiRUEOrdmajvBA6RapvimhuOb+th2V
	Y5P8W4cKe6OsB/HMeLHpUVZl/S2XsJfBIxS+ctA=
X-Google-Smtp-Source: AMrXdXsbioBwFqbi/k/WVph3+5mklCpGoxSAOdLuObXPAvcluduHxNT8e3ZXQwmgTclQY9jX4DmVMReLFqH9x8sBSsE=
X-Received: by 2002:a9d:7446:0:b0:686:8d12:772a with SMTP id
 p6-20020a9d7446000000b006868d12772amr2159668otk.153.1674979689159; Sun, 29
 Jan 2023 00:08:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230128173843.765212-1-masahiroy@kernel.org> <20230128173843.765212-2-masahiroy@kernel.org>
 <CA+icZUWTdAihUVSjEgV2BVOVCktUYccd--9y3bv18PrJDX5nhw@mail.gmail.com>
In-Reply-To: <CA+icZUWTdAihUVSjEgV2BVOVCktUYccd--9y3bv18PrJDX5nhw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Jan 2023 17:07:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSLCPEKcxJBzaGkR8xMYM0zgQrQOJpYMnodcfjy2vumQ@mail.gmail.com>
Message-ID: <CAK7LNAQSLCPEKcxJBzaGkR8xMYM0zgQrQOJpYMnodcfjy2vumQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: deb-pkg: create source package without cleaning
To: sedat.dilek@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 29, 2023 at 8:31 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sat, Jan 28, 2023 at 6:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > If you run 'make deb-pkg', all objects are lost due to 'make clean',
> > which makes the incremental builds impossible.
> >
> > Instead of cleaning, pass the exclude list to tar's --exclude-from
> > option.
> >
> > Previously, *.diff.gz contained some check-in files such as
> > .clang-format, .cocciconfig.
> >
> > With this commit, *.diff.gz will only contain the .config and debian/.
> > The other source files will go into the tarball.
> >
>
> Thanks for the patch.
>
> While at this...
>
> ...why not switch over to Debian's packaging default XZ compressor:
> *.orig.xz and *.diff.xz (or *.debian.tar.xz)?


Does debian support *.diff.xz?
I do not think so.

*.debian.tar.xz requires "Format: 3.0 (quilt)" migration.


See scripts/package/mkdebian.
We use "Format: 1.0", which only supports gzip.


It is true the Debian kernel uses "Format: 3.0 (quilt)",
but I do not think it will fit to the upstream kernel.

Rather, I want to use the Native format since I do not
see much sense in the *.orig.tar.gz / *.diff.gz split
for the upstream project.


My plan is to stop cleaning first,
then change the source format if it is desirable.





>
> EXAMPLE binutils:
>
> DSC: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40-2.dsc

This is "Format: 3.0 (quilt)".


> TAR: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40.orig.tar.xz
> DIFF: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40-2.debian.tar.xz


This is not a diff.  It is a tarball of the debian/ directory.
Real diffs are stored in debian/patches/.





>
> -Sedat-
>
> [1] https://packages.debian.org/sid/binutils
>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.package | 27 ++++++++++++++++++++++-----
> >  scripts/package/mkdebian | 27 +++++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index dfbf40454a99..cb135c99a273 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -50,6 +50,21 @@ fi ; \
> >  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> >         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3)
> >
> > +# Source Tarball
> > +# ---------------------------------------------------------------------------
> > +
> > +quiet_cmd_exclude_list = GEN     $@
> > +      cmd_exclude_list = $(srctree)/scripts/gen-exclude.py --prefix=./ --rootdir=$(srctree) > $@; echo "./$@" >> $@
> > +
> > +.exclude-list: FORCE
> > +       $(call cmd,exclude_list)
> > +
> > +quiet_cmd_tar = TAR     $@
> > +      cmd_tar = tar -I $(KGZIP) -c -f $@ -C $(srctree) --exclude-from=$< --exclude=./$@ --transform 's:^\.:linux:S' .
> > +
> > +%.tar.gz: .exclude-list
> > +       $(call cmd,tar)
> > +
> >  # rpm-pkg
> >  # ---------------------------------------------------------------------------
> >  PHONY += rpm-pkg
> > @@ -81,12 +96,11 @@ binrpm-pkg:
> >
> >  PHONY += deb-pkg
> >  deb-pkg:
> > -       $(MAKE) clean
> >         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> > -       $(call cmd,src_tar,$(KDEB_SOURCENAME))
> > -       origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> > -               mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> > -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) --source-option=-sP -i.git -us -uc
> > +       $(Q)origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> > +               $(MAKE) -f $(srctree)/scripts/Makefile.package ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> > +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) \
> > +               --build=source,binary --source-option=-sP -nc -us -uc
> >
> >  PHONY += bindeb-pkg
> >  bindeb-pkg:
> > @@ -174,4 +188,7 @@ help:
> >         @echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
> >         @echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source tarball'
> >
> > +PHONY += FORCE
> > +FORCE:
> > +
> >  .PHONY: $(PHONY)
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index c3bbef7a6754..12c057ffbe6e 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -84,6 +84,8 @@ set_debarch() {
> >         fi
> >  }
> >
> > +rm -rf debian
> > +
> >  # Some variables and settings used throughout the script
> >  version=$KERNELRELEASE
> >  if [ -n "$KDEB_PKGVERSION" ]; then
> > @@ -135,6 +137,31 @@ fi
> >  mkdir -p debian/source/
> >  echo "1.0" > debian/source/format
> >
> > +cat<<'EOF' > debian/source/local-options
> > +#
> > +# Ugly: ignore anything except .config or debian/
> > +# (is there a cleaner way to do this?)
> > +#
> > +diff-ignore
> > +
> > +extend-diff-ignore = ^[^.d]
> > +
> > +extend-diff-ignore = ^\.[^c]
> > +extend-diff-ignore = ^\.c($|[^o])
> > +extend-diff-ignore = ^\.co($|[^n])
> > +extend-diff-ignore = ^\.con($|[^f])
> > +extend-diff-ignore = ^\.conf($|[^i])
> > +extend-diff-ignore = ^\.confi($|[^g])
> > +extend-diff-ignore = ^\.config.
> > +
> > +extend-diff-ignore = ^d($|[^e])
> > +extend-diff-ignore = ^de($|[^b])
> > +extend-diff-ignore = ^deb($|[^i])
> > +extend-diff-ignore = ^debi($|[^a])
> > +extend-diff-ignore = ^debia($|[^n])
> > +extend-diff-ignore = ^debian[^/]
> > +EOF
> > +
> >  echo $debarch > debian/arch
> >  extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
> >  extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
> > --
> > 2.34.1
> >



--
Best Regards
Masahiro Yamada
