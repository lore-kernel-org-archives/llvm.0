Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479D2F23
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 11:56:00 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a8so33995807ejc.8
        for <llvm@lists.linux.dev>; Sun, 06 Feb 2022 03:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sGw9Hb8Vg5WwALbs3wJZ2aN1dEchxWfwoAwXEGqCDSg=;
        b=HKj+ZZbz1lf0RsvvnUbd1lwTG+Jjpotml2SwdaPE1CPKclhP367L9WEZzlzw6BVLf8
         YFz+H4NOgzBZbvWd24O0dGq007aVkubL2ymihb2OVKo12x/sxej8GATomLm28sRG+sKE
         v+KYRSp06B9bV9xPSqhfMQcZgs0GpEGOxB8B3N0eolVG8Yjr55XVnkkVK5WJ5r6EyGHv
         d5BOUNUdFRRZjkm6SFa0FZOfFMw4E2RMrhJelCaK8Ds9lG/4yHRgVWs1ITjXMljGSRL6
         dK4XBPfAx7VH9dyr8XmrqNGuuVqfqWILQKYmIOGhKDoFBUnYS3lGc70N9XrLBF/iMufj
         Aa2g==
X-Gm-Message-State: AOAM533DRfZuoq7CQB5WzG9N8RCB6Fyw/K77rnz/cQHlIa6mB85QDBBN
	wMWgF7J54+PKVW/8t1wI4jI=
X-Google-Smtp-Source: ABdhPJxv3i+v5ctIhzy0MVF43VzrUVWvrLzTOn5YQymmpTcA2Zr73Gay5In18xwWkDxbNDE3e91n+g==
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr6077972ejc.700.1644148559163;
        Sun, 06 Feb 2022 03:55:59 -0800 (PST)
Received: from [192.168.0.83] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.googlemail.com with ESMTPSA id g9sm2507091ejf.33.2022.02.06.03.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 03:55:58 -0800 (PST)
Message-ID: <67f432e2-1bfd-29dc-f2ed-051b47ef0844@kernel.org>
Date: Sun, 6 Feb 2022 12:55:57 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: ld.lld: error: undefined symbol: socfpga_reset_init
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
References: <202202050539.Mtk9I4Ef-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202202050539.Mtk9I4Ef-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2022 22:12, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   dcb85f85fa6f142aae1fe86f399d4503d49f2b60
> commit: 4483397b03536506535d611b0cb28a81a69e8edf ARM: socfpga: drop ARCH_SOCFPGA
> date:   11 months ago
> config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20220205/202202050539.Mtk9I4Ef-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4483397b03536506535d611b0cb28a81a69e8edf
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 4483397b03536506535d611b0cb28a81a69e8edf
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: socfpga_reset_init
>    >>> referenced by socfpga.c
>    >>>               socfpga.o:(socfpga_init_irq) in archive arch/arm/mach-socfpga/built-in.a
>    >>> referenced by socfpga.c
>    >>>               socfpga.o:(socfpga_arria10_init_irq) in archive arch/arm/mach-socfpga/built-in.a
> 

This looks like a false positive. On the socfpga defconfig arm build,
the socfpga_reset_init() (drivers/reset/reset-socfpga.c) is built.

I also could not reproduce it with GCC.

Best regards,
Krzysztof
