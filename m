Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2871E102D
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378129; cv=none; b=f3lZ7NOyk1Uxoew59ORzjtPurSezCpD92jNcuw38lzdBVu0vZr5bKbCglW0CuFT3yWtU+MhycCId6trwRYgnZpvBvrw0N+j0Cq7I5rsWulV1nOxnu+q0N2vRA8wb1X9xKMz4xHf7RW1gxQb+CPERj/lIm6luj8w8Kf+/6XCpFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378129; c=relaxed/simple;
	bh=qJdDHElCR9Y5mAxQJBceyiXnBDMGcW2KsEeQii/kSN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufG9eQG1NLkpxZtCJDnfEFkZQEh1euK6jBLMY4zYNp5DxPABhnvwZSPynHha/KsUBdBoUqyG/KQpfVAd5y/hO1/8uuIXMaW4PPE8p/Ic2Wj5DZEQR+0O2+HM9Dvpjt8R+FL/vaPttQ67TUAHix5oaNrHNP0TlllcItpQon9njq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0NlBufp; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0NlBufp"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3983426f80so6689378276.1
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 05:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737378126; x=1737982926; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrSz6Pj76V1WqpJ3uXrfekI51Rp7RSd4U/RfF9APccc=;
        b=h0NlBufpZtY8mRVyerIjCP6C75NG0CSm578bJh6wjawt0isnjMUVMIwyGhR+K2fxna
         RMkUuByT4CX64ehcUHqzn7ROMihhT1vJ04/cb+pO0rCPO19kqlDSkgiW1LwJfGMzc+vU
         VV1+J4//X/HTBgPab2YEM+/Dv5B2/ZzuI/EK5vEecobAsXqpejlpE27qBH1rePsYG+oS
         GY0ivx1cDuWoxx0Y/UtjOLYLgieosSD9euofTK/sFDfqovmsVCHoOleAWoFf/nlXTfeV
         u1NUVzhZecJsX12i4tGuoqUPqzfetCxiT9sAUhKMNij+1YgaME5VsI8Egh1aVLhHFm9B
         N+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737378126; x=1737982926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrSz6Pj76V1WqpJ3uXrfekI51Rp7RSd4U/RfF9APccc=;
        b=LBDMEhCuA49WRz4NFgrdYZMA9+M6aE3/tF10wY7kT9Hz7/o+jLZ4DDWLrgnAYC7vLV
         jRxoBfseEd3bTV7ZZmKaydEvSAmOioUNBW0nCwv4cMUFnxFALEcgcue/ATEG9I5Bb8zk
         ipDgnXeFN1rYvKtZzHIG2ljf9KrQtKdth2SeVMaOxZPef02xULzf9hA2bzwtN4mGHm12
         /8VU6vAXDS2Xzxdiwo+VmHOL0pO9XnWQ1SWrKz7tZDDC2IXuKe5WQTfXKd9Z3M/eYceW
         TFwoIQv/jgO18iKYARNHLRYbzh1U94M6vctQnzWamcPsKnvX46vcNTqCsnI9OkWd7WLU
         I5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVzOIX8WgONdMU+th99f6WAvwIUrw2OjM3VZPx2uHRlu8Kspxp5+pkSwB8RxUdiJp0aCk+p@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2h5aVzJyI6+opU+VN5anp4Zb8Ra9i5n8Y/vGAZOGx6HX3s7I5
	Y9gajUWYlmeDHuVHk98cO/ZascmMQxzW5rCduATCj4trZ9IXYut/zbSXZdqWrUcDJEAuBXFxDyf
	s9YrT8JLvrisYoMOqfC9b6RH2SAv3M5eF7buzZQ==
X-Gm-Gg: ASbGncvBP4hGQdlxMD/9Bx956Ll5+QdkO47J83QuwDg5RX4yd9zAhH4gUHDTomuzGkx
	HM1Qf2+Ly6g5UXJF2rD/Ci7RW2op/zmGzrSYkyc6WiZxVcPj5Fu8ypjvrGaQITvg=
X-Google-Smtp-Source: AGHT+IG7+9Gi7/TxpQ89EIO46nUbJ0N0XvzXIb8CmW7RSAwgrTfuGorv5TgJo4GiVfH0K0mrYj5hBCl8fTq2cApId20=
X-Received: by 2002:a05:6902:2b0e:b0:e57:442a:befa with SMTP id
 3f1490d57ef6-e57b13310efmr7758796276.48.1737378125990; Mon, 20 Jan 2025
 05:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com> <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
In-Reply-To: <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Jan 2025 14:01:30 +0100
X-Gm-Features: AbW1kvbWjLl1zoAghchHylQScyjEi2MKhWacXgKAbimMsRkQrL_a-qeiz58hJSM
Message-ID: <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Sudeep,

On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
>
> Il giorno lun 20 gen 2025 alle ore 11:32 kernel test robot
> <lkp@intel.com> ha scritto:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
> > commit: 82e703dd438b71432cc0ccbb90925d1e32dd014a [9185/10024] pmdomain: airoha: Add Airoha CPU PM Domain support
> > config: arm-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> >       59 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> >          |         ^
> >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> >          |                         ^
> >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> >          |                                                 ^
> >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> >      477 | #define SMCCC_SMC_INST  __SMC(0)
> >          |                         ^
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> >      215 |         __inst_thumb32(thumb_opcode)
> >          |         ^
> >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> >          |                           ^
> >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> >          |         ^
> > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> >          |                         ^
> >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> >          |                                                 ^
> >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> >      478 | #define SMCCC_HVC_INST  __HVC(0)
> >          |                         ^
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> >      215 |         __inst_thumb32(thumb_opcode)
> >          |         ^
> >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> >          |                           ^
> >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> >          |         ^
> > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> >          |                         ^
> >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> >      602 |                 asm ("" :                                               \
> >          |                      ^
> >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> >       35 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
> >          |         ^
> >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> >          |                         ^
> >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> >          |                                                 ^
> >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> >      477 | #define SMCCC_SMC_INST  __SMC(0)
> >          |                         ^
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> >      215 |         __inst_thumb32(thumb_opcode)
> >          |         ^
> >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> >          |                           ^
> >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> >          |         ^
> >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> >          |                         ^
> >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> >          |                                                 ^
> >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> >      478 | #define SMCCC_HVC_INST  __HVC(0)
> >          |                         ^
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> >      215 |         __inst_thumb32(thumb_opcode)
> >          |         ^
> >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> >          |                           ^
> >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> >          |         ^
> >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> >          |                         ^
> >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> >      602 |                 asm ("" :                                               \
> >          |                      ^
> >    6 errors generated.
> >
> >
> > vim +/R7 +59 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> >
> >     53
> >     54  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
> >     55                                                       unsigned int state)
> >     56  {
> >     57          struct arm_smccc_res res;
> >     58
> >   > 59          arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> >     60                               0, state, 0, 0, 0, 0, &res);
> >     61
> >     62          /* SMC signal correct apply by unsetting BIT 0 */
> >     63          return res.a0 & BIT(0) ? -EINVAL : 0;
> >     64  }
> >     65
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> Error is "error: write to reserved register 'R7'" and I guess it's very specific
> to some kind of ARM ERRATA.

I don't know to be honest. The arm-scmi transport driver
(drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
problem here and not there?

Anyway, do you need all the parameters? Perhaps try to drop some?

That said, I am keeping the offending patch as is and expecting to get
a fix as soon as possible.

Kind regards
Uffe
