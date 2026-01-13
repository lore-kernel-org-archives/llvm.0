Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35535312811;
	Tue, 13 Jan 2026 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294606; cv=none; b=C2SiNFbUYAxL9+9KnQKczGHE8iXZ6UEfQEyZ13PqFq5RSgH0sHcfbz/ZFeTgkW62G80drq9MMz4Sgqq0ASfcvPuQSfhaEef8nBN3uvVNb+O51z/OWpnFT8MkXIAOxTpnAND15apQBDzTuA/C14ZphI6hDxhDZ4Jpx10FRt9oRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294606; c=relaxed/simple;
	bh=VoZ8K+Qh3HPMMc3FiXVccpGnuyA3hzWO2LYr+PyxFck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYEDQL/0gSai2skEqQDAHeQaUtKKYZXDAlSvot/KXC+WPlfQSZL5IQlVTyZ+WQxkMHAHemuG2SnQpIE/e3Lyz8l6LKf3LDYVWOy6oNziTZF8kkiyM7NDpJ8tvItWvSXWtxtW23QUL65BUAPSO/S/sq7kYNNYNEC8lW8k48ocNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlnEMjQg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlnEMjQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294604; x=1799830604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VoZ8K+Qh3HPMMc3FiXVccpGnuyA3hzWO2LYr+PyxFck=;
  b=hlnEMjQgvGSeW2Zv5+z4XNhMs9pBiLpEwGygLlqy+TdvqxPdkr9KUwdt
   e188SOAKiXqZL88FYJRWzh7msA6GvQ6e0889b5wj9DaxPx3Vwb+erTdht
   6LNJYclEjR0UN/JPG2b/Svo3ytkqUe+ARqmGserdXeR2a6MsXZsXcte87
   YwfC1j0mtwHOlPUmN5N75dUnBeQm5CkzNQ1h4IGhHYP4P4J3kp3kHlxIF
   IYY/Dx9aTXkbIzkzqMgAA369uJFlbyTk6O1zgI1+nFiq5CNd0f1htDdKe
   SIFzcDqQ3IEH1I7WHBls8GwIW/0s7Tffh//0ERMrgtzu9lZ9k5ECOoc09
   w==;
X-CSE-ConnectionGUID: 3t5vWyW/TlKnliU0urylig==
X-CSE-MsgGUID: DbFwW8FzSlKKccbvfiIA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69557863"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69557863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:56:43 -0800
X-CSE-ConnectionGUID: Xq0hi+ipTRGDfypKKi+Tmg==
X-CSE-MsgGUID: DG7rfTZSSJ2mqDqAx1Nyhw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 00:56:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaCb-00000000EUy-21D8;
	Tue, 13 Jan 2026 08:56:37 +0000
Date: Tue, 13 Jan 2026 16:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	kas@kernel.org, ardb@kernel.org, akpm@linux-foundation.org,
	david@kernel.org, osalvador@suse.de, thomas.lendacky@amd.com,
	michael.roth@amd.com, prsampat@amd.com
Subject: Re: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <202601131632.NrQzg2Wm-lkp@intel.com>
References: <20260112202300.43546-2-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112202300.43546-2-prsampat@amd.com>

Hi Pratik,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/core linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratik-R-Sampat/mm-memory_hotplug-Add-support-to-accept-memory-during-hot-add/20260113-042631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260112202300.43546-2-prsampat%40amd.com
patch subject: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory during hot-add
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260113/202601131632.NrQzg2Wm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131632.NrQzg2Wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131632.NrQzg2Wm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory_hotplug.c:41:10: fatal error: 'asm/unaccepted_memory.h' file not found
      41 | #include <asm/unaccepted_memory.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +41 mm/memory_hotplug.c

    39	
    40	#include <asm/tlbflush.h>
  > 41	#include <asm/unaccepted_memory.h>
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
