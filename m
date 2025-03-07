Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA52192F2;
	Fri,  7 Mar 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350670; cv=none; b=t2j/+7CWRKMO0CDijHGiWB9zmygl/Dy65R2o+S2Pe06bsi+upIVMXsVIPn1biMC4KSHgNpTnM4NHT3K6qNFTQWQunKldtjI66g74dLQPtj2CNprVZexPHxRlAWQCqyPvISuXBsTV135CF3AhzjnVqS/HLVfl1caqghoolT0inoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350670; c=relaxed/simple;
	bh=Uy6FJ3J0v1XruHp8GNjv1bqcMX0mLfDNbeuCOVAtdOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMn2uLK7N+DrWxof0ngdEnXWk+/C7P9d/hYE4/2X9eGr5azhwczJB1vg5btWI3GR2jmAk5ZTKO1TxfVTwq8+SrfaGOmwcehZQMBk2o9hdl5/9UxFLLqNVGaYwfz9bBg++hlQzcTY3X5vqCTDrFE+JqNouWemKZhsnLcb3b+G5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dycfsiRw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dycfsiRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741350669; x=1772886669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uy6FJ3J0v1XruHp8GNjv1bqcMX0mLfDNbeuCOVAtdOI=;
  b=dycfsiRwn6H6GqGakR1DnrocbnItHDeB0Cvfv+HsPsLnFLLiVxjRCvZO
   xlUD53SSoryMuI/2nQ5OFdTWjXDm0YJv8vGJieB2gZSmP04ka5OMyq+uu
   an4YgskG9G/ieFK8hlgV4ivodr3IXcIRIRTg0tpgLGnoAwC3SFmCJBxA2
   9s9Auf12rc8peEDJrEODmLEjgs+/pK+/BVyIG65NOb+l7DBReziHCFHNr
   74wCdGjSF+mlB+GzKM16qfSkZ3liAVHMlGFCngdZ9Z2DXM+HDC36G+bqj
   BEcPqsrtFW/1yJEzY0HI8MpMjJhveMPDPIHYaedS3PyhZQxKsPc6dolfM
   w==;
X-CSE-ConnectionGUID: 77Hb+mFQTcyib9eBNmwTPw==
X-CSE-MsgGUID: ixPPZ1RoT7qdoeroioH01w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42274952"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42274952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:31:05 -0800
X-CSE-ConnectionGUID: hV0WpLYSRbywcuBD4ZsF+g==
X-CSE-MsgGUID: ZD6HatllQCq05fQJLex4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124230492"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 04:31:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWr0-0000St-04;
	Fri, 07 Mar 2025 12:31:02 +0000
Date: Fri, 7 Mar 2025 20:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] x86: ibs: Enable IBS profiling for memory
 accesses
Message-ID: <202503072051.xg3CbtA0-lkp@intel.com>
References: <20250306054532.221138-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306054532.221138-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.14-rc5]
[cannot apply to akpm-mm/mm-everything next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250306-134949
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250306054532.221138-5-bharata%40amd.com
patch subject: [RFC PATCH 4/4] x86: ibs: Enable IBS profiling for memory accesses
config: x86_64-buildonly-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072051.xg3CbtA0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072051.xg3CbtA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072051.xg3CbtA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x13: call to hw_access_profiling_stop() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5: call to hw_access_profiling_stop() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_exit_to_user_mode+0x7b: call to hw_access_profiling_start() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5: call to hw_access_profiling_stop() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0x71: call to hw_access_profiling_start() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_enter+0x16: call to hw_access_profiling_stop() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit+0x22: call to hw_access_profiling_start() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
