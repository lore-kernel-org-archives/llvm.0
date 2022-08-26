Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C222F2E
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 15:48:58 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id 10so1479949iou.2
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CfKWDPh7X1VuNag5D5B/vS+f3kUXwEbxZn8+4bgPB10=;
        b=ONIm9zdhImgqNvaUQZfwo8g5tSkpqQg0QkxDSb0QT+jV+CntszKp8hwzZYkJdui/k8
         /4oMsDkQiywyrCmaesV9+zR91N8l1I2CdzE2R5ZSNLNKcLaAlLdM5bYBnfkTBhT/kmuc
         6355G09l6pl7Rj+jg/+rnHad2AcOe9VIeZvIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CfKWDPh7X1VuNag5D5B/vS+f3kUXwEbxZn8+4bgPB10=;
        b=StoUFukBu2aIxljfIyCzO8YdNpP1972Pxh+Ti/PUMEgzXqRAsUxakJF8jnA5GYNb7F
         Lylzq/ReWzP5ixNEXcMEeRhol6nbOlR1b5wO6kD5kaTBMO75OokTWTOdC5shudbcth8M
         i5xnRlAGlX1VRigFDaJdZ20LPjnD3+KMhCRw0bXBrO0o3x2g6b0zO8nSeBUj1eutSkOU
         4+1FDEkCmE6+P3W81xoa9H8Z43AMqvbcHS6LA1D4lLi6EGvnYjJT3li3s2wOLIo/R/CF
         hmFJqEcc63XS6VwwB84W2eZv6mj8xxeC47tdjYXeM3toQjxmn2SmTLXA6F5aZ7xsm2Hr
         AQIg==
X-Gm-Message-State: ACgBeo3KYbhWrmroxHGqa4ruWbZqQOBRumkmeR7IHpszcBjL7ZDIuas4
	j665K8RM6De/fbdLi9gooX1EuTJiooupMhFC
X-Google-Smtp-Source: AA6agR4iOGcBitVp0ByTfbAliYheAfze3WF74wocxF5ogBtuyaGrj+ncN9QZ3vJtBSkRAG5FOnoRJg==
X-Received: by 2002:a6b:c343:0:b0:68a:b1d0:3ddf with SMTP id t64-20020a6bc343000000b0068ab1d03ddfmr3810938iof.0.1661528937316;
        Fri, 26 Aug 2022 08:48:57 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id z2-20020a02cea2000000b003476640caf8sm1033625jaq.173.2022.08.26.08.48.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 08:48:56 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id z72so1457806iof.12
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 08:48:56 -0700 (PDT)
X-Received: by 2002:a02:c772:0:b0:349:e359:a0c1 with SMTP id
 k18-20020a02c772000000b00349e359a0c1mr4210651jao.246.1661528935826; Fri, 26
 Aug 2022 08:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208221506.0Lo051G4-lkp@intel.com> <CACRpkdYoesPenQizTc6_MRZ14THBSFwyHb7oWJdR+CYYiJYYpQ@mail.gmail.com>
In-Reply-To: <CACRpkdYoesPenQizTc6_MRZ14THBSFwyHb7oWJdR+CYYiJYYpQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Aug 2022 08:48:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vxdoo21OQJ-Ad57-gFVcJ7biQipoJqDE2bSpLC2NxrhQ@mail.gmail.com>
Message-ID: <CAD=FV=Vxdoo21OQJ-Ad57-gFVcJ7biQipoJqDE2bSpLC2NxrhQ@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: drm_gem_fb_get_obj
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Aug 26, 2022 at 1:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 22, 2022 at 9:27 AM kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
> > commit: 57f6190a60ecc19f1ddddac0d7ea6524229271a9 drm/panel: ws2401: Add driver for WideChips WS2401
> > date:   1 year, 1 month ago
> > config: x86_64-randconfig-a002-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221506.0Lo051G4-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f6190a60ecc19f1ddddac0d7ea6524229271a9
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 57f6190a60ecc19f1ddddac0d7ea6524229271a9
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: undefined symbol: drm_gem_fb_get_obj
> >    >>> referenced by drm_mipi_dbi.c:203 (drivers/gpu/drm/drm_mipi_dbi.c:203)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> >    >>> referenced by drm_mipi_dbi.c:258 (drivers/gpu/drm/drm_mipi_dbi.c:258)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_fb_dirty) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_fb_swab
> >    >>> referenced by drm_mipi_dbi.c:219 (drivers/gpu/drm/drm_mipi_dbi.c:219)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_atomic_helper_connector_destroy_state
> >    >>> referenced by drm_mipi_dbi.c
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_gem_fb_create_with_dirty
> >    >>> referenced by drm_mipi_dbi.c
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_atomic_helper_check
> >    >>> referenced by drm_mipi_dbi.c
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_atomic_helper_commit
> >    >>> referenced by drm_mipi_dbi.c
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_fb_xrgb8888_to_rgb565
> >    >>> referenced by drm_mipi_dbi.c:224 (drivers/gpu/drm/drm_mipi_dbi.c:224)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_fb_memcpy
> >    >>> referenced by drm_mipi_dbi.c:221 (drivers/gpu/drm/drm_mipi_dbi.c:221)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_atomic_helper_damage_merged
> >    >>> referenced by drm_mipi_dbi.c:318 (drivers/gpu/drm/drm_mipi_dbi.c:318)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_pipe_update) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_simple_display_pipe_init
> >    >>> referenced by drm_mipi_dbi.c:529 (drivers/gpu/drm/drm_mipi_dbi.c:529)
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_dev_init_with_formats) in archive drivers/built-in.a
> > --
> > >> ld.lld: error: undefined symbol: drm_atomic_helper_connector_reset
> >    >>> referenced by drm_mipi_dbi.c
> >    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a
>
> I don't understand this error report, please robot, analyze further and come
> back with details on what needs to be fixed.

I've never been accused of being a robot (OK, well, there was that one
time...), but I can probably still help a little...

I followed the "steps to reproduce" from the report and got the
failure. Basically the problem is this:

$ grep DRM_MIPI_DBI build_dir/.config
CONFIG_DRM_MIPI_DBI=y

$ grep DRM_KMS_HELPER build_dir/.config
CONFIG_DRM_KMS_HELPER=m

...so you're the MIPI DBI code is builtin and calling into the KMS
helper which is a module. That's does not compute. <ERR>. <ERR>.
<SHUTTING DOWN>.

Unfortunately, fixing the error isn't the most trivial thing in the
world. If you just do this:

 config DRM_MIPI_DBI
        tristate
+       select DRM_KMS_HELPER
        depends on DRM

...then you get a circular dependency:

drivers/gpu/drm/Kconfig:76:error: recursive dependency detected!
drivers/gpu/drm/Kconfig:76:     symbol DRM_KMS_HELPER is selected by
DRM_MIPI_DBI
drivers/gpu/drm/Kconfig:31:     symbol DRM_MIPI_DBI is selected by
DRM_PANEL_ILITEK_ILI9341
drivers/gpu/drm/panel/Kconfig:165:      symbol
DRM_PANEL_ILITEK_ILI9341 depends on DRM_KMS_HELPER
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

...and if you do this:

 config DRM_MIPI_DBI
        tristate
        depends on DRM
+       depends on DRM_KMS_HELPER

...then you get errors like this:

WARNING: unmet direct dependencies detected for DRM_MIPI_DBI
  Depends on [m]: HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=m]
  Selected by [y]:
  - DRM_PANEL_WIDECHIPS_WS2401 [=y] && HAS_IOMEM [=y] && DRM [=y] &&
DRM_PANEL [=y] && SPI [=y] && GPIOLIB [=y] && BACKLIGHT_CLASS_DEVICE
[=y]
  Selected by [m]:
  - TINYDRM_ILI9225 [=m] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]
  - TINYDRM_ILI9486 [=m] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]
  - TINYDRM_ST7586 [=m] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]
  - TINYDRM_ST7735R [=m] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]


Hopefully that at least explains the problem even if it doesn't
magically give a solution. ;-)

-Doug
