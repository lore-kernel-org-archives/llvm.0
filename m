Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38FB3D0D8;
	Sat, 10 Feb 2024 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707569303; cv=none; b=pEdVe40cfE4dRTj15l4o0n9HQUnlbMDdSt7pCgOa+bjpSsHLafbqzFuXMJckGy0qiB6LsHtzRe7eJ/B0ox3m70Txn5OkRDvyDPZD+c5KOtqIaIZ7cKuRU9U0iVtmNVg2YE1axCBDpGxXEKrfeh/empi5AhrdBNSPf3va9xIAs/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707569303; c=relaxed/simple;
	bh=FIRhFSWaJkHSi5euNaEQekJvZSlwmwHv9DA2ItEaa2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYIwZ8G+dwPDYpeNnp0fKkXCpuZ8kfy5SkLEbzAUlCB3C2IjgzIDWqyZYU4864YTOeJVvqsvs0rJZee6+eHJQkhctTZj1iAMKuFFwx+avthoU5r/vx5WxzEettHeGxcrGh7/LW2MovEQlrI301Gucjx8RoSLPLDy86aVUbgb9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP4R4oZA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP4R4oZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707569302; x=1739105302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIRhFSWaJkHSi5euNaEQekJvZSlwmwHv9DA2ItEaa2A=;
  b=LP4R4oZATfQTuZVJn4shC6BrYjcnq+mwurnOYYbprbdCNBUg/slqP+4/
   gCjr8If6oU5jNXfOKg1Zg1/8S9+I3aFlbBM94/aYLC5SBKJSJYpH7yV8X
   2JEQgK8dfw3gk9XdT8YLRza/ZaZaNjgHow5IJo1Y1iZ4SG323dNvZzGir
   Kv24e1B6LFvKpRKw6DTCgsBrowpXvnsiwy1ehOUxjjq7QE7pyi1GbfrX6
   q3OKlMPE6qWDU1SgY8v/ATYT/+CbaspIYCxZunGq9XXWzvPEqVqHWEuZ4
   QZyVJI7a57ihAHYtpZt1O1r/D52StaK4+FXpTon1us1eVZYnF8FqmwnK7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1692934"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1692934"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 04:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934664995"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="934664995"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2024 04:48:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYmmH-0005fA-0v;
	Sat, 10 Feb 2024 12:48:17 +0000
Date: Sat, 10 Feb 2024 20:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/9] shmem: check if a block is uptodate before
 splice into pipe
Message-ID: <202402102036.XUZTIesW-lkp@intel.com>
References: <20240209142901.126894-8-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209142901.126894-8-da.gomez@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.8-rc3 next-20240209]
[cannot apply to vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/splice-don-t-check-for-uptodate-if-partially-uptodate-is-impl/20240209-223226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240209142901.126894-8-da.gomez%40samsung.com
patch subject: [RFC PATCH 7/9] shmem: check if a block is uptodate before splice into pipe
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20240210/202402102036.XUZTIesW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102036.XUZTIesW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102036.XUZTIesW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_moddi3
   >>> referenced by shmem.c
   >>>               mm/shmem.o:(shmem_file_splice_read) in archive vmlinux.a
   >>> referenced by shmem.c
   >>>               mm/shmem.o:(shmem_file_splice_read) in archive vmlinux.a
   >>> did you mean: __hexagon_modsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/modsi3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
