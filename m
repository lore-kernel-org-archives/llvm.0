Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37372286410;
	Tue, 30 Sep 2025 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759268135; cv=none; b=RKHeKf+ewrF36CT5H6INTQ1buiOcyA3dNilZ6XM/wmfXEXd/djEpaR3UNdnLIvmW6q39o4LwTx1725cQsUI4+FMZyb0pSlLAAenUKHPTelyI2haeGHbciDOZtoL7+AsinP2MISIE88b742yrjKF9qriCDQdcAxdAgA5jUjHiEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759268135; c=relaxed/simple;
	bh=RfxvIQ2IIjOYF/yOkpjAbzyqM/+6UbRiDfs+6VqpULg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHJ9YEiWhmbpkEtx5E387qvxXAlYq4QKDVeBJjBGbfb/Oj6LpXTECEARtHS6wFvGLdNe7hW8wXdUTQR7vZiiMavOUSVFuOPHeuwj1fqsUWV8EeC47J2Lv/Dkx59VGvXuweG70i6QEiWHcZlWfMclLPEIWa7t5DQK7TBcQuZJiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4BylNhz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4BylNhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759268133; x=1790804133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RfxvIQ2IIjOYF/yOkpjAbzyqM/+6UbRiDfs+6VqpULg=;
  b=P4BylNhzWj3Vt4j8jDf0/Af6S+KFe3b7i5QnfQVZA6MtIpiP0mJvwrd/
   BEJr0OU4GqJf8wkLoqp/D/ISo8xlJymjaWNZoD5Y44xpeheDbfV3EUtgd
   NTGOijXYBqT1p7rQ6tDdv4yiXFErfbYyboTJa73mFnXFY+smi0CX4fXiv
   hmUHPCbQaqLmZ/hqGyvEuspAGB5R4cpNpD17BnJxN3kD+YJxV6FyNy9nl
   fPpLhjWHxUiHHrktHXbUksHmpiXg23VAJQjEG+JJc+rUOl9460ghxHTxY
   nKi/jCOy1I4Ex2H5kYzAzBKg87OVgJvVUNpCOjXj/ajM77heeoG8W9jY8
   w==;
X-CSE-ConnectionGUID: Ml/639dWSKWDHx/2G7blPg==
X-CSE-MsgGUID: DNzW5WLxTh+rCp8ITrmgJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61450692"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61450692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 14:35:32 -0700
X-CSE-ConnectionGUID: F+mHdus0TC2UXq9ufGhaAA==
X-CSE-MsgGUID: dfZT7NufSsSH18/gkZAICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="209338694"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2025 14:35:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3i0O-000000006M1-0J46;
	Tue, 30 Sep 2025 21:35:28 +0000
Date: Tue, 30 Sep 2025 23:34:56 +0200
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/gmem_inplace 25/26]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:169:26: error: expected ';'
 after return statement
Message-ID: <202509302340.SwFSXu1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   7b78235a3c713211742f3296322be1419f79d575
commit: 74a7ef30a7ca775cdec44541c66c45b170d8ba80 [25/26] KVM: guest_memfd: Skip LRU for guest_memfd folios
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250930/202509302340.SwFSXu1t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509302340.SwFSXu1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509302340.SwFSXu1t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:169:26: error: expected ';' after return statement
     169 |                 return ERR_PTR(-ENOMEM)
         |                                        ^
         |                                        ;
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:172:6: error: use of undeclared identifier 'err'
     172 |         if (err)
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:177:2: error: use of undeclared identifier 'err'
     177 |         err = __filemap_add_folio(mapping, folio, index, gfp, NULL);
         |         ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:178:6: error: use of undeclared identifier 'err'
     178 |         if (err) {
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:187:17: error: use of undeclared identifier 'err'
     187 |         return ERR_PTR(err);
         |                        ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:200:1: error: function definition is not allowed here
     200 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:226:1: error: function definition is not allowed here
     226 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:266:1: error: function definition is not allowed here
     266 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:277:1: error: function definition is not allowed here
     277 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:303:1: error: function definition is not allowed here
     303 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:351:1: error: function definition is not allowed here
     351 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:374:1: error: function definition is not allowed here
     374 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:423:1: error: function definition is not allowed here
     423 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:433:1: error: function definition is not allowed here
     433 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:438:1: error: function definition is not allowed here
     438 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:483:1: error: function definition is not allowed here
     483 | {
         | ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:491:1: error: function definition is not allowed here
     491 | {
         | ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:508:12: error: use of undeclared identifier 'kvm_gmem_fault_user_mapping'
     508 |         .fault          = kvm_gmem_fault_user_mapping,
         |                           ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:510:16: error: use of undeclared identifier 'kvm_gmem_get_policy'
     510 |         .get_policy     = kvm_gmem_get_policy,
         |                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +169 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   155	
   156	static struct folio *__kvm_gmem_get_folio(struct address_space *mapping,
   157						  pgoff_t index,
   158						  struct mempolicy *policy)
   159	{
   160		const gfp_t gfp = mapping_gfp_mask(mapping);
   161		struct folio *folio;
   162	
   163		folio = filemap_lock_folio(mapping, index);
   164		if (!IS_ERR(folio))
   165			return folio;
   166	
   167		folio = filemap_alloc_folio(gfp, 0, policy);
   168		if (!folio) {
 > 169			return ERR_PTR(-ENOMEM)
   170	
   171		err = mem_cgroup_charge(folio, NULL, gfp, false);
 > 172		if (err)
   173			goto err_put;
   174	
   175		__folio_set_locked(folio);
   176	
   177		err = __filemap_add_folio(mapping, folio, index, gfp, NULL);
   178		if (err) {
   179			__folio_clear_locked(folio);
   180			goto err_put;
   181		}
   182	
   183		return folio;
   184	
   185	err_put:
   186		folio_put(folio);
   187		return ERR_PTR(err);
   188	}
   189	
   190	/*
   191	 * Returns a locked folio on success.  The caller is responsible for
   192	 * setting the up-to-date flag before the memory is mapped into the guest.
   193	 * There is no backing storage for the memory, so the folio will remain
   194	 * up-to-date until it's removed.
   195	 *
   196	 * Ignore accessed, referenced, and dirty flags.  The memory is
   197	 * unevictable and there is no storage to write back to.
   198	 */
   199	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 > 200	{
   201		/* TODO: Support huge pages. */
   202		struct address_space *mapping = inode->i_mapping;
   203		struct mempolicy *policy;
   204		struct folio *folio;
   205	
   206		/*
   207		 * Fast-path: See if folio is already present in mapping to avoid
   208		 * policy_lookup.
   209		 */
   210		folio = filemap_lock_folio(mapping, index);
   211		if (!IS_ERR(folio))
   212			return folio;
   213	
   214		policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
   215	
   216		do {
   217			folio = __kvm_gmem_get_folio(mapping, index, policy);
   218		} while (IS_ERR(folio) && PTR_ERR(folio) == -EEXIST);
   219	
   220		mpol_cond_put(policy);
   221		return folio;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
