Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31472135A53;
	Wed, 23 Oct 2024 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729659635; cv=none; b=eplq8r+vnMPX0IMcOgEO4SkHMF5fqegUXZPRLv89m9ABVTAaVg/6yjliNhOUSWWtMfcUwvIwAcDm/S8rA09nvhsRPIIKfxD8XWf2j30tKZYNreoVNaGTfc7am12FCzTHDnNFVXulEyyviu/1tpJuVIZJcQ6+nkxGvXcI/PNWRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729659635; c=relaxed/simple;
	bh=Y5mwWTAZ0TcnndyxJ32dE/2GT8OcocJWnH2I/mGoCXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBScDTY11vKMw3QbMQhYA4td3cuCYfJjjIM8KoYHErOIseg6V+eSWB5fzPUCtAPq1VjdMElR4kx/WE8RCmLwMrUGpZuElKkWGOdBRmIkmPUB8X44SccNUxcZuh8roLa5TJdxhzp2GLTINVntjl/fbs6xyCahoCah6DHhHXB3iw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yc0UcXfS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yc0UcXfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729659630; x=1761195630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5mwWTAZ0TcnndyxJ32dE/2GT8OcocJWnH2I/mGoCXc=;
  b=Yc0UcXfShlEYj6vgHj2VzfgPlJgDsCQTGpqYjcC5JkJtTVOZkOseKG7s
   ZYeMFAWjxhjTBLgfKJOk5K4/yzQ4yO2qnT7eTBG4YmoRurAtKG0oBG87t
   4nNrgz3tFVr2rF+hutOfvBQ2pUjw5nP9euADMVRv6qjripf8FlKbzfNT5
   L8O/sK4D+wjHwMemD7p5yXBwpuqBO5zYcG43CzMZlN5TYs+Uz8Ffp4WUe
   sH1Mt0AzThOoeFF11J4/9k+ifQKgmbd0+LW4Co1n4IES8c8J5pTv7LPYc
   3o4F+aGNcXdG64SzNTlD67m4W9+jUPd7DcbYEY/T5Inr7M2S7pbMFKW9q
   g==;
X-CSE-ConnectionGUID: 8za6yRs5Ray/jL0+pTO2Qg==
X-CSE-MsgGUID: AF99oQ+mTaq/w3C9RCINRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39805644"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="39805644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:00:28 -0700
X-CSE-ConnectionGUID: +lhXmCajT5use5rOnbIVdQ==
X-CSE-MsgGUID: mI2SZyg1SJOUyY3YibGOkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="85166612"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2024 22:00:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3TTr-000USJ-1J;
	Wed, 23 Oct 2024 05:00:23 +0000
Date: Wed, 23 Oct 2024 13:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 8/21] kernel/trace/ftrace.c:5887:
 warning: Function parameter or struct member 'hash' not described in
 'register_ftrace_direct_hash'
Message-ID: <202410231204.FTyqu5nK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git trampoline_multi_10
head:   48132820c5a21b82d1a4507a86a67b3742fb110e
commit: 5081acd5f53163da83a2b4d9fd7178c6c2f11a76 [8/21] ftrace: Add register_ftrace_direct_hash function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231204.FTyqu5nK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231204.FTyqu5nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231204.FTyqu5nK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ftrace.c:5887: warning: Function parameter or struct member 'hash' not described in 'register_ftrace_direct_hash'
>> kernel/trace/ftrace.c:5887: warning: expecting prototype for register_ftrace_direct(). Prototype was for register_ftrace_direct_hash() instead


vim +5887 kernel/trace/ftrace.c

f64dd4627ec6ed Jiri Olsa               2021-10-08  5862  
f64dd4627ec6ed Jiri Olsa               2021-10-08  5863  /**
da8bdfbd422333 Florent Revest          2023-03-21  5864   * register_ftrace_direct - Call a custom trampoline directly
f64dd4627ec6ed Jiri Olsa               2021-10-08  5865   * for multiple functions registered in @ops
f64dd4627ec6ed Jiri Olsa               2021-10-08  5866   * @ops: The address of the struct ftrace_ops object
c488fe4b50d896 Jiri Olsa               2024-09-30  5867   * @ip: The address of the function to attach
f64dd4627ec6ed Jiri Olsa               2021-10-08  5868   * @addr: The address of the trampoline to call at @ops functions
f64dd4627ec6ed Jiri Olsa               2021-10-08  5869   *
f64dd4627ec6ed Jiri Olsa               2021-10-08  5870   * This is used to connect a direct calls to @addr from the nop locations
f64dd4627ec6ed Jiri Olsa               2021-10-08  5871   * of the functions registered in @ops (with by ftrace_set_filter_ip
f64dd4627ec6ed Jiri Olsa               2021-10-08  5872   * function).
f64dd4627ec6ed Jiri Olsa               2021-10-08  5873   *
f64dd4627ec6ed Jiri Olsa               2021-10-08  5874   * The location that it calls (@addr) must be able to handle a direct call,
f64dd4627ec6ed Jiri Olsa               2021-10-08  5875   * and save the parameters of the function being traced, and restore them
f64dd4627ec6ed Jiri Olsa               2021-10-08  5876   * (or inject new ones if needed), before returning.
f64dd4627ec6ed Jiri Olsa               2021-10-08  5877   *
f64dd4627ec6ed Jiri Olsa               2021-10-08  5878   * Returns:
f64dd4627ec6ed Jiri Olsa               2021-10-08  5879   *  0 on success
f64dd4627ec6ed Jiri Olsa               2021-10-08  5880   *  -EINVAL  - The @ops object was already registered with this call or
f64dd4627ec6ed Jiri Olsa               2021-10-08  5881   *             when there are no functions in @ops object.
f64dd4627ec6ed Jiri Olsa               2021-10-08  5882   *  -EBUSY   - Another direct function is already attached (there can be only one)
f64dd4627ec6ed Jiri Olsa               2021-10-08  5883   *  -ENODEV  - @ip does not point to a ftrace nop location (or not supported)
f64dd4627ec6ed Jiri Olsa               2021-10-08  5884   *  -ENOMEM  - There was an allocation failure.
f64dd4627ec6ed Jiri Olsa               2021-10-08  5885   */
5081acd5f53163 Jiri Olsa               2024-10-14  5886  int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
f64dd4627ec6ed Jiri Olsa               2021-10-08 @5887  {
5081acd5f53163 Jiri Olsa               2024-10-14  5888  	struct ftrace_func_entry *new = NULL, *entry;
c488fe4b50d896 Jiri Olsa               2024-09-30  5889  	struct ftrace_hash *new_hash = NULL;
c488fe4b50d896 Jiri Olsa               2024-09-30  5890  	int err = -EBUSY, reg;
5081acd5f53163 Jiri Olsa               2024-10-14  5891  	unsigned long size, i;
f64dd4627ec6ed Jiri Olsa               2021-10-08  5892  
f64dd4627ec6ed Jiri Olsa               2021-10-08  5893  	mutex_lock(&direct_mutex);
f64dd4627ec6ed Jiri Olsa               2021-10-08  5894  
c488fe4b50d896 Jiri Olsa               2024-09-30  5895  	/* Make sure requested entry is not already registered.. */
5081acd5f53163 Jiri Olsa               2024-10-14  5896  	size = 1 << hash->size_bits;
5081acd5f53163 Jiri Olsa               2024-10-14  5897  	for (i = 0; i < size; i++) {
5081acd5f53163 Jiri Olsa               2024-10-14  5898  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
5081acd5f53163 Jiri Olsa               2024-10-14  5899  			if (__ftrace_lookup_ip(direct_functions, entry->ip))
f64dd4627ec6ed Jiri Olsa               2021-10-08  5900  				goto out_unlock;
5081acd5f53163 Jiri Olsa               2024-10-14  5901  		}
5081acd5f53163 Jiri Olsa               2024-10-14  5902  	}
f64dd4627ec6ed Jiri Olsa               2021-10-08  5903  
f64dd4627ec6ed Jiri Olsa               2021-10-08  5904  	err = -ENOMEM;
c488fe4b50d896 Jiri Olsa               2024-09-30  5905  	if (direct_functions == EMPTY_HASH) {
c488fe4b50d896 Jiri Olsa               2024-09-30  5906  		direct_functions = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
c488fe4b50d896 Jiri Olsa               2024-09-30  5907  		if (!direct_functions)
c488fe4b50d896 Jiri Olsa               2024-09-30  5908  			goto out_unlock;
c488fe4b50d896 Jiri Olsa               2024-09-30  5909  	}
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5910) 
c488fe4b50d896 Jiri Olsa               2024-09-30  5911  	new_hash = alloc_and_copy_ftrace_hash(FTRACE_HASH_DEFAULT_BITS, direct_functions);
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5912) 	if (!new_hash)
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5913) 		goto out_unlock;
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5914) 
5081acd5f53163 Jiri Olsa               2024-10-14  5915  	for (i = 0; i < size; i++) {
5081acd5f53163 Jiri Olsa               2024-10-14  5916  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
5081acd5f53163 Jiri Olsa               2024-10-14  5917  			if (add_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
5081acd5f53163 Jiri Olsa               2024-10-14  5918  				goto out_cleanup;
5081acd5f53163 Jiri Olsa               2024-10-14  5919  		}
5081acd5f53163 Jiri Olsa               2024-10-14  5920  	}
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5921) 
c488fe4b50d896 Jiri Olsa               2024-09-30  5922  	reg = !direct_functions->count;
c488fe4b50d896 Jiri Olsa               2024-09-30  5923  
5081acd5f53163 Jiri Olsa               2024-10-14  5924  	for (i = 0; i < size; i++) {
5081acd5f53163 Jiri Olsa               2024-10-14  5925  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
5081acd5f53163 Jiri Olsa               2024-10-14  5926  			if (add_hash_entry_direct(direct_functions, entry->ip, entry->direct) == NULL)
5081acd5f53163 Jiri Olsa               2024-10-14  5927  				goto out_cleanup;
5081acd5f53163 Jiri Olsa               2024-10-14  5928  		}
5081acd5f53163 Jiri Olsa               2024-10-14  5929  	}
d05cb470663a2a Steven Rostedt (Google  2023-12-29  5930) 
c488fe4b50d896 Jiri Olsa               2024-09-30  5931  	if (reg) {
c488fe4b50d896 Jiri Olsa               2024-09-30  5932  		if (!(ops->flags & FTRACE_OPS_FL_INITIALIZED)) {
f64dd4627ec6ed Jiri Olsa               2021-10-08  5933  			ops->func = call_direct_funcs;
f64dd4627ec6ed Jiri Olsa               2021-10-08  5934  			ops->flags = MULTI_FLAGS;
f64dd4627ec6ed Jiri Olsa               2021-10-08  5935  			ops->trampoline = FTRACE_REGS_ADDR;
c488fe4b50d896 Jiri Olsa               2024-09-30  5936  		}
c488fe4b50d896 Jiri Olsa               2024-09-30  5937  		ops->local_hash.filter_hash = new_hash;
53cd885bc5c3ea Song Liu                2022-07-19  5938  		err = register_ftrace_function_nolock(ops);
c488fe4b50d896 Jiri Olsa               2024-09-30  5939  		if (err)
c488fe4b50d896 Jiri Olsa               2024-09-30  5940  			free_ftrace_hash(new_hash);
c488fe4b50d896 Jiri Olsa               2024-09-30  5941  	} else {
c488fe4b50d896 Jiri Olsa               2024-09-30  5942  		err = ftrace_update_ops(ops, new_hash, EMPTY_HASH);
c488fe4b50d896 Jiri Olsa               2024-09-30  5943  		free_ftrace_hash(new_hash);
c488fe4b50d896 Jiri Olsa               2024-09-30  5944  	}
f64dd4627ec6ed Jiri Olsa               2021-10-08  5945  
5081acd5f53163 Jiri Olsa               2024-10-14  5946   out_cleanup:
5081acd5f53163 Jiri Olsa               2024-10-14  5947  	if (err) {
5081acd5f53163 Jiri Olsa               2024-10-14  5948  		for (i = 0; i < size; i++) {
5081acd5f53163 Jiri Olsa               2024-10-14  5949  			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
5081acd5f53163 Jiri Olsa               2024-10-14  5950  				new = __ftrace_lookup_ip(direct_functions, entry->ip);
5081acd5f53163 Jiri Olsa               2024-10-14  5951  				if (new)
c488fe4b50d896 Jiri Olsa               2024-09-30  5952  					remove_hash_entry(direct_functions, new);
c488fe4b50d896 Jiri Olsa               2024-09-30  5953  				kfree(new);
c488fe4b50d896 Jiri Olsa               2024-09-30  5954  			}
5081acd5f53163 Jiri Olsa               2024-10-14  5955  		}
5081acd5f53163 Jiri Olsa               2024-10-14  5956  	}
5081acd5f53163 Jiri Olsa               2024-10-14  5957  
5081acd5f53163 Jiri Olsa               2024-10-14  5958   out_unlock:
5081acd5f53163 Jiri Olsa               2024-10-14  5959  	mutex_unlock(&direct_mutex);
f64dd4627ec6ed Jiri Olsa               2021-10-08  5960  	return err;
f64dd4627ec6ed Jiri Olsa               2021-10-08  5961  }
da8bdfbd422333 Florent Revest          2023-03-21  5962  EXPORT_SYMBOL_GPL(register_ftrace_direct);
f64dd4627ec6ed Jiri Olsa               2021-10-08  5963  

:::::: The code at line 5887 was first introduced by commit
:::::: f64dd4627ec6edc39bf1430fe6dbc923d2300a88 ftrace: Add multi direct register/unregister interface

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
