Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1BA2868B4;
	Sat, 14 Feb 2026 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771086645; cv=none; b=hzhQUFdBZuvUBOJSBpskI1sAatYyJt62ArRX/wyCscpixNiyIi/UEuCnO+XbdP+OBsb6IdldZ26MhE2mBXy37/Hg5F+3TS2OH/jMBhTcPb7pe0TO8lwamsovFZTyVYOCq34V/aQcQBA0rLiynRsmLb2vb5mQzEjmc0NJdJbdjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771086645; c=relaxed/simple;
	bh=fEmo4hfvZgwaReNN6pyAvBzR83saPSRX0b3848xDaIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l0ExPOd1YPkUdVLskSwn2hS+UCjTeF33JGjzl/yONH1Z1iV0NAJ9OSi29vU/QgvPlbvS6RfUP5xBAJWfbHLkxtlV4517g/xsBy4XCo6DUcadQleb2k0XJom4enYXCvmxrPeN82fTuWj0YuZ/oKcK19t9YvtufgrxBeo+F0NkRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKS6tzHA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKS6tzHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771086643; x=1802622643;
  h=date:from:to:cc:subject:message-id;
  bh=fEmo4hfvZgwaReNN6pyAvBzR83saPSRX0b3848xDaIk=;
  b=NKS6tzHAeBJ0Vk/JrZLalT3BRGwfeCUAXFeyv+OJbbnHIhHB2turK68g
   ygscv4G1P6akEgQ8EvOeQaY3/TDo0yTWUejREnwFqT+e5SlfM8v7iENp5
   tjAxFM4iLnDWfo+Lb5ePvhehffZkIYv7kYB1V1cfcciAQpyPwCnEg9kH8
   Mjwxm7VxGsYjikPOmFV5TOTrTejyEGJ9eTfQrtdljbNfOhLBjRMHoG+l1
   uxnE/wzs+szn+e/Gmltt4XYox0lRPQpt9KkvnmWWgFswmQFSXmNOW2T5W
   YEsRFi8OYq8gRbGt7iSLfTCETLZazsy8Vg+6leGUpTYiaAaQ+OuIghGT6
   A==;
X-CSE-ConnectionGUID: ZpDlr0tXSpiI0QMr8Z+BLg==
X-CSE-MsgGUID: xv1WC0FAQGOFzzLf0bDHyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59812307"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="59812307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 08:30:40 -0800
X-CSE-ConnectionGUID: hl6tKS2wR1ihuoHbNVYCvQ==
X-CSE-MsgGUID: FDj2VVkTQOau91isalFghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217743545"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2026 08:30:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrIXU-00000000wjg-1OZ5;
	Sat, 14 Feb 2026 16:30:36 +0000
Date: Sun, 15 Feb 2026 00:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 17/19] ld.lld: error:
 ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
Message-ID: <202602150044.TmsCGgid-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   c8cade07a55a710c48535164d08894878eeee29f
commit: de93b4195b8a9ad80cd71e4e05bbe3e2a3c14ff8 [17/19] treewide: The rest of the owl
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602150044.TmsCGgid-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150044.TmsCGgid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150044.TmsCGgid-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:17: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:11: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:17: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:28: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/hexagon/kernel/vmlinux.lds:32: symbol not found: PTE_SIZE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
