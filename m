Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FB13AD5;
	Tue, 25 Jul 2023 08:04:09 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1bb954414e8so343995fac.0;
        Tue, 25 Jul 2023 01:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690272248; x=1690877048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ04m2mgXyxdxnuWbV0zRomtSyCFjCa11c8E/6QMRLA=;
        b=Glp75s3Qru9qtU/75zTwGijITmJdiNviTxxVSuUeFpc+43Ng4UxWFGSy+ib2h22X6R
         9ELZ7yZnJR8lShxo3JGhqoies4mVNRrQfi4qht8WlTA6PJldwk4ahJ7oZf+jap3TjGYt
         eIpFDab5F/8AYrQmU7XJdneJoyzXWx0OmDAdcPrM+pxsEXIJzyRrmgE83wMo3PhysTsy
         YdACaJ2+5rSdI0D4lFgdFFrd148At9k9Yr6RjbwOFzkh04CCdo6lhTqr6QVr0egHJcBF
         wr6HpQuA2oxxCJzc2k/S2KiBIqAW7aJtR0TeEksG3ftg7GlI2cWp1ECJ2CqpL61nObPI
         uG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690272248; x=1690877048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ04m2mgXyxdxnuWbV0zRomtSyCFjCa11c8E/6QMRLA=;
        b=aCh09jbmbjmx/7IhZ82jObpaIQcDGrnIZdifDw/FOdjH0vReo8moKpMgaDK7J1Owwh
         pzpvIzlY5FIHP3d13GGoRGofVXfQ89ZU5TPiFcKezL+9GdxbiZNBtzqT7kPcNxFF1PPM
         /aaF00SpYad2CGONF92CW/OYrnsUIfDtu9bxG5MRXk3QAQ29v9qVqc2Nrlwhi1sWVOB6
         0po8Npa1mENrtoXnAE59yXQCdrumpg7H9RfuX1KHcMCM7LVgIA5cSxjayUQGaWqovsxC
         IwjMDhQ9mrSzdZi19XVXwngvmKA6ZR9AEdnq/zOyewWXlSh+e1o0vmHlpLgnALGoMxHS
         9EEw==
X-Gm-Message-State: ABy/qLboEGAthNQMCcMYKF6XeUUL59J7jdJMcXX6IPXhLqstCmIL5Vea
	haTPfxd2zJ2kyDb7j913bzyOFIa5dVFdsAalyA4=
X-Google-Smtp-Source: APBJJlEE32iRJIl1HaETRlOMGBsoQJRQDz1yuBtZ3gl0fAODhR06dO0WeJzLKEkgbjEXwu0nkMJ66KlhtNzz4iQ/flY=
X-Received: by 2002:a05:6870:9a05:b0:1ba:1998:1d23 with SMTP id
 fo5-20020a0568709a0500b001ba19981d23mr13834004oab.35.1690272247963; Tue, 25
 Jul 2023 01:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307242310.CdOnd2py-lkp@intel.com>
In-Reply-To: <202307242310.CdOnd2py-lkp@intel.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jul 2023 10:03:56 +0200
Message-ID: <CAMhs-H8Zz_8w7Lcq5f=mEiucjwx+TAfBbVZ12PE1a47ioxTu2A@mail.gmail.com>
Subject: Re: drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmips_of_match'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Jul 24, 2023 at 5:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
> commit: 6f3b15586eef736831abe6a14f2a6906bc0dc074 clk: ralink: add clock a=
nd reset driver for MTMIPS SoCs
> date:   5 weeks ago
> config: x86_64-buildonly-randconfig-r003-20230723 (https://download.01.or=
g/0day-ci/archive/20230724/202307242310.CdOnd2py-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242310=
.CdOnd2py-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307242310.CdOnd2py-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/ralink/clk-mtmips.c:309:9: warning: variable 'ret' is unin=
itialized when used here [-Wuninitialized]
>            return ret;
>                   ^~~
>    drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable '=
ret' to silence this warning
>            int ret, i;
>                   ^
>                    =3D 0
>    drivers/clk/ralink/clk-mtmips.c:359:9: warning: variable 'ret' is unin=
itialized when used here [-Wuninitialized]
>            return ret;
>                   ^~~
>    drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable '=
ret' to silence this warning
>            int ret, i;
>                   ^
>                    =3D 0

This two errors were already fixed in:

6e68dae946e3: ("clk: ralink: mtmips: Fix uninitialized use of ret in
mtmips_register_{fixed,factor}_clocks()")

> >> drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmi=
ps_of_match' [-Wunused-const-variable]
>    static const struct of_device_id mtmips_of_match[] =3D {
>                                     ^
>    3 warnings generated.

This one is because CONFIG_OF is disabled so 'of_match_node()' turns
into a dummy macro. What would be the correct approach here?
Add select OF in Kconfig for this driver or silence the warning
declaring 'mtmips_of_match' with __maybe_unused?

Thanks in advance for clarification.

Best regards,
    Sergio Paracuellos

>
>
> vim +/mtmips_of_match +821 drivers/clk/ralink/clk-mtmips.c
>
>    820
>  > 821  static const struct of_device_id mtmips_of_match[] =3D {
>    822          {
>    823                  .compatible =3D "ralink,rt2880-sysc",
>    824                  .data =3D &rt2880_clk_data,
>    825          },
>    826          {
>    827                  .compatible =3D "ralink,rt3050-sysc",
>    828                  .data =3D &rt305x_clk_data,
>    829          },
>    830          {
>    831                  .compatible =3D "ralink,rt3052-sysc",
>    832                  .data =3D &rt305x_clk_data,
>    833          },
>    834          {
>    835                  .compatible =3D "ralink,rt3352-sysc",
>    836                  .data =3D &rt3352_clk_data,
>    837          },
>    838          {
>    839                  .compatible =3D "ralink,rt3883-sysc",
>    840                  .data =3D &rt3883_clk_data,
>    841          },
>    842          {
>    843                  .compatible =3D "ralink,rt5350-sysc",
>    844                  .data =3D &rt5350_clk_data,
>    845          },
>    846          {
>    847                  .compatible =3D "ralink,mt7620-sysc",
>    848                  .data =3D &mt7620_clk_data,
>    849          },
>    850          {
>    851                  .compatible =3D "ralink,mt7628-sysc",
>    852                  .data =3D &mt76x8_clk_data,
>    853          },
>    854          {
>    855                  .compatible =3D "ralink,mt7688-sysc",
>    856                  .data =3D &mt76x8_clk_data,
>    857          },
>    858          {}
>    859  };
>    860
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
