Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A05173;
	Mon, 31 Mar 2025 04:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743394027; cv=none; b=C4UCz2o2a1iDDMBLUVNNRzForv+hS6xSJLGlFOPHkm37ke2BzVwOcwO/YpTIum9HdTRUVM9dq3xGM2Gpwz9+uZEuHPBybq9gQM6bzq9yxdmzbMhzlJLCbCHXAKxzJHNtg46JCNW/RuX5yjkSMEMSpMOdxjtzZw68mLER/xxyOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743394027; c=relaxed/simple;
	bh=JqjQKoz45rxPMFfp+rRMgrI3gg+Np5O/KaBfJNW2l2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQ32vvGRv+7cSL9VcLG6qg7+WHdEwTY3IOYjQjU6qOq7XRLI4n9xI/OOQHi/quoIFBxlpghSMK9K9l7TDGxZjL6ErcrV6u8vqh2x/7/rNXkiMQfNrzP6LMgOrQW60e0RegSL7HP8S8LEWE1NGtM2WIyVmpCfirO3TtUMgkv9XRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKZ73YmJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKZ73YmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743394026; x=1774930026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqjQKoz45rxPMFfp+rRMgrI3gg+Np5O/KaBfJNW2l2U=;
  b=YKZ73YmJuY4vkJrfzI7bKpCcEbfsVmxTbnhCOsLcwd6ex3a/OrifVzjb
   Zj8rdSPAjSpCfIppxvrKEZcz++C+4Qb3N9b3aZohTGuulRyYqsjikWb8S
   v9fsSx/TPWdQzSuHN8V4jDNn69xaDYO5ajIBf57dPkYlqQM3tR9Ftul42
   kuVoPnxVNKaraqU4l+oZGipReADpHQPNXlSmEY887FhSVOtJ9XHOYyntu
   mpul9vevjzpyQLcL1AOw6a68P5Ekymum2uRYmHSTZy2rObyS4cE+2Jmo5
   fNuTABHpGEKkJNfT6U4Rf5begvIOfQQIIJS8gYRYma12dh7LDCLKcDIjt
   A==;
X-CSE-ConnectionGUID: zAW7s8qyQxyHo1PMhdKGiA==
X-CSE-MsgGUID: 0OAmpweQQUyAHpRZyiIEkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44803545"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44803545"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 21:07:05 -0700
X-CSE-ConnectionGUID: SizCGeIuS+aftb2pwD23Eg==
X-CSE-MsgGUID: AyIZLlj8RpW+8j5DVoAfWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126894326"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2025 21:07:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz6QP-00091y-17;
	Mon, 31 Mar 2025 04:07:01 +0000
Date: Mon, 31 Mar 2025 12:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug-cfi 9/10] vmlinux.o: warning: objtool: bad call
 to elf_init_reloc_text_sym() for data symbol .data..relocate_kernel
Message-ID: <202503311214.CjYO5Xck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug-cfi
head:   21e95723aa631b1eb5f618c8cf6061226d2a7d05
commit: 1bbed9c611fd286b68e2c459320910c4fefd4a22 [9/10] x86/kexec: Add CFI type information to relocate_kernel()
config: x86_64-randconfig-002-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311214.CjYO5Xck-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311214.CjYO5Xck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311214.CjYO5Xck-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section
>> vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .data..relocate_kernel

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
