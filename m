Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7518B15B0FE;
	Fri, 26 Sep 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758908351; cv=none; b=ux+myC6+EZMADH6NKfoEJU1wJeH3dDhZmK+p27Wx5wjIArNcbx3XApA5/lTi1V9yW7MrnK99ffjkwhE4jyktFkAjGjcAmjS4CcVf89uDhDZKr3mjZgYN+SfwZMzI19ScjNuoCizLZau1nLhe+pXwsVbZcJBQgZcxcFCCCAVPUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758908351; c=relaxed/simple;
	bh=X39IoOvaEEzAejj66YITLm4C1zTy42HigLrlKu3SseE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+o9W1SCfzufEi198xJaXIFTu6JVo8dmjiwJQwMkeu1A0idoywicRxemjHEVgOLdBXrsXtXBRcLhGoYJ7vTLl9CyzXgoCiosWkDe9ymlnC8v69sG12e0wcd5Gj5KL/LK9lX1BTnILkroVYAWKBe6Jl/jEqJ04a1JsNyBvweU8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6w5O0Xp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6w5O0Xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758908350; x=1790444350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X39IoOvaEEzAejj66YITLm4C1zTy42HigLrlKu3SseE=;
  b=g6w5O0XplRgEct8qOxjeppKyCKf8euEhzLJyJURRSq3RRaJyul89C2Kv
   xMPmbbbI5fJh6LBHJJS0pVfhYTGYRsHnU6thyLZLBtu3rZhhDBV21ylML
   UGN05K30LjpyRL4wjYZt0ho5cx1iGxOOROAFNG2RlIHD8qCi7KAaO00m0
   HyjARVU3MmcwtxfnYSRPSgIPj1JHMzj5rVZ86Ou1d6G7h+HLXvdqAmlEl
   OqUyXdFCS6H1Vst3VLN4sPm0rrumHAehSDbvLfISl35D2YOacbnOkbo9D
   2nL2WN9rUG221HjVbVHTz95/ii4VpBLR8wrq3T0I5rmuXKI82paOJ/bjN
   w==;
X-CSE-ConnectionGUID: YiBnb00gTmOgzdiuJ9xzaQ==
X-CSE-MsgGUID: 1qYEej2IR8CQqqssqJ5K7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78888814"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="78888814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 10:39:09 -0700
X-CSE-ConnectionGUID: 4tT18fXLTGGitV++G3TjIA==
X-CSE-MsgGUID: lQkOmgqlRtq3WAN8qSAnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="182950121"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2025 10:39:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2CPR-0006TX-2c;
	Fri, 26 Sep 2025 17:39:05 +0000
Date: Sat, 27 Sep 2025 01:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/12] mm/hugetlb: do explicit CMA balancing
Message-ID: <202509270126.MXOaMSXO-lkp@intel.com>
References: <20250915195153.462039-11-fvdl@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915195153.462039-11-fvdl@google.com>

Hi Frank,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes powerpc/topic/ppc-kvm s390/features trace/for-next linus/master v6.17-rc7 next-20250926]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-van-der-Linden/mm-cma-add-tunable-for-CMA-fallback-limit/20250926-101411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250915195153.462039-11-fvdl%40google.com
patch subject: [RFC PATCH 10/12] mm/hugetlb: do explicit CMA balancing
config: x86_64-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270126.MXOaMSXO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270126.MXOaMSXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270126.MXOaMSXO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: balance_node_cma
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(hugetlb_cma_balance)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
