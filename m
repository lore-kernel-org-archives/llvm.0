Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845BBD34
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 08:22:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id cf42so14817676lfb.1
        for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hKBnKR2iW3XxM9u27njnGJ4qF4jEIutX4Q4b0kirsZs=;
        b=DtAGRxVmOqZbLVSXMFja8IUkY5CHCp8lje31f8iSPCyxDFREP/hcGoSROd5z0xdzSK
         URaUrGZ+WfSmV4xyllpsZTW9Us3hjkKQaOvAwdUrko3CfVrb2psF3rJqnOc9Z6WzlPk5
         Rj/jHSj2/tpqY9FO2R9IgzBzBmlWmVSwKziST8njOqSTTFRNawQ8MijJ82r16K8EEoLa
         SB/yr5/yKC99zcYPPf0jsEwf2wP0YpQ8822gXqnfoFLOJtylOYtvDhJb4Xz7dOHNN3jW
         1cUpnNqeOtuTx762t28xv4959Lb5DIoVv66JS/KhNi5UlIOBH0W0LtCxDxRs45tZABVd
         x3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKBnKR2iW3XxM9u27njnGJ4qF4jEIutX4Q4b0kirsZs=;
        b=fbWj+hVxSulPfqviz1nLAZAn2wS1XLUw16Zyvw/ymRfVq9tVr5KPTP+Gj0Vn9mc6F2
         pL+38LUcL6CO+LeY2dwC+3yPHBVsfMmHUnelVcUIbOYA+MQS98R+G5W1c+NinR/UIcxG
         TEwxCgJ9uY2x97s3DQ4K6G12INm28nMYY05aNCIvN0bNcL2k1em4E/zcViaEFikflDXL
         0ifs/86ORDzboZPKmlLvu4xw5gc7GGZUP8cIZzDqmR6jMjsK20edXK5pRFu/V0aC13bs
         cMYrYtOXHUsVYJYZX14zwHWCNyqDzEnDiPLE6xYEpXdnLB+XmY9pUZipEdle7JDO3PxS
         /zzQ==
X-Gm-Message-State: AFqh2ko5ZclYh5owAqzt8Nama/dMlLxfbTeX48wgEoZOw09c7P/OOSur
	d9YC3NwbDQkotBwH/sgkq+4kI5+NzABXsyR/hcU=
X-Google-Smtp-Source: AMrXdXt3zTUW1/rT8yTMHEqwbBtNV+lMZJT5DHJEzzu6Ci94ZyAmSzzftThcsQZTA5k2MHKNz3OFI8zsWUmhvGclAhA=
X-Received: by 2002:ac2:4c51:0:b0:4a2:2c23:a6d4 with SMTP id
 o17-20020ac24c51000000b004a22c23a6d4mr2822884lfk.257.1674980543255; Sun, 29
 Jan 2023 00:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230128173843.765212-1-masahiroy@kernel.org> <20230128173843.765212-2-masahiroy@kernel.org>
 <CA+icZUWTdAihUVSjEgV2BVOVCktUYccd--9y3bv18PrJDX5nhw@mail.gmail.com> <CAK7LNAQSLCPEKcxJBzaGkR8xMYM0zgQrQOJpYMnodcfjy2vumQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQSLCPEKcxJBzaGkR8xMYM0zgQrQOJpYMnodcfjy2vumQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 29 Jan 2023 09:21:45 +0100
Message-ID: <CA+icZUUT2TpgCSrGZA_tLLq3LmYppOmyxh2o8V6w9B+t-J_CLQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: deb-pkg: create source package without cleaning
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 29, 2023 at 9:08 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Jan 29, 2023 at 8:31 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sat, Jan 28, 2023 at 6:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > If you run 'make deb-pkg', all objects are lost due to 'make clean',
> > > which makes the incremental builds impossible.
> > >
> > > Instead of cleaning, pass the exclude list to tar's --exclude-from
> > > option.
> > >
> > > Previously, *.diff.gz contained some check-in files such as
> > > .clang-format, .cocciconfig.
> > >
> > > With this commit, *.diff.gz will only contain the .config and debian/.
> > > The other source files will go into the tarball.
> > >
> >
> > Thanks for the patch.
> >
> > While at this...
> >
> > ...why not switch over to Debian's packaging default XZ compressor:
> > *.orig.xz and *.diff.xz (or *.debian.tar.xz)?
>
>
> Does debian support *.diff.xz?
> I do not think so.
>
> *.debian.tar.xz requires "Format: 3.0 (quilt)" migration.
>
>
> See scripts/package/mkdebian.
> We use "Format: 1.0", which only supports gzip.
>

Ah OK.

>
> It is true the Debian kernel uses "Format: 3.0 (quilt)",
> but I do not think it will fit to the upstream kernel.
>
> Rather, I want to use the Native format since I do not
> see much sense in the *.orig.tar.gz / *.diff.gz split
> for the upstream project.
>
>
> My plan is to stop cleaning first,
> then change the source format if it is desirable.
>

Yes, makes sense.

-Sedat-

>
>
>
>
> >
> > EXAMPLE binutils:
> >
> > DSC: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40-2.dsc
>
> This is "Format: 3.0 (quilt)".
>
>
> > TAR: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40.orig.tar.xz
> > DIFF: http://deb.debian.org/debian/pool/main/b/binutils/binutils_2.40-2.debian.tar.xz
>
>
> This is not a diff.  It is a tarball of the debian/ directory.
> Real diffs are stored in debian/patches/.
>
>
>
>
>
> >
> > -Sedat-
> >
> > [1] https://packages.debian.org/sid/binutils
> >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/Makefile.package | 27 ++++++++++++++++++++++-----
> > >  scripts/package/mkdebian | 27 +++++++++++++++++++++++++++
> > >  2 files changed, 49 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index dfbf40454a99..cb135c99a273 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -50,6 +50,21 @@ fi ; \
> > >  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> > >         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3)
> > >
> > > +# Source Tarball
> > > +# ---------------------------------------------------------------------------
> > > +
> > > +quiet_cmd_exclude_list = GEN     $@
> > > +      cmd_exclude_list = $(srctree)/scripts/gen-exclude.py --prefix=./ --rootdir=$(srctree) > $@; echo "./$@" >> $@
> > > +
> > > +.exclude-list: FORCE
> > > +       $(call cmd,exclude_list)
> > > +
> > > +quiet_cmd_tar = TAR     $@
> > > +      cmd_tar = tar -I $(KGZIP) -c -f $@ -C $(srctree) --exclude-from=$< --exclude=./$@ --transform 's:^\.:linux:S' .
> > > +
> > > +%.tar.gz: .exclude-list
> > > +       $(call cmd,tar)
> > > +
> > >  # rpm-pkg
> > >  # ---------------------------------------------------------------------------
> > >  PHONY += rpm-pkg
> > > @@ -81,12 +96,11 @@ binrpm-pkg:
> > >
> > >  PHONY += deb-pkg
> > >  deb-pkg:
> > > -       $(MAKE) clean
> > >         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> > > -       $(call cmd,src_tar,$(KDEB_SOURCENAME))
> > > -       origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> > > -               mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> > > -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) --source-option=-sP -i.git -us -uc
> > > +       $(Q)origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> > > +               $(MAKE) -f $(srctree)/scripts/Makefile.package ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> > > +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) \
> > > +               --build=source,binary --source-option=-sP -nc -us -uc
> > >
> > >  PHONY += bindeb-pkg
> > >  bindeb-pkg:
> > > @@ -174,4 +188,7 @@ help:
> > >         @echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
> > >         @echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source tarball'
> > >
> > > +PHONY += FORCE
> > > +FORCE:
> > > +
> > >  .PHONY: $(PHONY)
> > > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > > index c3bbef7a6754..12c057ffbe6e 100755
> > > --- a/scripts/package/mkdebian
> > > +++ b/scripts/package/mkdebian
> > > @@ -84,6 +84,8 @@ set_debarch() {
> > >         fi
> > >  }
> > >
> > > +rm -rf debian
> > > +
> > >  # Some variables and settings used throughout the script
> > >  version=$KERNELRELEASE
> > >  if [ -n "$KDEB_PKGVERSION" ]; then
> > > @@ -135,6 +137,31 @@ fi
> > >  mkdir -p debian/source/
> > >  echo "1.0" > debian/source/format
> > >
> > > +cat<<'EOF' > debian/source/local-options
> > > +#
> > > +# Ugly: ignore anything except .config or debian/
> > > +# (is there a cleaner way to do this?)
> > > +#
> > > +diff-ignore
> > > +
> > > +extend-diff-ignore = ^[^.d]
> > > +
> > > +extend-diff-ignore = ^\.[^c]
> > > +extend-diff-ignore = ^\.c($|[^o])
> > > +extend-diff-ignore = ^\.co($|[^n])
> > > +extend-diff-ignore = ^\.con($|[^f])
> > > +extend-diff-ignore = ^\.conf($|[^i])
> > > +extend-diff-ignore = ^\.confi($|[^g])
> > > +extend-diff-ignore = ^\.config.
> > > +
> > > +extend-diff-ignore = ^d($|[^e])
> > > +extend-diff-ignore = ^de($|[^b])
> > > +extend-diff-ignore = ^deb($|[^i])
> > > +extend-diff-ignore = ^debi($|[^a])
> > > +extend-diff-ignore = ^debia($|[^n])
> > > +extend-diff-ignore = ^debian[^/]
> > > +EOF
> > > +
> > >  echo $debarch > debian/arch
> > >  extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
> > >  extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
> > > --
> > > 2.34.1
> > >
>
>
>
> --
> Best Regards
> Masahiro Yamada
