Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE0DDB2;
	Fri, 17 May 2024 05:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715922382; cv=none; b=YCUbF5OeoX880b7Bl5Q1RyiRHCd0JOeX0JG1KMb6z0PqkuMbGrXbMwmbEcs6fGaZfvYYF02vc/gvljWQuTatPmvdwa9+W7hZypdqMn3+5KNKX4umaRVIncHfe6eWa9adOzDmcWpk6AEN2VjAV6Bh2ZJZabX6KtuN4I4jV1Bd4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715922382; c=relaxed/simple;
	bh=iAeXwU+FDcTMei3N8LOX/9KrK4aB9Laf5Ujy5EX2FGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br3HIByTCP/C9RMEGaixhVPvStq+cYmBSeU/wjl8bmUUvt8Rt1CjgNM/3dz/xmWYsOozRKG/LKa0fVWiERxe0a9Kg6HKktYsGdceMTk0eJC5YIqI1/sMDr+NITqhH88CHgBCZhuTeRMHa0e7Qp9ExTi8V+aGtY9iK6z1vMI9FkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftVUVrFX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftVUVrFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715922381; x=1747458381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAeXwU+FDcTMei3N8LOX/9KrK4aB9Laf5Ujy5EX2FGo=;
  b=ftVUVrFXidLZzewYTsBNBwqQIIyTqHzJqQF82lDYqa4AlKEwKSTvS5lv
   FWMoEF5WitFiypsE32o0Od3CwoUlc72HSbuNdc7OF4LggnI7XImvAWksl
   aVLI1CpruHqDaDwR0Gm8o6/Upx6RGHjhyrYaeyPkAawu5mal1WJjY4t3e
   8pcIDNum9cMnOxeeCg/InEiMc1APK+Nnio5cCotiNJ6B91QPc8l4egShs
   FvDjn4B7XLxaYHWdOCbdku8KkcjSPXZ3RKGMyr9H/APNsitfIM0B94Rin
   LQF4nnABDe4scNEMuxmi0q3GCWWdfd5S7KnGaC4m4/MlsA08b27w2zOYj
   Q==;
X-CSE-ConnectionGUID: zeYW0oBNTfqkOYfg5JaSlw==
X-CSE-MsgGUID: 5+0N4xC0Q5qJlQaTZIuXoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34592856"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="34592856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 22:06:20 -0700
X-CSE-ConnectionGUID: g3J3dyehStKB3UGgLDqV9w==
X-CSE-MsgGUID: BfJyx6y1TWCjKfqqpHqoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="69129355"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2024 22:06:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7pmu-0000Eo-2g;
	Fri, 17 May 2024 05:06:03 +0000
Date: Fri, 17 May 2024 12:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	naveen.n.rao@linux.vnet.ibm.com, mhiramat@kernel.org,
	npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH] PowerPC: Replace kretprobe with rethook
Message-ID: <202405171203.CasoixJG-lkp@intel.com>
References: <20240516134646.1059114-1-adubey@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516134646.1059114-1-adubey@linux.ibm.com>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Dubey/PowerPC-Replace-kretprobe-with-rethook/20240516-214818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240516134646.1059114-1-adubey%40linux.ibm.com
patch subject: [PATCH] PowerPC: Replace kretprobe with rethook
config: powerpc-asp8347_defconfig (https://download.01.org/0day-ci/archive/20240517/202405171203.CasoixJG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171203.CasoixJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171203.CasoixJG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_rethook_trampoline
   >>> referenced by stacktrace.c
   >>>               arch/powerpc/kernel/stacktrace.o:(arch_stack_walk_reliable) in archive vmlinux.a
   >>> referenced by stacktrace.c
   >>>               arch/powerpc/kernel/stacktrace.o:(arch_stack_walk_reliable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
