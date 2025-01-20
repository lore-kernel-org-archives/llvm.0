Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123F1B413E;
	Mon, 20 Jan 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369425; cv=none; b=LrI/v1tH+tcImaf8uMWBgnZyM9nmksIRJLMBZ1yU8pwHI6R6oe0tmS+YZs8kmOsVT7+HWFU+5OCjWU1qNrgwTCdDRJpeGwNE1GHCKS6iDbw53O4WXJs3KbNCSjeGBFJP/8I3Ln8ZRwezkpCHI5z+h3ZxLIaXT7x1NpmC7ki1/Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369425; c=relaxed/simple;
	bh=2Y8rhalkSnJByIflPDkpkZUXQkZELIhFgcolyzxdjyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhz/786RNgY85QalxAEhVNEo+8nL+bw/rw7iHlHDMaW1dO33cDkTLRTTbZWEp8UJXyItp4nUHWcIhypmK41Ne2eNC/lXo6diW/cxFwjvfAaNLnuhzrnE0/fn0ky43QEnt0yIAgT9bVYeOT9Hgj2hJQQZLBgmGWXXPPSBbehXZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTrYEeV5; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTrYEeV5"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-468f6b3a439so44028351cf.1;
        Mon, 20 Jan 2025 02:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737369422; x=1737974222; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1kEh6niBzmPc+f+vVAXKspS9IJe5ux+6JuWsreZ1Gg=;
        b=LTrYEeV5kzOjocU/vAQpsQEOIpbzbmUTnZ4sqrbaHcOF++vPywU/xSHOD0mv1LOfEE
         Q26OCoYvbSOC7MP2VxQtwW5Qv2eOh5+XWxk3C4qVOCEW6ven651lre+L2Y5kcY8NO0Yn
         BuxgwEseNDAag434Pnq4WfnaubZkzxeyJWIFynDu6pWi8Ec+oQJRSH1oHS5ek1RfTXXp
         RZ+S2mCBlMcXWpt0gxr8O4uFlBF6dKH0NWsa3nLF1+6WVoaACas+fWZikKhlTlmd7D82
         DteOpE9/8CL+u/gh4rapvyG5pniMm4XJfTxPV7oipI/lns8FWbeHBdRlGXOecyLXG/K9
         j7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369422; x=1737974222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1kEh6niBzmPc+f+vVAXKspS9IJe5ux+6JuWsreZ1Gg=;
        b=PPQIvhV+/LjyRsWLQ9UqaPWAFtQL13wl3VS0qZmdm67VkTxd5JxHEuVqi012Czc9Dv
         Gd+jGBFjasNenxXoa6XTqag32b2oVYMSmDtUDEGld0dYfzme2ZPhZK0Ap9b14IIicgvu
         /8pdtPtf0Ai+6KWTQwCMVi+/M296zqSylKv6EOUbuvaVR0xu6T/wpdmetU/7DvCqL6OS
         +egJXoz7P6FQ7Gk4fMTHs+CFe/AnVZodKwSjqJm1mpK26jnX6WnMBonQQnhreZJAYGdH
         RprqEOdes+hQkEOzVQqo1bdin9jztoQLCeXd1kpVtPLsDdj08cMFi6XnXGxljTzeCagH
         g/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCW2L3ed6IKHfVLuYrN6otegYIHOomPHWJfNgRV07U0dE6LPnVMkyxns5v48z7CwJ6RuP4ot0DiYjYZiw8yR@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0+NFrISzvcRm0R4uFL3Ji5lZNHlDAHgNB1OZQteh5pJJyOcqA
	4DZdEUJHjrq2KDesYzmSsNuK3ZTE6G0FX5VPQqY2/xz7acMcIDBB57QvkYAdZAiUnhcueTCILUQ
	7nJuy7OsrBCw8e4kwVCN5Cm0w1ljxDLr0
X-Gm-Gg: ASbGnctqvC6t1iqFzlRCQfcZ+m9mvkvYFQqIpVKU9sARATrA8HXTvk2b9apU+W917Un
	BO2Sq/3wrMISLNxb8NY4gN4SNegBHshU/h4F4Ivr3M5zZuVneuQ==
X-Google-Smtp-Source: AGHT+IHrlmS1pdf5uax6BrTPJ1M6SfU7VqaLZk+Ua5pgVhDBGtNSjFLhqIH0vMrWhyZpMk5GGeBTSyMU/c9nnZ5WemU=
X-Received: by 2002:ac8:7e93:0:b0:467:86c0:4bff with SMTP id
 d75a77b69052e-46e12b96e26mr163456121cf.51.1737369422355; Mon, 20 Jan 2025
 02:37:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com>
In-Reply-To: <202501201840.XmpHXpQ4-lkp@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 11:36:50 +0100
X-Gm-Features: AbW1kvYxUGNtM6aSynoe_rc9BVDnwz0Vbphh7C8rhN_ytxXYOXbXJEbxHtWgX6U
Message-ID: <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 11:32 kernel test robot
<lkp@intel.com> ha scritto:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
> commit: 82e703dd438b71432cc0ccbb90925d1e32dd014a [9185/10024] pmdomain: airoha: Add Airoha CPU PM Domain support
> config: arm-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
>       59 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
>          |         ^
>    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
>          |                         ^
>    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
>      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
>          |                                                 ^
>    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
>      477 | #define SMCCC_SMC_INST  __SMC(0)
>          |                         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>      215 |         __inst_thumb32(thumb_opcode)
>          |         ^
>    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
>      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
>          |                           ^
>    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
>      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
>          |         ^
> >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
>    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
>          |                         ^
>    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
>      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
>          |                                                 ^
>    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
>      478 | #define SMCCC_HVC_INST  __HVC(0)
>          |                         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>      215 |         __inst_thumb32(thumb_opcode)
>          |         ^
>    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
>      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
>          |                           ^
>    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
>      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
>          |         ^
> >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
>    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
>          |                         ^
>    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
>      602 |                 asm ("" :                                               \
>          |                      ^
>    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
>       35 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
>          |         ^
>    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
>          |                         ^
>    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
>      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
>          |                                                 ^
>    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
>      477 | #define SMCCC_SMC_INST  __SMC(0)
>          |                         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>      215 |         __inst_thumb32(thumb_opcode)
>          |         ^
>    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
>      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
>          |                           ^
>    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
>      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
>          |         ^
>    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
>    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
>          |                         ^
>    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
>      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
>          |                                                 ^
>    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
>      478 | #define SMCCC_HVC_INST  __HVC(0)
>          |                         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
>      215 |         __inst_thumb32(thumb_opcode)
>          |         ^
>    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
>      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
>          |                           ^
>    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
>      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
>          |         ^
>    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
>    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
>      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
>          |                         ^
>    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
>      602 |                 asm ("" :                                               \
>          |                      ^
>    6 errors generated.
>
>
> vim +/R7 +59 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
>
>     53
>     54  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
>     55                                                       unsigned int state)
>     56  {
>     57          struct arm_smccc_res res;
>     58
>   > 59          arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
>     60                               0, state, 0, 0, 0, 0, &res);
>     61
>     62          /* SMC signal correct apply by unsetting BIT 0 */
>     63          return res.a0 & BIT(0) ? -EINVAL : 0;
>     64  }
>     65
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
Error is "error: write to reserved register 'R7'" and I guess it's very specific
to some kind of ARM ERRATA.
