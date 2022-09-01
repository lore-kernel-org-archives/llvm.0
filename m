Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194EF6AD6
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 17:04:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b5so23183086wrr.5
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=oGngrFzLbPHH3qcpX426xQbz2Zq5fLl9uof+AvmzULw=;
        b=RzHAodZ0KfK4XEA7ycAzg2OlZ3uB8sINMqOxRB20LZG514UOiQRaz3XhPHkloCZJ2z
         VbgwYvBI5LZQZ72G3Xd5SmlR8Tp/HhsvFo8YcjtdM9+vn4DjpCnX2YQl4OG2ahWVoSq1
         CVoih7eM9S2sxjep1TFBqRN3wn/D551fyzgQwD/6qMNKDoEbBrhna67QTbk8EPAvoH0P
         ANIlsbH8gXCsShVyGBX/UHrHR/9iGoZ+N0nFxCuKdG0WQBEFIPr9GE4HCI+C+nIC6ZAN
         zOq42AB5kE3L0R0kheqyajp4ceCoK30E6TRAH5kuCmX3acAAoj064kAU4SuSbnyA4Tp+
         7Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=oGngrFzLbPHH3qcpX426xQbz2Zq5fLl9uof+AvmzULw=;
        b=wS5BeLqCMQmqdYimLaPrgpjYw9pmW1FQEcbtqKCyQnmDwaKtbuvkXkzKXiSlvcZjeA
         2+R7+lcg7DWByKCqQkXnHg0mIkB80AzWWdz6ktfzX2XapcLm046NvvCxjQUX1n3elWWg
         3pLnUUwFkHmI68xDrcxmycKfohwVRuDWlyXJ7KNGgCN0Ogr1/9AHknUEsFd++ue2XzM/
         mYBgFhd7G2w2UStDsJEcA0IODsPifUGZwoyuZ6Zeo+8X9e3wAmXwbZmy3Uuoj/rLqv1u
         rgHSGVYtCfFnWiJ4mCFs6op5ttr/NI53JMAyTHjDLuir8+JMzbiNgnrVCBSRtrUj3LcP
         nTjg==
X-Gm-Message-State: ACgBeo1e2PcYOb4IgBjOlTka7W6f4ZTlp7oui0ihKpjXsEz+wxfbUV+a
	iLIfC1kqOZultVDYsVYgHKSPgSMeXS26qtpHNK0HBQ==
X-Google-Smtp-Source: AA6agR44zTUIx7vtCBXWJafnXR82UyaMIibutwdIHqvt3nKhdEy7qCanQvYTvTEZHDTCLcQEM98z3W0g3d/Prcy9j6k=
X-Received: by 2002:a5d:4d83:0:b0:226:d08d:35c8 with SMTP id
 b3-20020a5d4d83000000b00226d08d35c8mr15492867wru.4.1662051863098; Thu, 01 Sep
 2022 10:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208311414.4OPuYS9K-lkp@intel.com> <Yw+A+0BY26l0AC5j@dev-arch.thelio-3990X>
 <b0b8fecd-4041-d04e-9a11-2c7947e5d5a0@intel.com> <YxAS9NBjBI/vi0XK@dev-arch.thelio-3990X>
 <8d2c3aef-aa4f-1f4d-dc89-622554ffda31@intel.com> <9d77cb93-2eff-d87d-6554-1636d5e7d5ec@csgroup.eu>
 <0acfb209-a792-a47b-0261-9fb29824e4b9@intel.com> <YxDj6v5p+wHop0Wm@dev-arch.thelio-3990X>
In-Reply-To: <YxDj6v5p+wHop0Wm@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 1 Sep 2022 10:04:11 -0700
Message-ID: <CAKwvOdmzuupyAMhy-jT3O=-PT36T01N4SXkCPz6Cv0CPsxkK3Q@mail.gmail.com>
Subject: Re: [kbuild-all] Re: powerpc-linux-objdump: Warning: Unrecognized
 form: 0x23
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Chen, Rong A" <rong.a.chen@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 1, 2022 at 9:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Sep 01, 2022 at 01:52:42PM +0800, Chen, Rong A wrote:
> >
> >
> > On 9/1/2022 1:45 PM, Christophe Leroy wrote:
> > >
> > >
> > > Le 01/09/2022 =C3=A0 06:59, Chen, Rong A a =C3=A9crit :
> > > >
> > > >
> > > > On 9/1/2022 10:03 AM, Nathan Chancellor wrote:
> > > > > Hi Rong,
> > > > >
> > > > > On Thu, Sep 01, 2022 at 09:15:58AM +0800, Chen, Rong A wrote:
> > > > > >
> > > > > >
> > > > > > On 8/31/2022 11:40 PM, Nathan Chancellor wrote:
> > > > > > > On Wed, Aug 31, 2022 at 02:52:36PM +0800, kernel test robot w=
rote:
> > > > > > > > tree:
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > > > > > > > master
> > > > > > > > head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
> > > > > > > > commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.de=
bug:
> > > > > > > > make DEBUG_INFO selectable from a choice
> > > > > > > > date:   5 months ago
> > > > > > > > config: powerpc-buildonly-randconfig-r003-20220830
> > > > > > > > (https://download.01.org/0day-ci/archive/20220831/202208311=
414.4OPuYS9K-lkp@intel.com/config)
> > > > > > > > compiler: clang version 16.0.0
> > > > > > > > (https://github.com/llvm/llvm-project
> > > > > > > > c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
> > > > > > > > reproduce (this is a W=3D1 build):
> > > > > > > >            wget
> > > > > > > > https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
> > > > > > > >            chmod +x ~/bin/make.cross
> > > > > > > >            # install powerpc cross compiling tool for clang=
 build
> > > > > > > >            # apt-get install binutils-powerpc-linux-gnu
> > > > > > > >            #
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Df9b3cd24578401e7a392974b3353277286e49cee
> > > > > > > >            git remote add linus
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > > > > > > >            git fetch --no-tags linus master
> > > > > > > >            git checkout f9b3cd24578401e7a392974b3353277286e=
49cee
> > > > > > > >            # save the config file
> > > > > > > >            mkdir build_dir && cp config build_dir/.config
> > > > > > > >            COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dcl=
ang
> > > > > > > > make.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/=
bash
> > > > > > > >
> > > > > > > > If you fix the issue, kindly add following tag where applic=
able
> > > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > >
> > > > > > > > All warnings (new ones prefixed by >>):
> > > > > > > >
> > > > > > > > > > powerpc-linux-objdump: Warning: Unrecognized form: 0x23
> > > > > > >
> > > > > > > Given this is clang 16.0.0 with
> > > > > > > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy, which uses DWA=
RF5 by
> > > > > > > default instead of DWARF4, it looks like older binutils not
> > > > > > > understanding DWARF5. What version of binutils is being used =
by the
> > > > > > > bot?
> > > > > >
> > > > > > Hi Nathan,
> > > > > >
> > > > > > We're using binutils v2.38.90.20220713-2
> > > > > >
> > > > > > ||/ Name           Version            Architecture Description
> > > > > > +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > ii  binutils       2.38.90.20220713-2 amd64        GNU assemble=
r,
> > > > > > linker and binary utilities
> > > > >
> > > > > Thanks for chiming in! This looks like the output of 'dpkg -l', r=
ight? I
> > > >
> > > > Hi Nathan,
> > > >
> > > > oh, yes, I misunderstood, it's not related to this package.
> > > >
> > > > > noticed on second glance that the tuple for the objdump warning a=
bove is
> > > > > 'powerpc-linux-', which leads me to believe that a kernel.org too=
lchain
> > > > > (or a self compiled one) is being used. I would expect the tuple =
to be
> > > > > 'powerpc-linux-gnu-' if Debian's package was being used. Is that
> > > > > possible?
> > > >
> > > > you are right, we used a self-compiled toolchain, we'll try the bin=
utils
> > > > from debian package.
> > >
> > > Can you first tell us the version you are using ?
> > >
> > >     powerpc-linux-objdump -v
> > >
> > > That will tell you the version.
> >
> > Hi Christophe,
> >
> > the version is v2.38:
> >
> > $ ./powerpc-linux-objdump -v
> > GNU objdump (GNU Binutils) 2.38
> > Copyright (C) 2022 Free Software Foundation, Inc.
> > This program is free software; you may redistribute it under the terms =
of
> > the GNU General Public License version 3 or (at your option) any later
> > version.
> > This program has absolutely no warranty.
>
> Thanks! I did some research and it seems like this warning is expected
> with binutils older than 2.39. The warning appears to come from
> read_and_display_attr_value() in binutils/dwarf.c. 0x22 and 0x23 are
> DW_FORM_loclistx and DW_FORM_rnglistx, which were only recently
> supported in that function.
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D28981
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D19c26da69d=
68d5d863f37c06ad73ab6292d02ffa
>
> That change shipped in binutils 2.39. I am not really sure how we should
> work around this in the kernel, other than maybe requiring binutils
> 2.39+ for CONFIG_DEBUG_INFO_DWARF5. Unfortunately, that will not fix
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT when DWARF5 is the default
> version...

I've been working on a series that will encode the default implicit
dwarf version based on compiler version check. Maybe that can be
extended/reused here once that lands?
https://lore.kernel.org/llvm/20220831184408.2778264-1-ndesaulniers@google.c=
om/
Series needs revision, but it's on the right track.

> Alternatively, switching to llvm-objdump for clang builds
> would help :) I am not aware of any issues that would affect that switch
> for PowerPC:
>
> https://github.com/ClangBuiltLinux/linux/labels/%5BTOOL%5D%20llvm-objdump

Oh, is 0day doing `make CC=3Dclang` rather than `make LLVM=3D1`?  Rong,
any chance we get 0day folks to test LLVM=3D1 for more architectures?
Ideally we'd test both, preferably LLVM=3D1 if we had to choose.

>
> Cheers,
> Nathan



--=20
Thanks,
~Nick Desaulniers
