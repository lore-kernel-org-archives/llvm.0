Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D94748D;
	Fri,  6 Jun 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208246; cv=none; b=itflTooThF7XI7T4Psszvr3AwCej3tfcjUY9tCOk5M+nQLLN4KvawyjfT7opCb1JS3qZbAe7+ctmXrLc/9UqlFKWCD85a5zSe0jg9Hjl3bAV8LjX9lay7eu2ndJGt3jQ6xVmjfzfIWYK1OJEqQppuXkFGJGIJgtOIXc+S9OA6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208246; c=relaxed/simple;
	bh=+lyusdDE3BFL7RWmDiyTDLK2U7O2Fnuz/TNzGUTd1LE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCL0JeS7gyGmU7tz0Yiutxr4gjBrOM4N7qSRAi6CtKFBpO2ktfBwIjQHYwNdFBbphW/Tp0+lsnhDcjX+RMqcxaBSqrLUEcmspKeVwXrFbUbovTHqrhHXuN4V5+a+ikNPZy+C0XstkZVoLQ908UvD92knK9wXAih/GUUyXJkBxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR5axkg+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR5axkg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749208243; x=1780744243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lyusdDE3BFL7RWmDiyTDLK2U7O2Fnuz/TNzGUTd1LE=;
  b=IR5axkg+wCOu3gziZOz1nto1ylMPr3AqVSA4y8ajXYaahmZirNoFRHPE
   AxNvcKWkip4F7k00EktedVlk9ELAsJ1gU8EE74pIHM130+LJ1xvXt+jv7
   v1dysk3EzuUwgCWwCUbViDb5tBl5TpE1R0uDvn2QSvHov5escrfLhg9ec
   j5JvSDPEAYiruh+U7fawPBJMxy6U7aOBczw5EbBOOw4hQJXa+J3ePQ0aF
   dGHJzctOTrcskq9vTgRY/fSO1MupsNidt9B95ReALz4RUtTEGVpohLcP2
   881LFhTY6ZdQHhHkVGjc4KhAj82aOcu5TElVo9WBAu4a8T8cAxCID6eaQ
   g==;
X-CSE-ConnectionGUID: cuXhXYcNSvO4KQWPl3pEsg==
X-CSE-MsgGUID: dl1TMShLSs6q45RFI2aRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51235211"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51235211"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 04:10:41 -0700
X-CSE-ConnectionGUID: MNGqvUeoS+yGb+NyQvmKag==
X-CSE-MsgGUID: wmoGWXA+T0iRfXr3wX0J8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="150813294"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2025 04:10:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNUy4-0004wL-1o;
	Fri, 06 Jun 2025 11:10:36 +0000
Date: Fri, 6 Jun 2025 19:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14431/14505] arch/arm/lib/crc-t10dif.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506061947.I0sKwiQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   475c850a7fdd0915b856173186d5922899d65686
commit: a2f83b8f28e2bcb8c701d30b18e71c12421b7a0e [14431/14505] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
config: s390-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061947.I0sKwiQi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061947.I0sKwiQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061947.I0sKwiQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .pylintrc: warning: ignored by one of the .gitignore files
   arch/alpha/kernel/core_marvel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/core_titan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/core_tsunami.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/irq_alpha.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/machvec_impl.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/csum_partial_copy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/fls.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/alpha/lib/udelay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/arcksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/intc-compact.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/kernel/unwind.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/bL_switcher.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/locomo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/sa1111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/common/sharpsl_param.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/crypto/aes-cipher-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/crypto/curve25519-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/fiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/opcodes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/reboot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/tcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/arm/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/arm/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/blake2s-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/lib/xor-neon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-at91/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-davinci/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-davinci/sram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-footbridge/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-footbridge/netwinder-hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx25.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx27.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx31.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx35.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpu-imx5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/cpuidle-imx6q.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/irq-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-imx/ssi-fiq-ksym.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-lpc32xx/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-lpc32xx/serial.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-mmp/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/id.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/ocpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap1/omap-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-omap2/id.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-pxa/pxa27x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-rpc/ecard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-s3c/gpio-samsung.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/assabet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/jornada720_ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/neponset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mach-sa1100/ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/dma-mapping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/flush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/iomap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/nommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/mm/proc-syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/plat-orion/gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/probes/decode-arm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/probes/decode-thumb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm/xen/enlighten.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/aes-ce-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/aes-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/crypto/sm4-ce-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/include/asm/asm-prototypes.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cpu_errata.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/fpsimd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/hibernate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/mte.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/rsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/kvm/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/arm64/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/arm64/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/chacha-neon-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/uaccess_flushcache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/lib/xor-neon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/copypage.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/mem_encrypt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/arm64/mm/mmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/abiv1/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/abiv2/strksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/ftrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/power.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/string.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/lib/usercopy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/cachev1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/cachev2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/highmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/tcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/csky/mm/tlb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/hexagon_ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/hexagon/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/kfpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_guess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/kernel/unwind_prologue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/lib/crc32-loongarch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/loongarch/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/amisound.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/chipram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/amiga/pcmcia.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/ataints.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/atakeyb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/atasound.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/stdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/atari/stram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/coldfire/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/coldfire/gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/emu/natfeat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/hp300/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/ints.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup_mm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/kernel/setup_no.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memcpy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memmove.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/memset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/lib/uaccess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/psc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mac/via.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/hwtest.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/kmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/memory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/motorola.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mm/sun3kmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/mvme16x/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/idprom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/mmu_emu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/m68k/sun3/sun3dvma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/alchemy/common/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/crypto/octeon-sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-boot-vector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-helper-util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-pko.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/cvmx-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/executive/octeon-model.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/cavium-octeon/octeon-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/cmpxchg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/ptrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/rtlx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/kernel/vpe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/lantiq/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/lib/crc32-mips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/lib/crypto/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/lib/crypto/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/mm/context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/mm/ioremap64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/mm/page.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/mm/uasm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/mti-malta/malta-time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/pci/pci-ip27.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/pic32/pic32mzda/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/ralink/irq-gic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/ralink/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/mips/ralink/prom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/nios2/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/openrisc/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/openrisc/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/parisc_ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/kernel/processor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/checksum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/lib/memcpy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/parisc/video/video-sti.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/crypto/curve25519-ppc64le-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/include/asm/kasan.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/crash_dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/idle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/rtasd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/security.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/static_call.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_64_vio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_nestedv2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_p9_entry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_p9_perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_rm_mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_hv_rm_xics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_rtas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_xics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/book3s_xive.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/emulate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/guest-state-buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/kvm/powerpc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/powerpc/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/powerpc/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/chacha-p10-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/poly1305-p10-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/feature-fixups.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/lib/sstep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/hash_pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/hugetlbpage.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/iommu_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/pkeys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/book3s64/radix_tlb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/init_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/ioremap_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/512x/mpc512x_shared.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/52xx/mpc52xx_gpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/8xx/cpm1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spu_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spu_syscalls.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/cell/spufs/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/chrp/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powermac/pfunc_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/idle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/ocxl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-async.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-irqchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-sensor-groups.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal-sensor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/opal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/pci-ioda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/rng.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/powernv/vas-window.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/ps3/exports.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/ps3/gelic_udbg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/pseries/hvcserver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/platforms/pseries/of_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/cpm2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/fsl_rio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/mpic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/mpic_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/msi_bitmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xics/icp-native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xive/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/powerpc/sysdev/xive/native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cacheinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/hibernate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/kernel_mode_vector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi-ipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/sbi_ecall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/kernel/vendor_extensions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crc64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crypto/chacha-riscv64-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/cache-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/cacheflush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/dma-noncoherent.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/riscv/mm/physaddr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/appldata/appldata_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/crypto/arch_random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/crypto/sha_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/include/asm/nospec-insn.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/cpufeature.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/crash_dump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/ctlreg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/facility.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/fpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/sthyi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/unwind_bc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kernel/uv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/interrupt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/kvm-s390.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/kvm/pv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/s390/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/crypto/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/lib/delay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/gmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/gmap_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/net/pnet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/s390/pci/pci_kvm_hook.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/boards/mach-x3proto/ilsel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/drivers/dma/dma-api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/drivers/dma/dmabrg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/irq/ipr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/cpu/sh4/sq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/io_trapped.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/ioport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/irq_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/kdebugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/process_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/reboot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/return_address.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/sh_bios.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/sh_ksyms_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/unwinder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/kernel/vsyscall/vsyscall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/lib/io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/mmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sh/mm/uncached.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/adi_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/auxio_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/ioport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/process_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/setup_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/time_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/kernel/traps_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/PeeCeeI.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/atomic32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/sparc/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/lib/iomap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/mm/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/mm/init_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/misc_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/misc_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/ranges.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/tree_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/prom/tree_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/sparc/video/video-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/drivers/mconsole_kern.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/gprof_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/physmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/reboot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/signal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/skas/uaccess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/stacktrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/kernel/um_arch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/um/os-Linux/user_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/coco/sev/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/aria_aesni_avx2_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/aria_aesni_avx_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/camellia_aesni_avx_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/camellia_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/curve25519-x86_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/serpent_avx_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/sm4_aesni_avx_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/twofish_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/crypto/twofish_glue_3way.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/events/intel/lbr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/events/intel/pt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/hyperv/hv_init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/hyperv/irqdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/hyperv/ivm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/hyperv/nested.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/acpi/cppc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/amd_node.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/apic/apic_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/apic/msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/apic/vector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/acrn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/aperfmperf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/bugs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/bus_lock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/mce/amd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/mce/dev-mcelog.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/microcode/intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/sgx/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/sgx/virt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/cpu/topology_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/e820.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/early-quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/fpu/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/fpu/xstate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/head64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/i8259.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/kvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/pvclock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/static_call.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/unwind_frame.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/unwind_guess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/hyperv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/kvm_onhyperv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/mmu/page_track.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/mmu/spte.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/mmu/tdp_mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/kvm/smm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/x86/lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/x86/lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> arch/x86/lib/crc64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/lib/crypto/blake2s-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/lib/crypto/chacha_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/lib/crypto/poly1305_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/lib/iomem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/cpu_entry_area.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/dump_pagetables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/init_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/init_64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/mem_encrypt_amd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/mmio-mod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/numa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/pat/memtype.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/pat/set_memory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/pgtable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/mm/pgtable_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/pci/pcbios.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/platform/efi/quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/platform/intel-quark/imr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/platform/intel/iosf_mbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/platform/scx200/scx200_32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/video/video-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/virt/svm/sev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/virt/vmx/tdx/tdx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/xen/enlighten.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/xen/enlighten_hvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/x86/xen/mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/kernel/process.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/kernel/setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/kernel/smp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/kernel/time.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/kernel/xtensa_ksyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/mm/cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   arch/xtensa/mm/ioremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/badblocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/bdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/bio-integrity-auto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/bio-integrity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-cgroup-fc-appid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-cgroup-rwstat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-cgroup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-crypto-profile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-crypto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-flush.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-ia-ranges.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-ioc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-map.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-merge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq-cpumap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq-debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq-sched.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq-tag.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-mq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-settings.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-stat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-timeout.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-wbt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/blk-zoned.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/bsg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/elevator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/genhd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/holder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/partitions/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   block/sed-opal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   certs/blacklist.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/acompress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/aead.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/aes_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/af_alg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/ahash.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/akcipher.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/algapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/aria_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/asymmetric_keys/asymmetric_type.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/asymmetric_keys/public_key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/asymmetric_keys/x509_loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/async_tx/async_memcpy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/async_tx/async_pq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/async_tx/async_raid6_recov.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/async_tx/async_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/async_tx/async_xor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/authenc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/blowfish_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/cast5_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/cast6_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/cast_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/cipher.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/cryptd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/crypto_engine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/ecc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/geniv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/hkdf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   crypto/jitterentropy-testing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
