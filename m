Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C42E2286;
	Tue, 19 May 2026 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779219284; cv=none; b=orkz/kGzNRA9gvrgBax14Syotppgh8Tq+tjaXwd3MYWXkfH+IdAVqSr614Nh/6Ls2p64A5ALdOwd169gn602bNcBvnzuAtEnHStKPo8LwnHcv9ktXK9Z4q2bmn/14FR/q3mrKpRyJ2hiX9+u0Jv886FKMygh5W1SK49ixxgHOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779219284; c=relaxed/simple;
	bh=hAWMlkh2r9FZkBVlkBIQrTmce6VfqMBrMoFkO+bbfpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnadLLOysNXz32rsk0toTKnockvCS38L+0kzJ54y7vQyntviX8fWUDTIAqvocv1GigGOzlo70zbO+06Z5cDi8WJEAHeA7tKtoadPnSeuWLBA2N1iffJRQgBiPj8D/0OIyeIQ1/s/cNMtVy24IBagniD9ibN8VdIsnENARGYk40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qcuu0xMT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qcuu0xMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779219283; x=1810755283;
  h=date:from:to:cc:subject:message-id;
  bh=hAWMlkh2r9FZkBVlkBIQrTmce6VfqMBrMoFkO+bbfpc=;
  b=Qcuu0xMTV7SRiUw56viu83qAIyWDO/BjNFkcJRD3a4LEVmGlQ0W55NrY
   n/zFhDaPGFygsIrnV/2qbuyYExGH1fP2xHmce8w8Fentp90bVMb/wPHpl
   XvuCoDqRgGm1W8UIn6RMWnaPJrApGkRfQkg9yYTnlQ0pjE1GIU41xHCoc
   wmoIekkB+xPq6HO8FT54r+vuy4q6zHN8PjtxbdOiSy7GUDwwX/Bw0KcO9
   XLSHfJ7RcQdcWgGFlvn5BO/wgXVU7McaSMOUvTC4q0IpcLOfHbvBcABCs
   oA96pGkzaf2DJ0pha9Ct6GjT6HCsnmJgGq2VgdUU1kavGSdQiS9ALC6op
   Q==;
X-CSE-ConnectionGUID: WMUzxYc0R7yzBaAdoZCusw==
X-CSE-MsgGUID: XOYNTTNDTdGYgOWwITKzuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91504622"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91504622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 12:34:42 -0700
X-CSE-ConnectionGUID: aB96Fj2uQkqubX2bjDpNBQ==
X-CSE-MsgGUID: d2PbgROGQrG/7YND+MBXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244860072"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2026 12:34:40 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPQD7-000000001mz-49nj;
	Tue, 19 May 2026 19:34:37 +0000
Date: Wed, 20 May 2026 03:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.exit_mm 3/4]
 drivers/firmware/efi/efi.c:76:3: error: field designator 'user_ns' does not
 refer to any field in type 'struct mm_struct'
Message-ID: <202605200302.rSItKx0k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.exit_mm
head:   822aa51be2cae2813d42b998a12558fa76afbc4f
commit: a8f2b6f303fb0cdc7fef1b4e8966828a1dc7e10a [3/4] sched: move mm->user_ns to task->exec_state
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200302.rSItKx0k-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200302.rSItKx0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200302.rSItKx0k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/efi.c:76:3: error: field designator 'user_ns' does not refer to any field in type 'struct mm_struct'
      76 |         .user_ns                = &init_user_ns,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +76 drivers/firmware/efi/efi.c

732ea9db9d8a6a04 Ard Biesheuvel    2022-10-11  67  
7e904a91bf604907 Sai Praneeth      2018-03-12  68  struct mm_struct efi_mm = {
d4af56c5c7c6781c Liam R. Howlett   2022-09-06  69  	.mm_mt			= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, efi_mm.mmap_lock),
7e904a91bf604907 Sai Praneeth      2018-03-12  70  	.mm_users		= ATOMIC_INIT(2),
7e904a91bf604907 Sai Praneeth      2018-03-12  71  	.mm_count		= ATOMIC_INIT(1),
57efa1fe5957694f Jason Gunthorpe   2020-12-14  72  	.write_protect_seq      = SEQCNT_ZERO(efi_mm.write_protect_seq),
14c3656b7284a864 Michel Lespinasse 2020-06-08  73  	MMAP_LOCK_INITIALIZER(efi_mm)
7e904a91bf604907 Sai Praneeth      2018-03-12  74  	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
7e904a91bf604907 Sai Praneeth      2018-03-12  75  	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
61ed08c2fd1db0eb Breno Leitao      2025-12-23 @76  	.user_ns		= &init_user_ns,
40374d308e4e4560 Ard Biesheuvel    2025-10-15  77  #ifdef CONFIG_SCHED_MM_CID
44fc84337b6eae58 Linus Torvalds    2025-12-02  78  	.mm_cid.lock		= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),
40374d308e4e4560 Ard Biesheuvel    2025-10-15  79  #endif
6ac433f8b2590b09 Mathieu Desnoyers 2025-12-24  80  	.flexible_array		= MM_STRUCT_FLEXIBLE_ARRAY_INIT,
7e904a91bf604907 Sai Praneeth      2018-03-12  81  };
7e904a91bf604907 Sai Praneeth      2018-03-12  82  

:::::: The code at line 76 was first introduced by commit
:::::: 61ed08c2fd1db0eb43c8b62ade249a3061e39444 arm64: efi: Fix NULL pointer dereference by initializing user_ns

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
