Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE0B652;
	Wed, 12 Nov 2025 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762917478; cv=none; b=Kz3MdHLiDZ8DX8yeAR9aaT5eFA/X5Y1ui4eoSLaVR17v9mBCpwznwUZiMhkuZua/txYypdH/VTHSgtgOl7H0g1TKKcqZgYaBL6NTBMOZc8d9aLRdzPolesw995mghS3uDhTVTAFDqWv6xTzQMBQrENTB0zLWrEUfVfYp3ptj6KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762917478; c=relaxed/simple;
	bh=gW+zfpmWsWiPeGDf7CF7WONy25DtxBnhsDUfPZ9Xgg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuLk2GKY75DCudfo/mXLmR3VEFK4yZScctW0oZcucQKYK7HrA6JOXhqK7EDUXCXjuD58nka6Uy6wMWhGGPR3/KirhISyxLKuitWu/gAEJUiRq8EJEhD/Z9nKuDNju/gIrUZMbqP2wHS9izmjIw7NItlDKSgLTybC664L5LQpxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+VZ/tIv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+VZ/tIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762917477; x=1794453477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gW+zfpmWsWiPeGDf7CF7WONy25DtxBnhsDUfPZ9Xgg0=;
  b=B+VZ/tIvFp+TtTwmBJqu2GjaPHdOIH2XOc4dhktpUcqTZs638On+ph9v
   4tk88W2qB3Q+Yz0lKx6LNNzA8/4T+BtoG5fp1Iu5ZO3tj5OmeesrTxj0H
   L9QyxyQa+cBSINXYbTV7KulBzgK0UYGhQK/YAj0bWkh1xEW/2Oh33PdvX
   /YuIMS/GJS1+dJdoQ36piIrtgYTW5aviPMfToyIi2aKFjywTzsD8oThdX
   KkvcyfFbAtuY+QdW2Fk3cMacsjNvMmM19tO5j3J7EcVuCMi3yPJcy8IMl
   SEKnA/upyRwTRTtopaxwxASz538yK/7zBiCkoyaGWBtFD+9b3iXoCS1Aw
   g==;
X-CSE-ConnectionGUID: 0SHSxP0FSamzNNw/a6nayg==
X-CSE-MsgGUID: jZtWq6+bTPKTyP3vZcKpfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90448888"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="90448888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 19:17:56 -0800
X-CSE-ConnectionGUID: TQJbXnRBSqKDMODumW1/RA==
X-CSE-MsgGUID: s/sIGUvoSYiBZlBkAjxcyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188747297"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 19:17:55 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ1Mm-0003ml-2r;
	Wed, 12 Nov 2025 03:17:52 +0000
Date: Wed, 12 Nov 2025 11:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chenghai Huang <huangchenghai2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
Message-ID: <202511121051.UNwDQsG4-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenghai-Huang/UAPI-Introduce-128-bit-types-and-byteswap-operations/20251112-100133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20251112015846.1842207-3-huangchenghai2%40huawei.com
patch subject: [PATCH RFC 2/4] asm-generic/io.h: add io{read,write}128 accessors
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511121051.UNwDQsG4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121051.UNwDQsG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121051.UNwDQsG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/purgatory/purgatory.c:10:
   In file included from include/linux/kexec.h:20:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:948:54: warning: passing 'const volatile void *' to parameter of type 'volatile void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
     948 |         val = __le128_to_cpu((__le128 __force)__raw_read128(addr));
         |                                                             ^~~~
   include/asm-generic/io.h:152:57: note: passing argument to parameter 'addr' here
     152 | static inline u128 __raw_read128(volatile void __iomem *addr)
         |                                                         ^
   1 warning generated.


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
