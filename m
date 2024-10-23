Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58414D6ED;
	Wed, 23 Oct 2024 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670271; cv=none; b=kmVXFU7gbawwjbYeCNxNBL393SkpjMg38pSz7irdV+d/SE3TGUtma5Aq1yhGjMiFC7XHDHwtYH2S9W8uDbhyRWQTlTQm+VOs3NXOHfZeK/ZHF99TilnZGmHSpWlVoUorrBHyyc/PW8Il6mTFR9FzeA6faUo0dfneAOesMc6XXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670271; c=relaxed/simple;
	bh=fDCaoiFX8lY9c/EkUDwV6zx5Ta+bTOHeCdG8mzLeGTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=conHw8z/CwPHYxaWhuY+T7hSR7sg8gdRaF4SXHFUGwu0IYT53DhM7OUZgATL3Z+VKRuR0oVptcggnea8/3LhghPoDwWHv9bkhJobNUdAxKdJwVF6ZJcFfTVFe4HHpgvsxcryaGukFDxfRcwpNu0FF7qs3wH0LXQeQotnPXLbmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYZog0If; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYZog0If"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729670270; x=1761206270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDCaoiFX8lY9c/EkUDwV6zx5Ta+bTOHeCdG8mzLeGTo=;
  b=WYZog0Ifxu1Kwsmue23fMgKXmJpmbR9NCweFpVg553ygxaMMA7S+7Wpa
   DqMBd+qcv7JIXJG1wlzb3WgbGmtFir+TGKCI3yihIqnJcBRpGXDdIZ3Gj
   os4aOD8Ic2cz77cgWR7RBOb7qiHiyhSz2xrAT4O7e80Rad249zEr04edO
   g60rkNq5VwFDM/xJY3w9Cdc6gPebWLQXkU6V6g/a0cxc5lQROpkgYvSMk
   fROk1lCFQWSuS+KPgFjAm2XylyMvf5d3cnsacSdptO7gEIHaEeNVoGB5I
   ENDu9xxYGjLAYrUoJlFa+kGKRMukcgZFmItXaZKqyMZmrKISBXP1EpSFa
   A==;
X-CSE-ConnectionGUID: JZSkdYfpSGiv7fLK4TN9rA==
X-CSE-MsgGUID: AM7bxuGfSc2Gs+al8DE32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29346788"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29346788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 00:57:38 -0700
X-CSE-ConnectionGUID: 6Z7rsDFSRAmfVFly3GDwzA==
X-CSE-MsgGUID: h15vvpNNTj2LHMIPzrTZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80049525"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 00:57:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3WFJ-000UdK-1t;
	Wed, 23 Oct 2024 07:57:33 +0000
Date: Wed, 23 Oct 2024 15:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 10/21] kernel/trace/ftrace.c:6149:
 warning: Function parameter or struct member 'hash' not described in
 'modify_ftrace_direct_nolock_hash'
Message-ID: <202410231555.ZGW6mgh1-lkp@intel.com>
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
commit: 981740a59cbb2e997c7cb9a640ef5e8a1d4fe471 [10/21] ftrace: Add modify_ftrace_direct_[nolock_]hash function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231555.ZGW6mgh1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231555.ZGW6mgh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231555.ZGW6mgh1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:5887: warning: Function parameter or struct member 'hash' not described in 'register_ftrace_direct_hash'
   kernel/trace/ftrace.c:5887: warning: expecting prototype for register_ftrace_direct(). Prototype was for register_ftrace_direct_hash() instead
   kernel/trace/ftrace.c:6001: warning: Function parameter or struct member 'hash' not described in 'unregister_ftrace_direct_hash'
   kernel/trace/ftrace.c:6001: warning: expecting prototype for unregister_ftrace_direct(). Prototype was for unregister_ftrace_direct_hash() instead
>> kernel/trace/ftrace.c:6149: warning: Function parameter or struct member 'hash' not described in 'modify_ftrace_direct_nolock_hash'
>> kernel/trace/ftrace.c:6149: warning: expecting prototype for modify_ftrace_direct_nolock(). Prototype was for modify_ftrace_direct_nolock_hash() instead
>> kernel/trace/ftrace.c:6197: warning: Function parameter or struct member 'hash' not described in 'modify_ftrace_direct_hash'
>> kernel/trace/ftrace.c:6197: warning: expecting prototype for modify_ftrace_direct(). Prototype was for modify_ftrace_direct_hash() instead


vim +6149 kernel/trace/ftrace.c

f96f644ab97abe Song Liu       2022-07-19  6128  
f96f644ab97abe Song Liu       2022-07-19  6129  /**
da8bdfbd422333 Florent Revest 2023-03-21  6130   * modify_ftrace_direct_nolock - Modify an existing direct 'multi' call
f96f644ab97abe Song Liu       2022-07-19  6131   * to call something else
f96f644ab97abe Song Liu       2022-07-19  6132   * @ops: The address of the struct ftrace_ops object
c488fe4b50d896 Jiri Olsa      2024-09-30  6133   * @ip: The address of the function to attach
f96f644ab97abe Song Liu       2022-07-19  6134   * @addr: The address of the new trampoline to call at @ops functions
f96f644ab97abe Song Liu       2022-07-19  6135   *
f96f644ab97abe Song Liu       2022-07-19  6136   * This is used to unregister currently registered direct caller and
f96f644ab97abe Song Liu       2022-07-19  6137   * register new one @addr on functions registered in @ops object.
f96f644ab97abe Song Liu       2022-07-19  6138   *
f96f644ab97abe Song Liu       2022-07-19  6139   * Note there's window between ftrace_shutdown and ftrace_startup calls
f96f644ab97abe Song Liu       2022-07-19  6140   * where there will be no callbacks called.
f96f644ab97abe Song Liu       2022-07-19  6141   *
f96f644ab97abe Song Liu       2022-07-19  6142   * Caller should already have direct_mutex locked, so we don't lock
f96f644ab97abe Song Liu       2022-07-19  6143   * direct_mutex here.
f96f644ab97abe Song Liu       2022-07-19  6144   *
f96f644ab97abe Song Liu       2022-07-19  6145   * Returns: zero on success. Non zero on error, which includes:
f96f644ab97abe Song Liu       2022-07-19  6146   *  -EINVAL - The @ops object was not properly registered.
f96f644ab97abe Song Liu       2022-07-19  6147   */
981740a59cbb2e Jiri Olsa      2024-10-15  6148  int modify_ftrace_direct_nolock_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
f96f644ab97abe Song Liu       2022-07-19 @6149  {
f96f644ab97abe Song Liu       2022-07-19  6150  	if (check_direct_multi(ops))
f96f644ab97abe Song Liu       2022-07-19  6151  		return -EINVAL;
f96f644ab97abe Song Liu       2022-07-19  6152  	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
f96f644ab97abe Song Liu       2022-07-19  6153  		return -EINVAL;
c488fe4b50d896 Jiri Olsa      2024-09-30  6154  	if (direct_functions == EMPTY_HASH)
c488fe4b50d896 Jiri Olsa      2024-09-30  6155  		return -EINVAL;
f96f644ab97abe Song Liu       2022-07-19  6156  
981740a59cbb2e Jiri Olsa      2024-10-15  6157  	return __modify_ftrace_direct(ops, hash);
f96f644ab97abe Song Liu       2022-07-19  6158  }
da8bdfbd422333 Florent Revest 2023-03-21  6159  EXPORT_SYMBOL_GPL(modify_ftrace_direct_nolock);
f96f644ab97abe Song Liu       2022-07-19  6160  
981740a59cbb2e Jiri Olsa      2024-10-15  6161  int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long ip, unsigned long addr)
981740a59cbb2e Jiri Olsa      2024-10-15  6162  {
981740a59cbb2e Jiri Olsa      2024-10-15  6163  	struct ftrace_hash *hash;
981740a59cbb2e Jiri Olsa      2024-10-15  6164  	int err = -EINVAL;
981740a59cbb2e Jiri Olsa      2024-10-15  6165  
981740a59cbb2e Jiri Olsa      2024-10-15  6166  	hash = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
981740a59cbb2e Jiri Olsa      2024-10-15  6167  	if (!hash)
981740a59cbb2e Jiri Olsa      2024-10-15  6168  		return -ENOMEM;
981740a59cbb2e Jiri Olsa      2024-10-15  6169  
981740a59cbb2e Jiri Olsa      2024-10-15  6170  	if (add_hash_entry_direct(hash, ip, addr) == NULL)
981740a59cbb2e Jiri Olsa      2024-10-15  6171  		goto free_hash;
981740a59cbb2e Jiri Olsa      2024-10-15  6172  
981740a59cbb2e Jiri Olsa      2024-10-15  6173  	err = modify_ftrace_direct_nolock_hash(ops, hash);
981740a59cbb2e Jiri Olsa      2024-10-15  6174  
981740a59cbb2e Jiri Olsa      2024-10-15  6175   free_hash:
981740a59cbb2e Jiri Olsa      2024-10-15  6176  	free_ftrace_hash(hash);
981740a59cbb2e Jiri Olsa      2024-10-15  6177  	return err;
981740a59cbb2e Jiri Olsa      2024-10-15  6178  }
981740a59cbb2e Jiri Olsa      2024-10-15  6179  
f96f644ab97abe Song Liu       2022-07-19  6180  /**
da8bdfbd422333 Florent Revest 2023-03-21  6181   * modify_ftrace_direct - Modify an existing direct 'multi' call
f96f644ab97abe Song Liu       2022-07-19  6182   * to call something else
f96f644ab97abe Song Liu       2022-07-19  6183   * @ops: The address of the struct ftrace_ops object
c488fe4b50d896 Jiri Olsa      2024-09-30  6184   * @ip: The address of the function to attach
f96f644ab97abe Song Liu       2022-07-19  6185   * @addr: The address of the new trampoline to call at @ops functions
f96f644ab97abe Song Liu       2022-07-19  6186   *
f96f644ab97abe Song Liu       2022-07-19  6187   * This is used to unregister currently registered direct caller and
f96f644ab97abe Song Liu       2022-07-19  6188   * register new one @addr on functions registered in @ops object.
f96f644ab97abe Song Liu       2022-07-19  6189   *
f96f644ab97abe Song Liu       2022-07-19  6190   * Note there's window between ftrace_shutdown and ftrace_startup calls
f96f644ab97abe Song Liu       2022-07-19  6191   * where there will be no callbacks called.
f96f644ab97abe Song Liu       2022-07-19  6192   *
f96f644ab97abe Song Liu       2022-07-19  6193   * Returns: zero on success. Non zero on error, which includes:
f96f644ab97abe Song Liu       2022-07-19  6194   *  -EINVAL - The @ops object was not properly registered.
f96f644ab97abe Song Liu       2022-07-19  6195   */
981740a59cbb2e Jiri Olsa      2024-10-15  6196  int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
f96f644ab97abe Song Liu       2022-07-19 @6197  {
f96f644ab97abe Song Liu       2022-07-19  6198  	int err;
f96f644ab97abe Song Liu       2022-07-19  6199  
f96f644ab97abe Song Liu       2022-07-19  6200  	if (check_direct_multi(ops))
f96f644ab97abe Song Liu       2022-07-19  6201  		return -EINVAL;
f96f644ab97abe Song Liu       2022-07-19  6202  	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
f96f644ab97abe Song Liu       2022-07-19  6203  		return -EINVAL;
c488fe4b50d896 Jiri Olsa      2024-09-30  6204  	if (direct_functions == EMPTY_HASH)
c488fe4b50d896 Jiri Olsa      2024-09-30  6205  		return -EINVAL;
f96f644ab97abe Song Liu       2022-07-19  6206  
f96f644ab97abe Song Liu       2022-07-19  6207  	mutex_lock(&direct_mutex);
981740a59cbb2e Jiri Olsa      2024-10-15  6208  	err = __modify_ftrace_direct(ops, hash);
ccf5a89efd6f0a Jiri Olsa      2021-10-08  6209  	mutex_unlock(&direct_mutex);
ccf5a89efd6f0a Jiri Olsa      2021-10-08  6210  	return err;
ccf5a89efd6f0a Jiri Olsa      2021-10-08  6211  }
da8bdfbd422333 Florent Revest 2023-03-21  6212  EXPORT_SYMBOL_GPL(modify_ftrace_direct);
981740a59cbb2e Jiri Olsa      2024-10-15  6213  

:::::: The code at line 6149 was first introduced by commit
:::::: f96f644ab97abeed3f7007c953836a574ce928cc ftrace: Add modify_ftrace_direct_multi_nolock

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
