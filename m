Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11FD142623;
	Wed, 23 Oct 2024 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665339; cv=none; b=ghQLBReTwo3DA43qInoVOZPcuIZVLA2zkPl+f0oOqj0VhsaffsHaVbtIwtzeFr7I4gj9Jq9FlEV1MsUVTIPnIFLMzl7VpAfzj+bfpKuUNfVYXdcz5YDUCucb/tC90vc4hYNE/CJU4wt/KdYXgsQydmdKBz88O83UgiL6uv9YQ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665339; c=relaxed/simple;
	bh=JCd5CSidKTxinXr/kmIB4aixmRXuKAiR+oKl2jOHSGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtDxZOU/CUx3G2WNvxhKrQmXWrSmcPxOssBYD7SjCAujeYhaS74G+d3i1PUWdZeO4k8hoWfwAXh7FFfEpzZ/KfTeba/4PvorVsCZHU4UT7pZKO5MUCgr+3JsCh3ujpNnJvsrtHsJgPeJQ53N32MXuu0FMOWYZJJjgN4BWjI5eTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaweMt1z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaweMt1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729665337; x=1761201337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCd5CSidKTxinXr/kmIB4aixmRXuKAiR+oKl2jOHSGg=;
  b=BaweMt1zaH2SZxgwBv7e1nr1WOaI4m1FSbq3qQwcVmGG4FKkUNMAnt3a
   oG5VpgdEpGo6/WK3IQX3h3CS1w5iJGqbB5i6X+zGhIIl+YbkrdrX+NNxv
   l/kciASmwQ/ovy5U5z3Prfkw6MqVrYM/OE/JRp1WUL97u8LKkCogWI7Fv
   QN0zbU+Ghy/rQ4i09Mul8IecGlQYCaSxYnge4uen758pzqZH+Aa1e0xEE
   XoTgVrxyDcJolXTd3EJOKCIYynu3PhGM00fMP9sSaaxLB2szqwRl7MwCz
   0/Hb1Qfg7DsVMNuFroM1XWYF7vsbk1mCIA6F56kyGyES5XAkVVgNi+/18
   g==;
X-CSE-ConnectionGUID: W2vCJzQbRxOUSLUEPV3YEg==
X-CSE-MsgGUID: KyJS4HHVQaOmLFKdVCBOdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29394926"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29394926"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 23:35:34 -0700
X-CSE-ConnectionGUID: guZbrTsTQhmxgJ/PuOjO7g==
X-CSE-MsgGUID: nPuuhLPKRwazOHhgL0cEDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80903242"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 23:35:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Uxu-000UZQ-1F;
	Wed, 23 Oct 2024 06:35:30 +0000
Date: Wed, 23 Oct 2024 14:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 9/21] kernel/trace/ftrace.c:6001:
 warning: Function parameter or struct member 'hash' not described in
 'unregister_ftrace_direct_hash'
Message-ID: <202410231448.tshoLbjZ-lkp@intel.com>
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
commit: 122145c00eae844a9c5f48a3c5604554a8b9a377 [9/21] ftrace: Add unregister_ftrace_direct_hash function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231448.tshoLbjZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231448.tshoLbjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231448.tshoLbjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:5887: warning: Function parameter or struct member 'hash' not described in 'register_ftrace_direct_hash'
   kernel/trace/ftrace.c:5887: warning: expecting prototype for register_ftrace_direct(). Prototype was for register_ftrace_direct_hash() instead
>> kernel/trace/ftrace.c:6001: warning: Function parameter or struct member 'hash' not described in 'unregister_ftrace_direct_hash'
>> kernel/trace/ftrace.c:6001: warning: expecting prototype for unregister_ftrace_direct(). Prototype was for unregister_ftrace_direct_hash() instead


vim +6001 kernel/trace/ftrace.c

5081acd5f53163 Jiri Olsa         2024-10-14  5982  
f64dd4627ec6ed Jiri Olsa         2021-10-08  5983  /**
da8bdfbd422333 Florent Revest    2023-03-21  5984   * unregister_ftrace_direct - Remove calls to custom trampoline
da8bdfbd422333 Florent Revest    2023-03-21  5985   * previously registered by register_ftrace_direct for @ops object.
f64dd4627ec6ed Jiri Olsa         2021-10-08  5986   * @ops: The address of the struct ftrace_ops object
c488fe4b50d896 Jiri Olsa         2024-09-30  5987   * @ip: The address of the function to attach
9b5a45eb639c46 Marilene A Garcia 2024-06-06  5988   * @addr: The address of the direct function that is called by the @ops functions
9b5a45eb639c46 Marilene A Garcia 2024-06-06  5989   * @free_filters: Set to true to remove all filters for the ftrace_ops, false otherwise
f64dd4627ec6ed Jiri Olsa         2021-10-08  5990   *
f64dd4627ec6ed Jiri Olsa         2021-10-08  5991   * This is used to remove a direct calls to @addr from the nop locations
f64dd4627ec6ed Jiri Olsa         2021-10-08  5992   * of the functions registered in @ops (with by ftrace_set_filter_ip
f64dd4627ec6ed Jiri Olsa         2021-10-08  5993   * function).
f64dd4627ec6ed Jiri Olsa         2021-10-08  5994   *
f64dd4627ec6ed Jiri Olsa         2021-10-08  5995   * Returns:
f64dd4627ec6ed Jiri Olsa         2021-10-08  5996   *  0 on success
f64dd4627ec6ed Jiri Olsa         2021-10-08  5997   *  -EINVAL - The @ops object was not properly registered.
f64dd4627ec6ed Jiri Olsa         2021-10-08  5998   */
122145c00eae84 Jiri Olsa         2024-10-14  5999  int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash,
59495740f79524 Florent Revest    2023-03-21  6000  				  bool free_filters)
f64dd4627ec6ed Jiri Olsa         2021-10-08 @6001  {
122145c00eae84 Jiri Olsa         2024-10-14  6002  	struct ftrace_func_entry *del, *entry;
c488fe4b50d896 Jiri Olsa         2024-09-30  6003  	struct ftrace_hash *new_hash = NULL;
122145c00eae84 Jiri Olsa         2024-10-14  6004  	unsigned long size, i;
c488fe4b50d896 Jiri Olsa         2024-09-30  6005  	int err = -EINVAL;
f64dd4627ec6ed Jiri Olsa         2021-10-08  6006  
f64dd4627ec6ed Jiri Olsa         2021-10-08  6007  	if (check_direct_multi(ops))
f64dd4627ec6ed Jiri Olsa         2021-10-08  6008  		return -EINVAL;
f64dd4627ec6ed Jiri Olsa         2021-10-08  6009  	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
f64dd4627ec6ed Jiri Olsa         2021-10-08  6010  		return -EINVAL;
c488fe4b50d896 Jiri Olsa         2024-09-30  6011  	if (direct_functions == EMPTY_HASH)
c488fe4b50d896 Jiri Olsa         2024-09-30  6012  		return -EINVAL;
f64dd4627ec6ed Jiri Olsa         2021-10-08  6013  
f64dd4627ec6ed Jiri Olsa         2021-10-08  6014  	mutex_lock(&direct_mutex);
c488fe4b50d896 Jiri Olsa         2024-09-30  6015  
122145c00eae84 Jiri Olsa         2024-10-14  6016  	/* Make sure requested entries are already registered.. */
122145c00eae84 Jiri Olsa         2024-10-14  6017  	size = 1 << hash->size_bits;
122145c00eae84 Jiri Olsa         2024-10-14  6018  	for (i = 0; i < size; i++) {
122145c00eae84 Jiri Olsa         2024-10-14  6019  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
122145c00eae84 Jiri Olsa         2024-10-14  6020  			del = __ftrace_lookup_ip(direct_functions, entry->ip);
122145c00eae84 Jiri Olsa         2024-10-14  6021  			if (!del || del->direct != entry->direct)
c488fe4b50d896 Jiri Olsa         2024-09-30  6022  				goto out_unlock;
122145c00eae84 Jiri Olsa         2024-10-14  6023  		}
122145c00eae84 Jiri Olsa         2024-10-14  6024  	}
c488fe4b50d896 Jiri Olsa         2024-09-30  6025  
c488fe4b50d896 Jiri Olsa         2024-09-30  6026  	new_hash = alloc_and_copy_ftrace_hash(FTRACE_HASH_DEFAULT_BITS, direct_functions);
c488fe4b50d896 Jiri Olsa         2024-09-30  6027  	if (!new_hash)
c488fe4b50d896 Jiri Olsa         2024-09-30  6028  		goto out_unlock;
c488fe4b50d896 Jiri Olsa         2024-09-30  6029  
122145c00eae84 Jiri Olsa         2024-10-14  6030  	for (i = 0; i < size; i++) {
122145c00eae84 Jiri Olsa         2024-10-14  6031  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
122145c00eae84 Jiri Olsa         2024-10-14  6032  			del = __ftrace_lookup_ip(new_hash, entry->ip);
122145c00eae84 Jiri Olsa         2024-10-14  6033  			remove_hash_entry(new_hash, del);
122145c00eae84 Jiri Olsa         2024-10-14  6034  			kfree(del);
122145c00eae84 Jiri Olsa         2024-10-14  6035  		}
122145c00eae84 Jiri Olsa         2024-10-14  6036  	}
c488fe4b50d896 Jiri Olsa         2024-09-30  6037  
c488fe4b50d896 Jiri Olsa         2024-09-30  6038  	if (ftrace_hash_empty(new_hash)) {
f64dd4627ec6ed Jiri Olsa         2021-10-08  6039  		err = unregister_ftrace_function(ops);
c488fe4b50d896 Jiri Olsa         2024-09-30  6040  		ftrace_free_filter(ops);
c488fe4b50d896 Jiri Olsa         2024-09-30  6041  	} else {
c488fe4b50d896 Jiri Olsa         2024-09-30  6042  		err = ftrace_update_ops(ops, new_hash, EMPTY_HASH);
c488fe4b50d896 Jiri Olsa         2024-09-30  6043  	}
c488fe4b50d896 Jiri Olsa         2024-09-30  6044  
c488fe4b50d896 Jiri Olsa         2024-09-30  6045  	free_ftrace_hash(new_hash);
fea3ffa48c6d42 Jiri Olsa         2021-12-06  6046  
c488fe4b50d896 Jiri Olsa         2024-09-30  6047  	if (!err) {
122145c00eae84 Jiri Olsa         2024-10-14  6048  		for (i = 0; i < size; i++) {
122145c00eae84 Jiri Olsa         2024-10-14  6049  			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
122145c00eae84 Jiri Olsa         2024-10-14  6050  				del = __ftrace_lookup_ip(direct_functions, entry->ip);
122145c00eae84 Jiri Olsa         2024-10-14  6051  				remove_hash_entry(direct_functions, del);
122145c00eae84 Jiri Olsa         2024-10-14  6052  				kfree(del);
122145c00eae84 Jiri Olsa         2024-10-14  6053  			}
122145c00eae84 Jiri Olsa         2024-10-14  6054  		}
c488fe4b50d896 Jiri Olsa         2024-09-30  6055  	}
59495740f79524 Florent Revest    2023-03-21  6056  
c488fe4b50d896 Jiri Olsa         2024-09-30  6057   out_unlock:
c488fe4b50d896 Jiri Olsa         2024-09-30  6058  	mutex_unlock(&direct_mutex);
59495740f79524 Florent Revest    2023-03-21  6059  	if (free_filters)
59495740f79524 Florent Revest    2023-03-21  6060  		ftrace_free_filter(ops);
f64dd4627ec6ed Jiri Olsa         2021-10-08  6061  	return err;
f64dd4627ec6ed Jiri Olsa         2021-10-08  6062  }
da8bdfbd422333 Florent Revest    2023-03-21  6063  EXPORT_SYMBOL_GPL(unregister_ftrace_direct);
ccf5a89efd6f0a Jiri Olsa         2021-10-08  6064  

:::::: The code at line 6001 was first introduced by commit
:::::: f64dd4627ec6edc39bf1430fe6dbc923d2300a88 ftrace: Add multi direct register/unregister interface

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
