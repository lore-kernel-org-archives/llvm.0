Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167717A309;
	Sun,  6 Jul 2025 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751829595; cv=none; b=jU5nCrSUCDavP0OlF2qyh86mSWG/yIau+z5xIQNdGmE/Qfmsz077+x9rqgtryNjaKOZxEKmtz6HclcVnX8GzpWfvjseOzISXZVOTr8YY+Vje9YnCtRBS4scFXp3WtfgfR5ZS+LHLomiZS5aJ/BUVb4FHnVHMNzqH/VPPZxZC4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751829595; c=relaxed/simple;
	bh=OKGvpjKu3NOPP88JJeZ/6P34we7ClAD7zEr9jOhZWcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyd7kRH6SnDZX4/0q9BjPfZadzXdqDgtvAvqrADfhPA0W3l6IRrqynsFaWCquFFhLcwk3ROmmkkm4y3dNecGOU4uK7tfMuhHqSinVafTXo980k9uSg3XolLVGcCQq17W552q1oQO5eMMTFwXrGHrBuRt1fUMAh4YuBfKFot+emY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZR/UX9A7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZR/UX9A7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751829594; x=1783365594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKGvpjKu3NOPP88JJeZ/6P34we7ClAD7zEr9jOhZWcg=;
  b=ZR/UX9A7I7Iz/NEdaxIO9gz6m8D99JIdJFlEIc8mh1s9JIdPdNQQFM7V
   28Jxxw6131K8Suymhp8bwM3mVQokor06T4/d3Egvj/FcX/mQe8RTuP7KE
   f4U4x1GYQpTO8oEs4wi0MigRg1tgOnYi5bA/Lajj8VTE5Rt/u1lSPZr8g
   lLAwmqLgZ3mdjPpK50kM8DpJaXd2Eyunt7D4pALeMnXh+m1azGyHl/G5Q
   OhgadRegfcB2L4T03Yaq88X7XH4vV873qkIABwGtgCwmvDmhckfWCNAkv
   c3sGL0yXmbm5hQQzlhc+Ovz4aY4JZoa5YH4Hv6BdEEK8n4BcINUHwn7cs
   Q==;
X-CSE-ConnectionGUID: YE79QmVcR3OoVc3chAFY6w==
X-CSE-MsgGUID: Uux69JiJQ8Kaeu9wFuqJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53180862"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53180862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 12:19:53 -0700
X-CSE-ConnectionGUID: /q/u9sT1T8WYnsjHz9ovYA==
X-CSE-MsgGUID: oI12MAC+St+QluHacTeOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="159389725"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2025 12:19:52 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYUtx-0001aP-0p;
	Sun, 06 Jul 2025 19:19:49 +0000
Date: Sun, 6 Jul 2025 21:19:23 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 2/10] kernel/trace/ftrace.c:6304:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202507062107.7xOwdDO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: c9910285c9bbb6b3afad3d1048ef11abf71bcdeb [2/10] ftrace: Add register_ftrace_direct_hash function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250706/202507062107.7xOwdDO8-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062107.7xOwdDO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507062107.7xOwdDO8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ftrace.c:6304:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6304 |         if (!new_hash)
         |             ^~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6304:2: note: remove the 'if' if its condition is always false
    6304 |         if (!new_hash)
         |         ^~~~~~~~~~~~~~
    6305 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6300:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6300 |         if (!filter_hash)
         |             ^~~~~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6300:2: note: remove the 'if' if its condition is always false
    6300 |         if (!filter_hash)
         |         ^~~~~~~~~~~~~~~~~
    6301 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6295:7: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6295 |                 if (ops->flags & FTRACE_OPS_FL_ENABLED)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6295:3: note: remove the 'if' if its condition is always false
    6295 |                 if (ops->flags & FTRACE_OPS_FL_ENABLED)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6296 |                         goto out_unlock;
         |                         ~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6293:7: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6293 |                 if (ops->func || ops->trampoline)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6293:3: note: remove the 'if' if its condition is always false
    6293 |                 if (ops->func || ops->trampoline)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6294 |                         goto out_unlock;
         |                         ~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:6293:7: warning: variable 'err' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    6293 |                 if (ops->func || ops->trampoline)
         |                     ^~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6293:7: note: remove the '||' if its condition is always false
    6293 |                 if (ops->func || ops->trampoline)
         |                     ^~~~~~~~~~~~
   kernel/trace/ftrace.c:6284:8: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6284 |                         if (__ftrace_lookup_ip(direct_functions, entry->ip))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6333:9: note: uninitialized use occurs here
    6333 |         return err;
         |                ^~~
   kernel/trace/ftrace.c:6284:4: note: remove the 'if' if its condition is always false
    6284 |                         if (__ftrace_lookup_ip(direct_functions, entry->ip))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6285 |                                 goto out_unlock;
         |                                 ~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6272:18: note: initialize the variable 'err' to silence this warning
    6272 |         int i, size, err;
         |                         ^
         |                          = 0
   6 warnings generated.


vim +6304 kernel/trace/ftrace.c

  6267	
  6268	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
  6269	{
  6270		struct ftrace_hash *filter_hash = NULL, *new_hash = NULL, *free_hash = NULL;
  6271		struct ftrace_func_entry *entry;
  6272		int i, size, err;
  6273		bool reg;
  6274	
  6275		if (!hash_count(hash))
  6276			return 0;
  6277	
  6278		mutex_lock(&direct_mutex);
  6279	
  6280		/* Make sure requested entry is not already registered.. */
  6281		size = 1 << hash->size_bits;
  6282		for (i = 0; i < size; i++) {
  6283			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  6284				if (__ftrace_lookup_ip(direct_functions, entry->ip))
  6285					goto out_unlock;
  6286			}
  6287		}
  6288	
  6289		filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
  6290	
  6291		reg = hash_count(filter_hash) == 0;
  6292		if (reg) {
> 6293			if (ops->func || ops->trampoline)
  6294				goto out_unlock;
  6295			if (ops->flags & FTRACE_OPS_FL_ENABLED)
  6296				goto out_unlock;
  6297		}
  6298	
  6299		filter_hash = hash_add(filter_hash, hash);
  6300		if (!filter_hash)
  6301			goto out_unlock;
  6302	
  6303		new_hash = hash_add(direct_functions, hash);
> 6304		if (!new_hash)
  6305			goto out_unlock;
  6306	
  6307		free_hash = direct_functions;
  6308		rcu_assign_pointer(direct_functions, new_hash);
  6309		new_hash = NULL;
  6310	
  6311		if (reg) {
  6312			ops->func = call_direct_funcs_hash;
  6313			ops->flags = MULTI_FLAGS;
  6314			ops->trampoline = FTRACE_REGS_ADDR;
  6315			ops->local_hash.filter_hash = filter_hash;
  6316	
  6317			err = register_ftrace_function_nolock(ops);
  6318			if (!err)
  6319				filter_hash = NULL;
  6320		} else {
  6321			err = ftrace_update_ops(ops, filter_hash, EMPTY_HASH);
  6322		}
  6323	
  6324	 out_unlock:
  6325		mutex_unlock(&direct_mutex);
  6326	
  6327		if (free_hash && free_hash != EMPTY_HASH)
  6328			call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
  6329	
  6330		if (filter_hash)
  6331			free_ftrace_hash(filter_hash);
  6332	
  6333		return err;
  6334	}
  6335	EXPORT_SYMBOL_GPL(register_ftrace_direct_hash);
  6336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
