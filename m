Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526EC2C11CF;
	Sat, 13 Jun 2026 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781359344; cv=none; b=K4WAhPtv0cjS1RAaovlzgG/D3v+Ke45xL5mbMvMRGP7VPnkldCE2jo9T/oq7u74W2dJeSleZGW4cV0B1mXrc3trJkPLh8DrgpLicfIOBRG+ZxgE+V7Xq+9qXrzBXo4ClVPDTT9cR14avM5SHS/9a6Bwl4UZ13t4MNK7zNsLh9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781359344; c=relaxed/simple;
	bh=qF/GCY3ku27aWDbtVnROgkjd17wQ+N4kuN5tQlX+iHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BAnLdwAOC5BJVAKusq7tkYGIJ40bWLRjYM82DhCuPBqkcoL0iaUonuJKaG+8PIIMuLH9Gl9CMa7EliKdt4kgu9AH5/keeE1ZArQ4NtRD6OkOBxAB1xKsgKPiGqd5RI4WfUfJWLCZrKcjOXyoAOQWgQBnQkiLzKnt1UAmtUy7Fyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buOUWjdc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buOUWjdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781359343; x=1812895343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qF/GCY3ku27aWDbtVnROgkjd17wQ+N4kuN5tQlX+iHM=;
  b=buOUWjdcw0yQ8xmBVP4JraNFT+xTULcpQq3IrvYABX3pI0shPdi1xX+l
   IYcewF+JiVv3JQ5K2xwDUMi0aRBxz9US54AcN12OZnmE7SUEg2+80BI0u
   +f/BUOrafaupRhL604pyeaIWax8RiGtwEl4WX0NRR4fZ3PutwUw5pUaO+
   KT5N29B3bnjsaZ54USvYSaQbz2xlZqvncACpZXEl7iD5nEBc3qwIQuXEP
   8/05avLGaLSUWhZWkaOzhrynZLpWDAzdmKpk5bohLQw0Ie+0++uYH6c4a
   xh0JIRcFsXRvtLjwEQGJM6BS+dWgEBBugz9ADrBlN5nde8iMG55qGMXK9
   g==;
X-CSE-ConnectionGUID: s8pTnMm3QE+BMo8I1nFAKQ==
X-CSE-MsgGUID: FEDRDcQ6RfqhGsBlu6f8sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82230908"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="82230908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 07:02:22 -0700
X-CSE-ConnectionGUID: 3V2ewZzbT4G5a4ctsqa9NQ==
X-CSE-MsgGUID: RwK02b8rQbSnPhp/40wtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="242692542"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jun 2026 07:02:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYOwE-000000004Uf-13R8;
	Sat, 13 Jun 2026 14:02:18 +0000
Date: Sat, 13 Jun 2026 16:01:51 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "__set_task_comm"
 [lib/tests/string_kunit.ko] undefined!
Message-ID: <202606131521.p7XfAbVA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/sched-Update-get_task_comm-comment/20260613-002327
head:   71cf6c96a43d5b1b807277ef0e81d193067a9ad5
commit: e24677900b1148bc206fb3a08e057a21859567dd lib/string_kunit: Add test for copy_task_comm()
date:   22 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606131521.p7XfAbVA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131521.p7XfAbVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131521.p7XfAbVA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__set_task_comm" [lib/tests/string_kunit.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
