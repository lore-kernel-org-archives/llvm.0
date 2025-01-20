Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDA71E103B;
	Mon, 20 Jan 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380095; cv=none; b=C5Qf+nK3gZTCBr3uXAHXu5i6ckmvoDfOhKsU7o3CgF+VNgynxE3qY4+ONMByTlj+rOGB/NHAAnxUQL66RcWUITOcQYFOHnm7Ghb7UTsw38bmLcORxwdD4Di34d3AucEFlL+Zzeg15BZhsCTu2MPwd0kGPXKBlxEsxKdcbAvbkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380095; c=relaxed/simple;
	bh=2ail9kowFrrxqYKQPlFuyurId2ug1BjJnFKLKV6SZGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMYBm3CLHOBz6+4dZ9bI1c+Ebkb40vnbD1+rCd0F+0n6cVxTjVVvHd6xnDida77RuaUVPmj4JJH913Ip4GajQ/mir7LWy3P9YOeOX7jadosny6mDl1PqYBrJMBTkoc4UJ9AeAbSYLPQm7QVZGyLLI8+ZAFzCefuY194uHhaxd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D917C1063;
	Mon, 20 Jan 2025 05:35:19 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 459A83F740;
	Mon, 20 Jan 2025 05:34:50 -0800 (PST)
Date: Mon, 20 Jan 2025 13:34:47 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <Z45Q9zJ8mvE_ut2R@bogus>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>

On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> + Sudeep,
> 
> On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> <ansuelsmth@gmail.com> wrote:
> >
> > Il giorno lun 20 gen 2025 alle ore 11:32 kernel test robot
> > <lkp@intel.com> ha scritto:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
> > > commit: 82e703dd438b71432cc0ccbb90925d1e32dd014a [9185/10024] pmdomain: airoha: Add Airoha CPU PM Domain support
> > > config: arm-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/config)
> > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201840.XmpHXpQ4-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > >       59 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> > >          |         ^
> > >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> > >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> > >          |                                                 ^
> > >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> > >      477 | #define SMCCC_SMC_INST  __SMC(0)
> > >          |                         ^
> > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > >      215 |         __inst_thumb32(thumb_opcode)
> > >          |         ^
> > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > >          |                           ^
> > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > >          |         ^
> > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> > >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> > >          |                                                 ^
> > >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> > >      478 | #define SMCCC_HVC_INST  __HVC(0)
> > >          |                         ^
> > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > >      215 |         __inst_thumb32(thumb_opcode)
> > >          |         ^
> > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > >          |                           ^
> > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > >          |         ^
> > > >> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to reserved register 'R7'
> > >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> > >      602 |                 asm ("" :                                               \
> > >          |                      ^
> > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > >       35 |         arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
> > >          |         ^
> > >    include/linux/arm-smccc.h:632:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      632 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:575:48: note: expanded from macro 'arm_smccc_1_1_smc'
> > >      575 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
> > >          |                                                 ^
> > >    include/linux/arm-smccc.h:477:24: note: expanded from macro 'SMCCC_SMC_INST'
> > >      477 | #define SMCCC_SMC_INST  __SMC(0)
> > >          |                         ^
> > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > >      215 |         __inst_thumb32(thumb_opcode)
> > >          |         ^
> > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > >          |                           ^
> > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > >          |         ^
> > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > >    include/linux/arm-smccc.h:629:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      629 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:591:48: note: expanded from macro 'arm_smccc_1_1_hvc'
> > >      591 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
> > >          |                                                 ^
> > >    include/linux/arm-smccc.h:478:24: note: expanded from macro 'SMCCC_HVC_INST'
> > >      478 | #define SMCCC_HVC_INST  __HVC(0)
> > >          |                         ^
> > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
> > >    arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
> > >      215 |         __inst_thumb32(thumb_opcode)
> > >          |         ^
> > >    arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
> > >      205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
> > >          |                           ^
> > >    arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
> > >      230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
> > >          |         ^
> > >    drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:35:2: error: write to reserved register 'R7'
> > >    include/linux/arm-smccc.h:635:4: note: expanded from macro 'arm_smccc_1_1_invoke'
> > >      635 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
> > >          |                         ^
> > >    include/linux/arm-smccc.h:602:8: note: expanded from macro '__fail_smccc_1_1'
> > >      602 |                 asm ("" :                                               \
> > >          |                      ^
> > >    6 errors generated.
> > >
> > >
> > > vim +/R7 +59 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> > >
> > >     53
> > >     54  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
> > >     55                                                       unsigned int state)
> > >     56  {
> > >     57          struct arm_smccc_res res;
> > >     58
> > >   > 59          arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
> > >     60                               0, state, 0, 0, 0, 0, &res);
> > >     61
> > >     62          /* SMC signal correct apply by unsetting BIT 0 */
> > >     63          return res.a0 & BIT(0) ? -EINVAL : 0;
> > >     64  }
> > >     65
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
> > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > to some kind of ARM ERRATA.
> 
> I don't know to be honest. The arm-scmi transport driver
> (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> problem here and not there?
>

I think it is known issue and must be solved with the below patch if my
understanding is right.

> Anyway, do you need all the parameters? Perhaps try to drop some?
>

I don't think we need to do that.

> That said, I am keeping the offending patch as is and expecting to get
> a fix as soon as possible.
>

Let me know if the patch helps.

Regards,
Sudeep

--->8

diff --git i/drivers/pmdomain/mediatek/Makefile w/drivers/pmdomain/mediatek/Makefile
index 0f6edce9239b..7e7016f9526e 100644
--- i/drivers/pmdomain/mediatek/Makefile
+++ w/drivers/pmdomain/mediatek/Makefile
@@ -2,3 +2,9 @@
 obj-$(CONFIG_MTK_SCPSYS)               += mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)    += mtk-pm-domains.o
 obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN)     += airoha-cpu-pmdomain.o
+ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
+# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
+# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
+# hooks are inserted via the -pg switch.
+CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
+endif

