Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028838DF9;
	Tue, 10 Feb 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770709535; cv=none; b=P7tFvSGoL38Sb2W76OuKsGMaYPQ1yfmtn8yhRVxt6K4nL0oP/8tXSIKXqP63bmZktvbUZPvv+clIAJRrUZGjbH3/f4FsePw68MjBxSkqXd9X62tmk0xzZJ55LLaU9drP80jMN15I0hviznUcvkQy3SxLRYVnlI3FRZJDyWWcAP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770709535; c=relaxed/simple;
	bh=sJGjG6kg446tp3EparQy4R1qSHF3uD3BHRcp+JD38W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO5kdls/dakc/7FMA8meuGxcv7nPQliM3oC2chjJMsCMAj35Auryt747ulhIRbgj5y0I/qTU72W41/DW6P3J689Fj9P7pqSx5M2l/gO3ioNZRo/Hpv5sV6h9PlEaZ+FD39WrHEwiADFYqMi4WoV2aoRlSnLyLS1Ll+25Pb+pACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnlxGmC7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnlxGmC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770709532; x=1802245532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sJGjG6kg446tp3EparQy4R1qSHF3uD3BHRcp+JD38W4=;
  b=YnlxGmC7V4aZgHTsAtjz6fEgD6Phcd0yIlTaCdOEMRnCheL3c8ijc2Q9
   u5PdHA/wbtiR7axzpSAFOBhmHy8E3SRRCGX4PAD33jn0C0Jv12xoFYcGI
   3SFEOqscetb3g0SftVe2e5lizDrd/6aVDUC4uWrtcFHMAmVs2IAQJ6BH1
   aKEEJdfcU1ejyR3WcFBsDmMt+yim74AOtP91JKVnJA91CB7M/90jln9os
   7PEMguntCYzeBnL2G7TVK52xwe6PSlKlXTaYch/nvQuu2dhI1LlGNbN+V
   4+VGd5fUpt5zNMpSEi9rUMjT2jjR1zcp5ksXA+zikMHoGor/Emnpew8v7
   w==;
X-CSE-ConnectionGUID: b/x9lJL6RnmKRPkfed2ohQ==
X-CSE-MsgGUID: KQ/6gS6yQ06iDN4d/NqT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59397513"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59397513"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:45:32 -0800
X-CSE-ConnectionGUID: MLtRNXcZQyWsNMJxLg+mhQ==
X-CSE-MsgGUID: 9nFpA0/HRhStRt3vD635+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234797933"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 23:45:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpiR5-00000000omy-1aOM;
	Tue, 10 Feb 2026 07:45:27 +0000
Date: Tue, 10 Feb 2026 15:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org, baolin.wang@linux.alibaba.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com
Subject: Re: [PATCH v2 02/11] mm: introduce pgtable_has_pmd_leaves()
Message-ID: <202602101556.msl493OX-lkp@intel.com>
References: <f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap@redhat.com>

Hi Luiz,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core linus/master v6.19 next-20260209]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Capitulino/docs-tmpfs-remove-implementation-detail-reference/20260210-061806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap%40redhat.com
patch subject: [PATCH v2 02/11] mm: introduce pgtable_has_pmd_leaves()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101556.msl493OX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101556.msl493OX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101556.msl493OX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: init_arch_has_pmd_leaves
   >>> referenced by main.c
   >>>               init/main.o:(start_kernel) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
