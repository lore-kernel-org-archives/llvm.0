Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA42773C1;
	Mon, 26 Jan 2026 06:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408587; cv=none; b=cLpz5PCSmAY8v9N5UAd396n3Xdcw1q6p7X5VIYlTOcI4RbpmkTHSZz78gZnkgpyZi3FmcjdVKqUp7Xm9nE8AgbNvc30rV/L37WAkYLE8cBNysRUlyJ8CRKbeHMJXAjMTrX0VWChTyy4BEzOUZqUd9p/btpzOKa5EKSMZnryAGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408587; c=relaxed/simple;
	bh=0CdevH3a9D4SYG9/dPZlTvG4v0FMYdSfyd0GPc/85xI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vs1gpUFIkCC+f4XpwGKGE0Wf0dtCUESfrFrrmoZdmZ3ZBYXuqdLD0WdHALtKXD00+on8SMeVjd/M5mOg0oCVcawtXYCskEQ5faB9L+hNhwxK4UyZkcFWYmHr/sWIZBy875ivlm8gTXaRzFEmT0cQWO4lNO0qEcCY5paceH3Cx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAM6xwP8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAM6xwP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769408585; x=1800944585;
  h=date:from:to:cc:subject:message-id;
  bh=0CdevH3a9D4SYG9/dPZlTvG4v0FMYdSfyd0GPc/85xI=;
  b=OAM6xwP8HTMy1fz85EmSet37bTcMt5ICKJ6lqUmEr6g+9nVZY+hDcC8I
   5RIjrGoEpkmx+wHdhI/8MmmuLXiBSbGXEzhBOy6XJSupW5+SAm7MR0+GS
   /1OhITCZtP6Sjhd3QqJonfF/hkG+vQ3JcRBNxpaJibRvrgfABB9Y/r7SF
   vB+4tR0NwruS4ECY2/VKrKUPvdcndxK9OktbasHhuvA9j7VSYS3RzKdk2
   qFWaJgvjpeHJeQtwsg2zM9JWN6XxNQwbXKTlP3fOkqNL74y1BJF8s/NLU
   v9ParmPTwtj+KZrqfa+VfmCjfDYtI7vZjIbemvWwmfTCLpTi4959HhMdt
   g==;
X-CSE-ConnectionGUID: losMMatfQJu9lsRECNUCNQ==
X-CSE-MsgGUID: xx4g2U+QRFWvn0iI0Qm1/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="58158194"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="58158194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:23:03 -0800
X-CSE-ConnectionGUID: pjmfP5YVTeGJnRtZHBbqdQ==
X-CSE-MsgGUID: VeMkn5i8Sd+2VzUKYWblhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207406809"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 22:23:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkG02-00000000X0A-452M;
	Mon, 26 Jan 2026 06:22:58 +0000
Date: Mon, 26 Jan 2026 14:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>
Subject: [rppt:uffd+guestmemfd/missing/v0 14/17] ERROR: modpost:
 "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202601261459.BTA9trhm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/missing/v0
head:   4ef69952db49cd0d355a1485070765e8b7006397
commit: 30138ea8730b8b7db50f96e4cee6ffdbb6243052 [14/17] KVM: guest_memfd: implement UFFD minor
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260126/202601261459.BTA9trhm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261459.BTA9trhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261459.BTA9trhm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
