Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D524DCF9;
	Fri, 31 Jul 2026 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533692; cv=none; b=EuKo1pCNOQVnI2TvrKEgvcP1Bwv2R1yGdtRn6x+r8anchgv9xYskPzNMwD8cRGtmFlKB60Kun3yIxfCUl1Qyg9cqRZ9x233yAAJQ8tCwNfupqWyY2fGoocjqudpHVxLinp+PViR3B+yaQtP5sefgRxhV4c2Jr2tmhyIGuWRiaC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533692; c=relaxed/simple;
	bh=3L6XyO8IHMddg4Cu4NVaj72WNg74WX1edAVlzsbBR9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mP/8QkbF8ER9ugT2bogQXn6fFs3JpeMoaBZpvvKfH8DsfOi33Z3blKztErmZ4ATY0IV8A0ywoOg97tpAeuYU5XRh08785rrhFgXfjBRoErFX1mKAtrTYPm6zwqaYOzMxE6lrXVTTByyYfvWoVgwc+E4bLuHrk+o/759eAB878ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFziIc98; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFziIc98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785533691; x=1817069691;
  h=date:from:to:cc:subject:message-id;
  bh=3L6XyO8IHMddg4Cu4NVaj72WNg74WX1edAVlzsbBR9E=;
  b=oFziIc98i9xdcfuR5xeSd8Iw9VruhOnhOsxfwpxP4pJ7W+ID0hr23j3i
   hal+Nx3F40u1wVo9GXl+UhEbgjUQk8Oa8pZYILb7seyqY6UNWgY/OKDBc
   t0PGfGCIdp6WsQpFAkhnDchsQHnV9dk1uODrbC8Dx1Q0gTtidSmuawVmT
   HUySKnvzb9XJ7U9Nd4k18DMMfzCoQ/sJSOCF+yD54W0is9CnhQY7+jKc6
   1iSewS0Y7k3qmQfsj3ztAbwO8WdaI2rte12vybtSdePmHGl6AE5DDEILI
   63Dy/M/AwpMJ9jsiAB6FzyNdVNIvehBD0MYD1ayzMTcvw+MnuRCe33Zpn
   w==;
X-CSE-ConnectionGUID: 7fB2xlSyTuKojFZOt73aBw==
X-CSE-MsgGUID: MnR/dGoiQQmRc5JyGTfuhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="85930025"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="85930025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 14:34:50 -0700
X-CSE-ConnectionGUID: JTmDpwUuRn6Krl2hZlPaxg==
X-CSE-MsgGUID: pDfD08S4TXeFwM/+Ibjp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="257307647"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2026 14:34:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpusQ-000000003Is-2H5c;
	Fri, 31 Jul 2026 21:34:46 +0000
Date: Fri, 31 Jul 2026 23:34:32 +0200
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/percpu.c:2568 function parameter 'local_base'
 not described in 'pcpu_setup_first_chunk'
Message-ID: <202607312317.Zo37Hk1v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/drivers-arch_numa-move-percpu-set-up-code-to-arch/20260731-215335
head:   d4b4b34a585268944101ba7da2e1307d82850de9
commit: 863a2eb5549facc8785c9c78a24563f3c31896fa mm: percpu: set up first chunk and reserve chunk
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260731/202607312317.Zo37Hk1v-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312317.Zo37Hk1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312317.Zo37Hk1v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/percpu.c:2568 function parameter 'local_base' not described in 'pcpu_setup_first_chunk'
>> Warning: mm/percpu.c:2568 function parameter 'local_base' not described in 'pcpu_setup_first_chunk'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
