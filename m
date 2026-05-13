Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B8402435;
	Wed, 13 May 2026 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674288; cv=none; b=E6SlIRVzCRQSWFpK3B2Z884MyErW8npwzjTPrCHqIJSSCbVBaHP84aM0B4R5mbyj1s7p1odWmJ+mEso8FMPiTyaE/s2D7xyfvYX4rRa+MtaavGeLeGty0JZo95b/1CFsSa/hww0RABmti7A0RGyEbVidcLAwZpb03yCbyBnqYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674288; c=relaxed/simple;
	bh=Bq4DEd1wpxmiR3VQXVcP4e0QnueNrknQIdhxe2cBJ/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k+2FB67LtsQPffdSZZAYjMX2186UmTimqk9C1fPp6D3XOAvigSbU9TotdG5Y82lIQvGYwOmdAqYe8cPAuEcjeQEGljZYuI1T4elAuh8+1/Ez5RYRDg5bQxy7vGoC4ujHEnjv3eF//jKnWtBJnpp2F+KVL/sHdXP1kBa6Zr8P6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFbIu+JC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFbIu+JC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778674285; x=1810210285;
  h=date:from:to:cc:subject:message-id;
  bh=Bq4DEd1wpxmiR3VQXVcP4e0QnueNrknQIdhxe2cBJ/g=;
  b=RFbIu+JCdJiZOuJeJ4kiTPgQHs0J0/jIn3pOTAew4BiFDl3VXKIu7K+g
   n6pJH+VojibenfKjeW3TFZZOrmfP3R8hGK1iXpQXxvsxq+LLr/OCUutZR
   4vDEvntEwcFve+Bp19BEcOz5XfDZpbAqvutaou2NxultEakuKsH59qqRk
   D7jBDZiMvDCq4GjhA4FOVT4zKw1GihsRQmGCsi7moBcmxO5KEAVtqDWrj
   BuWQEI7Zw7A5iHhia6YTOmXcRmUsEmxnDh9sRoshf8xzHVxrxim4v7FPP
   dupexFwy5f1FdhhvNz0IhFuftI782ZHDJl+PQG/CDRWr6ZpRmbVBlH7mD
   g==;
X-CSE-ConnectionGUID: gJce4b9aTZC4GgOwVlm52g==
X-CSE-MsgGUID: SYRIoFvbQj2ZsMziTuQkBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="67128256"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="67128256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:11:24 -0700
X-CSE-ConnectionGUID: yASwr0k6Sq+y5ZFTnWe0+g==
X-CSE-MsgGUID: EyznT+97SiqZ6ejtgjFiAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233621461"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2026 05:11:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8Qq-00000000439-3nKZ;
	Wed, 13 May 2026 12:11:20 +0000
Date: Wed, 13 May 2026 20:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 6/6]
 mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
Message-ID: <202605132022.8fbd7hvH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   10c188407341817c6baf9dad9c788928f8387800
commit: 10c188407341817c6baf9dad9c788928f8387800 [6/6] mm/slab: allow changing sheaf_capacity at runtime
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260513/202605132022.8fbd7hvH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132022.8fbd7hvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132022.8fbd7hvH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
>> mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
>> mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   mm/slub.c:3187:44: error: no member named 'cache' in 'struct slab_sheaf'
    3187 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   mm/slub.c:3187:44: error: no member named 'cache' in 'struct slab_sheaf'
    3187 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   mm/slub.c:3187:44: error: no member named 'cache' in 'struct slab_sheaf'
    3187 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   mm/slub.c:6042:8: error: use of undeclared label 'flush'
    6042 |                 goto flush;
         |                      ^
   mm/slub.c:7962:39: error: use of undeclared identifier 'USHORT_MAX'
    7962 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                                              ^~~~~~~~~~
   mm/slub.c:8641:26: error: no member named 'barn' in 'struct kmem_cache_node'
    8641 |                 if (get_node(s, node)->barn)
         |                     ~~~~~~~~~~~~~~~~~  ^
   9 errors generated.


vim +3173 mm/slub.c

  3162	
  3163	/*
  3164	 * The following two functions are used mainly in cases where we have to undo an
  3165	 * intended action due to a race or cpu migration. Thus they do not check the
  3166	 * empty or full sheaf limits for simplicity.
  3167	 */
  3168	
  3169	static void barn_put_empty_sheaf(struct node_barn *barn, struct slab_sheaf *sheaf)
  3170	{
  3171		unsigned long flags;
  3172	
> 3173		lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
  3174	
  3175		spin_lock_irqsave(&barn->lock, flags);
  3176	
  3177		list_add(&sheaf->barn_list, &barn->sheaves_empty);
  3178		barn->nr_empty++;
  3179	
  3180		spin_unlock_irqrestore(&barn->lock, flags);
  3181	}
  3182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
