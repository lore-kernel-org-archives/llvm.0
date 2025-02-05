Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C316EB42;
	Wed,  5 Feb 2025 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768369; cv=none; b=Vh204AujZjry7hwhj5X4WSmIV+v/5xE9rKIUXmL8rtD8VhkZFJnlY/hzH7w6AnWD+xj+Ql7P/LEUrBtDNM198CuX2IFga0Sodj065kykqzav/sBG3PszwpqG7+wxSUMixIFZu1n/ix7uc4wymCu8Nb/ZDEiwVKKMw2BdSuhAz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768369; c=relaxed/simple;
	bh=pQr3SJKbPJxFPni1VFXkf5GnRQtWiJZAVA3arSaB8mE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1MecuXxZhMymzmh11DdLp+6lJ7xwQJZ1sfwcq7p4R+co/RhmCOC76IyTlsgTGWA3iEZbBFhaLQumQVGOFthIenmKQaV2cuVyj6roAVu4ZC1Oxq9fWOjC5buLclsno4KfzjxBKSZOzMiQ7MQwBpY4+9Oyi/hvJa7mMeg/5DjjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sj3aDs4a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj3aDs4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738768367; x=1770304367;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pQr3SJKbPJxFPni1VFXkf5GnRQtWiJZAVA3arSaB8mE=;
  b=Sj3aDs4aoySkYYFQNxgPVpQF90OFcJPBUEqEjO6vVhXoKS4KSCDpc3KF
   PUi+sqkRdCxu3WbJDi12YhXOumzYdUjqI9TRna10iA2u5p9AzfF1vExPI
   e8/AuQLec1CnOLycS80qmsqryf4pYQPXXDCg37ZNQpWEoOx2OQ6PrhajN
   ue3mAbDXc96V48uy57sI0kRrJ0eBbjSI84YaiJw94xzrNi9b0sV/GsZlG
   45sRgBiGKuE+NaNy3g3YWr4PliF/gtt+Iq4+dBxS02lrVzqVcM+mYvpJy
   gWk6EdltMRW3XYGnuUJqrYWYbQTqDXn5T2S7UkKVcVOR/V8IpNaRjXxUe
   g==;
X-CSE-ConnectionGUID: kmrkV/AyQGq+DrRr20/38g==
X-CSE-MsgGUID: dP5Xvo3LRkGf3hhnkk7pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50327145"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="50327145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 07:12:47 -0800
X-CSE-ConnectionGUID: nbt93cicSqSEhAoVDhr/pw==
X-CSE-MsgGUID: QONQJTpjQsaJXoTF/weSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111466803"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2025 07:12:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfh51-000vMi-2o;
	Wed, 05 Feb 2025 15:12:43 +0000
Date: Wed, 5 Feb 2025 23:12:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/helpers.c:685:39: warning: bitwise operation between
 different enumeration types ('enum bpf_return_type' and 'enum
 bpf_type_flag')
Message-ID: <202502052349.NjNaWT5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hao Luo <haoluo@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Hao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c8c229261f14159b54b9a32f12e5fa89d88b905
commit: 3c4807322660d4290ac9062c034aed6b87243861 bpf: Replace RET_XXX_OR_NULL with RET_XXX | PTR_MAYBE_NULL
date:   3 years, 2 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250205/202502052349.NjNaWT5E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052349.NjNaWT5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052349.NjNaWT5E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/helpers.c:685:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     685 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   2 warnings generated.


vim +685 kernel/bpf/helpers.c

   681	
   682	const struct bpf_func_proto bpf_per_cpu_ptr_proto = {
   683		.func		= bpf_per_cpu_ptr,
   684		.gpl_only	= false,
 > 685		.ret_type	= RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL,
   686		.arg1_type	= ARG_PTR_TO_PERCPU_BTF_ID,
   687		.arg2_type	= ARG_ANYTHING,
   688	};
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
