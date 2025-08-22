Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34FB1F4289;
	Fri, 22 Aug 2025 06:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842563; cv=none; b=GHo1jP2/iT1AToKE0EYD1UhIYhzBM7Gp7SpxkiCe8r+y1YwvJbT9vgsNETJxyolRjZo4dH/cZ2xUfH0vc2goABTIjF187A5a9G6PX0Bd3tLgQ5fpQSvIP3TVD2TOzaYUCUzGtY3mQXWVi8VnAO6huuYVMbcpw6Vj3jWn1WYK5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842563; c=relaxed/simple;
	bh=+NPqbdv38fetVrn0lDnin2z6y3GhqtfzToIRn6eO6pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCS2i5P35bFcLRAcvoP4ArcsTFbJK4Sypfx/65PsCA0bC/k/j3GGs5PKeZj1FG8icTYLGjr3m9zBdlawhIktUVO8gTFuzOZuhK7eS+zVoIV7oik+KPjfyIA+rdrBSB6intBuhcf26/lqi6+s6LY22hxvvE5aiqYXf7P4RhwaCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMQq3keO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMQq3keO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755842562; x=1787378562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+NPqbdv38fetVrn0lDnin2z6y3GhqtfzToIRn6eO6pc=;
  b=lMQq3keOB6sGC6lGEsu+qr2bksuFF3isFmzz9GWQ9uKfA27eD3v1xz7L
   m9Pbx9wFKnG2nB+79k6UohKXevJmAJBqNJKrFRROlzs0FMrZ2xrj6T56F
   QYYnHOSWDBivRV0Iw66VLCXYkgG3aVd41DTJyNbeftUXOHDvOE4BH2CFi
   cKZjAqAheIySnvYVbzjSMGEEn0nrV1ITMrArW+ZHrXKjUitl0pAMc0Kb/
   Qu8Sl7QqI+8kqckcwUv/KDyc3Yra4nN/RcRSPq7E/zoOJ5g2071wqqV9T
   +YmhoYeXUfad9uWzkqFnJP//EFhkzlQs87fkCjh0QYwGJwlWSa+342cyc
   A==;
X-CSE-ConnectionGUID: 8EjGPnJARqeugSHFCxzdrQ==
X-CSE-MsgGUID: K0dxM/myRl2Liw2p0K3j9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69516641"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69516641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 23:01:54 -0700
X-CSE-ConnectionGUID: VIbIxPTvSBueLCake4V/uw==
X-CSE-MsgGUID: 1++NJTM+TDmp3YHWP1j9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169440821"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2025 23:01:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upKq8-000KxP-0Y;
	Fri, 22 Aug 2025 06:01:44 +0000
Date: Fri, 22 Aug 2025 14:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 47/48] Warning:
 drivers/tty/serial/8250/8250_core.c:577 function parameter 'up' not
 described in 'serial8250_suspend_port'
Message-ID: <202508221357.BFL3PhpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   0926f0595441527a1b067314368d6b4afd949a09
commit: 07e7f9e30917ad531ded38bc825a161b2561a765 [47/48] serial8250 port operations work on struct uart_8250_port
config: x86_64-buildonly-randconfig-003-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221357.BFL3PhpS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221357.BFL3PhpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221357.BFL3PhpS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tty/serial/8250/8250_core.c:577 function parameter 'up' not described in 'serial8250_suspend_port'
>> Warning: drivers/tty/serial/8250/8250_core.c:600 function parameter 'up' not described in 'serial8250_resume_port'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
