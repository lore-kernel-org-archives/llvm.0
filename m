Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9436F413;
	Mon, 18 May 2026 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136910; cv=none; b=bu89d8GvZC4ei/NSfgnSwk2+CkX8IwEPmbtcQIsjipTsGW1eUg+3GLvRtKI+JpA4BCqUwl4nnAhO4L2M8XMUPUOd6n0NZ0pNeolWUa2Qsj3f94cqUtW90Iwl4b0Ui5p1dU8jB17jK3TUTsCu5cM8YrTHEuQuCsWKqgPuC541G24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136910; c=relaxed/simple;
	bh=tLQbYlyvOqeVnlHn+hZxm40X9+dVt+Br5fhtEzaCzVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iEBH8K72uSfFFjLZ8HrUk4RzWvqpZaVVWnlzIqZ9zJcoIJPbdizzHqxnD2doniNh8M1+Gf+G20j41zY3Co+Dy0zw2sWzpVXG/bIQHbz7F7RA4HC8wpJ38Spn2OaU8EuMMln5x5VHBIJSwl0tKTi8wWiXBjMonqpg97DyyXpFjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hby2wyWR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hby2wyWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136909; x=1810672909;
  h=date:from:to:cc:subject:message-id;
  bh=tLQbYlyvOqeVnlHn+hZxm40X9+dVt+Br5fhtEzaCzVM=;
  b=hby2wyWR1peO9l0felj6tqxQCfBx6Xfh9mw3zYdv3Nh29MBdyxgdeHbM
   UPE8KiN3Xu5mSXi2ZzQ04jFkT+kLkwoEq4A/Rg0and+Yjq7GWScQ52Enn
   xB+/1cXQw/nwhbDXMHhFsidqCzFyeq3h+ZPd3BnC6jOM9wqVbsuDwdWOe
   2PxR//MqRuHbz9+KIA6ruZp6FEPSpE6gd1dhJ3tpABEOKuEsXswGrBP1f
   NkvdHGWU9XUVIlNOTpkQNcH4XJk2A4jxXngsQeQCdN6B0+OmXMoIk0+ll
   797IDRKHw8OlJKhryz8sFbUDkYnmtk3Ao/Zm+u2KeaBBXgdOnvM8a4HsX
   Q==;
X-CSE-ConnectionGUID: 48MdW7KpS+i6wCRSy8CCuQ==
X-CSE-MsgGUID: 16AjRxKqTxCdMJyZMS5zaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79981822"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79981822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:41:49 -0700
X-CSE-ConnectionGUID: tW8h/u0YSyiua/cwRAbv5Q==
X-CSE-MsgGUID: 2snzUz44R1OMAQbGFSOtGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235092701"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 13:41:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4mW-000000003Ne-2zVI;
	Mon, 18 May 2026 20:41:44 +0000
Date: Tue, 19 May 2026 04:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 205/238]
 arch/sparc/kernel/pci_fire.c:266:23: warning: variable 'order' set but not
 used
Message-ID: <202605190414.PeXvfubE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: e38ac4a3d318d95890c7ec5a86491b7502679fcb [205/238] sparc: replace __get_free_pages() with kmalloc()
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260519/202605190414.PeXvfubE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190414.PeXvfubE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190414.PeXvfubE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/sparc/kernel/pci_fire.c:266:23: warning: variable 'order' set but not used [-Wunused-but-set-variable]
     266 |         unsigned long pages, order;
         |                              ^
   1 warning generated.


vim +/order +266 arch/sparc/kernel/pci_fire.c

9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  263  
759f89e03c9e56 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-10-11  264  static void pci_fire_msiq_free(struct pci_pbm_info *pbm)
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  265  {
759f89e03c9e56 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-10-11 @266  	unsigned long pages, order;
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  267  
759f89e03c9e56 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-10-11  268  	order = get_order(512 * 1024);
759f89e03c9e56 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-10-11  269  	pages = (unsigned long) pbm->msi_queues;
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  270  
e38ac4a3d318d9 arch/sparc/kernel/pci_fire.c   Mike Rapoport (Microsoft  2026-02-10  271) 	kfree((void *)pages);
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  272  
759f89e03c9e56 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-10-11  273  	pbm->msi_queues = NULL;
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  274  }
9bb3c227c47b23 arch/sparc64/kernel/pci_fire.c David S. Miller           2007-08-30  275  

:::::: The code at line 266 was first introduced by commit
:::::: 759f89e03c9e5656ff18c02e21b439506f7c0cdc [SPARC64]: Consolidate MSI support code.

:::::: TO: David S. Miller <davem@sunset.davemloft.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
