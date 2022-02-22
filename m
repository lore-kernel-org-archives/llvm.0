Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1457E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 08:23:01 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id q9so14788498vsg.2
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=You3LBNbCM7lz2JRM9j1I9l/7nvOo05sggfb0YdIjtU=;
        b=BN9O/d6Zsa0m2rR3YedBZ+ejwIp2a+f0g5ApqVPjqJwRGCYJ+hp6O83jMzT5OFlrhR
         GD6PkgBqVa7LPfYhbs2wTL/RwWQHJNYElYxak803kZl+Edxi3QlYja/IkRZsYWFHWH0A
         S8t8OdH2eXkqOZOFaFfCA4SxSCpzQC1Rmz2gZN1HcX2tk7S5Q3mZZxYTcwWbzPTysbJ6
         q9wgA+yUuxD9SEybns3gKeTS3/21YoHEZvbr1ErR6kVDvmsJCvXdrpJe0wwITpOogSj5
         LwjaW43ye7/nR2Jb0U+dmQnvCTX3BHJAf03Rw3zBdiruS5RqbO/9034gDsR8thUYxPjl
         5hpQ==
X-Gm-Message-State: AOAM531FsbctQF3ifIsCnOmstcjmvtPgJCfLoHO11oWc9vPoukIU0ZO1
	TYmYrX5Gnl6I2iRFR01EXgGc/b/GfECffw==
X-Google-Smtp-Source: ABdhPJyoCYe42XvzBAfhLuNCAfjrsX5q99wrs3CAM3yoNd2BHKBzjJF1FehcwFdRaftcK9yu3gErrQ==
X-Received: by 2002:a67:eb4b:0:b0:303:8e9d:be89 with SMTP id x11-20020a67eb4b000000b003038e9dbe89mr9307779vso.56.1645518180610;
        Tue, 22 Feb 2022 00:23:00 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id k45sm5511640uae.14.2022.02.22.00.23.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 00:23:00 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 60so9214617uae.1
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:23:00 -0800 (PST)
X-Received: by 2002:ab0:1009:0:b0:343:779c:f40a with SMTP id
 f9-20020ab01009000000b00343779cf40amr2023566uab.89.1645518179785; Tue, 22 Feb
 2022 00:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cd7f7feeabebf268adc9e050e348230e93b40829.1645457792.git.geert+renesas@glider.be>
 <202202220911.QtJ97DYI-lkp@intel.com>
In-Reply-To: <202202220911.QtJ97DYI-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 09:22:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTAnveFihVYnsAaOTapmWse9OsfoQsww7QQJ2kJi7EQA@mail.gmail.com>
Message-ID: <CAMuHMdWTAnveFihVYnsAaOTapmWse9OsfoQsww7QQJ2kJi7EQA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] pinctrl: renesas: r8a779f0: Add QSPI pins,
 groups, and functions
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 2:56 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
> [also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 next-20220217]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
> config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220911.QtJ97DYI-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/a5976fa9dc1d92148ae24e8dd706696e45a45d5a
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
>         git checkout a5976fa9dc1d92148ae24e8dd706696e45a45d5a
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/renesas/pfc-r8a779f0.c:1082:2: error: implicit declaration of function 'BUS_DATA_PIN_GROUP' [-Werror,-Wimplicit-function-declaration]

Missing dependency:

    This depends on "[PATCH 00/60] pinctrl: renesas: Share more pin group
    data"[1].

    [1] https://lore.kernel.org/r/cover.1640269757.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
