Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA249372B39;
	Wed, 15 Jul 2026 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124633; cv=none; b=nLkcyFskefbXX5xhjheglCVVbDEVuT4bstfIQJm7m0xpbrY6xvc5Qw2Dj8i95M+bIwcYlpkIYSGx5TM7Kf9linJV7IAL26kpW+jSAlXUcd9dh/ZVaNwWZoZH8h0CF3LOq1vTbYwDTF3U3aXlkJG6W8MPk2t9x8TCYxZXsboZ4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124633; c=relaxed/simple;
	bh=LFu+VkLg+SsmVA+NSmQZD5mkvTskucG2N0t4EcNKus4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mi5BwdXN6cS+2B0y/BrgquGuHc8PWxEcfuEtz9RDrs5reFWpEDYFFa5yhCrNMql3mqbOJQfAmEmeHH4N5t4P9+KQ99Ce9J9hrh45cuza/1jFFvGXS9vAv4xZamzau6k6PHOpsix5vxQK8IeWSlknT52BJUROiBHRWKWHpR9K27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9v6gpHF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9v6gpHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784124632; x=1815660632;
  h=date:from:to:cc:subject:message-id;
  bh=LFu+VkLg+SsmVA+NSmQZD5mkvTskucG2N0t4EcNKus4=;
  b=i9v6gpHFlbhPCC453gZgw1wvCt5sDykFWQnh9HcDmHLqzJfKUJS8VZg4
   PyhT5w011PwOyWShhzgiul6Bv98UUJfIK3pwhVMXD5TYJhqaG216+vYs4
   /KxKJc2pheFVpnIa41n9JkH7tPvP7zmT6n+Wif37GvOSBb6U+WCUZ9uHf
   hLxft9/v9LSof1JuijTdvYG9vpn6/dcdjtBQ2EmP23tirMWyGgqWoewaK
   tFebK0JnKIlu2Cf2Qx/rH5GssvSZdwV4jcy+/zSeSI3ooTnCbRA5qvNk4
   Z5LdZmsNo1TrZP/JChlZYdHWp5UNkOFh2xv9UCZ0TyCFif2riOFVJNsN2
   w==;
X-CSE-ConnectionGUID: eTuXMttnQQC6dkl/+i8Yiw==
X-CSE-MsgGUID: YImkwTDkSxuAwKrvj4WfaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84615845"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84615845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:10:28 -0700
X-CSE-ConnectionGUID: YZjT+rUOSvW6vsb6d7afYw==
X-CSE-MsgGUID: mcmzhCNtRT+f+oow36iFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251778382"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jul 2026 07:10:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk0Jc-000000004G1-3kgf;
	Wed, 15 Jul 2026 14:10:24 +0000
Date: Wed, 15 Jul 2026 16:10:20 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/linux/kexec_handover.h:129:1: error: expected
 identifier or '('
Message-ID: <202607151609.NMmZBoqm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260710-014638
head:   a4ac1827ac09b0b27fd42c9776b5f5bae67530c8
commit: ff640ad9350077a3af2482f69c1e34ee82daeaa2 mm/mm_init: don't rely on memblock to get KHO scratch migratetype
date:   6 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260715/202607151609.NMmZBoqm-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151609.NMmZBoqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151609.NMmZBoqm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mm_init.c:33:
>> include/linux/kexec_handover.h:129:1: error: expected identifier or '('
     129 | {
         | ^
   1 error generated.


vim +129 include/linux/kexec_handover.h

   126	
   127	static inline void kho_init_scratch_migratetype(unsigned long start_pfn,
   128							unsigned long end_pfn);
 > 129	{
   130	}
   131	#endif /* CONFIG_KEXEC_HANDOVER */
   132	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
