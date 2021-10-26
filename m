Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605042CA4
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 06:17:22 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id u12so6070392pjy.1
        for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 23:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=72NWvI+2E74PfCtgjNBtlwVsE3DLrjepehqVh4U93DE=;
        b=IN4M9UC/aAXdewmn3oDgXlf8aTkdKtcfTKztbhVG8LfgnnzFxZWTAPrDb7023nYKkk
         v1bv6X8wRLJdZWOcjhdy+FO/GkpeLPq6QEVn2JV8lOgbERYajXhUxwGtx8ucbxk15hzu
         0CJcEXPl4mhVXu6rUQY76DzO/lhW2QMdPiT8UdmgEwLzHLcLgW1+FvziCAC9bw8W9Syd
         h1KYW0sfkSui8Mko4H+npfsP/9ftMmPQFAnfpqOk31gPhooZr8Mw6g6II8rjjfFAi4we
         vrAs5BHJpLH1GZnFQ+q1zAszBFsU87O8/mtqZ5m7pth5ZdE8W+Pi1xy31HD2fvQxuxTL
         h74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=72NWvI+2E74PfCtgjNBtlwVsE3DLrjepehqVh4U93DE=;
        b=e9QEBaYgmvf+9euRG8aRIcK9FZ1UZW528wb944BPN1XO/uZBftzM25HPepG/gaQp5i
         u0UPVk/1DyWdjJtbsUgMpNiF4raX/MFV9dsa6k7ahhI4FwTwq2NFAEChEAeWKTtKKF5V
         aSr39eAp1oRWyh36WQaBg1Pya+BSYT2Z2i1HBQlcro5TPykJuXPCbUrP5jkK992iQBV3
         YkN/qSdgf3vKrtvYMRIwt7Hkjjna/FrlBlOOaqjT6rmdlbxqlNWlAutF+NJFgeWCd+uI
         R27E3F9eO1/vGjfFX32vxJ1hXc3SrW8LpI9Yi+r8bqqeNCWaQzf2pEcC+4pPDXgGS09Z
         Xukw==
X-Gm-Message-State: AOAM532+AsWsIJiBzD3KjCf0MLSCMuXJwLDYfKSmdx2k0XatNp3H3UJ/
	vR+SF3OTvYXk3VHZfpBgheouMeufHwQflzko1oU=
X-Google-Smtp-Source: ABdhPJxvuqArUd+4kS/K+4kLcR+8sDeiwka9qIwL3cMOtjCcnwe0CQdFAcTvB1Y366hrWpkXCiFpE+QZK0TkIJAL4JE=
X-Received: by 2002:a17:90a:a2d:: with SMTP id o42mr2595329pjo.91.1635229041804;
 Mon, 25 Oct 2021 23:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1634207106-7632-9-git-send-email-dillon.minfei@gmail.com> <202110261351.fFvc5pmc-lkp@intel.com>
In-Reply-To: <202110261351.fFvc5pmc-lkp@intel.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Tue, 26 Oct 2021 14:16:45 +0800
Message-ID: <CAL9mu0+VG-CT8RPP6zmatEk=AuwLC0QR9P=GOZF7z-NCBARFuw@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] media: stm32-dma2d: STM32 DMA2D driver
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

Hi Kernel

Thanks for your testing, could you help to test the [v6 version]
of this series? v6 is the latest version accepted by maintainers,
also rebased to [media_tree] since v5.

I will try to check this compile test on v6 as well.

[v6 version]
https://patchwork.linuxtv.org/project/linux-media/patch/1634633003-18132-11-git-send-email-dillon.minfei@gmail.com/

[media_tree]
https://git.linuxtv.org/media_tree.git

Thanks & Regards
Dillon

On Tue, 26 Oct 2021 at 13:29, kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on atorgue-stm32/stm32-next clk/clk-next linus/master v5.15-rc7 next-20211025]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/dillon-minfei-gmail-com/Add-support-for-DMA2D-of-STMicroelectronics-STM32-Soc-series/20211014-182826
> base:   git://linuxtv.org/media_tree.git master
> config: hexagon-randconfig-r015-20211025 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a461fa64bb37cffd73f683c74f6b0780379fc2ca)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/af498051ebf90dbd11747a29cdc2eea74de2afea
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review dillon-minfei-gmail-com/Add-support-for-DMA2D-of-STMicroelectronics-STM32-Soc-series/20211014-182826
>         git checkout af498051ebf90dbd11747a29cdc2eea74de2afea
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: v4l2_fh_init
>    >>> referenced by dma2d.c
>    >>> media/platform/stm32/dma2d/dma2d.o:(dma2d_open) in archive drivers/built-in.a
>    >>> referenced by dma2d.c
>    >>> media/platform/stm32/dma2d/dma2d.o:(dma2d_open) in archive drivers/built-in.a
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
