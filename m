Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA722C9C;
	Wed, 14 Jun 2023 15:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB41C433C0;
	Wed, 14 Jun 2023 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756417;
	bh=oMSxcw3X6zlLbI5UmWxFFgbH+T9vMTVCLfV7wjlwkcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJmYGJaatmXiYivuVpGOckaMShdIE/Tx2FKVtqzbdRpmmUUqSN+leqytt5aqOQ9ev
	 BxC80MBmI3zfOjs+JRFFxcwZnunlH7yLfAJu5OYcLmTgsx7Gv5bcHPt0U9sADJJETJ
	 AAamKLLWdYwQ1ERIFJulBg8L7MOdegIMlhOe9ZnqPBsHq9RC/JGWvZ1c408iTJ1Yo5
	 6ZMwPGPf4/ahTE5wD43rjw+lac8KDyXwAFH3E2QK0ybz59Y0M/PfdxViEUBYC4lFMK
	 0fSREqduy3eYh8ggrW7Jmi7Kacg/E588Ja1QaJitwx8ALxUiS4o6D98rlRgHlCtQEN
	 HZDk4WO5tv7gQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b1af9ef7a9so11809911fa.1;
        Wed, 14 Jun 2023 08:26:57 -0700 (PDT)
X-Gm-Message-State: AC+VfDxU++D6NzrfoBcuzXDZlCs5Bo7VPN9ySRHl5CuuXCSaUBLsv+MP
	sa1nlnLYhTHB8MO411IhvP/t3Q7os1ZgNisJzw==
X-Google-Smtp-Source: ACHHUZ7e2RDr8bq2bLrOdkSpQxhIRxybPf/oRpYUssszcDIESnr+wUGhHiDMVtpey3X5CHK6SJZ5VeBGRL8uqexvvsg=
X-Received: by 2002:a2e:b046:0:b0:2ac:70fa:fb7b with SMTP id
 d6-20020a2eb046000000b002ac70fafb7bmr7342135ljl.18.1686756415185; Wed, 14 Jun
 2023 08:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306141702.ZaO9V2lk-lkp@intel.com> <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
In-Reply-To: <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Jun 2023 09:26:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com>
Message-ID: <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com>
Subject: Re: [linux-next:master 9063/9793] drivers/ata/pata_octeon_cf.c:835:7:
 error: call to undeclared function 'of_property_read_reg'; ISO C99 and later
 do not support implicit function declarations
To: Damien Le Moal <dlemoal@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 3:41=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 6/14/23 18:23, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   b16049b21162bb649cdd8519642a35972b7910fe
> > commit: d0b2461678b12c08d43eaf6740485e2f2c3aeac6 [9063/9793] ata: Use o=
f_property_read_reg() to parse "reg"
> > config: mips-randconfig-r016-20230614 (https://download.01.org/0day-ci/=
archive/20230614/202306141702.ZaO9V2lk-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce (this is a W=3D1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mips64-linux-gnuabi64
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Dd0b2461678b12c08d43eaf6740485e2f2c3aeac6
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout d0b2461678b12c08d43eaf6740485e2f2c3aeac6
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/ata/
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306141702.ZaO9V2lk-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/ata/pata_octeon_cf.c:835:7: error: call to undeclared functio=
n 'of_property_read_reg'; ISO C99 and later do not support implicit functio=
n declarations [-Wimplicit-function-declaration]
> >      835 |         rv =3D of_property_read_reg(node, 0, &reg, NULL);
>
> Rob,
>
> I guess this is missing:
>
> diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
> index 57b2166a6d5d..ff538b858928 100644
> --- a/drivers/ata/pata_octeon_cf.c
> +++ b/drivers/ata/pata_octeon_cf.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <scsi/scsi_host.h>
>
> I can add that if you want. Or you can send a fix and I will queue it,
> whichever is fine.

If you can fix it up, that would be great.

I'll look into whether this can be made easier to reproduce. These
patches had been on a branch and picked up by 0-day. There must be
some implicit include of of_address.h somewhere.

Rob
