Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501E7E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 08:24:34 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id i27so20216980vsr.10
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hK6mHBo7sbDA8ZdZiE6IIHy5EcCfEsdUzeQalQlsy1U=;
        b=VHyAV4pN24HRRS0FJE+BFTvG8iCosUN/6U/nD29wqhoLBXhry/b2wuIBzFKjEQX4xt
         mqhtvItg6Zv+0WWYDBLukIujLV2WfiuhhBlpXUf19fvgaDJSD+YWwn9W8uD/U/wF53d4
         IXe1esJ/FlJ8bmdJ41s8xyXBR5gSS5esqeru9YNtU1oC7DxaeZ3o8SW146yrF6+0VKtU
         aLH/iWMtTS0F3AwkX6kBxxShXGvGryGkjOm5zMJzU/eUMygkRIL5s4TZluWcikdMgS00
         7gvqotGt5VB24ibjncNV1OibSjNrcXXwfJXYRp/rNrBuqrBqcl95Xy+J8NkmA+S/EGa1
         h5KA==
X-Gm-Message-State: AOAM532Lr3fEGQamzrkyhRXlzVOMB4DB0skm1MqFWaWQRghLdSFAmXZB
	pHbbPlXquNhiQ/wBWhINJlMM+N+lXbgAXA==
X-Google-Smtp-Source: ABdhPJwJ6impVsq5sWJJg5GHmb2oOneTWOc/fPD+TTqj82gG8sTSlky464DSiVPY2hQZZc+xnB9gcA==
X-Received: by 2002:a67:e145:0:b0:31b:47e7:68cd with SMTP id o5-20020a67e145000000b0031b47e768cdmr9734174vsl.58.1645518273713;
        Tue, 22 Feb 2022 00:24:33 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id x144sm2363120vkx.22.2022.02.22.00.24.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 00:24:33 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id w4so20291099vsq.1
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:24:33 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr10311284vse.57.1645518273268; Tue, 22
 Feb 2022 00:24:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
 <202202220706.BSRvcjhD-lkp@intel.com>
In-Reply-To: <202202220706.BSRvcjhD-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 09:24:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUD=GU=xtMesW+pVnn2qLgp+PBxYEFia8Z8f1SuZx4k4w@mail.gmail.com>
Message-ID: <CAMuHMdUD=GU=xtMesW+pVnn2qLgp+PBxYEFia8Z8f1SuZx4k4w@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 12:31 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
> [also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 ne=
xt-20220217]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinct=
rl-renesas-Add-R-Car-S4-8-support/20220221-234855
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-pinctrl
> config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/a=
rchive/20220222/202202220706.BSRvcjhD-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271=
fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/a774a621c83874c65ae824a=
0a53f2741f3612df8
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renes=
as-Add-R-Car-S4-8-support/20220221-234855
>         git checkout a774a621c83874c65ae824a0a53f2741f3612df8
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash drivers/pinctrl/renesas/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/pinctrl/renesas/pfc-r8a779f0.c:998:20: error: incompatible fun=
ction pointer types initializing 'int (*)(struct sh_pfc *, unsigned int, u3=
2 *)' (aka 'int (*)(struct sh_pfc *, unsigned int, unsigned int *)') with a=
n expression of type 'int (unsigned int, u32 *)' (aka 'int (unsigned int, u=
nsigned int *)') [-Werror,-Wincompatible-function-pointer-types]
>            .pin_to_pocctrl =3D r8a779f0_pin_to_pocctrl,
>                              ^~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

Missing dependency:

    This depends on "[PATCH 01/10] pinctrl: renesas: Remove unused pfc
    parameter from .pin_to_pocctrl()"[1].

    [1] https://lore.kernel.org/r/822133086f32618c7fc920123c6a96f5d4ea7ad6.=
1640270559.git.geert+renesas@glider.be/

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
