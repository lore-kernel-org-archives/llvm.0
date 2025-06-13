Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24D2AD04;
	Fri, 13 Jun 2025 00:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749774558; cv=none; b=bJycNWSeWegRk6SW3r2/awxZh7LxCKaY+b7lNVmzA4irZ32+yCYvgImCqIEm9QdqLIjfBnLFyQQIYWRVGN3uuW9wNOrR7cv76IVjn7bHydSMPHu9NqNfUWPWFhmNwcIOEuLOoJMrd6N6lDL+fBXxrb9RdVxGdVURE3LqFjSrkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749774558; c=relaxed/simple;
	bh=sUoBP6UyyYZWs8Y7cDqZrmnUCf1FshoJgzGR6g1rjGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4pykvig05psSRFlALG0v1JdBDKOS6ZKBVfJIB9/lxV5jWJk4hNzPpM612gGwTCAV4lnVMUywMCKlfrooMqPcld0mUmneYVa3FSvO+Gyhx8yAKXGJxeGOj/HNBhH52s8Uq7/n2vGJ9fTrpwL7AFFvNYSoQQ2BbZo2hUwko1xMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoY9g7KV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoY9g7KV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749774557; x=1781310557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sUoBP6UyyYZWs8Y7cDqZrmnUCf1FshoJgzGR6g1rjGU=;
  b=SoY9g7KVus19a9D4KeR6xTXnJ/Gu9jlZx18jg6rKjGXiZ6iw5pK+Z/uI
   h0c6bP0hvhQQeHqRpxrHqoYAvuA8tJd9cq77IuYW9Dyle7lCpF2bmNbM7
   0uku2/WQqMaz5ChPf80+gKKYERD7eG5KJlNUATfubVIn7HXk1gFdhViaB
   ri59RU8VLuOm0wNueEcirC2lG3JsCn52CPawmRtGACiZViOK8cLotcU+M
   05K2uW7mWqQVtMxZUdFtMPdbSUTJm2TD/m8EhzEaTVpY+9Bq3F09+T5QU
   OTm0hMVtxsEJRwPwC+Cf5WmJTrTTglYearRVgOI+SNsziUsRW1j4mdP0a
   A==;
X-CSE-ConnectionGUID: gQz9inZEQxCQ9C1n/HNSTg==
X-CSE-MsgGUID: sfjHGG6XR9yF0CKEgBavNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63331334"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="63331334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:29:16 -0700
X-CSE-ConnectionGUID: slmO81qfSJ+G2olY3rpewQ==
X-CSE-MsgGUID: V00vUppaQ0issEkSV4FTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147657927"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jun 2025 17:29:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPsIC-000C3O-1m;
	Fri, 13 Jun 2025 00:29:12 +0000
Date: Fri, 13 Jun 2025 08:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:testme 7/9] arch/x86/mm/tlb.c:308:23: warning: result
 of comparison of constant -1 with expression of type 'u16' (aka 'unsigned
 short') is always true
Message-ID: <202506130820.oi9U3KYH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git testme
head:   733c4f3de1b68afd5fad839dbcd1806a3d29e1e0
commit: bb1b4a810e5639c9d98aabc03375eeb1d8a88b57 [7/9] NR_GLOBAL_ASIDS
config: i386-buildonly-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130820.oi9U3KYH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130820.oi9U3KYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130820.oi9U3KYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/tlb.c:311:46: error: use of undeclared identifier 'MAX_GLOBAL_ASID'
     311 |         asid = find_next_zero_bit(global_asid_used, MAX_GLOBAL_ASID, last_global_asid);
         |                                                     ^
   arch/x86/mm/tlb.c:313:30: warning: & has lower precedence than >=; >= will be evaluated first [-Wparentheses]
     313 |         if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~^
   arch/x86/mm/tlb.c:313:30: note: place parentheses around the '>=' expression to silence this warning
     313 |         if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
         |                                     ^
         |             (                      )
   arch/x86/mm/tlb.c:313:30: note: place parentheses around the & expression to evaluate it first
     313 |         if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
         |                                     ^                       
         |                     (                                       )
   arch/x86/mm/tlb.c:313:14: error: use of undeclared identifier 'MAX_GLOBAL_ASID'
     313 |         if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
         |                     ^
>> arch/x86/mm/tlb.c:308:23: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     308 |         if (last_global_asid >= HIGHEST_GLOBAL_ASID)
         |             ~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +308 arch/x86/mm/tlb.c

   300	
   301	static u16 allocate_global_asid(void)
   302	{
   303		u16 asid;
   304	
   305		lockdep_assert_held(&global_asid_lock);
   306	
   307		/* The previous allocation hit the edge of available address space */
 > 308		if (last_global_asid >= HIGHEST_GLOBAL_ASID)
   309			reset_global_asid_space();
   310	
   311		asid = find_next_zero_bit(global_asid_used, MAX_GLOBAL_ASID, last_global_asid);
   312	
   313		if (asid >= MAX_GLOBAL_ASID & !global_asid_available) {
   314			/* This should never happen. */
   315			VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
   316					global_asid_available);
   317			return 0;
   318		}
   319	
   320		/* Claim this global ASID. */
   321		__set_bit(asid, global_asid_used);
   322		last_global_asid = asid;
   323		global_asid_available--;
   324		return asid;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
