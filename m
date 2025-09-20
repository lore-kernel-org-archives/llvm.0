Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2922B2E40E;
	Sat, 20 Sep 2025 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758348981; cv=none; b=VUxCWtTAen2Nr2inh/an8IIwwt13WaEuU1L8lPeL08yytCskNPd/Uiojn4w5UcgdkIS+dfP8smFH4slm7Ae9on9u24IKkh3QPt4I2fPMNhIUdvkC3tZ5m9tCgzYWHkwnLJHLslF/9zNRjlqLkvmCj5Ladi2kijiR5IsYwaTINw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758348981; c=relaxed/simple;
	bh=9M16b7GEQ3Vmqn15POZuMuLNnXG6RyLLh89yP/T9VSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a70bSbOEdM30pX+r/syBB/vqGmXzG3Tlu24CyeuQn4B/Jlg2FFqVX66SNaVAaCS3T3vE6X9mSV9vbZndM2tqj0qIyp0OZarEdy3S+mYyXtVHY9P2SVxbRBilzEtSUyYKdxMatFzutU9gPMvJZAFL03x23oagIhnN48TK5GV1WhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB3m0osG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB3m0osG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758348979; x=1789884979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9M16b7GEQ3Vmqn15POZuMuLNnXG6RyLLh89yP/T9VSU=;
  b=MB3m0osGWC9XGLhaRTs6MvviE11LAxGcbkxme+zqs5ZlkYXo2jKvjIrF
   7q5rwKugHo0GZce4k1Ay4mcDkjTPcli5zpdrI+P4wuQp82czeWfosVFRc
   7y5ECEsUmgAinGer/OVmZA0EBNKHOQPhxdmabiTfBhYg9DfU/9bNKTLRP
   umMLQ1+e337WiHQ4MJsazfzJdIE4vpcc49Npsy8ljFdbAgesod2KM4AZU
   pihJLdrii6HBEQyHAnMgueRTkI0x5Df5xHpkJsQ4agT4ku+NdBAOAAZKe
   ESfW0bulicURQkrX3G4VCyrfjKsHLsWYn/tBmDDDTC7swtU/GfxLnw9d4
   A==;
X-CSE-ConnectionGUID: sdjUdhd7SuiCm3yl95KKAg==
X-CSE-MsgGUID: Cczmk22oQUSzWRJu5jG9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64491786"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64491786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 23:16:19 -0700
X-CSE-ConnectionGUID: 1JxXB7wqR2K60/ozDZ5UyA==
X-CSE-MsgGUID: 9aprUd58TdSgynSRzHh0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="180262141"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Sep 2025 23:16:17 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzqtL-00055b-1S;
	Sat, 20 Sep 2025 06:16:15 +0000
Date: Sat, 20 Sep 2025 14:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch 6/7] kexec: Implement dynamic kimage tracking
Message-ID: <202509201452.A4jipRlm-lkp@intel.com>
References: <20250918222607.186488-7-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918222607.186488-7-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.17-rc6]
[cannot apply to tip/x86/core powerpc/next powerpc/fixes next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20250919-062852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918222607.186488-7-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch 6/7] kexec: Implement dynamic kimage tracking
config: x86_64-buildonly-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201452.A4jipRlm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201452.A4jipRlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201452.A4jipRlm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec.c:127:18: warning: variable 'dest_image' set but not used [-Wunused-but-set-variable]
     127 |         struct kimage **dest_image, *image;
         |                         ^
   1 warning generated.


vim +/dest_image +127 kernel/kexec.c

dc009d92435f99 Eric W. Biederman  2005-06-25  123  
0eea08678ebe9f Minfei Huang       2016-05-23  124  static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
5d700a0fd71ded Arnd Bergmann      2021-09-08  125  		struct kexec_segment *segments, unsigned long flags)
0eea08678ebe9f Minfei Huang       2016-05-23  126  {
0eea08678ebe9f Minfei Huang       2016-05-23 @127  	struct kimage **dest_image, *image;
0eea08678ebe9f Minfei Huang       2016-05-23  128  	unsigned long i;
0eea08678ebe9f Minfei Huang       2016-05-23  129  	int ret;
0eea08678ebe9f Minfei Huang       2016-05-23  130  
4b692e86161935 Arnd Bergmann      2021-09-08  131  	/*
4b692e86161935 Arnd Bergmann      2021-09-08  132  	 * Because we write directly to the reserved memory region when loading
05c6257433b721 Valentin Schneider 2022-06-30  133  	 * crash kernels we need a serialization here to prevent multiple crash
05c6257433b721 Valentin Schneider 2022-06-30  134  	 * kernels from attempting to load simultaneously.
4b692e86161935 Arnd Bergmann      2021-09-08  135  	 */
05c6257433b721 Valentin Schneider 2022-06-30  136  	if (!kexec_trylock())
4b692e86161935 Arnd Bergmann      2021-09-08  137  		return -EBUSY;
4b692e86161935 Arnd Bergmann      2021-09-08  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
