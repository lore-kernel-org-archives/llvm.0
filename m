Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6D1EA7ED;
	Tue,  1 Apr 2025 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547836; cv=none; b=hidVcTqPFxENsQloGycqetNRM7EIwUJ9BXtHHpTdIx6Q8l1Ek8jbQs3z/mSBa4TKGVZ8Ai5lLX/vDG2bPLfhWrPjNUunoeQl0I2ZvVuoAaI5FStgPkR8U4CtfB7XM829bpsFRKaZUwdbse3P0HSp531q+Nhi5sMO8cQ2uMpk+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547836; c=relaxed/simple;
	bh=epV3U4Dvb/g8lgrS/3wjD++2ErBzuUTTcu9gWuqU/es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+eROguBXgfSRXkblY+Rwt1063D8vIDrYL1gEBq16e+2afnjfca13a7gwuz60t/Dx8BWu6mEs/WekbZA4HpDCz3j4yT7prnP9n4nDrJe2ga6pKg3spJ7BYiMl+OeThrEOjw60qutcqQQGx40BEW4nQjMMQZu67YUBv4uygXury4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHZ+pnDL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHZ+pnDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743547834; x=1775083834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epV3U4Dvb/g8lgrS/3wjD++2ErBzuUTTcu9gWuqU/es=;
  b=lHZ+pnDL1XA54mh4EPVallCHsExkEQjAWstV8RNuVUxwUftsntpPTDlV
   AEjH/JlEZQ9NgyuwoavDFVew6NLv6py7QUzkcWtBjIbdrbX6qQEzf1IgJ
   084uTM8W0ISvso+lkvtRuQ2otFTp5M+HgYnTk4voauWu6wlwxfSUyGiOF
   EC8Zs0iiTr8JVhcBefQR52BEr5abZsphyulnPNfIW/stZzpCeaJFxxaPs
   0m6Tky7+hfA0J0/4LGh93HKlejaF+Uu3wSkIMRQCa67RcG/aDsk1gOcHu
   Kvw6VGg0sW4qP9LUtJrCtPea3ruIDU02xIsvFro0Emk87wzahcLcvkGS3
   g==;
X-CSE-ConnectionGUID: P7ItmOoCTHKqHs643/ShtQ==
X-CSE-MsgGUID: rRnB6CFyTHaB4l9yG4aexg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56258283"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56258283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:50:34 -0700
X-CSE-ConnectionGUID: pZvYa/5pSjOfbmXlGBqQlg==
X-CSE-MsgGUID: iaoIJ2FVTkSTVt6xnGxUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126770610"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Apr 2025 15:50:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzkR8-000ADS-0K;
	Tue, 01 Apr 2025 22:50:26 +0000
Date: Wed, 2 Apr 2025 06:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 12/15] x86/msr: Use the alternatives mechanism to
 write MSR
Message-ID: <202504020626.Da5lLJX2-lkp@intel.com>
References: <20250331082251.3171276-13-xin@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331082251.3171276-13-xin@zytor.com>

Hi Xin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8fc8ae1aeed6dc895bf35a4797c6e770574f4612]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li-Intel/x86-msr-Replace-__wrmsr-with-native_wrmsrl/20250331-203150
base:   8fc8ae1aeed6dc895bf35a4797c6e770574f4612
patch link:    https://lore.kernel.org/r/20250331082251.3171276-13-xin%40zytor.com
patch subject: [RFC PATCH v1 12/15] x86/msr: Use the alternatives mechanism to write MSR
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504020626.Da5lLJX2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020626.Da5lLJX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020626.Da5lLJX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:20:
>> arch/x86/include/asm/msr.h:344:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     344 |                 if (cpu_feature_enabled(X86_FEATURE_XENPV))
         |                     ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:20:
   arch/x86/include/asm/msr.h:392:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     392 |                 if (cpu_feature_enabled(X86_FEATURE_XENPV))
         |                     ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:20:
   arch/x86/include/asm/msr.h:517:20: error: redefinition of 'wrmsrl'
     517 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   arch/x86/include/asm/msr.h:415:29: note: previous definition is here
     415 | static __always_inline void wrmsrl(const u32 msr, const u64 val)
         |                             ^
   12 warnings and 3 errors generated.


vim +/DISABLED_MASK_BIT_SET +344 arch/x86/include/asm/msr.h

   336	
   337	static __always_inline bool __wrmsr_variable_all(const u32 msr, const u64 val, const int type)
   338	{
   339		const enum pv_msr_action action = get_pv_msr_action(msr);
   340	
   341		if (action == PV_MSR_PV) {
   342			return __wrmsr_variable(msr, val, type);
   343		} else if (action == PV_MSR_IGNORE) {
 > 344			if (cpu_feature_enabled(X86_FEATURE_XENPV))
   345				return false;
   346		}
   347	
   348		return __native_wrmsr_variable(msr, val, type);
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
