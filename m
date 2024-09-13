Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068618C902;
	Fri, 13 Sep 2024 04:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726201058; cv=none; b=odaxs4o5vKAkwhk8obq3gjMc1uEHd/LAFSB/dzmPrdpgwllBQws6iOctYkS35IwdlM1xUwZe4/b6B1JauzPOsBgASrkqPINMvFA4Mewcw6G20uRXfjesLkh6XUP+VwNUOKjdfZnbv/cNiBYNyAWaAqD/JWccclsYHzCfFV4wbYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726201058; c=relaxed/simple;
	bh=Iz/wKYFc07vTxmqWHCRim+ec7cDlBI3TIq+956XMZek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0aAdQH3ZCi1lael2hzuLlbfNZvlolG1kbWJlg5xNRNRyVaG8rwIbR1x5LmxfArx4rLalZwvzzFlwndCkucae1LApV3L39XmreMPYhcffmW/oF+gMMFXh0c7PJsciHqUiZeGRUOg+Bnxs5cRiK9ujg33/V57R/gAvF4weFT9/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuABr6h6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuABr6h6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726201056; x=1757737056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iz/wKYFc07vTxmqWHCRim+ec7cDlBI3TIq+956XMZek=;
  b=YuABr6h6AczbZDHlX+OmRC8K0KZInAm1UBP0uA2V7dtAzVR0wSMGt1jS
   4YsDDZFcU+3TxFKk2By7RzIebUpYFpPOQF6Rrx8hZyF51SN2jfeDkWF6T
   lHcpbnPBr8B1XAJYC2vmFP7ZNHFEk3VLyskEtmdU/uXCuofsSz7jkc68l
   W3/weeW2Op+ERzgH5JW/U8Vjh33nNIEy/jz+WhZtiXiALMSJSaKh2FX4w
   u87brFxbFsH6uLodiku9x/qQ3YeOdtcMC2msACB7tD/K3RgBjZZwjredb
   xfWYG3rdeBWHdnnBeYQ46EpXsk2HqG2UZJtrw9koz1F3abd4Xf4xEwscF
   A==;
X-CSE-ConnectionGUID: fhfJoWGDRnmxUyr0Lkl+ww==
X-CSE-MsgGUID: V+QkYwMJSvS77A6y8PzEBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24963943"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="24963943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:17:35 -0700
X-CSE-ConnectionGUID: nhEQGOhHTF2nz3TyjNZmNQ==
X-CSE-MsgGUID: LBdf0sc5TyK16MfzUhetkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72730235"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 21:17:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soxkR-0005zs-0U;
	Fri, 13 Sep 2024 04:17:31 +0000
Date: Fri, 13 Sep 2024 12:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] mm: Drop unused set_pte_safe()
Message-ID: <202409131220.CJ5MlGCG-lkp@intel.com>
References: <20240910101026.428808-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910101026.428808-1-anshuman.khandual@arm.com>

Hi Anshuman,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Drop-unused-set_pte_safe/20240910-181151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240910101026.428808-1-anshuman.khandual%40arm.com
patch subject: [PATCH V2] mm: Drop unused set_pte_safe()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240913/202409131220.CJ5MlGCG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131220.CJ5MlGCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131220.CJ5MlGCG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/init_64.c:91:1: error: call to undeclared function 'set_pte_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 | DEFINE_ENTRY(pte, pte, init)
         | ^
   arch/x86/mm/init_64.c:83:3: note: expanded from macro 'DEFINE_ENTRY'
      83 |                 set_##type1##_safe(arg1, arg2);                 \
         |                 ^
   <scratch space>:49:1: note: expanded from here
      49 | set_pte_safe
         | ^
   arch/x86/mm/init_64.c:91:1: note: did you mean 'set_pte_range'?
   arch/x86/mm/init_64.c:83:3: note: expanded from macro 'DEFINE_ENTRY'
      83 |                 set_##type1##_safe(arg1, arg2);                 \
         |                 ^
   <scratch space>:49:1: note: expanded from here
      49 | set_pte_safe
         | ^
   include/linux/mm.h:1331:6: note: 'set_pte_range' declared here
    1331 | void set_pte_range(struct vm_fault *vmf, struct folio *folio,
         |      ^
   1 error generated.


vim +/set_pte_safe +91 arch/x86/mm/init_64.c

eccd906484d1cd Brijesh Singh 2019-04-17  87  
eccd906484d1cd Brijesh Singh 2019-04-17  88  DEFINE_ENTRY(p4d, p4d, init)
eccd906484d1cd Brijesh Singh 2019-04-17  89  DEFINE_ENTRY(pud, pud, init)
eccd906484d1cd Brijesh Singh 2019-04-17  90  DEFINE_ENTRY(pmd, pmd, init)
eccd906484d1cd Brijesh Singh 2019-04-17 @91  DEFINE_ENTRY(pte, pte, init)
eccd906484d1cd Brijesh Singh 2019-04-17  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
