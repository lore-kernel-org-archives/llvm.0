Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8F2DCF62;
	Fri,  5 Sep 2025 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073916; cv=none; b=cMVxaFC/TS1rze5Sz91CQwDqu+nOOuJBCvlipZ+6vES94GL7DUWn7+U6LJILGm/+Oh0xSxMfurr4nCnt+1ZcVKhKxHQB1jJc5GK0QPVGY1gNdkjnW+AFAGfm/RujAWX7hb0NsWbc0y2g0RRJhNn5UlkAIPJVvf/+2YTaMEWEO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073916; c=relaxed/simple;
	bh=lJJedU2pVKjVWAYrRDd0oTvgmjeB5BwUvMKl5FUqbVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmkcqQQ/JJyMpMY0WN6gBaXW6o6uNXsYZzkMOyFyP6e1EwONapmGnetaJdHU+9GAwEduyJCbjH3k4HoO1pigWtouMjEe/pCF4Dq2FXTQkdoftwFxRj4qqa3Jpq5BigT2jwQlpKRTU4UaT1BtjDqoyP52oc4Qc/XujC5RCFH29uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of1eii8o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of1eii8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757073915; x=1788609915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJJedU2pVKjVWAYrRDd0oTvgmjeB5BwUvMKl5FUqbVY=;
  b=Of1eii8opBh5Trr1uisafK+8EXitjP6A+UG5KpdZDR6bTzgyAra9JC9l
   bu990uCXjw8icsPK+x/k9oC2+oCBey+i20G4P2+9bKGJzdJzPOjTgX6kW
   mrY/3paXQaEamNFNYza88EoO9F5ZTz/xtQtmloh6ikX5ozZdqA73V0ITD
   DLDr7UEiysa/GCJChEOGPJiFmqvYjZhWkdalwQbjxExMwCN44Ilo0vqf3
   ngEwns0ZbZtY3luqBGwyhSS/Z8Gh3AirK32ZZAe50YQFGDrvBBfaUrEps
   Fj7AdF6Oa228WDmDkE+TP3UTUjECyzjoqlpT7AVEuU10ur7Fjd1VE8qYZ
   Q==;
X-CSE-ConnectionGUID: NG10E9vUTWGowkx76+ihtg==
X-CSE-MsgGUID: V5Qdt9UxR3OjhD1FjcbjXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70800649"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70800649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 05:05:12 -0700
X-CSE-ConnectionGUID: VfKOMlYVTBifb6JJgMVr7w==
X-CSE-MsgGUID: CsJOWelgS/SDl57Z6L06qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172955585"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 05:05:11 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuVBk-0000OF-2R;
	Fri, 05 Sep 2025 12:05:08 +0000
Date: Fri, 5 Sep 2025 20:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: ankita@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 12/14] vfio/nvgrace-egm: Introduce ioctl to share retired
 pages
Message-ID: <202509051947.Vy0zT93N-lkp@intel.com>
References: <20250904040828.319452-13-ankita@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904040828.319452-13-ankita@nvidia.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on linus/master awilliam-vfio/for-linus v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ankita-nvidia-com/vfio-nvgrace-gpu-Expand-module_pci_driver-to-allow-custom-module-init/20250904-121328
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250904040828.319452-13-ankita%40nvidia.com
patch subject: [RFC 12/14] vfio/nvgrace-egm: Introduce ioctl to share retired pages
config: i386-buildonly-randconfig-002-20250905 (https://download.01.org/0day-ci/archive/20250905/202509051947.Vy0zT93N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051947.Vy0zT93N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051947.Vy0zT93N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/egm.h:12:2: error: unknown type name '__aligned_u64'
      12 |         __aligned_u64 offset;
         |         ^
   ./usr/include/linux/egm.h:13:2: error: unknown type name '__aligned_u64'
      13 |         __aligned_u64 size;
         |         ^
>> ./usr/include/linux/egm.h:17:2: error: unknown type name '__u32'
      17 |         __u32 argsz;
         |         ^
   ./usr/include/linux/egm.h:19:2: error: unknown type name '__u32'
      19 |         __u32 count;
         |         ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
