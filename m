Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C157263B;
	Tue, 14 Apr 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178788; cv=none; b=aLZfM22oZ9asm3MBz+7bDLDFrlSLu1j7/0UL1yzRWAZ1JunOEKvGAvTVxz1yldxJZOs7o7TASKaSFhbEQez48gwD5b96TXfPTSDro2Xx4acBRdT1LIsUS/liUikMsISGFQTnBajQ6OhvXwckEak75H+eg8b3SjyoY+ZpOfDYWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178788; c=relaxed/simple;
	bh=OiIxkv4y6Tse4JPNDhwEsDHtr/xNfsjFOakzhZ3DGGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bz/ABBNJNczFlACGE1JeBFfLeVTFvLUP87GyBdiardQa0DXdGYAZQeH2ohBx0f0BWKql4Mhnb4pQKTtCr0WaWnFkco5351rereT4mbGR0gmPkF6Z7OB9eteTvq98IERQZSr6ddrKxeKehGL1JsQAN9eOE2Sh96leRiWdtkNLLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIUa6cCY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIUa6cCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776178787; x=1807714787;
  h=date:from:to:cc:subject:message-id;
  bh=OiIxkv4y6Tse4JPNDhwEsDHtr/xNfsjFOakzhZ3DGGE=;
  b=NIUa6cCYMlhMC4Iz9HsYPlMxAtqscYEhcaKrHONCRBt/EFrHYmp9Fzo5
   TwmVZQ/LUIsy+tMPcWUVD9QiVCqAuLhlApHpJMcSkzCR02sTfn1rqQd1r
   /bWkFm/5qy8PxdTCoT0P2VwLzhxpLCU20L5L479fSWWkBWbfLwsVLD4RY
   IZxmMI5qEteNExPAcXM59E8arW92nbb/5LFAl73Znxc1LhR63S/VIYEEp
   Kxpzc73XkrOI+8rRa9a2UMhN2nAz8mGBKAgIEJ0npw0a9zvcVpFMKTyuk
   0DoecWEolmf/qfKX/2x/of53ckEb7QvLWmhxqb5FEUomSvKIf+TTOvV+J
   A==;
X-CSE-ConnectionGUID: 3tuwAKxQQUS71zZvKaTBTQ==
X-CSE-MsgGUID: /0BFwIQ6QdGMtA3vjNfefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77164011"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77164011"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 07:59:47 -0700
X-CSE-ConnectionGUID: UuloeLybSXCxIYCA8PenGA==
X-CSE-MsgGUID: Pe8kypZEQsWhyANxAhLHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235072569"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Apr 2026 07:59:46 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCfEt-000000001Y1-1XFl;
	Tue, 14 Apr 2026 14:59:43 +0000
Date: Tue, 14 Apr 2026 22:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:bakeathon 29/31] fs/locks.c:1650:54: warning: & has
 lower precedence than ==; == will be evaluated first
Message-ID: <202604142214.twdXIOCY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git bakeathon
head:   5ff2ff7a45070fa6c7c2e5569cc846435c5595f8
commit: bb79ce8021d8f0575ca2bcf23baffb9ef2ade9b9 [29/31] filelock: ensure that lease type matches when scanning for visible leases
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260414/202604142214.twdXIOCY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142214.twdXIOCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142214.twdXIOCY-lkp@intel.com/

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
