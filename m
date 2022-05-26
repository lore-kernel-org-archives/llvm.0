Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A8EA9
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 00:14:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id n10so164497ejk.5
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUN1Hk+wVODcst4ocCxem+PCWnT3RpL+w2LVEy5CkRA=;
        b=RtP6hh4X8z+2MahAiAUIOJVM9Cfmt7V5Ll8iE25tjBROyYvHx4EOB8CtLSuOQeapQd
         BR1dE4Yip3iyeN1fJom8sECDjU2+AKUGFOFdW94NxU5AyV9Js4RicQo7nhg6MqqySr/r
         MsiOZh3uZVfiTEimtdnWO4N2hsnqY1z1fITBrp8gZrKtOs8rtHAtWN82Jm4FaGK04oEk
         SM1JaUH0FbWOBZC7d6+39nmFWIrPZJ+9Fy/gxfH1Q/NPCP8GuV8eC+jeaecUcSbUXcr8
         1LN/htRrUOFLscNprtUKZdz2aJSfLLMANVSpubh492YLFpHnbRNWZwvq4j3iFsl4EzSp
         uJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUN1Hk+wVODcst4ocCxem+PCWnT3RpL+w2LVEy5CkRA=;
        b=hUBi75MV9lqFYkqqwO/E74u5KpYfAq36WnYnqACWuq2WcmGiDgLKasaE7DWa0sMNUl
         zs5KJ3meYwrNBgakt7TCoIf2lYvH77Hab4oyflByFaDK9b/ZwghJ1EXqfJG61sE73Jiw
         zaVTsaFizBT9cUMYENShoNjniJ2kLZT7CVztFnDJxMlOBGdJCvhEn7QtniRDMpRsttW+
         k1WdcCRkpS5xlESiwT2PFjGnz5EyGkiiQspjgR2uz7ptdhh9iz3r6NFZqx8oT9eLjUte
         C5CoUqwsMtscR1Iislj1arWmHKOrhzoq/l1WYMcgWwZENlg+gqvD+4xpdGZVqoWZJ80L
         RZMg==
X-Gm-Message-State: AOAM5326eHf52avIF7pr3HNdGdYBjcwR1HV6z7/IjUkYdngqMabsrs+G
	kDZiMmto6Xpn0Secc1x/bhA1K1g8BALfrNZKVIc=
X-Google-Smtp-Source: ABdhPJyO00AJg5mswWV1wx6ajRW6tH6ji4ANJHj6fdfFPQFeCDOUk7NVjUlDeNuLLnBukt35NG5sW7tLc1W4JwY9K+I=
X-Received: by 2002:a17:907:62a0:b0:6fe:69f3:88de with SMTP id
 nd32-20020a17090762a000b006fe69f388demr30054330ejc.214.1653524078459; Wed, 25
 May 2022 17:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205021042.xPjJ6Z4J-lkp@intel.com>
In-Reply-To: <202205021042.xPjJ6Z4J-lkp@intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 May 2022 21:14:30 -0300
Message-ID: <CAOMZO5Dg8_vDbW0vau4YFspZZ-RS=in8xEavkyYvBAQB41xTWA@mail.gmail.com>
Subject: Re: drivers/dma/imx-dma.c:1048:20: warning: cast to smaller integer
 type 'enum imx_dma_type' from 'const void *'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 1, 2022 at 11:13 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Fabio,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
> commit: 0ab785c894e618587e83bb67e8a8e96649868ad1 dmaengine: imx-dma: Remove unused .id_table
> date:   1 year, 5 months ago
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220502/202205021042.xPjJ6Z4J-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ab785c894e618587e83bb67e8a8e96649868ad1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 0ab785c894e618587e83bb67e8a8e96649868ad1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/dma/imx-dma.c:1048:20: warning: cast to smaller integer type 'enum imx_dma_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            imxdma->devtype = (enum imx_dma_type)of_device_get_match_data(&pdev->dev);
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.

Does anyone know how to fix this clang warning?

Thanks
