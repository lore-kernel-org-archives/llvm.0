Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E52CA8
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 06:48:26 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id h2so15816523ili.11
        for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 23:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p6OoejQbebxr0SLhWVuOUA5cnwT9iYUCjNc1Oek50ug=;
        b=HUFd0zjY2+QinOdoIPkJbQaGHBWuXGnBQsuE2jRhWx+i8v4vpp9ua3IzJB+RwaDh4E
         tcY+7Vwlo3f+7a1WxUMWL/MoHmJnIXogPyciK2q+Qny8OYIxhMsPQ8CnYoUvdAuy5ziW
         iHRAChSd0XHGQcRYQ/OHMsMPIzfWRICiLDk6wb2w5IdmZY7KnyFSpOKqCI65KzBThSYg
         aePCT7ldH1eu/dnMdEoJla95FoxCqG9ikye0+Q25wgkbZ5mpE8XxO4ozORaDZ7NxKSiC
         uWRLJPvUNKFlov5oGjiYqE2oBly6lLf7c9qMvEUg0SAQQNN7/22SZ3B8MlB4BqdsaUba
         VRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p6OoejQbebxr0SLhWVuOUA5cnwT9iYUCjNc1Oek50ug=;
        b=hZtNHwz4yb2WZpT7k8Qoyw+uZQ1a3AqRv7qYEYHP1Wq8Pre9H/MF7roJZ2LODKtmXT
         7+7A20OID7Q6aj7A+PqMLpAP3Bind8f2ejsaF4KNegemDLyZbu9iNCrx7Pu2KfAxm0q4
         ShR4C4D9wXpNkLt942Ehu1wpLGfZnwu3Haz4k8N4w24b2jLYgzMIGvFNUyO3b/QiMCYF
         LjQLOQzVHqbp3HSTAONctQr3IesNg7UtZQOqdLc66k5GRPlgciLe9ucP+wMBxeMj+t+n
         oDRLB1+vaidfV4jyMszIcNYfaR4bJfYmbqfawk+T3UOcLGbOeqCZ9Cj10zFaV94MuPvT
         JStQ==
X-Gm-Message-State: AOAM532IRCb+GfXGGpuGR/MaUJWyYdJCqWhGBULizUHzTI4qepkauVlg
	N/0Yz67vB2ykQgQxzFNZPqIQxEFmmBxOle1RZ4k=
X-Google-Smtp-Source: ABdhPJxf6rkkkjSVwTpYcnkH+TwyQQFxVQu6KZknA+Mk+W6r9BiCeBvkGt3LCo9/ktMQLcBFYqFibjWRz9fA6RnW380=
X-Received: by 2002:a05:6e02:1a05:: with SMTP id s5mr14106390ild.303.1635230905959;
 Mon, 25 Oct 2021 23:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1634207106-7632-9-git-send-email-dillon.minfei@gmail.com>
 <202110261351.fFvc5pmc-lkp@intel.com> <CAL9mu0+VG-CT8RPP6zmatEk=AuwLC0QR9P=GOZF7z-NCBARFuw@mail.gmail.com>
In-Reply-To: <CAL9mu0+VG-CT8RPP6zmatEk=AuwLC0QR9P=GOZF7z-NCBARFuw@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Tue, 26 Oct 2021 14:47:49 +0800
Message-ID: <CAL9mu0+joj8gCkt7uPHaDiMFESCxV=5AO1hnUuPt=36GM+RFkw@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] media: stm32-dma2d: STM32 DMA2D driver
To: kernel test robot <lkp@intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, mchehab+huawei@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

Hi Kernel

Please ignore my last mail, no need to test v6, should have the same
issue. I found the cause in Kconfig.

495 config VIDEO_STM32_DMA2D
496     tristate "STM32 Chrom-Art Accelerator (DMA2D)"
497     depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST

should be
497     depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_STM32 || COMPILE_TEST)

Will send v7 right now.

Hi Hans, Mauro

Sorry for trouble, I need to send a patch to fix the compile test issue.
Could you help to drop the v6 version, thanks.

Best Regards
Dillon

On Tue, 26 Oct 2021 at 14:16, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> Hi Kernel
>
> Thanks for your testing, could you help to test the [v6 version]
> of this series? v6 is the latest version accepted by maintainers,
> also rebased to [media_tree] since v5.
>
> I will try to check this compile test on v6 as well.
>
> [v6 version]
> https://patchwork.linuxtv.org/project/linux-media/patch/1634633003-18132-11-git-send-email-dillon.minfei@gmail.com/
>
> [media_tree]
> https://git.linuxtv.org/media_tree.git
>
> Thanks & Regards
> Dillon
>
> On Tue, 26 Oct 2021 at 13:29, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on media-tree/master]
> > [also build test ERROR on atorgue-stm32/stm32-next clk/clk-next linus/master v5.15-rc7 next-20211025]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/dillon-minfei-gmail-com/Add-support-for-DMA2D-of-STMicroelectronics-STM32-Soc-series/20211014-182826
> > base:   git://linuxtv.org/media_tree.git master
> > config: hexagon-randconfig-r015-20211025 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a461fa64bb37cffd73f683c74f6b0780379fc2ca)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/af498051ebf90dbd11747a29cdc2eea74de2afea
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review dillon-minfei-gmail-com/Add-support-for-DMA2D-of-STMicroelectronics-STM32-Soc-series/20211014-182826
> >         git checkout af498051ebf90dbd11747a29cdc2eea74de2afea
> >         # save the attached .config to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: undefined symbol: v4l2_fh_init
> >    >>> referenced by dma2d.c
> >    >>> media/platform/stm32/dma2d/dma2d.o:(dma2d_open) in archive drivers/built-in.a
> >    >>> referenced by dma2d.c
> >    >>> media/platform/stm32/dma2d/dma2d.o:(dma2d_open) in archive drivers/built-in.a
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
