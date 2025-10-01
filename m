Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88B18DB26;
	Wed,  1 Oct 2025 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759278179; cv=none; b=FilIJqrwDnc1NmiH94dymbJYqETfk6T0f9GeLMIf1NnLJZpp2/ND/PpYrmqhMEnya78VVBb9665hW8NfmpVA03jL+BXHMVu3qIbYGxJGWE+RKE0k4niQA5ey3OXWfnWeh55+tbEY84kOP0l5mfxWLJqRoFA/X+Q3KojDnBJFDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759278179; c=relaxed/simple;
	bh=ttZMJ17cT3J1GVhUrSoBwlOzeYW63nL7hvO5wKHbnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5p7CRkEnKk/q2AB26GH3NQ4h3MYcTo1RMfAlPU/0y50O89+M26/Acyej+aKLNBJAYAGsRgGqIA0cpklcjK6dggZn/N+s2L4bPhZuZT5BKawSuuhhJ2unxp+5GlYHb2u67gVAP4UyV2jjZXaPc2ID6tQRwQSp+n6fsVm0VLSpqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7r4Swif; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7r4Swif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759278178; x=1790814178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ttZMJ17cT3J1GVhUrSoBwlOzeYW63nL7hvO5wKHbnbw=;
  b=n7r4SwifhRYj05fd5/Fi//9oAyCmqTuaViukISqYWCTkUJAS424Dn3L4
   Qvn0RxxvqgHOYL+xN4vR7j9auiq6jWlOWuJHLJXgY05g96arnSEXlG0VU
   RTo59Oo6dx9oV08cWErjIJKxVpMf9LuYbjEQxAwO3MtStE6dtSw5cCxYP
   kY7GL92I+ftQ+ve2d9OBDF279xuGKCVOCtkY4AiAJHqHtJQFfq1KPE2hG
   bIqAN/+VF7rAcpdHhby7UjxRs3hXz3tmCstniqtCDf3qUJiyhxj6/tQ2e
   nE65ou5Z3PuKrdMI9ug4PMswxAXyO70wh1CVNpdmXJZqaDgONH4ftH0fj
   g==;
X-CSE-ConnectionGUID: 7iSqnG8aROSEznYwjqqz4A==
X-CSE-MsgGUID: W74+fTtHQ46VSLhPf85fqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="86993104"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="86993104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 17:22:57 -0700
X-CSE-ConnectionGUID: kOQ4ZWHcRIu/QqXwpjakSg==
X-CSE-MsgGUID: BB48GV28QmWEZ6PqUO1N2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="209606684"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2025 17:22:55 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3kcP-0002aN-0R;
	Wed, 01 Oct 2025 00:22:53 +0000
Date: Wed, 1 Oct 2025 08:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/gmem_inplace 25/26]
 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:169:26: error: expected ';'
 after return statement
Message-ID: <202510010847.0QVfAdWU-lkp@intel.com>
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
config: arm64-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20251001/202510010847.0QVfAdWU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010847.0QVfAdWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010847.0QVfAdWU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:169:26: error: expected ';' after return statement
     169 |                 return ERR_PTR(-ENOMEM)
         |                                        ^
         |                                        ;
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:172:6: error: use of undeclared identifier 'err'
     172 |         if (err)
         |             ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:177:2: error: use of undeclared identifier 'err'
     177 |         err = __filemap_add_folio(mapping, folio, index, gfp, NULL);
         |         ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:178:6: error: use of undeclared identifier 'err'
     178 |         if (err) {
         |             ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:187:17: error: use of undeclared identifier 'err'
     187 |         return ERR_PTR(err);
         |                        ^
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:200:1: error: function definition is not allowed here
     200 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:226:1: error: function definition is not allowed here
     226 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:266:1: error: function definition is not allowed here
     266 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:277:1: error: function definition is not allowed here
     277 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:303:1: error: function definition is not allowed here
     303 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:351:1: error: function definition is not allowed here
     351 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:374:1: error: function definition is not allowed here
     374 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:423:1: error: function definition is not allowed here
     423 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:433:1: error: function definition is not allowed here
     433 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:438:1: error: function definition is not allowed here
     438 | {
         | ^
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:508:12: error: use of undeclared identifier 'kvm_gmem_fault_user_mapping'
     508 |         .fault          = kvm_gmem_fault_user_mapping,
         |                           ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:516:1: error: function definition is not allowed here
     516 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:532:1: error: function definition is not allowed here
     532 | {
         | ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:568:1: error: function definition is not allowed here
     568 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +169 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c

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
