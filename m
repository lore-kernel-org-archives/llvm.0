Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1567F37AA6C;
	Sun, 12 Apr 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998547; cv=none; b=skHrsr1bCzDZww8iQ9Kvr7u2gqQaLTB2OdAOLd7QJ006w3b8nw8lSW1+nyALjx8H9NsaBfWfn+Somr3awcPeJwxAfFDyTCxvX0D1SxGaOC1lk3R+aSx2E5vMjbK1nZ9NYms+uJJJaQ9f+DaoeRoG9mxN3oivQHLl20dxSeoc4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998547; c=relaxed/simple;
	bh=dBgdYBdQVnTCTgSV2X9UrU6Xgxv02MKQE1jLUUi6iTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj8VjxYg2I8hOakNhTTGavLNH+XUwpdKDW+pvHlch9+2W00BT5by9ZJaGFCozrvccZYemhIv9J4UfM7zz+Yed7dzPKMhnvEBbndja2T618mK/bR9NXyKiJ79J5LCrvlGmo0S8KLWtNaKJMOT8YDWcCBwvYgqBGgc4lg201hel50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UegMxqij; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UegMxqij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775998546; x=1807534546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBgdYBdQVnTCTgSV2X9UrU6Xgxv02MKQE1jLUUi6iTw=;
  b=UegMxqijlNtsFpNAEfItoc5psRuNWZm399M6ECZMA6x24jJNo+JIMelE
   aMgTjHdw5K6JVtlAeGtCdSKxYQInt1wPqM+zYq7qT7x8mohoH2rMBzsA2
   F+F7eN0cyaaRVfw7wTIGZRR2Vs0mKPP0Z27Ntm94vWGGD2DUOvb0KoGC1
   3KJaxV6hnbuv4BzG7zMiJTZFYoISLPzz8HN/XH74pAzi1+Bg3//a7mvpH
   a2QA+8IP0pypFkV8WaBcHElL0vmANfsis8OxPi8esqEgTZQEa2c2lHljo
   hkTABRIbFLS4cQVRq14ylofcovMeUXW9bAFgaopmEOSvbXJncE9kO4hiL
   Q==;
X-CSE-ConnectionGUID: 9XhuKb5TSSaTtwuth99vzg==
X-CSE-MsgGUID: 02yyK4esS9KMKyLWRJxrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88400213"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="88400213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 05:55:46 -0700
X-CSE-ConnectionGUID: KwIPODh4SgaYYP3THN7g2Q==
X-CSE-MsgGUID: xNBQ8QEoSI+uHOkYdiplqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="229449807"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Apr 2026 05:55:43 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBuLj-000000002CT-37WW;
	Sun, 12 Apr 2026 12:55:39 +0000
Date: Sun, 12 Apr 2026 20:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, francesco@valla.it,
	geert@linux-m68k.org, tglx@kernel.org, shashankbalaji02@gmail.com,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <202604122037.R14cnXpl-lkp@intel.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410203741.997410-2-tim.bird@sony.com>

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-fix-zero-valued-printk-timestamps-in-early-boot/20260412-134726
base:   linus/master
patch link:    https://lore.kernel.org/r/20260410203741.997410-2-tim.bird%40sony.com
patch subject: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
config: um-defconfig (https://download.01.org/0day-ci/archive/20260412/202604122037.R14cnXpl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122037.R14cnXpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604122037.R14cnXpl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:49:
>> include/linux/early_times.h:20:9: error: call to undeclared function 'rdtsc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |         return rdtsc();
         |                ^
   include/linux/early_times.h:45:47: warning: division by zero is undefined [-Wdivision-by-zero]
      45 |                 return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
         |                                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/rdtsc +20 include/linux/early_times.h

    10	
    11	#ifdef CONFIG_EARLY_CYCLES_KHZ
    12	static inline u64 early_unsafe_cycles(void)
    13	{
    14	#if defined(CONFIG_X86_64)
    15		/*
    16		 * This rdtsc may happen before secure TSC is initialized, and
    17		 * it is unordered. So please don't use this value for cryptography
    18		 * or after SMP is initialized.
    19		 */
  > 20		return rdtsc();
    21	#elif defined(CONFIG_ARM64)
    22		return read_sysreg(cntvct_el0);
    23	#elif defined(CONFIG_RISCV_TIMER)
    24		u64 val;
    25	
    26		asm volatile("rdtime %0" : "=r"(val));
    27		return val;
    28	#else
    29		return 0;
    30	#endif
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
