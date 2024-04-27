Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277C1DFD2;
	Sat, 27 Apr 2024 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714220617; cv=none; b=sIz4wsmconKmrQEIAaeInAxaLilMnbX8De7fdEJGfLuvNlXqiGiJL/95Yt/Tia1JxerRsgh2Txfbq2gEXbNQkgbITb60JID8HCRaqnUlOieukqXtRdlePZMX8vdQt2txmDd6DqiYCsPHM3O2GkT8Ydj/f5NlsQmIp3hVfkqpU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714220617; c=relaxed/simple;
	bh=zrBOzM1NNEumGcrqIdS5fhfRYb5DhMIPnzVbf/lwLAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Es952Czwj+nfFVzS2M2/7xmB8GZYFEHt+8t+t4QbbjCiTrV9q1p0Ot9xTRRcLtqb/JL3joo0V5vLJYMFuh1y3EZ8EOUYLMgpeMcvOxgl2iJh9e8tXhTd0WDd46RZeAv00df+6RXu1AKEG3Sc7brSPjquAQ4jDE5MDsDIEygpndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1fwZgLv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1fwZgLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714220615; x=1745756615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zrBOzM1NNEumGcrqIdS5fhfRYb5DhMIPnzVbf/lwLAo=;
  b=W1fwZgLv6oOyuo50gZAujcOLrJFTXYQUIgSHDwAwqjXHHoNe47p6Q+RG
   rdUnFf4/CKi5c/u3zXmeh5hCkz7bMlqMAcnFIT4s5T8biwAWt3opfmeNN
   giiwiDYIYUgYXUGAGZvgP6KO6yKpWA647xpng/mz8loTBqlQ4dkjYfMn1
   4U5RJE1r7KdXLLaF9xjVTZHUWxtAXNsW1FcViGlQZSC/GZ2R4ey4K11KB
   oiaKfIg1QbEJVflAF1KIhpy8yK/PycaPN8DXdM5mFh0wlchhzzrL6hQzL
   GFutgeQoPpRCPTUkSgsweMIg3Iig5vaC4cQwGKm+I5+CyUHa+4WnY7nia
   A==;
X-CSE-ConnectionGUID: 3NwA8bNTQUCdy6jmTJrDQw==
X-CSE-MsgGUID: dW3Fyl04QVCEYPWOGKN75A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27400283"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="27400283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 05:23:35 -0700
X-CSE-ConnectionGUID: vlP4aEErSFmW4D4BKS4OPQ==
X-CSE-MsgGUID: qGwOeUGwS72nWiPiBxVNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="26171424"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 05:23:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0h5W-0004yQ-2G;
	Sat, 27 Apr 2024 12:23:30 +0000
Date: Sat, 27 Apr 2024 20:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:uprobes_cow 2/3]
 arch/arm/probes/uprobes/core.c:29:5: error: conflicting types for 'set_swbp'
Message-ID: <202404272026.UsFT9Wl5-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240427/202404272026.UsFT9Wl5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272026.UsFT9Wl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404272026.UsFT9Wl5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/probes/uprobes/core.c:29:50: warning: declaration of 'struct vma_area_struct' will not be visible outside of this function [-Wvisibility]
   int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
                                                    ^
>> arch/arm/probes/uprobes/core.c:29:5: error: conflicting types for 'set_swbp'
   int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
       ^
   include/linux/uprobes.h:106:12: note: previous declaration is here
   extern int set_swbp(struct arch_uprobe *aup, struct vm_area_struct *vma, unsigned long vaddr);
              ^
>> arch/arm/probes/uprobes/core.c:32:38: error: incompatible pointer types passing 'struct vma_area_struct *' to parameter of type 'struct vm_area_struct *' [-Werror,-Wincompatible-pointer-types]
           return uprobe_write_opcode(auprobe, vma, vaddr,
                                               ^~~
   include/linux/uprobes.h:112:84: note: passing argument to parameter 'vma' here
   extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct vm_area_struct *vma, unsigned long vaddr, uprobe_opcode_t);
                                                                                      ^
   1 warning and 2 errors generated.


vim +/set_swbp +29 arch/arm/probes/uprobes/core.c

    28	
  > 29	int set_swbp(struct arch_uprobe *auprobe, struct vma_area_struct *vma,
    30		     unsigned long vaddr)
    31	{
  > 32		return uprobe_write_opcode(auprobe, vma, vaddr,
    33			   __opcode_to_mem_arm(auprobe->bpinsn));
    34	}
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
