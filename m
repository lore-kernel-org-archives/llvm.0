Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548CA2DA77F;
	Fri,  6 Feb 2026 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400548; cv=none; b=J8A8d5C1WNlnTrQQkLOR5jE/4HMzDsD8kmrBWMKpT+QbSHJ7ddDAsiSwdUtJNERJHpk4ZSVvlWHq6nGjXPo5w5j2CMdT+HM1pR3TeyUc5D+My+rl7XWMYtrzb8MbzRH2n7aSfzBqWSIIUyp3mPRQxQbzr8RxYI2e0h3RgmTNslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400548; c=relaxed/simple;
	bh=w/HdjbXQdEnBJ4vhDGv+x5ENE91qaBBvm6JqpGy2iv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kH/ZYiYf8Ep3pVogDxw8JAaYalvhWIgxlQ2w3PnciEQKHpfK7A0FAfjZz2r3h/vK8ojfQzBbj9gQSg49JRbWbTF30R6GDJhGEN1DLmYE8LbdZ+XdeqkwuXYyf+jUKtfOyG2Kqa8KPULj3Hr5vsNZOw8w2NC27zmRODeAp/pMKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jc0patYU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jc0patYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770400548; x=1801936548;
  h=date:from:to:cc:subject:message-id;
  bh=w/HdjbXQdEnBJ4vhDGv+x5ENE91qaBBvm6JqpGy2iv4=;
  b=Jc0patYU52xyntonkSd/TmuyJ8VUpioYzLrz1zdbAD3lAr1CNshLNWzE
   Y3saFdQxF28kM45/34Se4gyUQzmUh0s42fOwB0h95Wus6jHZwxMzg9HoY
   0267+vsyo/4dbjQgHHsTpb7MbByFLTpO1BQ+PyAJOI38Yg2BKP3qfJN9P
   c9NH7fk33ouoH/Ktdq3hPc3JMZi1Ly4TnmPLhcoC2xD8a3w8eBT5dCeF3
   HNvm6qvfrQaHjjWKbynblUMlESceZfG2qmk7RAObpJijpCj7wdYVBG5Zz
   fg8nzIHMPUR9VJEY4uAQYGhdtPRs/HvtektOgFrq09Wr8KB7S4AyA5Ofs
   w==;
X-CSE-ConnectionGUID: eKfx9dnQQle7t9Bl/LyOpw==
X-CSE-MsgGUID: BJ15R9O5QaC6zLk5EtAnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59181574"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="59181574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:55:48 -0800
X-CSE-ConnectionGUID: snr+tQ9TTE2L2Jknl2A4wA==
X-CSE-MsgGUID: S7II2oeaS8Cxj6h7a2xCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215426653"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 09:55:46 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voQ3U-000000004cD-1WzU;
	Fri, 06 Feb 2026 17:55:44 +0000
Date: Fri, 06 Feb 2026 18:54:50 +0100
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/slab_common.c:1340 struct member 'llist_head'
 not described in 'kfree_rcu_cpu'
Message-ID: <202602061821.2hXXZOos-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-slab-introduce-k-v-free_rcu-with-struct-rcu_ptr/20260206-173717
head:   74bab249f849bb9ae9f523a97ac0517af267dc2e
commit: 5821ba146f0af3ff4e38a7d092ad36b06e0fbc38 mm/slab: introduce kfree_rcu_nolock()
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260206/202602061821.2hXXZOos-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061821.2hXXZOos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061821.2hXXZOos-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slab_common.c:1340 struct member 'llist_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'sched_monitor_irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'llist_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'irq_work' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1340 struct member 'sched_monitor_irq_work' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
