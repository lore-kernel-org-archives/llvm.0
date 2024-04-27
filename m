Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2F4D5AC;
	Sat, 27 Apr 2024 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216176; cv=none; b=CMCxf0NLtWbjBJZaDNCJ7/Dj8wyjOwemYnGUSnoY3KJr27AOC93aY8/n4xNnzb+E77RrHHD25W3XxytJsihpyoJvQPjmNKJQmBDSaSr7LKH4OcjKB5hklX+QkyivinPo2cOKGv7YrNXofeZKuWAqS4B9084DvJV8jorOXOIbbC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216176; c=relaxed/simple;
	bh=tXW+RHE3nwCTp5JP48kfmgCeskzzx0ASWQVynU2yctk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txMEXAvO8bDDEPwfbHpdnk40gZrrFqAeo7f4tJWEuhOlP+O2dhrn3RXOU6MJN55o2dE3ife5yD41S9GGep1oEUDdTYWRj7pUUtdiH9K4y/kc/c0YwQedQueZfIKM/ydXN804wwUEIPM4fN2vUFdYbTERlYyzJ0x2s1xXmvagrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G963YHD1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G963YHD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714216174; x=1745752174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXW+RHE3nwCTp5JP48kfmgCeskzzx0ASWQVynU2yctk=;
  b=G963YHD1WXoN1vdJhfUTfUPPbEZkYW0lWmUBHWid0voteSvC4Cxb1nHv
   Uy6ZpYVDsvLl3cF7PLLvpFpa6pwmHBzF73QcUip9K2mCqFCFsHN/NdRNg
   65Sb/4GPvMQVy90rTDveXA7DD1jOav2U00jqJTNRQ5XdRHVcB4pliyk2S
   XaAMLgpMYM9oM3CJVsMBq+q99dAmYyWVcEsJiLvtKckAuXXFxmCezJFFg
   416dST+4jfa2/dXMNH78+rAmmIBVwI+vJP+VZ8OicZhexDIoDylpPmBrZ
   G9ZLJ0OSpTAAb3+9xOynxSOAVR7zO+9LGjvPFg30MwWS54HP1qU7LggPL
   g==;
X-CSE-ConnectionGUID: VkgQefrUR5m9sE4k4X6Xng==
X-CSE-MsgGUID: CSc0a2lJTYGiPmTWNXJGCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10053054"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="10053054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 04:09:33 -0700
X-CSE-ConnectionGUID: xA49F7xqTaCGx5KGHMoNmA==
X-CSE-MsgGUID: F1H/7+5PQS6dAHj+b+g+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="26292912"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2024 04:09:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0fvs-0004vG-2a;
	Sat, 27 Apr 2024 11:09:28 +0000
Date: Sat, 27 Apr 2024 19:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:uprobes_cow 2/3]
 arch/arm/probes/uprobes/core.c:29:50: warning: declaration of 'struct
 vma_area_struct' will not be visible outside of this function
Message-ID: <202404271956.wOymyIUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux uprobes_cow
head:   42ab6aaef9cde61b0c00b5aafe291bda60e362e7
commit: 204060681d67b845d95d19d8964b62381a46d6a9 [2/3] kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and uprobe_write_opcode()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271956.wOymyIUX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271956.wOymyIUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271956.wOymyIUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/probes/uprobes/core.c:29:50: warning: declaration of 'struct vma_area_struct' will not be visible outside of this function [-Wvisibility]
   int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
                                                    ^
   arch/arm/probes/uprobes/core.c:29:5: error: conflicting types for 'set_swbp'
   int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
       ^
   include/linux/uprobes.h:106:12: note: previous declaration is here
   extern int set_swbp(struct arch_uprobe *aup, struct vm_area_struct *vma, unsigned long vaddr);
              ^
   arch/arm/probes/uprobes/core.c:32:38: error: incompatible pointer types passing 'struct vma_area_struct *' to parameter of type 'struct vm_area_struct *' [-Werror,-Wincompatible-pointer-types]
           return uprobe_write_opcode(auprobe, vma, vaddr,
                                               ^~~
   include/linux/uprobes.h:112:84: note: passing argument to parameter 'vma' here
   extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct vm_area_struct *vma, unsigned long vaddr, uprobe_opcode_t);
                                                                                      ^
   1 warning and 2 errors generated.


vim +29 arch/arm/probes/uprobes/core.c

    28	
  > 29	int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
    30		     unsigned long vaddr)
    31	{
    32		return uprobe_write_opcode(auprobe, vma, vaddr,
    33			   __opcode_to_mem_arm(auprobe->bpinsn));
    34	}
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
