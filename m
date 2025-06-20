Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453022BD5B9;
	Fri, 20 Jun 2025 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431992; cv=none; b=A++DY4x2qCQux0cwq40MLj7Xd3rN20H5plIGS7ap22P2uBb+4lNeQk5uUguxbMlsuFr+ECmFGclXIsEnnVvt/OrD8j9bYY/Ak+ogbnLqR6CPYpU95LQnIWXVWDLDQ1qAIcO9ZkzTzW6QTGQ3cZQPjCzk5F7X7xDk8QW3zr+t+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431992; c=relaxed/simple;
	bh=a9uONM4rmhKbrAIwRb95wqPMGmRhgJxYw5gTK3ykaoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXCe7Xi+m3Qx6aZLNYnJCwDhKN25v6rNcjLreehwXH+H9ALT8VISeBcwBrNYM/lGdagEQ2yOBAA50w1v9sGtu/yJWkTIY09tbRv1IxQGABAgr9EiCjwwYQl/vj+I0mZtZR5gjn7WpsxDLrZ4Wbr9eWOeVNo118miwBkvVFdZjDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilHY2Nks; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilHY2Nks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750431990; x=1781967990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a9uONM4rmhKbrAIwRb95wqPMGmRhgJxYw5gTK3ykaoI=;
  b=ilHY2NksO5+YtZZWaw/zsVeysVqBA+rkf/4nIP1fomY7TRhnhCFht2tA
   eMRzsIfQjoRkbtHGZMovPA6IMNXmhm40Gp84r7LFBGZonL3mp1V+XRY2y
   dZULU/Ml/0e1dGyjIKRlIPKO/LyrU474tND5oGL5S8nnjE7rf/zqSx++A
   soakHTAONA8hKV4X0SHZ6iDnTZU17+eyces5M0RwPvcKLnFuFsuXzSd4C
   yPfKbmwOp58GIH/Lx+ztjPUrpT6Ab8v2L1JZV2AwRCCu1mQ24R46VWwG1
   FPBHRZziE2dFnTIAvXotEgShV3bewJ/TfzKTcOMtR5+VgKFq+Y7GCxAKe
   A==;
X-CSE-ConnectionGUID: 3ZyNOySIQdOQ7+AJQYCigQ==
X-CSE-MsgGUID: LVJor87cRkexA4bXEG1sjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78105417"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="78105417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:06:30 -0700
X-CSE-ConnectionGUID: rhj41lQnSvyZT0GM2PeTIw==
X-CSE-MsgGUID: C2IPd0U1Rf+oxQhMobxk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156426660"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2025 08:06:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSdJy-000Lrq-2Z;
	Fri, 20 Jun 2025 15:06:26 +0000
Date: Fri, 20 Jun 2025 23:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
Message-ID: <202506202236.iXeBHAH3-lkp@intel.com>
References: <20250619200442.1694583-6-riel@surriel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200442.1694583-6-riel@surriel.com>

Hi Rik,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/mm peterz-queue/sched/core linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-Introduce-Remote-Action-Request-MSRs/20250620-081542
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250619200442.1694583-6-riel%40surriel.com
patch subject: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
config: i386-buildonly-randconfig-002-20250620 (https://download.01.org/0day-ci/archive/20250620/202506202236.iXeBHAH3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202236.iXeBHAH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202236.iXeBHAH3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rar_boot_cpu_init
   >>> referenced by intel.c
   >>>               arch/x86/kernel/cpu/intel.o:(intel_detect_tlb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
