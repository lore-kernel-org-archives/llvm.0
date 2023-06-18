Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75215A23;
	Sun, 18 Jun 2023 05:45:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-988883b0d8fso21239666b.1;
        Sat, 17 Jun 2023 22:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687067112; x=1689659112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5OCpoLLSwqpwTaOJjviEwGo1lJ2UP1XX1sq+Zw/Fig=;
        b=Ws/85BwQ8WmT2rPZ5ZNkaMakEIykdCA3Om3ZFwYuQSwrEj1X45nylvF4vEPKO0q6GC
         MW6DfVD+or9ysafykKHo6cygfxW2VGCFzw1yHspnC+XpXKr1vCKUB4b6JznlQ50X7W7b
         3it5jvur8AOOY4iY+dAuL35NfqAieaR9riexAi3tSiO6kAneMc/b86OPNhkvHKLLMM+J
         cSKn3Jjd+9R6RL6dDfI78uraMGv/M1Ude5CnAVoFUvbm7H1OzBnnqyvp9lU7KVTJXiKv
         N0+5sOv6QCkLb0NwbPZKN/xM+Co4e2BlXX4GMgC8fHw/5iIujaXjllWDnhpV8vD/ZqgK
         nKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687067112; x=1689659112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5OCpoLLSwqpwTaOJjviEwGo1lJ2UP1XX1sq+Zw/Fig=;
        b=JLsp08leIka33fgXis23XpTv4je5OEB3LsM+lyet1tPknnvQCH8qpvqBG6BQKQOBG5
         mW+q4ZBE/6pc4KOLKdNc/e5CjBc4rbmrDSOx6iQfnPqURhYJgYM4uNRhO0C75weFtDYu
         F6f8T8RYboXnHZe5oDfpXbQwxEV4jaJbn3ENdP1LtI1YMKw+lwpArykZoHRnTkH6+Pa9
         UcyDNkKEIuWiD7xbTCoGZAXs+Mq4q5kaF8/kmGdWkOp7WIZ3rnz5jzgJTLS0YoieolXa
         T9KE4xfnMMGHDUzewnCapKH5e9oDAVoMrHLBxsKmbUMgIb4I8Su49YUt1Y3bPbFKsVxj
         1FGQ==
X-Gm-Message-State: AC+VfDwcd5NvN+gC3+rYunaHoLIoUJSRhz4fNmAjxHUhf+xvay5HcJLu
	bhIQ6bvByS8m1JQlnbItLkB03Sz2GPTum03riI9pY6sylU0=
X-Google-Smtp-Source: ACHHUZ6eVxgbcW/n0S9DGE5iZKlCLVkKbRKYUumA6tq/a0YNY/WoCxhQMA2M9Vn5zqTD6zvrsX/VZsHkhuaQ4+NSsyo=
X-Received: by 2002:a17:906:6a06:b0:966:1984:9d21 with SMTP id
 qw6-20020a1709066a0600b0096619849d21mr6995304ejc.9.1687067112117; Sat, 17 Jun
 2023 22:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306172304.OtXP5VDT-lkp@intel.com>
In-Reply-To: <202306172304.OtXP5VDT-lkp@intel.com>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Sun, 18 Jun 2023 07:44:36 +0200
Message-ID: <CAOLZvyFPB4dEpz3+sxc0P7brgi7j78EKoBbUB3k+sBtGYytHHg@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-4.19.y 6274/6288] arch/mips/kernel/cpu-probe.c:2050:7:
 error: duplicate case value '786432'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this commit fa4caeb3f05cc831edac116c08ff80a769d88241 from 4.xx.
It fixes an issue introduced sometime during the 5.x cycle, and is therefor=
e
not applicable to 4.xx at all.

Thank you!
        Manuel


On Sat, Jun 17, 2023 at 5:54=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-4.19.y
> head:   d1785513fcf91e8e81e50a9adddfc08a064709cf
> commit: fa4caeb3f05cc831edac116c08ff80a769d88241 [6274/6288] MIPS: Restor=
e Au1300 support
> config: mips-pic32mzda_defconfig (https://download.01.org/0day-ci/archive=
/20230617/202306172304.OtXP5VDT-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172304=
.OtXP5VDT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306172304.OtXP5VDT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/mips/kernel/cpu-probe.c:2050:7: error: duplicate case value '7864=
32'
>     2050 |         case PRID_COMP_NETLOGIC:
>          |              ^
>    arch/mips/include/asm/cpu.h:44:28: note: expanded from macro 'PRID_COM=
P_NETLOGIC'
>       44 | #define PRID_COMP_NETLOGIC      0x0c0000
>          |                                 ^
>    arch/mips/kernel/cpu-probe.c:2024:7: note: previous case defined here
>     2024 |         case PRID_COMP_NETLOGIC:
>          |              ^
>    arch/mips/include/asm/cpu.h:44:28: note: expanded from macro 'PRID_COM=
P_NETLOGIC'
>       44 | #define PRID_COMP_NETLOGIC      0x0c0000
>          |                                 ^
>    1 error generated.
>
>
> vim +/786432 +2050 arch/mips/kernel/cpu-probe.c
>
> 9966db25defba4 Ralf Baechle       2007-10-11  1995
> 078a55fc824c16 Paul Gortmaker     2013-06-18  1996  void cpu_probe(void)
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  1997  {
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  1998      struct cpuinfo_mi=
ps *c =3D &current_cpu_data;
> 9966db25defba4 Ralf Baechle       2007-10-11  1999      unsigned int cpu =
=3D smp_processor_id();
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2000
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2001      /*
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2002       * Set a default =
elf platform, cpu probe may later
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2003       * overwrite it w=
ith a more precise value
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2004       */
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2005      set_elf_platform(=
cpu, "mips");
> 05510f2b481939 Marcin Nowakowski  2017-03-07  2006
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2007      c->processor_id =
=3D PRID_IMP_UNKNOWN;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2008      c->fpu_id       =
=3D FPIR_IMP_NONE;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2009      c->cputype      =
=3D CPU_UNKNOWN;
> 4f12b91d2da577 Markos Chandras    2014-07-18  2010      c->writecombine =
=3D _CACHE_UNCACHED;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2011
> 9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2012      c->fpu_csr31    =
=3D FPU_CSR_RN;
> 9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2013      c->fpu_msk31    =
=3D FPU_CSR_RSVD | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
> 9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2014
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2015      c->processor_id =
=3D read_c0_prid();
> 8ff374b9c296b9 Maciej W. Rozycki  2013-09-17  2016      switch (c->proces=
sor_id & PRID_COMP_MASK) {
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2017      case PRID_COMP_LE=
GACY:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2018              cpu_probe=
_legacy(c, cpu);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2019              break;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2020      case PRID_COMP_MI=
PS:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2021              cpu_probe=
_mips(c, cpu);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2022              break;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2023      case PRID_COMP_AL=
CHEMY:
> fa4caeb3f05cc8 Manuel Lauss       2023-05-10  2024      case PRID_COMP_NE=
TLOGIC:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2025              cpu_probe=
_alchemy(c, cpu);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2026              break;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2027      case PRID_COMP_SI=
BYTE:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2028              cpu_probe=
_sibyte(c, cpu);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2029              break;
> 1c0c13eb935c95 Aurelien Jarno     2007-09-25  2030      case PRID_COMP_BR=
OADCOM:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2031              cpu_probe=
_broadcom(c, cpu);
> 1c0c13eb935c95 Aurelien Jarno     2007-09-25  2032              break;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2033      case PRID_COMP_SA=
NDCRAFT:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2034              cpu_probe=
_sandcraft(c, cpu);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2035              break;
> a92b05880d261e Daniel Laird       2008-03-06  2036      case PRID_COMP_NX=
P:
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2037              cpu_probe=
_nxp(c, cpu);
> bdf21b18b4abf9 Pete Popov         2005-07-14  2038              break;
> 0dd4781bca5687 David Daney        2008-12-11  2039      case PRID_COMP_CA=
VIUM:
> 0dd4781bca5687 David Daney        2008-12-11  2040              cpu_probe=
_cavium(c, cpu);
> 0dd4781bca5687 David Daney        2008-12-11  2041              break;
> b2edcfc814017e Huacai Chen        2016-03-03  2042      case PRID_COMP_LO=
ONGSON:
> b2edcfc814017e Huacai Chen        2016-03-03  2043              cpu_probe=
_loongson(c, cpu);
> b2edcfc814017e Huacai Chen        2016-03-03  2044              break;
> 252617a4ab714d Paul Burton        2015-05-24  2045      case PRID_COMP_IN=
GENIC_D0:
> 252617a4ab714d Paul Burton        2015-05-24  2046      case PRID_COMP_IN=
GENIC_D1:
> 252617a4ab714d Paul Burton        2015-05-24  2047      case PRID_COMP_IN=
GENIC_E1:
> 83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2048              cpu_probe=
_ingenic(c, cpu);
> 83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2049              break;
> a7117c6bddcbff Jayachandran C     2011-05-11 @2050      case PRID_COMP_NE=
TLOGIC:
> a7117c6bddcbff Jayachandran C     2011-05-11  2051              cpu_probe=
_netlogic(c, cpu);
> a7117c6bddcbff Jayachandran C     2011-05-11  2052              break;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  2053      }
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2054
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2055      BUG_ON(!__cpu_nam=
e[cpu]);
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2056      BUG_ON(c->cputype=
 =3D=3D CPU_UNKNOWN);
> cea7e2dfdef53f Ralf Baechle       2008-10-30  2057
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2058      /*
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2059       * Platform code =
can force the cpu type to optimize code
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2060       * generation. In=
 that case be sure the cpu type is correctly
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2061       * manually setup=
 otherwise it could trigger some nasty bugs.
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2062       */
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2063      BUG_ON(current_cp=
u_type() !=3D c->cputype);
> dec8b1ca990055 Franck Bui-Huu     2007-10-08  2064
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2065      if (cpu_has_rixi)=
 {
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2066              /* Enable=
 the RIXI exceptions */
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2067              set_c0_pa=
gegrain(PG_IEC);
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2068              back_to_b=
ack_c0_hazard();
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2069              /* Verify=
 the IEC bit is set */
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2070              if (read_=
c0_pagegrain() & PG_IEC)
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2071                      c=
->options |=3D MIPS_CPU_RIXIEX;
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2072      }
> 2e274768e4dd95 Florian Fainelli   2016-02-09  2073
> 0103d23f44b1e9 Kevin Cernekee     2010-05-02  2074      if (mips_fpu_disa=
bled)
> 0103d23f44b1e9 Kevin Cernekee     2010-05-02  2075              c->option=
s &=3D ~MIPS_CPU_FPU;
> 0103d23f44b1e9 Kevin Cernekee     2010-05-02  2076
> 0103d23f44b1e9 Kevin Cernekee     2010-05-02  2077      if (mips_dsp_disa=
bled)
> ee80f7c73dc1b1 Steven J. Hill     2012-08-03  2078              c->ases &=
=3D ~(MIPS_ASE_DSP | MIPS_ASE_DSP2P);
> 0103d23f44b1e9 Kevin Cernekee     2010-05-02  2079
> 3d528b326d7da8 Markos Chandras    2014-07-14  2080      if (mips_htw_disa=
bled) {
> 3d528b326d7da8 Markos Chandras    2014-07-14  2081              c->option=
s &=3D ~MIPS_CPU_HTW;
> 3d528b326d7da8 Markos Chandras    2014-07-14  2082              write_c0_=
pwctl(read_c0_pwctl() &
> 3d528b326d7da8 Markos Chandras    2014-07-14  2083                       =
      ~(1 << MIPS_PWCTL_PWEN_SHIFT));
> 3d528b326d7da8 Markos Chandras    2014-07-14  2084      }
> 3d528b326d7da8 Markos Chandras    2014-07-14  2085
> 7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2086      if (c->options & =
MIPS_CPU_FPU)
> 7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2087              cpu_set_f=
pu_opts(c);
> 7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2088      else
> 7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2089              cpu_set_n=
ofpu_opts(c);
> 9966db25defba4 Ralf Baechle       2007-10-11  2090
> 8d5ded16ee7564 Joshua Kinard      2015-06-02  2091      if (cpu_has_bp_gh=
ist)
> 8d5ded16ee7564 Joshua Kinard      2015-06-02  2092              write_c0_=
r10k_diag(read_c0_r10k_diag() |
> 8d5ded16ee7564 Joshua Kinard      2015-06-02  2093                       =
          R10K_DIAG_E_GHIST);
> 8d5ded16ee7564 Joshua Kinard      2015-06-02  2094
> 8b8aa636f02879 Leonid Yegoshin    2014-11-13  2095      if (cpu_has_mips_=
r2_r6) {
> f6771dbb27c704 Ralf Baechle       2007-11-08  2096              c->srsets=
 =3D ((read_c0_srsctl() >> 26) & 0x0f) + 1;
> da4b62cd6762ce Al Cooper          2012-07-13  2097              /* R2 has=
 Performance Counter Interrupt indicator */
> da4b62cd6762ce Al Cooper          2012-07-13  2098              c->option=
s |=3D MIPS_CPU_PCI;
> da4b62cd6762ce Al Cooper          2012-07-13  2099      }
> f6771dbb27c704 Ralf Baechle       2007-11-08  2100      else
> f6771dbb27c704 Ralf Baechle       2007-11-08  2101              c->srsets=
 =3D 1;
> 91dfc423cc8cfd Guenter Roeck      2010-02-02  2102
> 4c0630346e2fcf Paul Burton        2015-07-27  2103      if (cpu_has_mips_=
r6)
> 4c0630346e2fcf Paul Burton        2015-07-27  2104              elf_hwcap=
 |=3D HWCAP_MIPS_R6;
> 4c0630346e2fcf Paul Burton        2015-07-27  2105
> a8ad136789b425 Paul Burton        2014-01-28  2106      if (cpu_has_msa) =
{
> a5e9a69e2cb64c Paul Burton        2014-01-27  2107              c->msa_id=
 =3D cpu_get_msa_id();
> a8ad136789b425 Paul Burton        2014-01-28  2108              WARN(c->m=
sa_id & MSA_IR_WRPF,
> a8ad136789b425 Paul Burton        2014-01-28  2109                   "Vec=
tor register partitioning unimplemented!");
> 3cc9fa7fb3e38e Paul Burton        2015-07-27  2110              elf_hwcap=
 |=3D HWCAP_MIPS_MSA;
> a8ad136789b425 Paul Burton        2014-01-28  2111      }
> a5e9a69e2cb64c Paul Burton        2014-01-27  2112
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2113      if (cpu_has_mips1=
6)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2114              elf_hwcap=
 |=3D HWCAP_MIPS_MIPS16;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2115
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2116      if (cpu_has_mdmx)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2117              elf_hwcap=
 |=3D HWCAP_MIPS_MDMX;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2118
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2119      if (cpu_has_mips3=
d)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2120              elf_hwcap=
 |=3D HWCAP_MIPS_MIPS3D;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2121
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2122      if (cpu_has_smart=
mips)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2123              elf_hwcap=
 |=3D HWCAP_MIPS_SMARTMIPS;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2124
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2125      if (cpu_has_dsp)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2126              elf_hwcap=
 |=3D HWCAP_MIPS_DSP;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2127
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2128      if (cpu_has_dsp2)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2129              elf_hwcap=
 |=3D HWCAP_MIPS_DSP2;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2130
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2131      if (cpu_has_dsp3)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2132              elf_hwcap=
 |=3D HWCAP_MIPS_DSP3;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2133
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2134      if (cpu_has_mips1=
6e2)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2135              elf_hwcap=
 |=3D HWCAP_MIPS_MIPS16E2;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2136
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2137      if (cpu_has_loong=
son_mmi)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2138              elf_hwcap=
 |=3D HWCAP_LOONGSON_MMI;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2139
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2140      if (cpu_has_loong=
son_ext)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2141              elf_hwcap=
 |=3D HWCAP_LOONGSON_EXT;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2142
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2143      if (cpu_has_loong=
son_ext2)
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2144              elf_hwcap=
 |=3D HWCAP_LOONGSON_EXT2;
> 34ab38cd80982b Jiaxun Yang        2019-10-10  2145
> 6ad816e77ed775 James Hogan        2016-05-11  2146      if (cpu_has_vz)
> 6ad816e77ed775 James Hogan        2016-05-11  2147              cpu_probe=
_vz(c);
> 6ad816e77ed775 James Hogan        2016-05-11  2148
> 91dfc423cc8cfd Guenter Roeck      2010-02-02  2149      cpu_probe_vmbits(=
c);
> 949e51bea342da David Daney        2010-10-14  2150
>
> :::::: The code at line 2050 was first introduced by commit
> :::::: a7117c6bddcbfff2fa237a14a853b32cb94bf59a MIPS: Netlogic XLR/XLS pr=
ocessor IDs.
>
> :::::: TO: Jayachandran C <jayachandranc@netlogicmicro.com>
> :::::: CC: Ralf Baechle <ralf@linux-mips.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
