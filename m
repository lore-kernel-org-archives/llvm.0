Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE327603F;
	Thu, 19 Feb 2026 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771475065; cv=none; b=keko5lDKorrRATAsXUH8ysEchHB2J/RGaEWzcwF4Ci2RcompOM7SImcYzNwA2CV7Ss7KZqwplVfnnThOg62kX9Fa8c6moYpHoF0SKjZnfvM0tKdumaDBhCPQtqW0JeBf3Wzpti2JF3mDu8Ns155kwZRWOUr5zP3lHxqc/MjRcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771475065; c=relaxed/simple;
	bh=ifTD5NN/GZFdJUGYYQlNwL3Uvng9mBMOl7wNq2UOPlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fotxA/aIcDRqe9h9JF/J3ew96Avvm8baNSpcBJ784C4J9AhfQ6FxVnBBPHTJNO0zdWvxaSyUZ5v+rV100GnsWLCPU5lkaFAZKfeh+8NSaKNCnL5a6f6AdIXoPAI8Z4TZCrSYedyIciS4darKDjKuo4UYCjfq5CS5Cv9cQbGZEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7uTIss/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7uTIss/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771475063; x=1803011063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ifTD5NN/GZFdJUGYYQlNwL3Uvng9mBMOl7wNq2UOPlU=;
  b=L7uTIss/iqWxyIvBV8fHqU1uikJM/+HeU+pX23tAoAkRhvMCTwg6zsCC
   pFvNXQmrYbUhPxZme4CX/bVQCyHJLtvGDm/FKBv12gwuR5Brv/E4L6lrY
   XcOUe2n9B7MansUTYQgZhhuq1u++nT0VzYnJejyFxrmSSk2Gm/GGBTSSo
   J51A2cf82XYeIMMGIkGyr52njWgL5d2Q1SfjibPWHclh4oyTn6RJrja9t
   AZ894N/MKK63O00n6tZmteywBrGV1VH2PGo1uz8gp5WVzNB37pKlN8CXA
   ZFtL1bP8VMrtuVZgNxPMA6ogWKIDDMd5vNSSHlhP2aqvx5uojr6yNfC80
   Q==;
X-CSE-ConnectionGUID: tRrhTnaJSCugHe3yLMjAZw==
X-CSE-MsgGUID: ++riLS3URPal1/zW7d3kXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72652319"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72652319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 20:24:23 -0800
X-CSE-ConnectionGUID: wXivgnv9S0qkA019poKSvQ==
X-CSE-MsgGUID: WqfJby28SWWljlbtVIfEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="252104806"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Feb 2026 20:24:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsvaL-000000012x2-3i9j;
	Thu, 19 Feb 2026 04:24:17 +0000
Date: Thu, 19 Feb 2026 12:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Reda CHERKAOUI <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	Reda CHERKAOUI <redacherkaoui67@gmail.com>
Subject: Re: [PATCH] x86/boot/compressed: make error() take const char *
Message-ID: <202602191200.xX8igqdm-lkp@intel.com>
References: <20260218160319.31884-1-redacherkaoui67@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218160319.31884-1-redacherkaoui67@gmail.com>

Hi Reda,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.19 next-20260218]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Reda-CHERKAOUI/x86-boot-compressed-make-error-take-const-char/20260219-000605
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218160319.31884-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: make error() take const char *
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602191200.xX8igqdm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191200.xX8igqdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191200.xX8igqdm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/compressed/misc.c:521:54: error: incompatible function pointer types passing 'void (const char *) __attribute__((noreturn))' to parameter of type 'void (*)(char *)' [-Wincompatible-function-pointer-types]
     521 |         entry_offset = decompress_kernel(output, virt_addr, error);
         |                                                             ^~~~~
   arch/x86/boot/compressed/misc.c:345:12: note: passing argument to parameter 'error' here
     345 |                                 void (*error)(char *x))
         |                                        ^
   1 error generated.


vim +521 arch/x86/boot/compressed/misc.c

^1da177e4c3f41 arch/i386/boot/compressed/misc.c Linus Torvalds  2005-04-16  513  
e605a425975b07 arch/x86/boot/compressed/misc.c  Joe Millenbach  2012-07-19  514  	debug_putstr("\nDecompressing Linux... ");
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  515  
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  516  	if (init_unaccepted_memory()) {
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  517  		debug_putstr("Accepting memory... ");
5adfeaecc487e7 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2024-08-09  518  		accept_memory(__pa(output), needed_size);
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  519  	}
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  520  
83381519352d6b arch/x86/boot/compressed/misc.c  Ard Biesheuvel  2023-08-07 @521  	entry_offset = decompress_kernel(output, virt_addr, error);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
