Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EBD34D397;
	Thu,  2 Jul 2026 04:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782965359; cv=none; b=E/ouyJhGyDoqqAxP/GrUzbNkg8j0Ti1fx8JG5holGU/HsJcn2o7IcRYduv6XGjMsvAmvYeUiKzF4unVqB2x9/qzdx9mZ1+46oa2Qw+LixRSPUK9JH1GHKBPZJ9sxegkiSWCY5obPQS9BY2whCXK0iGUA9QAKxDi/H2wTE9ygAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782965359; c=relaxed/simple;
	bh=N91hSTRvkIO3kD+ETSjc1M6ta7Q20vnWiKJavF/cqXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=clg8tgwEk0co+SWrt7+Q9QXClPWHJrFIh13Ri88R23QCOMg9OVKTddyk4Pjd7rfstYA4cncsIiVbqSIuN/ZSEuXHxin72uKvoUbxYJMYPKN4ELJkKgdoW4lGfQSFMMQWYhTwguMRqHmo7WMAocOZeqvdQKq1QwGMe2zfbhotQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaGH66q5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaGH66q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782965359; x=1814501359;
  h=date:from:to:cc:subject:message-id;
  bh=N91hSTRvkIO3kD+ETSjc1M6ta7Q20vnWiKJavF/cqXA=;
  b=AaGH66q53wRFnI9IVuFtS7utGQ3p6w4rJvsi55udBNvBGKCrIYbmjtDK
   +Lq4Yj0hNBhGFfCmsdfnTgbJymIzIHH20oAMezblJPCRAGpAIIeuBbyvv
   F6Eg8BR6oL6zIhihzyNwK8JCO9kUwYxANCYmlIj6Hpv8BcWO/2qje1rnz
   Pz3/mQJL/kL16g5Xc3ql1AMSKnxkVY2a0vmLqnWNsD2UjyIRyPz96x5jj
   K53YaoT1x/nk0Ulam2Qc1fUSE74r7KM4/6C17TFOuEDJxayCjJqJrTLIq
   z/8sfaamAmLz1y1OIvmRUqOXkXAA04rx5Hl+25DvEG7e+PCLdYXH0l6Im
   g==;
X-CSE-ConnectionGUID: a0h8vRVPR+ubyqmPtrpSSg==
X-CSE-MsgGUID: WzA2BJlCTWKataQ3Tn01zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106501718"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="106501718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:09:16 -0700
X-CSE-ConnectionGUID: gIqroMsPQsux2ryJS52QsQ==
X-CSE-MsgGUID: YFJc261YR5G/Q4Rn+VclFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252311208"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2026 21:09:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8je-000000009yV-2lvt;
	Thu, 02 Jul 2026 04:09:10 +0000
Date: Thu, 02 Jul 2026 12:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:kmalloc-no-objext-rfc-v1r2 3/3] mm/slab.h:397:10:
 error: use of undeclared identifier 'KMALLOC_NO_OBJ_EXT'
Message-ID: <202607021256.JaPXbde2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r2
head:   a734609d2f387a9e682d352e9f28599744cc300b
commit: a734609d2f387a9e682d352e9f28599744cc300b [3/3] mm/slab: prevent unbounded recursion in free path with new kmalloc type
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021256.JaPXbde2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021256.JaPXbde2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021256.JaPXbde2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:19:
>> mm/slab.h:397:10: error: use of undeclared identifier 'KMALLOC_NO_OBJ_EXT'
     397 |                 type = KMALLOC_NO_OBJ_EXT;
         |                        ^~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from mm/oom_kill.c:51:
>> mm/slab.h:397:10: error: use of undeclared identifier 'KMALLOC_NO_OBJ_EXT'
     397 |                 type = KMALLOC_NO_OBJ_EXT;
         |                        ^~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:508:28: warning: variable 'oom_reaper_th' set but not used [-Wunused-but-set-global]
     508 | static struct task_struct *oom_reaper_th;
         |                            ^
   1 warning and 1 error generated.


vim +/KMALLOC_NO_OBJ_EXT +397 mm/slab.h

   381	
   382	/*
   383	 * Find the kmem_cache structure that serves a given size of
   384	 * allocation
   385	 *
   386	 * This assumes size is larger than zero and not larger than
   387	 * KMALLOC_MAX_CACHE_SIZE and the caller must check that.
   388	 */
   389	static inline struct kmem_cache *
   390	kmalloc_slab(size_t size, kmem_buckets *b, gfp_t flags, kmalloc_token_t token,
   391		     unsigned int alloc_flags)
   392	{
   393		unsigned int index;
   394		enum kmalloc_cache_type type = kmalloc_type(flags, token);
   395	
   396		if (alloc_flags & SLAB_ALLOC_NO_OBJ_EXT)
 > 397			type = KMALLOC_NO_OBJ_EXT;
   398	
   399		if (!b)
   400			b = &kmalloc_caches[type];
   401		if (size <= 192)
   402			index = kmalloc_size_index[size_index_elem(size)];
   403		else
   404			index = fls(size - 1);
   405	
   406		return (*b)[index];
   407	}
   408	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
