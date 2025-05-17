Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152651F181F;
	Sat, 17 May 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491706; cv=none; b=fRpMrrf4YsPLTiOySO7Kk8dOs0tSjo/Y2FMfe4NRhjtH+NqFdndyU/nHh4vNfHBanaRAP7S4xMWmPzyUouTovOWdpBcMA/sqB3ESnm/NFGF732dFnbFiC6B+0ZfFUnkWSiGSi/NRxzepavAEGanNN5ONwZM/9eK0sEA8eX3afy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491706; c=relaxed/simple;
	bh=9leiPeZIa4vPhq0f2gDx3Y0sSzQI09KZY9Ls62CbR+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPX5WTXYno750zXJhZvZagCUCmCwzJmuDIVThpuAQGzc13+TIOU7rZsnbkbiahZzoawwz6Up3dNLEEHBhSPgRTyF3v5hhImkmy/9y1xGG6aBZ6m3EH7dn4vEyt489BmdzDCR5zKh/UKGPDvN4vpWtv+YpgJ+3vTOAJdqzo9PhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACLkp0Bp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACLkp0Bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747491705; x=1779027705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9leiPeZIa4vPhq0f2gDx3Y0sSzQI09KZY9Ls62CbR+k=;
  b=ACLkp0BpYZnv6Tt97RP6BAH2qdTy8/escKnAp8NKMYYp8cP0ZMdpMsnz
   IyWTjV1KRDK2T9RlXDFTh0Hy9/PGMMayP/O4FHPGnn38sJyemZzmftGfg
   YbbvLohnRj0fFsmxCGNwyd/C0ekfWCs0A3kae6a9fB/ko2KZu1Z6SGs/n
   qXYn1Rm3EXTSc/TNVNaxi9qaKIx8BOok4vSulyeQNNskrs96l5NeV3xpD
   pxTI3fpGt7TboMgxqA/cu3o4plvFW3R/rQzVJk1IkfoVToetuHy3YKRBj
   er9v4tpL5MWd/xci4r/Nheq3z6+ujYcuHYaRBIyV+oTA+DKGI1sI7HI/k
   g==;
X-CSE-ConnectionGUID: YCcw9D68SfmIp7AK7Fp4jA==
X-CSE-MsgGUID: 60C8zeFdSeGIOpR3fIgvfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49377823"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="49377823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 07:21:44 -0700
X-CSE-ConnectionGUID: bpcq+TdCRNCPJ09gvYN0Kw==
X-CSE-MsgGUID: JV57oDTETWORM2dTX86Ceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="138874383"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2025 07:21:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGIQ1-000KAa-0q;
	Sat, 17 May 2025 14:21:41 +0000
Date: Sat, 17 May 2025 22:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mediated_pmu 66/109] arch/x86/kvm/svm/svm.c:149:15:
 error: static assertion failed due to requirement '(sizeof
 (direct_access_msrs) / sizeof ((direct_access_msrs)[0]) +
 ((int)sizeof(struct (unnamed at arch/x86/kvm/svm/svm.c:149:1)))) == 47':
 ARRAY_SIZE(direct_access_msrs) == ...
Message-ID: <202505172232.LdWP0Wjp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   4cc8b36f2f60e45223b6ad98c22b31dec0d65022
commit: 2f97b58b68724b4ed0c528535d29d58ee0d695f4 [66/109] KVM: SVM: Use ARRAY_SIZE() to iterate over direct_access_msrs
config: i386-buildonly-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505172232.LdWP0Wjp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505172232.LdWP0Wjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505172232.LdWP0Wjp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:149:15: error: static assertion failed due to requirement '(sizeof (direct_access_msrs) / sizeof ((direct_access_msrs)[0]) + ((int)sizeof(struct (unnamed at arch/x86/kvm/svm/svm.c:149:1)))) == 47': ARRAY_SIZE(direct_access_msrs) == MAX_DIRECT_ACCESS_MSRS
     149 | static_assert(ARRAY_SIZE(direct_access_msrs) == MAX_DIRECT_ACCESS_MSRS);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:25: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/svm/svm.c:149:46: note: expression evaluates to '41 == 47'
     149 | static_assert(ARRAY_SIZE(direct_access_msrs) == MAX_DIRECT_ACCESS_MSRS);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +149 arch/x86/kvm/svm/svm.c

   148	
 > 149	static_assert(ARRAY_SIZE(direct_access_msrs) == MAX_DIRECT_ACCESS_MSRS);
   150	#undef MAX_DIRECT_ACCESS_MSRS
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
