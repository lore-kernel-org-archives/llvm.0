Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BF1F92A
	for <llvm@lists.linux.dev>; Tue, 30 May 2023 17:09:52 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75ce1196bd7so147942685a.3
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 10:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685466591; x=1688058591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EWuA87ZTwMNaJl1WFYYkO25MGwpDXQ2nj8CcG+i0N8=;
        b=VSrJMLAgG3zmRzmAuMW0ALroD1+sPpD3Sm/OAVL1eJ/U88LUjkwek/BOjQkZMCQlBd
         ZBL4LCXvfkVaLM+e3x/m2oMF0n/1xvLE+Z4/SLjTPn0pNa45238jNsQABYgQAxWj6T3S
         VOAXi+RhfK/6KTmGGhnzai40v6tu1yS+ri+hb+jVFI5lzBLg0QQFEanzgvORtmav3eL4
         u2k5w5+YQkWWSGH7FiOb1YXyVM0Bm8Aox6aOBJMYU4gOfSeVlXeJFbAqLm6O1tdkynBN
         5P3+00i6dKx186Tkatajojp0N//y404eNdO11Tgrd4dhmTFslqnpdVL7MyaFdSfQv1si
         ZLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685466591; x=1688058591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EWuA87ZTwMNaJl1WFYYkO25MGwpDXQ2nj8CcG+i0N8=;
        b=Tck6kW0ZdNo30nUYN+EPWfriHKfvTxKDxd97EKtgQRnfPvdXiLYGFT6ASCklQD32O5
         OQMI/IJ5n1w8K7ZSaLEibkGHpCy5ngoXXg/XIUCtL5DCxTXzvDpBAAKFGjqTjwgP9dJ0
         hcTS+0IzSXkCpb/IC6dszL0zVEmAD5DodioDUO2/DxaxSE88MrIocAcy6uXE5NE4mA+P
         cYyK4JTbG0Y9JrhqrV/rMnF5vpl7oQkUpB3MTXdXDbONzHIPigDZtzBxAUCCBbsPzDGA
         B+Vg0tzbIK8/rRDYaaunXr97nbslj2sGve0QZsTSqOlbgxF5+zoRoKgEefW5ARwNuMel
         yZxA==
X-Gm-Message-State: AC+VfDyOyf6RaRmMYucJTXXRwu/ByoC5+MolUoKU0R7y6GVPn3gPr8Bu
	pQ23287gZ9k6FZa59O8ZfNsGHuGeTpAVBia92wPmgw==
X-Google-Smtp-Source: ACHHUZ5qf003D3TcgrV2zibr2F0VVZtcFD7sbGwHjajxZd/1s2/YAo+qLZC+C/XuLRFzPX11QFVyANFfkzWE1PbSTkY=
X-Received: by 2002:a05:6214:5297:b0:626:2177:319 with SMTP id
 kj23-20020a056214529700b0062621770319mr2561547qvb.21.1685466591389; Tue, 30
 May 2023 10:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305251508.iFEInYVW-lkp@intel.com> <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>
 <20230526152458.GA395537@dev-arch.thelio-3990X> <ZHLRexILH7RVNivQ@rli9-mobl>
In-Reply-To: <ZHLRexILH7RVNivQ@rli9-mobl>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 May 2023 10:09:40 -0700
Message-ID: <CAKwvOdmBMeOUxAzYu0Q13sGsS6-_cVFBtQsnFgjoSfc_kHE14g@mail.gmail.com>
Subject: Re: [stable:linux-4.19.y 984/6017] ld.lld: error: drivers/usb/dwc2/platform.o:
 contains a compressed section, but zlib is not available
To: Philip Li <philip.li@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Keeping <john@metanate.com>, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 8:59=E2=80=AFPM Philip Li <philip.li@intel.com> wro=
te:
>
> On Fri, May 26, 2023 at 08:24:58AM -0700, Nathan Chancellor wrote:
> > On Thu, May 25, 2023 at 02:21:24PM -0700, Nick Desaulniers wrote:
> > > On Thu, May 25, 2023 at 12:44=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x-stable.git linux-4.19.y
> > > > head:   3f57fb8b1bd06b277556601133823bec370d723f
> > > > commit: c964b1bbf179a163084b1ec8ad094b8c8dce28c8 [984/6017] usb: dw=
c2: hcd_queue: Fix use of floating point literal
> > > > config: x86_64-randconfig-x093-20230524
> > > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-projec=
t f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > > reproduce (this is a W=3D1 build):
> > > >         mkdir -p ~/bin
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/li=
nux-stable.git/commit/?id=3Dc964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > > >         git remote add stable https://git.kernel.org/pub/scm/linux/=
kernel/git/stable/linux-stable.git
> > > >         git fetch --no-tags stable linux-4.19.y
> > > >         git checkout c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/m=
ake.cross W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/m=
ake.cross W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/usb/
> > > >
> > > > If you fix the issue, kindly add following tag where applicable
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305251508.iFEInY=
VW-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > >
> > > Hmmm...that's surprising to see on 4.19.  I didn't add support for
> > > compressed debug info until:
> > >
> > > commit 10e68b02c861 ("Makefile: support compressed debug info")
> > >
> > > which landed in v5.8-rc1 and AFAIK was never backported.
> > >
> > > I wasn't able to reproduce this with ToT LLVM (clang-17); I wonder if
> > > this is an issue with clang-14?
>
> Hi Nathan, we will double check whether it is clang-14 specific. For now,
> I use the the reproduce steps which can't reproduce this yet, even by run=
ning
>
>         $ COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash
>
> The clang version downloaded by reproduce step is clang-16, which
> can't reproduce

Hi Philip,
Is it possible that perhaps on your test machine that you're
attempting to reproduce, you have zlib installed, but some of the
automation machines on which the bot runs do not?

>
> $ ~/0day/clang/bin/clang --version
> clang version 16.0.0 (git://gitmirror/llvm_project 8d9828ef5aa9688500657d=
36cd2aefbe12bbd162)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
>
> >
> > Something I was thinking about yesterday is that binutils has a bunch o=
f
> > configure flags to control default behavior and one of those is
> > compressed debug sections on by default:
> >
> >   --enable-compressed-debug-sections=3D{all,gas,gold,ld,none}
> >                           Enable compressed debug sections for gas, gol=
d or ld
> >                           by default
> >
> > Is it possible that the version of binutils that the kernel test robot
> > uses has compressed debug sections enabled by default for gas? Although=
,
>
> Do you refer to below info? If not, i will check further
>
> $ ld --version
> GNU ld (GNU Binutils for Debian) 2.40
>
> $ ld --help | grep -A4 compress
>   --compress-debug-sections=3D[none|zlib|zlib-gnu|zlib-gabi|zstd]
>                               Compress DWARF debug sections
>                                 Default: none
>   -z common-page-size=3DSIZE    Set common page size to SIZE
>
> > if I am reading make.cross correctly (linked above), it seems like the
> > integrated assembler should be used in this case... It would be really
> > helpful to have the exact make command that the robot used in the repor=
t
>
> Got it, let us think of this to share the build log, so far, as it contai=
ns
> some debugging/tracing info, we haven't sent it along with the report. Bu=
t
> I think at least, we can extract the make command out as first step.
>
> > to know for sure. I do not see a similar switch available for LLVM and
> > even then, I would not expect to see the same issue because we should
> > not even have the ability to generate a compressed debug section if zli=
b
> > was not available.
> >
> > > Just tried and could not reproduce.  Has this issue been seen elsewhe=
re?
> > >
> > > Ah, we have
> > >
> > > https://lore.kernel.org/llvm/?q=3Dcontains+a+compressed+section%2C+bu=
t+zlib+is+not+available
> > > https://lore.kernel.org/llvm/20230404161735.GA1703291@dev-arch.thelio=
-3990X/
> > >
> > > So since 10e68b02c861 is in v5.8-rc1, then for 4.14, 4.19, and 5.4 we
> > > probably want a stable-only patch for -gz=3Dnone.
> > >
> > > GCC didn't support -gz=3Dnone until 5.1, so that might be an issue fo=
r
> > > older branches of stable which might still support older GCC versions=
.
> > > 4.19.y still supports gcc 4.6.
> > >
> > > ```
> > > diff --git a/Makefile b/Makefile
> > > index 71416fde7348..e6754300021c 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -756,6 +756,7 @@ KBUILD_AFLAGS       +=3D -g
> > >  else
> > >  KBUILD_AFLAGS  +=3D -Wa,-gdwarf-2
> > >  endif
> > > +KBUILD_CFLAGS  +=3D $(call cc-option, -gz=3Dnone)
> > >  endif
> > >
> > >  ifdef CONFIG_DEBUG_INFO_DWARF4
> > > ```
> > >
> > > Godbolt only binutils v2.27+, but 4.19 supported v2.20+ (so I can't
> > > check --compress-debug-sections=3Dnone assembler support quickly).
> >
> > You could do
> >
> >   KBUILD_AFLAGS   +=3D $(as-option, -Wa$(comma)--compress-debug-section=
s=3Dnone)
> >
> > no?
>
> Do you suggest we can do this when using clang-14 to build or even gcc wh=
en
> such issue appears?
>
> >
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed se=
ction, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compress=
ed section, but zlib is not available
> > > > >> ld.lld: error: drivers/usb/dwc2/platform.o: contains a compresse=
d section, but zlib is not available
> > > >    ld.lld: error: too many errors emitted, stopping now (use -error=
-limit=3D0 to see all errors)
> >
> > Cheers,
> > Nathan
> >



--=20
Thanks,
~Nick Desaulniers
