Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308523ED3BA;
	Tue, 19 May 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199042; cv=none; b=C3YftAITmLktMZF3U3h0VgVIyJh6tpsgata292Qil6YcfRbg/nxyEmsairob/YwOQEYCT8FL+Pkgx0yyba6OIBIFFWriCbceEI6VnA4z+rt2hain4LXa7nOuMaHbh5GZrrvm6hji5N38vWxVuN0OrMSd5gKkDHulGgOm9R297hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199042; c=relaxed/simple;
	bh=BTMjnEmGqyuKWKNQvrdb6CqN1Hbea1pONmQ4Q0Ts6Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkZq/J7+GYeVQZKmJ96RUuZDocQdn7N95cWwo9MKk/KXX0QSNCjQd7NY+veLiA/1n1pOX3D1dJg+aaDn24QeJuFvEEl6PuDyORWKqdZvxNu9DuQa7JWz3mbr/08oo0n4zYaehM/rvbsWMM4CKY54JjA1CvwE1hcbhaVeafFRaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfRNRpoi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfRNRpoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199041; x=1810735041;
  h=date:from:to:cc:subject:message-id;
  bh=BTMjnEmGqyuKWKNQvrdb6CqN1Hbea1pONmQ4Q0Ts6Bw=;
  b=GfRNRpoi0Olj/QSnzdUjRTRf5N3K0loaiXw3KmdzlMMKLjD7/xMnPrKp
   IjUEmNgCXtqT4iEhjEMo66RoIRco5eWIizS81C4Bmws5rcQd7sD4mJDQu
   RVHgs8cPQ68h8MoTVVyjSsULGmhCzyMlyCTnb+3TwoUcgEsgGh3zWY2X3
   QM2JnyJaDJHhkZKvfqPBvD/40ieVP33YssRnHIuWwbKNucyQjwYQN/TPf
   3ZycpAgCERevrLHwA9Ai/7eD37bt5jiO+lpneANCGYNV2Z48D14vGQ1zP
   6Agg3ET7aPG8yuOoyXR5H/PMsJNUl8un3Sl5f9sTpjN+8mb3wvIgIpjiG
   g==;
X-CSE-ConnectionGUID: sRzUb45XQ3OZ9oL4uH/4PQ==
X-CSE-MsgGUID: lKwrmIDkSU6bUkf5WlPUAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90772632"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90772632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:57:18 -0700
X-CSE-ConnectionGUID: 3+m9k/YVTeiqjKKH3Oladg==
X-CSE-MsgGUID: B/8KAQ4+TvmfnJmTVd6IZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243776063"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 06:57:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPKwd-00000000ADP-0aKo;
	Tue, 19 May 2026 13:57:15 +0000
Date: Tue, 19 May 2026 15:56:40 +0200
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_slab 63/63] Warning: mm/slub.c:5466 function
 parameter 's' not described in 'kmem_cache_alloc_nolock'
Message-ID: <202605191537.EijdPlsZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_slab
head:   cb83f972bd005841d18f7bbff6e50d9bcbf0adf8
commit: cb83f972bd005841d18f7bbff6e50d9bcbf0adf8 [63/63] bpf,slab: Add slub-backed allocator for bpf_arena
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260519/202605191537.EijdPlsZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191537.EijdPlsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191537.EijdPlsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5466 function parameter 's' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'gfp_flags' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'node' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 's' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'gfp_flags' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'node' not described in 'kmem_cache_alloc_nolock'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
