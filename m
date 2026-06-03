Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE642883D;
	Wed,  3 Jun 2026 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475960; cv=none; b=VbqlYMoldXnUl4BATjnx7Y99CFGwnrzvsvtEjjVg+7EhPU3TKh6hVbTXnH7HpRDh8YT2JtE8I9kPCEaUuKkLnkKWleYPhMDGyNbno27BbtKMymxoOpLYTD9ozKKLRKwb7f1fxasVlTE6RkDzCRDweDfRRUReDESDRae94fRH3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475960; c=relaxed/simple;
	bh=wL9cO5vTFjAX+rbQQ/4COcAsHnwO/nTAt3urSfc4y9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gExmDekmITvC7PXzFTs6bSvjOthm/CeyioTJloguOyegsn3xZRSGDzBK/25+YGqglNSPPbGFMN7Inui/haLAdlNwRaTegeHTVophg4a4FR334eGEDWsqsv6TSOaiA1lE6crLKOWuGT9J4kLhY1JHMmR6cn7pybzACkzkHbSJsVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpXmBu5l; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpXmBu5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780475956; x=1812011956;
  h=date:from:to:cc:subject:message-id;
  bh=wL9cO5vTFjAX+rbQQ/4COcAsHnwO/nTAt3urSfc4y9U=;
  b=jpXmBu5lWtayJ0XgQKJugciPWAGBx/3/n1ZKkS2g4vMjt+4ORyBJYbmv
   nx+1HrDtBdeEbeOM7Uem2EpPlCl1jOPEOZ1Z357DmKZWkLS9mL/tcRGbt
   qxa/WZsqKU81JbVDJ6x5R8afto9ezhUxWer6MWy6F4d1expNcj0psWB2k
   M7Li4te+zGN3s7i5DioKV3lXP5aqPO/343kDwdwebFvqf3LiQg8/MeVMX
   MBFwZs6DAHjY+trWtcJZSkOMI/8LLSgr6ZerNWkq4v4iWU7OMiSXe3gPL
   4j2P2tvbAizZ3NB6KYfDkdbTbrkG2Gge3zsg95N7+SXXPbPrG/Zg7YBCs
   A==;
X-CSE-ConnectionGUID: GwucoUUvQf60KguBXmdn/A==
X-CSE-MsgGUID: uA8b6LtYQ1S78yfgQfRxqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81457047"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81457047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:39:15 -0700
X-CSE-ConnectionGUID: prmmYnv4Qta25E+1OwHcow==
X-CSE-MsgGUID: ajwE+loqRfuhnWo+9wUueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="249236962"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2026 01:39:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUh83-00000000DAA-0uKM;
	Wed, 03 Jun 2026 08:39:11 +0000
Date: Wed, 03 Jun 2026 16:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 8/46] usr/include/asm/ptrace.h:33:
 userspace cannot reference function or variable defined in the kernel
Message-ID: <202606031650.MoLDfkga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   d99deb935033fad4dc63395a63498a77613df72a
commit: 9c6142c4359fd832a3ab06191d8ec6f52c83cd1f [8/46] hexagon: update UAPI headers
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606031650.MoLDfkga-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031650.MoLDfkga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031650.MoLDfkga-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/asm/ptrace.h:33: userspace cannot reference function or variable defined in the kernel
   usr/include/asm/ptrace.h:34: userspace cannot reference function or variable defined in the kernel

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
