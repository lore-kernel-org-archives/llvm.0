Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECD379;
	Thu, 15 Jun 2023 01:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528C1C433C0;
	Thu, 15 Jun 2023 01:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686792889;
	bh=4JDmkFL1ybbw2qryCxHYsAFh65V3q674kF5SYlnA2M8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bzN8642YPb4iOzlU5j8+fSqzWFtGxh6Y8qjsXxz5c3O1w8w2saWRnq2q0BUyLvuQd
	 HHnBRKQpVhR1yVzwqRRqfntlR6djm6szsuRTZpIkrpcMKuAS9VB58PuBsmnRlS88qO
	 40GOf80lOBm3geep07tyk8/nzgsTvCokeT6hyluTGWMw5bf4WfwyRiKck+VrLkWqBQ
	 znT/oDdg58bYBteBXXZi6U/geO3JPMpcT3jLGpCaK9F0D077QucSXCoc6qVMtSW3T6
	 fdVpF76DEgvDbYmVlxc+P08g94Ouz1IyXTI8kYhNDqjIOezEPb8Ev+rB7xjxGULldi
	 ECEZviGuKHYuA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b1b92845e1so18796021fa.0;
        Wed, 14 Jun 2023 18:34:49 -0700 (PDT)
X-Gm-Message-State: AC+VfDytbN4o1vsgqJ7Te8Rjy7X4ckTMqjf11sqeeWAcKunRPdWFh7nD
	8O0PCpm01ZfnnwiEDGXxQ825P8G09Y5X4P6cew==
X-Google-Smtp-Source: ACHHUZ7/zs0IswJu6mIJqdL86fAYQ4yaQbHWfkCkfrf4MRCra28Amsc3x1QkAPlgHJh4c/fIwTL9HjCh7f4SLAP89hE=
X-Received: by 2002:a2e:86c4:0:b0:2b1:e8f8:e0ff with SMTP id
 n4-20020a2e86c4000000b002b1e8f8e0ffmr8324787ljj.10.1686792887272; Wed, 14 Jun
 2023 18:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306141702.ZaO9V2lk-lkp@intel.com> <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
 <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com> <9be724b6-9b3c-51fd-ca20-634603a9145e@kernel.org>
In-Reply-To: <9be724b6-9b3c-51fd-ca20-634603a9145e@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Jun 2023 19:34:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL1=gPcRRmqhYK_nnxim5m4NJcYxCVO1wy-eLh0pWnwzA@mail.gmail.com>
Message-ID: <CAL_JsqL1=gPcRRmqhYK_nnxim5m4NJcYxCVO1wy-eLh0pWnwzA@mail.gmail.com>
Subject: Re: [linux-next:master 9063/9793] drivers/ata/pata_octeon_cf.c:835:7:
 error: call to undeclared function 'of_property_read_reg'; ISO C99 and later
 do not support implicit function declarations
To: Damien Le Moal <dlemoal@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 6:41=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 6/15/23 00:26, Rob Herring wrote:
> > On Wed, Jun 14, 2023 at 3:41=E2=80=AFAM Damien Le Moal <dlemoal@kernel.=
org> wrote:
> >>
> >> On 6/14/23 18:23, kernel test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> >>> head:   b16049b21162bb649cdd8519642a35972b7910fe
> >>> commit: d0b2461678b12c08d43eaf6740485e2f2c3aeac6 [9063/9793] ata: Use=
 of_property_read_reg() to parse "reg"
> >>> config: mips-randconfig-r016-20230614 (https://download.01.org/0day-c=
i/archive/20230614/202306141702.ZaO9V2lk-lkp@intel.com/config)
> >>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.=
git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> >>> reproduce (this is a W=3D1 build):
> >>>         mkdir -p ~/bin
> >>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> >>>         chmod +x ~/bin/make.cross
> >>>         # install mips cross compiling tool for clang build
> >>>         # apt-get install binutils-mips64-linux-gnuabi64
> >>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git/commit/?id=3Dd0b2461678b12c08d43eaf6740485e2f2c3aeac6
> >>>         git remote add linux-next https://git.kernel.org/pub/scm/linu=
x/kernel/git/next/linux-next.git
> >>>         git fetch --no-tags linux-next master
> >>>         git checkout d0b2461678b12c08d43eaf6740485e2f2c3aeac6
> >>>         # save the config file
> >>>         mkdir build_dir && cp config build_dir/.config
> >>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/mak=
e.cross W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
> >>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/mak=
e.cross W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/ata/
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306141702.ZaO9V2lk=
-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> drivers/ata/pata_octeon_cf.c:835:7: error: call to undeclared funct=
ion 'of_property_read_reg'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
> >>>      835 |         rv =3D of_property_read_reg(node, 0, &reg, NULL);
> >>
> >> Rob,
> >>
> >> I guess this is missing:
> >>
> >> diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf=
.c
> >> index 57b2166a6d5d..ff538b858928 100644
> >> --- a/drivers/ata/pata_octeon_cf.c
> >> +++ b/drivers/ata/pata_octeon_cf.c
> >> @@ -16,6 +16,7 @@
> >>  #include <linux/slab.h>
> >>  #include <linux/irq.h>
> >>  #include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>  #include <linux/of_platform.h>
> >>  #include <linux/platform_device.h>
> >>  #include <scsi/scsi_host.h>
> >>
> >> I can add that if you want. Or you can send a fix and I will queue it,
> >> whichever is fine.
> >
> > If you can fix it up, that would be great.
>
> Done.
>
> > I'll look into whether this can be made easier to reproduce. These
> > patches had been on a branch and picked up by 0-day. There must be
> > some implicit include of of_address.h somewhere.
>
> I looked into enabling compile test with removing the MIPS dependency to =
make
> sure this driver also goes through my regular compile tests (I am lazy, I=
 do
> x86_64 only :)).
>
> Something like this works for ahci_octeon:
>
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index 4572f837e504..6b115685a86e 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -239,7 +239,7 @@ config AHCI_MVEBU
>
>  config AHCI_OCTEON
>         tristate "Cavium Octeon Soc Serial ATA"
> -       depends on SATA_AHCI_PLATFORM && MIPS && (CAVIUM_OCTEON_SOC || CO=
MPILE_TEST)
> +       depends on SATA_AHCI_PLATFORM && ((MIPS && CAVIUM_OCTEON_SOC) ||
> COMPILE_TEST)
>         default y
>         help
>           This option enables support for Cavium Octeon SoC Serial ATA.
> diff --git a/drivers/ata/ahci_octeon.c b/drivers/ata/ahci_octeon.c
> index 5021ab3ede49..2e6b28bf43f4 100644
> --- a/drivers/ata/ahci_octeon.c
> +++ b/drivers/ata/ahci_octeon.c
> @@ -15,8 +15,13 @@
>  #include <linux/platform_device.h>
>  #include <linux/of_platform.h>
>
> +#ifdef CONFIG_MIPS
>  #include <asm/octeon/octeon.h>
>  #include <asm/bitfield.h>
> +#else
> +#define cvmx_readq_csr(csr)            (0)
> +#define cvmx_writeq_csr(csr, cfg)      do { } while (0)
> +#endif

That's kind of ugly...

>
>  #define CVMX_SATA_UCTL_SHIM_CFG                0xE8
>
> But it is not that simple for pata_octeon...

I copied you on mine[1]. It doesn't build for !MIPS, but at least
doesn't depend on a specific config. Should be good enough for 0-day
to build somewhat quickly.

Rob

[1] https://lore.kernel.org/all/20230614173633.2430653-2-robh@kernel.org/
