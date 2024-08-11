Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A3199A2;
	Sun, 11 Aug 2024 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723357263; cv=none; b=V2id6DYFiJrQAfhh+hfw3m7ModZv8P6ael2/6viJgp1cJc9eQNp5EG3Oib6uRCFHXLD1ilRJQxryaGe6IqiNdpeNKCpdObErHhLIFUquQbrzUEYWTPwiyKUAu+VjDIBkdotTkGvh2XRKkzOn5veKtKRQn8B3yivKEr26oVJgexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723357263; c=relaxed/simple;
	bh=m2rTSP4NwmfzViDA/E00kqm6iPh4PW9UTFBI3P3ixW8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mine1PhFNX1OyWduiUo59raxSEMiz14Wk/MwomEM1yaNTaFKe29tx1c94klKeHfwXaxikoHJwNukJPcIl1d68AFdJZBM0voKdJHPaoh97Td+N2oXpVXwn2VNdLlQs9RZYDOLLRpysSXb7nB7wCIli7wdQYHsrFQXpddM20pAXvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kc06o6WH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kc06o6WH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723357261; x=1754893261;
  h=date:from:cc:subject:message-id:mime-version;
  bh=m2rTSP4NwmfzViDA/E00kqm6iPh4PW9UTFBI3P3ixW8=;
  b=kc06o6WHKjbmTHcDv2ae3j8qzrwT3DwLyTCyZHQDImH1gIaRgxF7+KuJ
   B+7nvjkrEsIuEN5T3lMk2dI1Alet67Nm92sywOKkMU1oXkidc46vXwSXd
   vKb5b4xqW++NiZ79mJ8Iq2OWY2+wd2zAVEefh/fvnmVK5f4cRHr59w7jw
   w//971/zhxH7ZfJJFSy6jwVbrq+vnTvlIv8XGWT/sRKaT1cVXKtKy6RlZ
   evCvyyBl3wB7RTzSVsjlMXJ97gMjLorDHMkoRaZFbP6IwrTBJVU10xt9G
   JHnExD3ome8oT+WFp6MAidIZkMYPPxjxARpOSHvasyeosbgjaoRkFIXC1
   g==;
X-CSE-ConnectionGUID: zFzPUXUWQWmBE3BG5tVCsQ==
X-CSE-MsgGUID: XWHnCAOsQCWZpLuou2xHJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21627078"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21627078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 23:21:00 -0700
X-CSE-ConnectionGUID: JFMe1zGnTCK8j4G710UQiw==
X-CSE-MsgGUID: gPmmY3KSR2WUEmyycINbxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57853168"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2024 23:20:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd1wm-000Adn-2L;
	Sun, 11 Aug 2024 06:20:56 +0000
Date: Sun, 11 Aug 2024 14:20:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: BUG_func+0x7: unreachable instruction
Message-ID: <202408111417.aHzPZj0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Juergen Gross <jgross@suse.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5189dafa4cf950e675f02ee04b577dfbbad0d9b1
commit: 9824b00c2b58f9e1072ef3ece571a2cfc71089d4 x86/paravirt: Move some functions and defines to alternative.c
date:   8 months ago
config: x86_64-buildonly-randconfig-002-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111417.aHzPZj0w-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111417.aHzPZj0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111417.aHzPZj0w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_user_addr_fault+0xd5b: unreachable instruction
   vmlinux.o: warning: objtool: abort+0xc: unreachable instruction
   vmlinux.o: warning: objtool: prio_changed_idle+0xc: unreachable instruction
   vmlinux.o: warning: objtool: switched_to_idle+0xc: unreachable instruction
   vmlinux.o: warning: objtool: prio_changed_stop+0xc: unreachable instruction
   vmlinux.o: warning: objtool: yield_task_stop+0xc: unreachable instruction
   vmlinux.o: warning: objtool: switched_to_stop+0xc: unreachable instruction
   vmlinux.o: warning: objtool: hugetlb_vm_op_fault+0xc: unreachable instruction
   vmlinux.o: warning: objtool: hugetlbfs_write_end+0xc: unreachable instruction
   vmlinux.o: warning: objtool: r100_semaphore_ring_emit+0xc: unreachable instruction
   vmlinux.o: warning: objtool: lkdtm_BUG+0xc: unreachable instruction
   vmlinux.o: warning: objtool: omap_dm_timer_modify_idlect_mask+0xc: unreachable instruction
>> vmlinux.o: warning: objtool: BUG_func+0x7: unreachable instruction


objdump-func vmlinux.o BUG_func:
0000 0000000000003de0 <BUG_func>:
0000     3de0:	f3 0f 1e fa          	endbr64
0004     3de4:	55                   	push   %rbp
0005     3de5:	0f 0b                	ud2
0007     3de7:	48 89 e5             	mov    %rsp,%rbp
000a     3dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
