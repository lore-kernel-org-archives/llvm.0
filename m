Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE019E997;
	Wed,  5 Mar 2025 03:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143958; cv=none; b=IeNZ/7fPeP+ezPGIK+uRUOSc8dxHXkmB1GQXLWcW1DdTqxrS3uUNoKwi9VAy4MILc2a9yI2IcapLrPxHXNkNcCWzUY6PkVZ4UvtKkyLTzbuz3cJXtLN13imUB+Y3PNbpBZoU/tQzV0IIRZTYKU5/VC+9mz57qX99+i1OeQjfZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143958; c=relaxed/simple;
	bh=fNa16iyZuSIkcb+ZljTEihfgo/0sKUoeQ8oXjnqA2TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1/MyapXIKCizCsywq0j+hoRcqHbugen3bYqjwiTq3IkvP8V2Ohfnz0ULA/HKaeCr6jSMoUU+sPYHgB3j+qxPFzTBOuKE922pwg8vqGhJzjx7Vm0sow0XfOzmqcqnoEogEy+3PJD2x+c5y99refDiN62P6XIuqQdBv5gmqW5BAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bN9mk4jM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bN9mk4jM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741143956; x=1772679956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNa16iyZuSIkcb+ZljTEihfgo/0sKUoeQ8oXjnqA2TU=;
  b=bN9mk4jMCwFDMPYTOCXebqR8lEfhdwYY5T3Kq+YU9g8tJLM+SECMXkpl
   JEvl0Pcz72FJXBfMUfXMACeHph8l1CLXU73pJhwDaT51mSyNujr0o9syM
   KzpSkp4Y5sQNDR6RFEPXyYJqQqfg7RA+uqadrJNy6qei8XacqHOvuV7Rn
   PbUdCE2ZcqBJL7PANVhtUYhrueD2G8ISHCWLPU76B8f75iF7egFb8LESf
   ijitzKLOuGPC632VlW5DU99wrpMS/hVATGqZXCtn22bjylujkZtigWtiQ
   L4dxTeGE0SAp3FeHAQvrvpIULnkFTAdXGi3pUo4N7sEm5ww6ffpkJA2tM
   Q==;
X-CSE-ConnectionGUID: l0CgucNpTf+4oXcOMq47xw==
X-CSE-MsgGUID: NDujblLhRxm5E2GIoyjrdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41268896"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="41268896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:05:53 -0800
X-CSE-ConnectionGUID: F9vAyWAgQ9Gph9u1JbSH7Q==
X-CSE-MsgGUID: GswfxuRvTOeOgH+FP9uBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118278354"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 19:05:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpf4u-000KWQ-28;
	Wed, 05 Mar 2025 03:05:48 +0000
Date: Wed, 5 Mar 2025 11:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	willy@infradead.org, michel@lespinasse.org, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH 3/7] lib/rbtree: add random seed
Message-ID: <202503051009.iTp8hlJy-lkp@intel.com>
References: <20250304011952.29182-4-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304011952.29182-4-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250304]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/lib-rbtree-enable-userland-test-suite-for-rbtree-related-data-structure/20250304-092345
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304011952.29182-4-richard.weiyang%40gmail.com
patch subject: [PATCH 3/7] lib/rbtree: add random seed
config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051009.iTp8hlJy-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051009.iTp8hlJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051009.iTp8hlJy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/rbtree_test.c:17:22: warning: implicit conversion from 'unsigned long long' to 'ulong' (aka 'unsigned long') changes value from 3141592653589793238 to 2721204694 [-Wconstant-conversion]
      17 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
         |                ~~~~  ^~~~~~~~~~~~~~~~~~~~~~
   lib/rbtree_test.c:10:21: note: expanded from macro '__param'
      10 |         static type name = init;                \
         |                     ~~~~   ^~~~
   1 warning generated.
--
>> lib/interval_tree_test.c:22:22: warning: implicit conversion from 'unsigned long long' to 'ulong' (aka 'unsigned long') changes value from 3141592653589793238 to 2721204694 [-Wconstant-conversion]
      22 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
         |                ~~~~  ^~~~~~~~~~~~~~~~~~~~~~
   lib/interval_tree_test.c:10:21: note: expanded from macro '__param'
      10 |         static type name = init;                \
         |                     ~~~~   ^~~~
   1 warning generated.


vim +17 lib/rbtree_test.c

     8	
     9	#define __param(type, name, init, msg)		\
    10		static type name = init;		\
    11		module_param(name, type, 0444);		\
    12		MODULE_PARM_DESC(name, msg);
    13	
    14	__param(int, nnodes, 100, "Number of nodes in the rb-tree");
    15	__param(int, perf_loops, 1000, "Number of iterations modifying the rb-tree");
    16	__param(int, check_loops, 100, "Number of iterations modifying and verifying the rb-tree");
  > 17	__param(ulong, seed, 3141592653589793238ULL, "Random seed");
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
