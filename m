Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7B1D5CE0;
	Sun, 18 Jan 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723453; cv=none; b=DFPaUfEECqYt1Vo263xYUCxFeOhSWRqgsnb5aqqbwqxabksUfcizSEIuFcnaQS59ehYoR+6LbJifg6uqIhEpvS87SqZT7025czAz5GoBw0y0k+hlbnnze3zrtIsKFucmO99PWwhDa8Dap98c1gG5xsspmI2YbDk51brs/g2t3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723453; c=relaxed/simple;
	bh=FqFD1HQX0h8Gfmhza+5gLTaSJLZa/BB0tcQWzDRvqJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fktKMlyAAtbsyagorO9dW5y8xf7RcRFiqaAFTLY1GTe/qvIDfUhS5VjHCgJdER9UF27hLlCo7CHMTRUIQuoOXksf+dhRkCMIOBVWQzR11uapkJbe/5HP7ej6NwLnKRL07YfORO0Y0HFfV/0cfW7A9pIL83A0Zv13NBZG+Us7qz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEwITbie; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEwITbie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768723452; x=1800259452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FqFD1HQX0h8Gfmhza+5gLTaSJLZa/BB0tcQWzDRvqJo=;
  b=bEwITbieu5szyuR4iTv4XSOYfpB1v7UdQ1olK7PMwRHo2HG2ZolP+kwc
   P1+WGhC3tcGKIrxqrWmAaurad6gQYxhluuLJ7GyJtqq16JhFP+ZF2zSqT
   EFBP4xKM7H4VnpkAva3lDOXD0b5r5CXJB0iUN8JrD87nHcrccJsg4/Wf/
   OGx22FLZk/+C+WWbsaYzj+UFYfJr8+UFSI1KuxN39P2g8OzQ47c8zOYfT
   rHayDk+GI4hF4uhzDEz9m2JmG+jRiuCtwYdYwJsTIuW/bE8Dl+a3yMJ7l
   AZFvzhFpXOMuWfKcgtF5QHOarXkdvlHOzFvCzCMFsUIZYJBldfjHh2Ecd
   w==;
X-CSE-ConnectionGUID: mVH8YwSKQ/C6VW/iMVE+/w==
X-CSE-MsgGUID: iWsf88dwTR6dt6yRBz2Z9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70019513"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="70019513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 00:04:12 -0800
X-CSE-ConnectionGUID: uPui2NXkSzmsRkj1HQlxpg==
X-CSE-MsgGUID: MMVmDEfcTd2TZx+M4g5xgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210079331"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 00:04:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhNlY-00000000Mmy-2Xrc;
	Sun, 18 Jan 2026 08:04:08 +0000
Date: Sun, 18 Jan 2026 16:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: scott.k.mitch1@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/2] netfilter: nfnetlink_queue: optimize verdict
 lookup with hash table
Message-ID: <202601181534.BnLgzIMA-lkp@intel.com>
References: <20260117173231.88610-3-scott.k.mitch1@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117173231.88610-3-scott.k.mitch1@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[cannot apply to nf-next/master horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/scott-k-mitch1-gmail-com/netfilter-nfnetlink_queue-nfqnl_instance-GFP_ATOMIC-GFP_KERNEL_ACCOUNT-allocation/20260118-013424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20260117173231.88610-3-scott.k.mitch1%40gmail.com
patch subject: [PATCH v6 2/2] netfilter: nfnetlink_queue: optimize verdict lookup with hash table
config: powerpc-pmac32_defconfig (https://download.01.org/0day-ci/archive/20260118/202601181534.BnLgzIMA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181534.BnLgzIMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181534.BnLgzIMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nfnetlink_queue.c:279:1: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     279 | }
         | ^
   1 warning generated.


vim +279 net/netfilter/nfnetlink_queue.c

   206	
   207		new_size = inst->queue_hash_size;
   208		if (nfqnl_should_grow(inst)) {
   209			/* Resize cannot be done synchronously from __enqueue_entry because
   210			 * it runs in softirq context where the GFP_KERNEL_ACCOUNT allocation
   211			 * (which can sleep) is not allowed. Instead, resize is deferred to
   212			 * work queue. During packet bursts, multiple enqueues may occur before
   213			 * any work runs, so we calculate target size based on current queue_total
   214			 * (aiming for 75% load) rather than just doubling. Ensure minimum 2x
   215			 * growth to avoid tiny increments.
   216			 */
   217			new_size = (inst->queue_total > NFQNL_HASH_MAX_SIZE * 3 / 4) ?
   218				NFQNL_HASH_MAX_SIZE :
   219				roundup_pow_of_two(inst->queue_total / 3 * 4);
   220	
   221			new_size = max(new_size, inst->queue_hash_size * 2);
   222		} else if (nfqnl_should_shrink(inst)) {
   223			new_size = inst->queue_hash_size / 2;
   224		}
   225	
   226		if (new_size == inst->queue_hash_size) {
   227			spin_unlock_bh(&inst->lock);
   228			goto out_put;
   229		}
   230	
   231		/* Work queue serialization guarantees only one instance of this function
   232		 * runs at a time for a given queue, so we can safely drop the lock during
   233		 * allocation without worrying about concurrent resizes.
   234		 */
   235		spin_unlock_bh(&inst->lock);
   236	
   237		if (target_memcg)
   238			old_memcg = set_active_memcg(target_memcg);
   239	
   240		new_hash = kvmalloc_array(new_size, sizeof(*new_hash), GFP_KERNEL_ACCOUNT);
   241	
   242		if (target_memcg)
   243			set_active_memcg(old_memcg);
   244	
   245		if (!new_hash)
   246			goto out_put;
   247	
   248		hash_mask = new_size - 1;
   249		for (h = 0; h < new_size; h++)
   250			INIT_HLIST_HEAD(&new_hash[h]);
   251	
   252		spin_lock_bh(&inst->lock);
   253	
   254		list_for_each_entry(entry, &inst->queue_list, list) {
   255			/* No hlist_del() since old_hash will be freed and we hold lock */
   256			h = nfqnl_packet_hash(entry->id, hash_mask);
   257			hlist_add_head(&entry->hash_node, &new_hash[h]);
   258		}
   259	
   260		old_hash = inst->queue_hash;
   261	
   262		if (new_size < inst->queue_hash_size)
   263			inst->queue_hash_last_shrink_jiffies = jiffies;
   264	
   265		inst->queue_hash_size = new_size;
   266		inst->queue_hash_mask = hash_mask;
   267		inst->queue_hash = new_hash;
   268	
   269		spin_unlock_bh(&inst->lock);
   270	
   271		kvfree(old_hash);
   272	
   273	out_put:
   274	#ifdef CONFIG_MEMCG
   275		/* Decrement reference count after we are done */
   276		if (target_memcg)
   277			css_put(&target_memcg->css);
   278	#endif
 > 279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
