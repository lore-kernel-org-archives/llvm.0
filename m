Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7D1EB5E3;
	Tue, 14 Apr 2026 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186247; cv=none; b=lZMf/LGTkhWomDTK3hcLaq6UJzoIO2jhAVBCBQzYOCx9eolkTkd782n8h2UgfIwwHiy7VAtAdIKZJkkvZ9C1b65UTkK2RNTAma/UI2llyKOnqR/TKiejgeJ4mAsIlyA+/W3XAGuZC0eqoRVlHTKEltjQLhbI/4T/oMo7j/zuVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186247; c=relaxed/simple;
	bh=kj40bAU+Pe/9JLRPI+koTYfjpGsvj7LCUkhVi66Fofc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dz4rh9P0ajAFMH8f6qtde4Nvq1dKCyAGIQMfM75QJ1DDP5JY19Hn+fyKFUsfc0VAyA8uzUR74WqiOCrEtjyuNprGISYqMIJMUjlMfVeEJYaEEcn2+x0YLI1SthcyMp5hMLGaEpHCn5qaQ5Ge+/pek+9doJg+aoOyiWxFblDsjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwYRiTEU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwYRiTEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776186247; x=1807722247;
  h=date:from:to:cc:subject:message-id;
  bh=kj40bAU+Pe/9JLRPI+koTYfjpGsvj7LCUkhVi66Fofc=;
  b=FwYRiTEUlMd2QRbbimFoBY+V2VxPFagiQzdAz+b9r5h2Dlwiipqn2DPx
   3kNJ4VGV+wAdIBG/B4rZ3rOgq3EgyEKwDTuH7tR33NamhTq+VxoggymrS
   7Pg8cpsBpCJpTN68jJUy8uuVcIJveMpRtgyb+erePwbu1cvHZ0H26qA9c
   jiDGM+bB5o3fnKl6OT+hyZ5UYgWQs+E/wqn5ZRfo3I2eDvgmYZtSrcxhG
   w1E2+6bFI21j3S8Geqw3Db6jXv8lHuXSewrfnM4V7/Es2Sz7mgC1zgsqX
   7beFvwTUItOQoi+jNMG3kfH2edEwMD0GDDAedg29QfB0sqotKR8ZoRX/A
   g==;
X-CSE-ConnectionGUID: 9bWCoAkrRLmNo+ugrpnPgA==
X-CSE-MsgGUID: Bk/QYYe5Qa601iPli5q1Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77224719"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77224719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 10:04:06 -0700
X-CSE-ConnectionGUID: 9V7lgIfzQy6TcJxJ9j78Gg==
X-CSE-MsgGUID: iH0e3iBgSYSYaE6F3imKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253546580"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 10:04:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wChBC-000000000Sv-10Lg;
	Tue, 14 Apr 2026 17:04:02 +0000
Date: Tue, 14 Apr 2026 19:03:45 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:bakeathon 29/31] fs/locks.c:1650:54: warning: & has
 lower precedence than ==; == will be evaluated first
Message-ID: <202604141808.hziAdYby-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git bakeathon
head:   5ff2ff7a45070fa6c7c2e5569cc846435c5595f8
commit: bb79ce8021d8f0575ca2bcf23baffb9ef2ade9b9 [29/31] filelock: ensure that lease type matches when scanning for visible leases
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141808.hziAdYby-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141808.hziAdYby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141808.hziAdYby-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/locks.c:1650:54: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
    1650 |         if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
         |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/locks.c:1650:54: note: place parentheses around the '==' expression to silence this warning
    1650 |         if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
         |                                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/locks.c:1650:54: note: place parentheses around the & expression to evaluate it first
    1650 |         if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
         |                                             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1650 fs/locks.c

  1646	
  1647	static bool
  1648	lease_type_matches(struct file_lease *fl, unsigned int flags)
  1649	{
> 1650		if ((flags & LEASE_BREAK_LEASE) && (fl->c.flc_flags & LEASE_TYPE_MASK == FL_LEASE))
  1651			return true;
  1652		if ((flags & LEASE_BREAK_DELEG) && (fl->c.flc_flags & FL_DELEG))
  1653			return true;
  1654		if ((flags & LEASE_BREAK_LAYOUT) && (fl->c.flc_flags & FL_LAYOUT))
  1655			return true;
  1656		return false;
  1657	}
  1658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
