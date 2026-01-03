Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FA27453;
	Sat,  3 Jan 2026 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767404235; cv=none; b=BqBJhjYmdW8V0JP51+zeNwNLn7mkYC1fWyGBYfl2+8TrLtmX3ZVAyt0xfILVY2Pj7fWN0ynWxxcI1wrcYAZt2HjEBcpoeRLMOoZtc+No+MoXZtByq4CukYz/j5feVbLyek6BfoiADOzNilDXs5nL2dCFQqrcjSGctif1ETrQj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767404235; c=relaxed/simple;
	bh=VE1xzgjjWYjXm43fyyzXvGlUIdhmjF7rIMUozNnHze0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umeqIt29tD3JHVdjzIfpQ0qdq0kiEEppCaj+tEpeJAwGddoTU+EHrqFzOvNUxNpgAvMsKW0TDK5uHQx3iJn8w+TPUl5tYQkBm2F7O4H7PxGfav9VIL8ps1t27WhmCX9Qnk4kDtGXWmzER26TzluETjdbIv7OI8WoJRg8HreZ9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfoHqVnI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfoHqVnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767404234; x=1798940234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VE1xzgjjWYjXm43fyyzXvGlUIdhmjF7rIMUozNnHze0=;
  b=YfoHqVnIkovhhiZSUQG+FDjgcYSgyFQwT+tr+4fjh1lpFAxqhNeq8OFU
   /S8GiuN1isvsIRFp51bvAYukI1xziPS2IkL/8vOtl8M7zpnvjkdS7PKt7
   wIyg1CAVV4d2lfeDapfn6hC7YnHJV5p1V5HzPsy353i2bGEG8aC3ZfILC
   SN8Jb2N0n0qew0BctI6foHbfU8C4n77/25BHWy4DS8Tf19HLf64/kX7ki
   Z0fpgN40KsfkmbXPQ++ImSXyT8HbL9TG+jBl76KLBFrJAgMpujW1QrHxe
   4SeGpvPkKoJPHl1u1RmjM7INeTSTs8Scrosj9hqPSmkm0tTk8Lw3cOVF0
   g==;
X-CSE-ConnectionGUID: 64YSAtEGTQCINo0wNijU/w==
X-CSE-MsgGUID: upKRnCe8S6yjVgDW8FqmSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72729953"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="72729953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 17:37:12 -0800
X-CSE-ConnectionGUID: xtDsHCaJRvmxBNbVSfJHuw==
X-CSE-MsgGUID: 4KmqNy3cStGqWehgYBnVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202388517"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2026 17:37:11 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbqZn-000000000Vd-3qth;
	Sat, 03 Jan 2026 01:37:07 +0000
Date: Sat, 3 Jan 2026 02:36:23 +0100
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 2/2] bpf: arena: Reintroduce memcg accounting
Message-ID: <202601030234.BWfTlyVd-lkp@intel.com>
References: <20260102151852.570285-3-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102151852.570285-3-puranjay@kernel.org>

Hi Puranjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c286e7e9d1f1f3d90ad11c37e896f582b02d19c4]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/bpf-syscall-Introduce-memcg-enter-exit-helpers/20260102-232059
base:   c286e7e9d1f1f3d90ad11c37e896f582b02d19c4
patch link:    https://lore.kernel.org/r/20260102151852.570285-3-puranjay%40kernel.org
patch subject: [PATCH bpf-next v3 2/2] bpf: arena: Reintroduce memcg accounting
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260103/202601030234.BWfTlyVd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030234.BWfTlyVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030234.BWfTlyVd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:619:21: warning: unused variable 'memcg' [-Wunused-variable]
     619 |         struct mem_cgroup *memcg, *old_memcg;
         |                            ^~~~~
>> kernel/bpf/syscall.c:619:29: warning: unused variable 'old_memcg' [-Wunused-variable]
     619 |         struct mem_cgroup *memcg, *old_memcg;
         |                                    ^~~~~~~~~
   2 warnings generated.


vim +/memcg +619 kernel/bpf/syscall.c

c9eb8102e21e8c Alexei Starovoitov 2025-02-21  612  
c9eb8102e21e8c Alexei Starovoitov 2025-02-21  613  int bpf_map_alloc_pages(const struct bpf_map *map, int nid,
317460317a02a1 Alexei Starovoitov 2024-03-07  614  			unsigned long nr_pages, struct page **pages)
317460317a02a1 Alexei Starovoitov 2024-03-07  615  {
317460317a02a1 Alexei Starovoitov 2024-03-07  616  	unsigned long i, j;
317460317a02a1 Alexei Starovoitov 2024-03-07  617  	struct page *pg;
317460317a02a1 Alexei Starovoitov 2024-03-07  618  	int ret = 0;
317460317a02a1 Alexei Starovoitov 2024-03-07 @619  	struct mem_cgroup *memcg, *old_memcg;
317460317a02a1 Alexei Starovoitov 2024-03-07  620  
317460317a02a1 Alexei Starovoitov 2024-03-07  621  	for (i = 0; i < nr_pages; i++) {
c9eb8102e21e8c Alexei Starovoitov 2025-02-21  622  		pg = __bpf_alloc_page(nid);
317460317a02a1 Alexei Starovoitov 2024-03-07  623  
317460317a02a1 Alexei Starovoitov 2024-03-07  624  		if (pg) {
317460317a02a1 Alexei Starovoitov 2024-03-07  625  			pages[i] = pg;
317460317a02a1 Alexei Starovoitov 2024-03-07  626  			continue;
317460317a02a1 Alexei Starovoitov 2024-03-07  627  		}
317460317a02a1 Alexei Starovoitov 2024-03-07  628  		for (j = 0; j < i; j++)
c9eb8102e21e8c Alexei Starovoitov 2025-02-21  629  			free_pages_nolock(pages[j], 0);
317460317a02a1 Alexei Starovoitov 2024-03-07  630  		ret = -ENOMEM;
317460317a02a1 Alexei Starovoitov 2024-03-07  631  		break;
317460317a02a1 Alexei Starovoitov 2024-03-07  632  	}
317460317a02a1 Alexei Starovoitov 2024-03-07  633  
317460317a02a1 Alexei Starovoitov 2024-03-07  634  	return ret;
317460317a02a1 Alexei Starovoitov 2024-03-07  635  }
317460317a02a1 Alexei Starovoitov 2024-03-07  636  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
