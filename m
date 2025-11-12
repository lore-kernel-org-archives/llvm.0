Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159791514DC;
	Wed, 12 Nov 2025 05:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762923609; cv=none; b=c+UtaX/UCP0mfh3QAi2Z/3pjQXIpV4ejlG5mdYH1bYuDjGR+hApT4qiR1s825ldljX2OEaSGdB3pFFX4CcM2dNgOgCiPk8sVKn2aylSQ1hwhfiXxKkjcV/KM7ZVc58N7JV/Z5l+3l36c8bAw/XMuGWCtD6YDsKxD1mV1GgBDPuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762923609; c=relaxed/simple;
	bh=oVzcjrtUZy9ro5ZLynud7t632MdL27zlclznqXw5X1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQUCbh+mcPpj+r+YEBRR76Vyk+Euh3ZocSSp6rVRVkoKr1kot+rKHIA6G+oIDk2+HVJNon+oLhjzJGq1VE27WtuoUVDNIk8satZXIZiS38Gt1BjQqgXe7xj2npfa6ENijbA21q+T5g4q+9zUgFoVPEmWiCBu9fV2KgwIhGc7TnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXPXPDb6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXPXPDb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762923607; x=1794459607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oVzcjrtUZy9ro5ZLynud7t632MdL27zlclznqXw5X1o=;
  b=iXPXPDb6gaQn4lYZi9JaNIe36u+TM+f3ytIzb/MxmI2L849+dzZQpE0Y
   66mWOrR6DEM71ddm6z/+RclwBrayi2G01Xdo9k/ys9YsTJrn8oP9LIlde
   d4yUo2Y8xcJ0XQm8JyJDQCV08SdgjcqrUSRqPQ2fpVaF4hF3TVe81Ux2H
   IaQSY5X+eqD4fgP8Oca868sYahHLXPDNezHqwjnY/drp1vIJL2g5VNPcv
   Uvix9uY9YuCt0gpxSNojOvMMJigt8xHcyIijJBGmDjFirkqdL1jMGjban
   0N9TUJtDXc081qwlEnaFo9f0X1C5mE/HWW5xRTuixjXh9TVcryxH2hXL1
   g==;
X-CSE-ConnectionGUID: 6qnHeLgwSs6Pdu/xaPjpmQ==
X-CSE-MsgGUID: rcL9i7dMT7Gir1MLDemQiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65075624"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="65075624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:00:06 -0800
X-CSE-ConnectionGUID: e9nXy1HZSSivhbPorUyohA==
X-CSE-MsgGUID: nyCj46xkQmq/uZzmK/ihsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189289420"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 21:00:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ2xe-0003qd-1Q;
	Wed, 12 Nov 2025 05:00:02 +0000
Date: Wed, 12 Nov 2025 13:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
Message-ID: <202511121204.SWr5k0Gt-lkp@intel.com>
References: <20251112015846.1842207-3-huangchenghai2@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112015846.1842207-3-huangchenghai2@huawei.com>

Hi Chenghai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on arm64/for-next/core soc/for-next linus/master v6.18-rc5 next-20251111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenghai-Huang/UAPI-Introduce-128-bit-types-and-byteswap-operations/20251112-100133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20251112015846.1842207-3-huangchenghai2%40huawei.com
patch subject: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511121204.SWr5k0Gt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121204.SWr5k0Gt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121204.SWr5k0Gt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/loongarch/include/asm/hardirq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/loongarch/include/asm/io.h:82:
>> include/asm-generic/io.h:948:54: error: passing 'const volatile void *' to parameter of type 'volatile void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     948 |         val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
         |                                                             ^~~~
   include/asm-generic/io.h:152:57: note: passing argument to parameter 'addr' here
     152 | static inline u128 __raw_read128(volatile void __iomem *addr)
         |                                                         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +948 include/asm-generic/io.h

   939	
   940	#ifdef CONFIG_ARCH_SUPPORTS_INT128
   941	#ifndef ioread128
   942	#define ioread128 ioread128
   943	static inline u128 ioread128(const volatile void __iomem *addr)
   944	{
   945		u128 val;
   946	
   947		__io_br();
 > 948		val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
   949		__io_ar(val);
   950	
   951		return val;
   952	}
   953	#endif
   954	#endif /* CONFIG_ARCH_SUPPORTS_INT128 */
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
