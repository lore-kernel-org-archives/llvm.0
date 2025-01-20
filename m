Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E81FC8;
	Mon, 20 Jan 2025 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380254; cv=none; b=Nxh2/uGM9OVdmke9tPP+pCHT5NfWjHv/m7eIHgbA2L08q08rDpNDivenKs+vez9MlA0++OwOx+rr/UEPMLbB7B0pIvUFht/cDoq+oE1Ngg+j51oRfHX4iRRg6CydyigztykKB6EcyhyZ0n3EuvHYiyg5m6yPdy5QemVEULy8fxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380254; c=relaxed/simple;
	bh=0ss+kIyq/0UZ2XTvkpyEp5A2v+lZSmFFpo/THYy8MM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9UKWWL1TEPfVgqOn+mN+bakvjONv6pDciersQZPhKNEUfM5HP+8q1PN/go3m2V33zWxHYEEQlGnE+n2wGNiOHsRYJQTfUujvx8ToyQ/3lMYQ5E/J1f73584GJe/pgM09z+ULGssrAhEPQRgZ/DMNYgOXqXUbnoev5jEVrpDY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IokH4wU0; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IokH4wU0"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6f0afda3fso473344185a.2;
        Mon, 20 Jan 2025 05:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737380251; x=1737985051; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YpYw9PJV0Psh9+PyaynH07qKLfCaibXFDWz6lHi7Rhg=;
        b=IokH4wU05KGMkXo4nhjZEb1BDbdQ65z0M0eD30BVWo1qryyOhFm/79Sxl6Pkd4QdJa
         moRuEpPccgD61LTUhmy9UiUYKxfILtGztjkpNbJ7Wyi8HQF4lH1NDm+KNw5v2zA9o5Nf
         NVD/WK/Wkr36+qpWA0Ev1T54+38QW3wk+NLAznS8LUbhznr61X27uPFjOfswsDmDkFXq
         9R07CGgvH/JX5N1lJ4BoqqE4ZA7ScglRRP/PyYoP8kl3Xtf5imw692MqzOW5qPuJWHzD
         dpf8BLiEJ/A4X9e3HVXZIwKVngY3Aem3xRAIfhqpimcCW9ULj8LnUhL+XdK4POrHno2w
         Aw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737380251; x=1737985051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpYw9PJV0Psh9+PyaynH07qKLfCaibXFDWz6lHi7Rhg=;
        b=bhRIGgVwvrrdl20yqbt3ZvZmilH8Uvwr6cIHrvW/QT/McZaz8FhDzHJCMUf3qjv3h5
         cEl3zzpXsNKxIfxiZSM3dj+57v5M2M+zj8NiYBs6/szPxVO0012jyIcKL8+qTE0f7uNZ
         /xje2Rf6UT1Xpvo/ZS/ZsNG3FXHbL+wrjJxCKn+I7uvb8i6MYAx6cUbliA49z14/NfH8
         onp1IGCt+9A0jvvS02YdhlJaFLOaxtArdHDzPwdxFCVPUhWIAiaLgsJPfKqXYIrWRNKm
         PI3VhYP9ldBhsOSbRuXCxTjO+qOxBvwwrQTbTjGzjMj0L2FaQ5SDh/vWZDWI2RCYY4KB
         t8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxP4gnTHiZECWkH/VPkIPziaw00Zhwjv7zhW7UQHDLbwJJlHTgMrH2hbP0tUNGTHPVB9h7@lists.linux.dev, AJvYcCWAM6skpIzkp6Jh9x2KPqqsjugOhhTwfr9UQSv28UZUOZfq2y27f0z1BcYsi22Rp2L7R6yIraXkpIZZSj5O8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7WIUY2OLgz5nbChIlLyMB2ltiHv+AR91U8qaUKZ9GUHSQ3fcZ
	7M3A6srH1cxs004hIQ1yhEvA38bSr9evLb/X3Jz1Vf3TAMF8xxGjRhWq5R/VYiNSgLvoqGevWTT
	w41tylY3j9Phapp9XxZ2zgjLmrSM=
X-Gm-Gg: ASbGncvX6qurBu4SHSlKx4ItL0ep5LKg2Y1nL/nfjy2tZhRWdmzewqcnPtSBfFCU2yw
	jR4YPSa0Gf1Lq/y/+/I+7PIosGMp8FxXJ+Lue1J51fLNfMTlwDQ==
X-Google-Smtp-Source: AGHT+IG1tjC87ReLtwMh3yAFWwVWL/CJnE1QoMbQBWFX4D6lZ+VHogxeUwgxmX/9JEn5jOAknRNZQo9L4F+s/tB98lQ=
X-Received: by 2002:a05:6214:2b0b:b0:6d8:af2d:2a44 with SMTP id
 6a1803df08f44-6e1b220e38emr198524026d6.32.1737380251479; Mon, 20 Jan 2025
 05:37:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com> <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com> <Z45Q9zJ8mvE_ut2R@bogus>
In-Reply-To: <Z45Q9zJ8mvE_ut2R@bogus>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 14:37:19 +0100
X-Gm-Features: AbW1kvZCChG13juEBlrUNXpb7psD-iEFWj9n4ZSCen7iTjHfdUwkBNfu7soAmZs
Message-ID: <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
<sudeep.holla@arm.com> ha scritto:
>
> On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > + Sudeep,
> >
> > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > <ansuelsmth@gmail.com> wrote:
> > >
> > > Il giorno lun 20 gen 2025 alle ore 11:32 kernel test robot
> > > <lkp@intel.com> ha scritto:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
> > > > commit: 82e703dd438b71432cc0ccbb90925d1e32dd014a [9185/10024] pmdomain: airoha: Add Airoha CPU PM Domain support
> > > > config: arm-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/config)
> > > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > > >       59 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> > > >          |         ^
> > > >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> > > >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> > > >          |                                                 ^
> > > >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> > > >      477 | #define SMCCC_SMC_INST  __SMC(0)
> > > >          |                         ^
> > > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > > >      215 |         __inst_thumb32(thumb_opcode)
> > > >          |         ^
> > > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > > >          |                           ^
> > > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > > >          |         ^
> > > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > > >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> > > >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> > > >          |                                                 ^
> > > >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> > > >      478 | #define SMCCC_HVC_INST  __HVC(0)
> > > >          |                         ^
> > > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > > >      215 |         __inst_thumb32(thumb_opcode)
> > > >          |         ^
> > > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > > >          |                           ^
> > > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > > >          |         ^
> > > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > > >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> > > >      602 |                 asm ("" :                                               \
> > > >          |                      ^
> > > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > > >       35 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
> > > >          |         ^
> > > >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> > > >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> > > >          |                                                 ^
> > > >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> > > >      477 | #define SMCCC_SMC_INST  __SMC(0)
> > > >          |                         ^
> > > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > > >      215 |         __inst_thumb32(thumb_opcode)
> > > >          |         ^
> > > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > > >          |                           ^
> > > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > > >          |         ^
> > > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > > >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> > > >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> > > >          |                                                 ^
> > > >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> > > >      478 | #define SMCCC_HVC_INST  __HVC(0)
> > > >          |                         ^
> > > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > > >      215 |         __inst_thumb32(thumb_opcode)
> > > >          |         ^
> > > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > > >          |                           ^
> > > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > > >          |         ^
> > > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > > >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > > >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> > > >          |                         ^
> > > >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> > > >      602 |                 asm ("" :                                               \
> > > >          |                      ^
> > > >    6 errors generated.
> > > >
> > > >
> > > > vim +/R7 +59 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> > > >
> > > >     53
> > > >     54  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
> > > >     55                                                       unsigned int state)
> > > >     56  {
> > > >     57          struct arm_smccc_res res;
> > > >     58
> > > >   > 59          arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> > > >     60                               0, state, 0, 0, 0, 0, &res);
> > > >     61
> > > >     62          /* SMC signal correct apply by unsetting BIT 0 */
> > > >     63          return res.a0 & BIT(0) ? -EINVAL : 0;
> > > >     64  }
> > > >     65
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
> > >
> > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > to some kind of ARM ERRATA.
> >
> > I don't know to be honest. The arm-scmi transport driver
> > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > problem here and not there?
> >
>
> I think it is known issue and must be solved with the below patch if my
> understanding is right.
>

If it's a known issue and affects also other use of smcc why we need
specific fix in the driver makefile instead of a more generic one.

Do you have a link for the known issue?

> > Anyway, do you need all the parameters? Perhaps try to drop some?
> >
>
> I don't think we need to do that.
>

No we don't but the macro require to define all of them...

> > That said, I am keeping the offending patch as is and expecting to get
> > a fix as soon as possible.
> >
>
> Let me know if the patch helps.
>

I will test!

> Regards,
> Sudeep
>
> --->8
>
> diff --git i/drivers/pmdomain/mediatek/Makefile w/drivers/pmdomain/mediatek/Makefile
> index 0f6edce9239b..7e7016f9526e 100644
> --- i/drivers/pmdomain/mediatek/Makefile
> +++ w/drivers/pmdomain/mediatek/Makefile
> @@ -2,3 +2,9 @@
>  obj-$(CONFIG_MTK_SCPSYS)               += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)    += mtk-pm-domains.o
>  obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN)     += airoha-cpu-pmdomain.o
> +ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
> +# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> +# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> +# hooks are inserted via the -pg switch.
> +CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
> +endif
>
