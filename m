Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E2EC5;
	Sat,  1 Mar 2025 05:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740806637; cv=none; b=sz9LZ8hRGYVPOsJ/YgwQkHxO+c8jkLAx7D4N7WTKAEOLVBrsmVMV9LdcJFxUVun94EZU5zle08us6LYifU83ps2+fwoMqD/BF1p6vwaX75g1liEdJSUhMQgHcTfn/O9e6Rr3/EXiFXEdm34v+R0GkH0gkLAecx18JZM0n88yeaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740806637; c=relaxed/simple;
	bh=+LwrchugwxTX9sqQaRG/WOYGU+xtBV9uq0Yn99vVipU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFRXQ1wUrLEXNnaQvkrJkyjnyiBQQ0Czv5APeuMtN892Za1vIBTfUcJFh6vDfcwWMJgMqNS8/Yr5DCpkr0XKXlKw6ipqvXVIIuzBqDe3aTF0HKyZg5uSGk0/RYpPMNGN3rn2ce0FjOP6bRh+JRYL9udxi5GYM+tjDY30A529Vcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqeFS55j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqeFS55j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740806635; x=1772342635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LwrchugwxTX9sqQaRG/WOYGU+xtBV9uq0Yn99vVipU=;
  b=dqeFS55jw7bndV4x8W+vuEh+drJqI3wmH9W95HhBv9RXAU46+eiUEpG6
   T7z0SIZGJwRjuVh0EtkL+yTAqkNUzz9cXa7aGBJfRsIqFrfrZ/Xqeunuq
   +uyi1Z3/qdMnZSlZKUtum+x40TEegkKGy74DO4Tc2aKfoIgsiIRdSIftF
   Cyao6tVTrW8E5ebnH3FcXvgKWwWF9azRT34vcGvV4b4wLnDm2+lPtWZla
   t2sYmdTtwDyU0yetqxdUbeiKS+dvwVDAMHAFvsKIIjePMirXbyh/F9/q8
   qXiVcZdBdkMoYJzW8PHA2y2lGlzPXYmktPUmC7cet2Pcs95WDgOPh4PY5
   g==;
X-CSE-ConnectionGUID: WAXpUdusTuufmiDrk8M/ZQ==
X-CSE-MsgGUID: lGpJfciVSh2gWnkmiSGNSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52729996"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="52729996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 21:23:55 -0800
X-CSE-ConnectionGUID: eBMjlKI7S6m8TkAWvMet1A==
X-CSE-MsgGUID: WyQOW212TzilIXninxCs3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="117275740"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2025 21:23:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toFKJ-000Fuk-1L;
	Sat, 01 Mar 2025 05:23:51 +0000
Date: Sat, 1 Mar 2025 13:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 17/18] kernel/futex/core.c:313:9: error:
 call to undeclared function '__futex_hash'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503011307.3vzaK8rr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 07c5880a60a9773964daf0341bb41604efa8cf49 [17/18] futex: Untangle and naming
config: s390-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011307.3vzaK8rr-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011307.3vzaK8rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011307.3vzaK8rr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:313:9: error: call to undeclared function '__futex_hash'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return __futex_hash(key, NULL);
                  ^
   kernel/futex/core.c:313:9: note: did you mean 'futex_hash'?
   kernel/futex/core.c:311:27: note: 'futex_hash' declared here
   struct futex_hash_bucket *futex_hash(union futex_key *key)
                             ^
>> kernel/futex/core.c:313:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct futex_hash_bucket *' [-Wint-conversion]
           return __futex_hash(key, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/futex/core.c:327:1: error: static declaration of '__futex_hash' follows non-static declaration
   __futex_hash(union futex_key *key, struct futex_private_hash *fph)
   ^
   kernel/futex/core.c:313:9: note: previous implicit declaration is here
           return __futex_hash(key, NULL);
                  ^
   3 errors generated.


vim +/__futex_hash +313 kernel/futex/core.c

   310	
   311	struct futex_hash_bucket *futex_hash(union futex_key *key)
   312	{
 > 313		return __futex_hash(key, NULL);
   314	}
   315	
   316	#endif /* CONFIG_BASE_SMALL */
   317	
   318	/**
   319	 * futex_hash - Return the hash bucket in the global hash
   320	 * @key:	Pointer to the futex key for which the hash is calculated
   321	 *
   322	 * We hash on the keys returned from get_futex_key (see below) and return the
   323	 * corresponding hash bucket in the global hash. If the FUTEX is private and
   324	 * a local hash table is privated then this one is used.
   325	 */
   326	static struct futex_hash_bucket *
 > 327	__futex_hash(union futex_key *key, struct futex_private_hash *fph)
   328	{
   329		struct futex_hash_bucket *hb;
   330		u32 hash;
   331	
   332		hb = __futex_hash_private(key, fph);
   333		if (hb)
   334			return hb;
   335	
   336		hash = jhash2((u32 *)key,
   337			      offsetof(typeof(*key), both.offset) / 4,
   338			      key->both.offset);
   339		return &futex_queues[hash & futex_hashmask];
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
