Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C221A455;
	Tue, 25 Mar 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888286; cv=none; b=i1v+R2ebbvrI/XM9kILx5kn7RbgZb8a1MFAO1u+hXx6N8JFlA1UuoptmvWBm+5ehqQV4g6fq34nHfYfX6Tfa397YIE1ewAmyrYUkN1RKwWjf9oTlX8/I2n70tQ+UF8+3T1fMnKCGykPFBYRg9GUqWpdfLrlkhW7gAPR2YP/1/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888286; c=relaxed/simple;
	bh=oWGR22FyOQaCQf+OKayIjTHhuGOsk3zSBN3Fa6UG14c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUSdFdxQtfTqdwz3+PpKV2KH5k2XBke7CfPyVWaJz3q6tbXqergyL3UPhRE/ljdF2WId+j3lhQLxazyMsWBOSclII9Kcq3SYloZ11EPe9KEzVDYdHBnwZs2KAgBL0W2YvrpJk/D6WIZYzPV+ZGFncaCnyQkv9R91nQFNcewqz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A402HqHR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A402HqHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742888282; x=1774424282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWGR22FyOQaCQf+OKayIjTHhuGOsk3zSBN3Fa6UG14c=;
  b=A402HqHR/JRvXfIIofaqnpk3vosY6Zs70GmbOW3IhVxybY6TkvVnOyKK
   V+PtM10Xl9OBnJXRLuIttvxZUCYwRQCzRE0p4uCvbHJ7i9J3LOllDZ4Cj
   gD7/Sq1GItqiTUd1KirvUmvd7umFwTOKgBSXWZaxEF8Bu2qRPbJoh39zo
   HVHDQ/C3f4+fDsa6dOW+4MyDlWwRdbX3gBadQb+CKAZ/FURrSzZaVJURi
   muFfqbllC5m+NVEXl/RHozHx1EsgN4sA9oovHSd2UjN/VjPfcAnb3QTNY
   +wNomHPdDs143vwjgoZnKrvd2wKLbvl09RRzk0i2E/kSaK2OMpNU9VBQg
   g==;
X-CSE-ConnectionGUID: mEY1MdUrTHuJ9dUBEd8LXA==
X-CSE-MsgGUID: cyT3UraBSjyNM/bKPFQKXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44009037"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="44009037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 00:38:02 -0700
X-CSE-ConnectionGUID: YJwvPNNqTNaUtBD3QFoMFw==
X-CSE-MsgGUID: +R3Jbn6bT3a2GiYMoFJynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="125232279"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2025 00:37:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twyrF-0004Cr-0s;
	Tue, 25 Mar 2025 07:37:57 +0000
Date: Tue, 25 Mar 2025 15:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 10495/13068] error:
 arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register
 allocation in function 'hv_get_partition_id'
Message-ID: <202503251528.CfFvIaX6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   882a18c2c14fc79adb30fe57a9758283aa20efaa
commit: 19b18a019381cf292ada820558af21d726cb259d [10495/13068] kbuild: make all file references relative to source root
config: i386-buildonly-randconfig-006-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251528.CfFvIaX6-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251528.CfFvIaX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251528.CfFvIaX6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_get_partition_id'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_tlb_multi'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping'
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping_range'
   2 errors generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_unmap_interrupt'
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_map_interrupt'
   2 errors generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_post_message'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_query_ext_cap'
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
