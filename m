Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF01DDC22;
	Thu, 17 Oct 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729171353; cv=none; b=omG5wDlFdKxCDvWi/8U/UnCl/HFEygyWtZU43pdm+bXNuDgcjODSAUr1V4D4/XPmCA6/jlDGeOYhZ+fB9lGzLDbO1DMBE1VsBMFCrvcAFWynhoSh3WYqtqn0B7spvSon6CDBA+/P+/vVLo0XEtqDfgXXheNmJUU2fu/cibJgSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729171353; c=relaxed/simple;
	bh=45iTvW2dP9MKnjDQp7mUsRsXZ8PTM299CRt8UGVh6dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9PQpLQo6KmhwQX/kZ49OXRT+Qu5K/FFeWtjGKBXgAE0ZIC0BVe+d6sDp5GcI4t6vJ75a3NaFb32KUNBfp+/h6fzdwe4L0Ff8OoIAF7UM6/HiDoGW0HFUSVI/viAIxd/pS3FsxYQz9usdWVD1x5ksldCbYgl80OovOrTNRiW5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+06ZtEQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+06ZtEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729171350; x=1760707350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=45iTvW2dP9MKnjDQp7mUsRsXZ8PTM299CRt8UGVh6dc=;
  b=Y+06ZtEQ6dd9pzgbNOdUUhQRGSSLeT8LvVsb9yjddXyzBnpWeSUjv9Xc
   il7ZXy06kJdVT6UfaMmI6Kf/PmGs4x5S7YQ0Kl8aLM3LUwhSj/TDLqt1Y
   QU9pgPc/F49uyGDXqAU+IS+in0Y4NGWFOl7CuYbReGpvXUtsORVuOzcGt
   JYlma8mPbLWus/O46CTP6H5R30Kieq4sVm8rspo5vm2Dqq3DQoJxvqBvj
   eCECI4XNSAIvXsTgoYs8g6vCO+rrAjNq5B4Zj1W8dakRsUNktJdKHOQEd
   bFQmEd/fqOHLOPHXvhKidXb2nS5LkQMmfpw1KaZChX9Bn2d9ya7WHTWEt
   Q==;
X-CSE-ConnectionGUID: sDDYA/gCSQiC3I1TNQlsfg==
X-CSE-MsgGUID: IiZwwZhpSLOxX+fJjPz0Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="54069266"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="54069266"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:22:27 -0700
X-CSE-ConnectionGUID: LrSZgGBtS4Kp7SfSpeBvZA==
X-CSE-MsgGUID: wDHFXdEuRNSG+4FDqS+rJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78689342"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2024 06:22:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1QSM-000MOD-25;
	Thu, 17 Oct 2024 13:22:22 +0000
Date: Thu, 17 Oct 2024 21:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.file 3/3] fs/file.c:86: warning: Function
 parameter or struct member 'cnt' not described in '__file_ref_put'
Message-ID: <202410172117.cBYQGs00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.file
head:   e7aacb8102608f8026fb8cf145141460834bfac2
commit: 51b75c2e26e2f265788b5408290b015413ab2ff7 [3/3] file_ref_t: allow for valid race
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241017/202410172117.cBYQGs00-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410172117.cBYQGs00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410172117.cBYQGs00-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/file.c:86: warning: Function parameter or struct member 'cnt' not described in '__file_ref_put'


vim +86 fs/file.c

bef236c3c0fea5 Christian Brauner 2024-10-07   68  
bef236c3c0fea5 Christian Brauner 2024-10-07   69  /**
bef236c3c0fea5 Christian Brauner 2024-10-07   70   * __file_ref_put - Slowpath of file_ref_put()
bef236c3c0fea5 Christian Brauner 2024-10-07   71   * @ref:	Pointer to the reference count
bef236c3c0fea5 Christian Brauner 2024-10-07   72   *
bef236c3c0fea5 Christian Brauner 2024-10-07   73   * Invoked when the reference count is outside of the valid zone.
bef236c3c0fea5 Christian Brauner 2024-10-07   74   *
bef236c3c0fea5 Christian Brauner 2024-10-07   75   * Return:
bef236c3c0fea5 Christian Brauner 2024-10-07   76   *	True if this was the last reference with no future references
bef236c3c0fea5 Christian Brauner 2024-10-07   77   *	possible. This signals the caller that it can safely schedule the
bef236c3c0fea5 Christian Brauner 2024-10-07   78   *	object, which is protected by the reference counter, for
bef236c3c0fea5 Christian Brauner 2024-10-07   79   *	deconstruction.
bef236c3c0fea5 Christian Brauner 2024-10-07   80   *
bef236c3c0fea5 Christian Brauner 2024-10-07   81   *	False if there are still active references or the put() raced
bef236c3c0fea5 Christian Brauner 2024-10-07   82   *	with a concurrent get()/put() pair. Caller is not allowed to
bef236c3c0fea5 Christian Brauner 2024-10-07   83   *	deconstruct the protected object.
bef236c3c0fea5 Christian Brauner 2024-10-07   84   */
51b75c2e26e2f2 Christian Brauner 2024-10-16   85  bool __file_ref_put(file_ref_t *ref, unsigned long cnt)
bef236c3c0fea5 Christian Brauner 2024-10-07  @86  {
bef236c3c0fea5 Christian Brauner 2024-10-07   87  	/* Did this drop the last reference? */
bef236c3c0fea5 Christian Brauner 2024-10-07   88  	if (likely(cnt == FILE_REF_NOREF)) {
bef236c3c0fea5 Christian Brauner 2024-10-07   89  		/*
bef236c3c0fea5 Christian Brauner 2024-10-07   90  		 * Carefully try to set the reference count to FILE_REF_DEAD.
bef236c3c0fea5 Christian Brauner 2024-10-07   91  		 *
bef236c3c0fea5 Christian Brauner 2024-10-07   92  		 * This can fail if a concurrent get() operation has
bef236c3c0fea5 Christian Brauner 2024-10-07   93  		 * elevated it again or the corresponding put() even marked
bef236c3c0fea5 Christian Brauner 2024-10-07   94  		 * it dead already. Both are valid situations and do not
bef236c3c0fea5 Christian Brauner 2024-10-07   95  		 * require a retry. If this fails the caller is not
bef236c3c0fea5 Christian Brauner 2024-10-07   96  		 * allowed to deconstruct the object.
bef236c3c0fea5 Christian Brauner 2024-10-07   97  		 */
bef236c3c0fea5 Christian Brauner 2024-10-07   98  		if (!atomic_long_try_cmpxchg_release(&ref->refcnt, &cnt, FILE_REF_DEAD))
bef236c3c0fea5 Christian Brauner 2024-10-07   99  			return false;
bef236c3c0fea5 Christian Brauner 2024-10-07  100  
bef236c3c0fea5 Christian Brauner 2024-10-07  101  		/*
bef236c3c0fea5 Christian Brauner 2024-10-07  102  		 * The caller can safely schedule the object for
bef236c3c0fea5 Christian Brauner 2024-10-07  103  		 * deconstruction. Provide acquire ordering.
bef236c3c0fea5 Christian Brauner 2024-10-07  104  		 */
bef236c3c0fea5 Christian Brauner 2024-10-07  105  		smp_acquire__after_ctrl_dep();
bef236c3c0fea5 Christian Brauner 2024-10-07  106  		return true;
bef236c3c0fea5 Christian Brauner 2024-10-07  107  	}
bef236c3c0fea5 Christian Brauner 2024-10-07  108  
bef236c3c0fea5 Christian Brauner 2024-10-07  109  	/*
bef236c3c0fea5 Christian Brauner 2024-10-07  110  	 * If the reference count was already in the dead zone, then this
bef236c3c0fea5 Christian Brauner 2024-10-07  111  	 * put() operation is imbalanced. Warn, put the reference count back to
bef236c3c0fea5 Christian Brauner 2024-10-07  112  	 * DEAD and tell the caller to not deconstruct the object.
bef236c3c0fea5 Christian Brauner 2024-10-07  113  	 */
bef236c3c0fea5 Christian Brauner 2024-10-07  114  	if (WARN_ONCE(cnt >= FILE_REF_RELEASED, "imbalanced put on file reference count")) {
bef236c3c0fea5 Christian Brauner 2024-10-07  115  		atomic_long_set(&ref->refcnt, FILE_REF_DEAD);
bef236c3c0fea5 Christian Brauner 2024-10-07  116  		return false;
bef236c3c0fea5 Christian Brauner 2024-10-07  117  	}
bef236c3c0fea5 Christian Brauner 2024-10-07  118  
bef236c3c0fea5 Christian Brauner 2024-10-07  119  	/*
bef236c3c0fea5 Christian Brauner 2024-10-07  120  	 * This is a put() operation on a saturated refcount. Restore the
bef236c3c0fea5 Christian Brauner 2024-10-07  121  	 * mean saturation value and tell the caller to not deconstruct the
bef236c3c0fea5 Christian Brauner 2024-10-07  122  	 * object.
bef236c3c0fea5 Christian Brauner 2024-10-07  123  	 */
bef236c3c0fea5 Christian Brauner 2024-10-07  124  	if (cnt > FILE_REF_MAXREF)
bef236c3c0fea5 Christian Brauner 2024-10-07  125  		atomic_long_set(&ref->refcnt, FILE_REF_SATURATED);
bef236c3c0fea5 Christian Brauner 2024-10-07  126  	return false;
bef236c3c0fea5 Christian Brauner 2024-10-07  127  }
bef236c3c0fea5 Christian Brauner 2024-10-07  128  EXPORT_SYMBOL_GPL(__file_ref_put);
bef236c3c0fea5 Christian Brauner 2024-10-07  129  

:::::: The code at line 86 was first introduced by commit
:::::: bef236c3c0fea5fc0dce2e729c1482ca9df4d82e fs: add file_ref

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
