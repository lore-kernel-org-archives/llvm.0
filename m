Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA8199FAC;
	Fri, 29 Nov 2024 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732924392; cv=none; b=q5aQjFS5JrRX3U8uKu8WuzNFP6HRsyc1UVHKx85GlYGDjaEwHziWUZIy3LeFY2BL+ZoLklemk2DDPw20kXuVzmsoIOLsTJmZV2B3CKd+ZQkbvGxYPuNx62+Wv7w43BJK35y+nvv76STrbh8HQwg+KAXKeiKsOLbv3dZERpRKK6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732924392; c=relaxed/simple;
	bh=dMojtd1hKJIh3YUnjd/dXONV6TFdwZwQm6greqURNnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5HqXcGmraAs0WNATnwvFBvXl2B7mRs73JKBiGi/4CitqSISogB4im1N5ZQpVS4LUEo/FzrLW5iCawbPy1biIamQxgN0+UKBRReaJhQCR+GcYfBcyxMfrd1kK1WYQX0Nb5KED8Sod27Tn6eSLCImjNBv4yvJKP6LUi1fzEipa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2xXc3xZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2xXc3xZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732924391; x=1764460391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMojtd1hKJIh3YUnjd/dXONV6TFdwZwQm6greqURNnQ=;
  b=Y2xXc3xZ8eDczLVXVLbFsmum3+M6g8vvxphy20HcVQpPk16hcDKMcVj7
   a63D/Fdu0pnTNpmhwHuGwq9LbEawvEY/HAdfZ0EY2OQgLAp/EumFU/hGl
   i5aJQL6pyLjQIj39u5IRW6e/lg0ICcc3btQkHyXU5br3JND3mOn/dr2VF
   DejxtSHsyp8UOJBZNtho+4CTqLsLeZh46mzQltDm40ZmxYXLogGvRU8lk
   OExSaTdaqEigx2kpFkIlJqObRA8lb0ANh694igVCHEsMV7T+oifp1nG6t
   CuE2tDSmnMRqUaLQxgjPUrl/vXsJtL4iYc3Zqc/tmn2VBUgqHQGCWSVFW
   Q==;
X-CSE-ConnectionGUID: 4PTk/NrETvCh7eDsG+pzqg==
X-CSE-MsgGUID: UDZuTi/AS1Ci3KPigxJd0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36019811"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="36019811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 15:53:08 -0800
X-CSE-ConnectionGUID: j+faet0cR6mdqtIIg5nmDg==
X-CSE-MsgGUID: 9n8EXdejTZerldv0VCBg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92760198"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2024 15:53:07 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAnI-0000m5-0w;
	Fri, 29 Nov 2024 23:53:04 +0000
Date: Sat, 30 Nov 2024 07:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: error: ran out of registers during register allocation
Message-ID: <202411300710.sjbtlh3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: f83705a51275ed29117d46e1d68e8b16dcb40507 Driver: VMBus: Add Devicetree support
date:   1 year, 7 months ago
config: i386-buildonly-randconfig-002-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300710.sjbtlh3s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300710.sjbtlh3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300710.sjbtlh3s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/mmu.c:3:
   In file included from include/linux/hyperv.h:17:
   In file included from include/linux/mm.h:1970:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> error: ran out of registers during register allocation
>> error: ran out of registers during register allocation
>> error: ran out of registers during register allocation
>> error: ran out of registers during register allocation
>> error: ran out of registers during register allocation
   1 warning and 5 errors generated.
--
   In file included from arch/x86/hyperv/ivm.c:10:
   In file included from include/linux/hyperv.h:17:
   In file included from include/linux/mm.h:1970:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> error: ran out of registers during register allocation
   1 warning and 1 error generated.
--
   In file included from arch/x86/hyperv/irqdomain.c:11:
   In file included from include/linux/pci.h:1970:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:1970:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> error: ran out of registers during register allocation
>> error: ran out of registers during register allocation
   1 warning and 2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
