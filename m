Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7872
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:39:32 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id 64so5367749uab.12
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 08:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gX+TS4GAKxw9FHIAudZ0sNH9j5UvtzjLYDH0hT4o1bI=;
        b=K2hD4RE8mxdNl4hluF0OoaaB1KLKcyxOF4ly1WYzD0dZAbPtQBsmVd5UROJp2/UxsB
         A17WiFeL5YLj7N95UQSPFjN3PeYB38lFsnG/CHZBqR84jJ7tNuchhXtU6Rv9fdl1FmFW
         dkb+Kknok1o82hbO000KnjpTSpEK1ICFTkrkZ08WUAJuOcmmXuiXyK8KBHeK8/2Ql47R
         eoV+QKpRjLMs6oa3coupOiir5mRcwvC1fJSvUkXCstOA1MSylEyI6KVMgJoXPbGmLO2H
         j0evhzLVamAkt1/baHitdtTAF0gu0CqIt/STK4LcCR1PX0hi+/adXSNZxbTdo0m11ifb
         LtaQ==
X-Gm-Message-State: AOAM5303yc1pBv4lasFEGfrscr39noY3YuwCOXZE2JMQmTydFlQLErUf
	NJyfrNaoi9DZIJzJBtW+XFyEJXB3bsMz01cwWYM=
X-Google-Smtp-Source: ABdhPJz9vtijXmfKPXlevaJC6cL8JOlijswhLjqG4VkhGCM078ujehKFzbrajWLdzK4Zh92O6UAysLiNRRTvf/eTOVM=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr4411792uac.89.1632843571125;
 Tue, 28 Sep 2021 08:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202109282205.VsHhj6PP-lkp@intel.com>
In-Reply-To: <202109282205.VsHhj6PP-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Sep 2021 17:39:19 +0200
Message-ID: <CAMuHMdX0Zm_hMheZ0e1Xu991jnUr=aY_cDBHHGFvQ1sKqM1b9A@mail.gmail.com>
Subject: Re: drivers/gpu/drm/kmb/kmb_dsi.c:812:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 5:09 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   0513e464f9007b70b96740271a948ca5ab6e7dd7
> commit: ade896460e4a62f5e4a892a98d254937f6f5b64c drm: DRM_KMB_DISPLAY sho=
uld depend on ARCH_KEEMBAY
> date:   11 months ago
> config: mips-randconfig-r013-20210928 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e=
8dfdfe7efecfda318d43a06fae18b40eb498)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dade896460e4a62f5e4a892a98d254937f6f5b64c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ade896460e4a62f5e4a892a98d254937f6f5b64c
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/kmb/ drive=
rs/net/ethernet/mellanox/mlxsw/ mm/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpu/drm/kmb/kmb_dsi.c:812:2: warning: unused function 'set_tes=
t_mode_src_osc_freq_target_low_bits'
>    set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi
>    ^
> >> drivers/gpu/drm/kmb/kmb_dsi.c:824:2: warning: unused function 'set_tes=
t_mode_src_osc_freq_target_hi_bits'
>    set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi

These two functions are "static inline", so there should not be such
warning. Toolchain issue?

>    ^
>    fatal error: error in backend: Nested variants found in inline asm str=
ing: '.if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_br=
anch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftra=
ce_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/in=
clude/asm/barrier.h", .line =3D 16, $); 0x00 ) !=3D -1)) : $))) ) && ( (1 <=
< 0) ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .els=
e; ; .endif'
>    clang-14: error: clang frontend command failed with exit code 70 (use =
-v to see invocation)
>    clang version 14.0.0 (git://gitmirror/llvm_project dc6e8dfdfe7efecfda3=
18d43a06fae18b40eb498)
>    Target: mipsel-unknown-linux
>    Thread model: posix
>    InstalledDir: /opt/cross/clang-dc6e8dfdfe/bin
>    clang-14: note: diagnostic msg:
>    Makefile arch drivers fs include kernel mm net nr_bisected scripts sou=
rce usr
>
>
> vim +/set_test_mode_src_osc_freq_target_low_bits +812 drivers/gpu/drm/kmb=
/kmb_dsi.c
>
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  810
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  811  static inline void
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04 @812      set_test_mode_src=
_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  813                       =
                          u32 dphy_no,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  814                       =
                          u32 freq)
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  815  {
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  816      /* Typical rise/f=
all time=3D166, refer Table 1207 databook,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  817       * sr_osc_freq_ta=
rget[7:0]
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  818       */
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  819      test_mode_send(km=
b_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  820                     (f=
req & 0x7f));
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  821  }
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  822
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  823  static inline void
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04 @824      set_test_mode_src=
_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  825                       =
                         u32 dphy_no,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  826                       =
                         u32 freq)
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  827  {
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  828      u32 data;
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  829
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  830      /* Flag this as h=
igh nibble */
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  831      data =3D ((freq >=
> 6) & 0x1f) | (1 << 7);
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  832
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  833      /* Typical rise/f=
all time=3D166, refer Table 1207 databook,
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  834       * sr_osc_freq_ta=
rget[11:7]
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  835       */
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  836      test_mode_send(km=
b_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  837  }
> 98521f4d4b4cb26 Anitha Chrisanthus 2020-11-04  838
>
> :::::: The code at line 812 was first introduced by commit
> :::::: 98521f4d4b4cb265374a4b1e13b41287a1960243 drm/kmb: Mipi DSI part of=
 the display driver
>
> :::::: TO: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> :::::: CC: Sam Ravnborg <sam@ravnborg.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
