Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7027B
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 18:04:09 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id cs6so26008520qvb.6
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 11:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+DyMdSELpMsE9UL+Un7HNtT9x0W8nOtMV/6G+JcfLhY=;
        b=QpRax2KUiCRWEi9gI42G3R6f7nhwTStrQwMi2HzTR2Ja0HzebKWLBAy6gc/2OSEovj
         2fuQN0rECKIj+vMYwiCXNrsNhMO/iGYXuFYz/gjAKqkKkfO99iiDdAINKwPIXQiagygZ
         fc9z9dh/ni0jpII15ScfcSmwNL3UgfADnf6IwTwV2VUYmP/6w0TgA16qnubeqsNlJ6FB
         ZxtJdmAotwpogquSgH8Aj08+9mvEy2Ee0v5yGZUKJ/XYiwCS7x0YbvjsJLyaTz+9J/wf
         e8K1RZJy7zA5pVYw0a1CwPQknc8LfeWusCCigOEDlQTtFDf36WMJkmBjkXm5JlywrKlr
         Ngsw==
X-Gm-Message-State: AJIora8u2BgPkNdT4R33FRDL94m0WRKwwpYmP5+mBSGaJ0cgN5DblQdK
	Ud0gTH3RYviTkiVClus+iVEZlr7AVd0lXQ==
X-Google-Smtp-Source: AGRyM1vLTdHlk96ffjk/8KAe8mniq6fmNSa7gsTcfowwOxioMjfS3MfkAS2jcX1n8906agSgGBQPYA==
X-Received: by 2002:a05:622a:11d3:b0:304:fc1f:b500 with SMTP id n19-20020a05622a11d300b00304fc1fb500mr3749706qtk.554.1656525848471;
        Wed, 29 Jun 2022 11:04:08 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id s9-20020ac85289000000b00304efba3d84sm11247937qtn.25.2022.06.29.11.04.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:04:08 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-317a66d62dfso155957007b3.7
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 11:04:07 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr5215357ywd.283.1656525847711; Wed, 29
 Jun 2022 11:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202206300147.qdDDrtfw-lkp@intel.com>
In-Reply-To: <202206300147.qdDDrtfw-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2022 20:03:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA5fNgGxoYfb=9GNxYtXyVn-ENH8u5gXkKcVufhnciXQ@mail.gmail.com>
Message-ID: <CAMuHMdXA5fNgGxoYfb=9GNxYtXyVn-ENH8u5gXkKcVufhnciXQ@mail.gmail.com>
Subject: Re: drivers/gpu/drm/kmb/kmb_dsi.c:812:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel Test Robot,

On Wed, Jun 29, 2022 at 7:57 PM kernel test robot <lkp@intel.com> wrote:
> First bad commit (maybe !=3D root cause):

Definitely not introduced by my patch.
Looks like these functions were never used at all.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d9b2ba67917c18822c6a09af41c32fa161f1606b
> commit: ade896460e4a62f5e4a892a98d254937f6f5b64c drm: DRM_KMB_DISPLAY sho=
uld depend on ARCH_KEEMBAY
> date:   1 year, 8 months ago
> config: mips-randconfig-r016-20220629 (https://download.01.org/0day-ci/ar=
chive/20220630/202206300147.qdDDrtfw-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774=
ba7f60d1fef403b5507b1b1a7475d3684d71)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dade896460e4a62f5e4a892a98d254937f6f5b64c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ade896460e4a62f5e4a892a98d254937f6f5b64c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/kmb/ drive=
rs/net/ethernet/mellanox/mlxsw/ drivers/scsi/ufs/ drivers/staging/ fs/xfs/
>
> If you fix the issue, kindly add following tag where applicable
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
>    ^
>    fatal error: error in backend: Nested variants found in inline asm str=
ing: '.if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_br=
anch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftra=
ce_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/in=
clude/asm/barrier.h", .line =3D 16, $); 0x00 ) !=3D -1)) : $))) ) && ( (1 <=
< 0) ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .els=
e; ; .endif'
>    clang-15: error: clang frontend command failed with exit code 70 (use =
-v to see invocation)
>    clang version 15.0.0 (git://gitmirror/llvm_project a774ba7f60d1fef403b=
5507b1b1a7475d3684d71)
>    Target: mipsel-unknown-linux
>    Thread model: posix
>    InstalledDir: /opt/cross/clang-a774ba7f60/bin
>    clang-15: note: diagnostic msg:
>    Makefile arch drivers fs include kernel mm nr_bisected scripts source =
usr
>
>
> vim +/set_test_mode_src_osc_freq_target_low_bits +812 drivers/gpu/drm/kmb=
/kmb_dsi.c
>
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  810
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  811  static inline void
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04 @812       set_test_mode_src=
_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  813                        =
                          u32 dphy_no,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  814                        =
                          u32 freq)
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  815  {
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  816       /* Typical rise/f=
all time=3D166, refer Table 1207 databook,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  817        * sr_osc_freq_ta=
rget[7:0]
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  818        */
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  819       test_mode_send(km=
b_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  820                      (f=
req & 0x7f));
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  821  }
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  822
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  823  static inline void
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04 @824       set_test_mode_src=
_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  825                        =
                         u32 dphy_no,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  826                        =
                         u32 freq)
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  827  {
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  828       u32 data;
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  829
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  830       /* Flag this as h=
igh nibble */
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  831       data =3D ((freq >=
> 6) & 0x1f) | (1 << 7);
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  832
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  833       /* Typical rise/f=
all time=3D166, refer Table 1207 databook,
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  834        * sr_osc_freq_ta=
rget[11:7]
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  835        */
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  836       test_mode_send(km=
b_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  837  }
> 98521f4d4b4cb2 Anitha Chrisanthus 2020-11-04  838
>
> :::::: The code at line 812 was first introduced by commit
> :::::: 98521f4d4b4cb265374a4b1e13b41287a1960243 drm/kmb: Mipi DSI part of=
 the display driver
>
> :::::: TO: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> :::::: CC: Sam Ravnborg <sam@ravnborg.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
