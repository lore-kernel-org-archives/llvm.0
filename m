Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3A2560
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 08:26:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m1so1203706edb.7
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=L6RGdjoY+6gxGbx3graJqJb0iU8CPB5cb7afxoCsDDs=;
        b=ui/bq2ILEPwGljYaS7Kr5e+dU9U0iVAxN/aVvUgtji596YvxIINn34e1rmYsIVnvn7
         NizHaaxO/gZC3c8NzL3YbDCrnd5hMEkmkt0nXsXQjB4ibrWcM1GcfszMOH99UcBqM+27
         38y2aECTDEOB+Vd9iLKEgbISObjsFQ9Ce0ZfNrZMuaAyTFw7JAeDLGiCWyws1LJgD4sC
         eJEG1PiTCd87HpqinX7JmuLG4UBPuQcYfIVxFbMU7hbj292b9HCt2w0tnK6IropkevB/
         h3TXGIEsyf2OOUcy1bVyrEFdQYXq4x6T/SuAE0WWrHvm/IKdisBle+QxzrV/Gq6aQ4zV
         i5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=L6RGdjoY+6gxGbx3graJqJb0iU8CPB5cb7afxoCsDDs=;
        b=e+xrbv0cK0SCg0mFwxMacYxsifHzUguOlL6sQUVNEE8R/n9swqFpuamDM16HUM5igI
         ZSu7ouQOQp5X/mJq8ylL/oE3eMnjW0W7gnTCMLBlf81oNa2yecURWst6LXoregEfdrWi
         FOoa/rcazmSQCt856kIX4XYj8NHMBNGKo7YjfA6e6EKWMXYJZpmr5w0Tuc7XiNnT3+MV
         wmxPcHL6K5Pc+9hr2/4zkD9JHRtE1CTY9YxPkmKfMCnAnwcCqrc4ujxUvmA7TjwSMUcq
         iASYjflFf135LaB0pey1vqY3RZEU5sr0EmqnHp2ZCeYBEDG2BdnDmnIqJYj/ZjSZV4Wr
         RumA==
X-Gm-Message-State: ACgBeo1O1YqAAnJmZrnjaDXDtBiabHZdWRuJnEM2Ta6omx9wYWWtCdPT
	tego/GOUJ7P0zZBZjc8BIkGGJtruAi7DMj6W8o+tKQ==
X-Google-Smtp-Source: AA6agR4ZAQqzLF7gYyN6tLirIFssq2R5dp+X3fc7UvkTKXdWF6D+cNxFsdE8uCN+giaNWTqZ0qY7KX7Vl24nYsKr83M=
X-Received: by 2002:a05:6402:50d4:b0:447:85f:52d5 with SMTP id
 h20-20020a05640250d400b00447085f52d5mr5972359edb.205.1661502414690; Fri, 26
 Aug 2022 01:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208221506.0Lo051G4-lkp@intel.com>
In-Reply-To: <202208221506.0Lo051G4-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 10:26:43 +0200
Message-ID: <CACRpkdYoesPenQizTc6_MRZ14THBSFwyHb7oWJdR+CYYiJYYpQ@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: drm_gem_fb_get_obj
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 9:27 AM kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
> commit: 57f6190a60ecc19f1ddddac0d7ea6524229271a9 drm/panel: ws2401: Add driver for WideChips WS2401
> date:   1 year, 1 month ago
> config: x86_64-randconfig-a002-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221506.0Lo051G4-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f6190a60ecc19f1ddddac0d7ea6524229271a9
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 57f6190a60ecc19f1ddddac0d7ea6524229271a9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: drm_gem_fb_get_obj
>    >>> referenced by drm_mipi_dbi.c:203 (drivers/gpu/drm/drm_mipi_dbi.c:203)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
>    >>> referenced by drm_mipi_dbi.c:258 (drivers/gpu/drm/drm_mipi_dbi.c:258)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_fb_dirty) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_fb_swab
>    >>> referenced by drm_mipi_dbi.c:219 (drivers/gpu/drm/drm_mipi_dbi.c:219)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_connector_destroy_state
>    >>> referenced by drm_mipi_dbi.c
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_gem_fb_create_with_dirty
>    >>> referenced by drm_mipi_dbi.c
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_check
>    >>> referenced by drm_mipi_dbi.c
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_commit
>    >>> referenced by drm_mipi_dbi.c
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_mode_config_funcs) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_fb_xrgb8888_to_rgb565
>    >>> referenced by drm_mipi_dbi.c:224 (drivers/gpu/drm/drm_mipi_dbi.c:224)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_fb_memcpy
>    >>> referenced by drm_mipi_dbi.c:221 (drivers/gpu/drm/drm_mipi_dbi.c:221)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_damage_merged
>    >>> referenced by drm_mipi_dbi.c:318 (drivers/gpu/drm/drm_mipi_dbi.c:318)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_pipe_update) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_simple_display_pipe_init
>    >>> referenced by drm_mipi_dbi.c:529 (drivers/gpu/drm/drm_mipi_dbi.c:529)
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_dev_init_with_formats) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_connector_reset
>    >>> referenced by drm_mipi_dbi.c
>    >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_connector_funcs) in archive drivers/built-in.a

I don't understand this error report, please robot, analyze further and come
back with details on what needs to be fixed.

Yours,
Linus Walleij
