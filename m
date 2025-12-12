Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9729D26D;
	Fri, 12 Dec 2025 05:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765518872; cv=none; b=JsQvutyqvcxbWRyERYk8bHA7yktaIFk4Y/m6v+k6hmc8K0DB0e6tF9H8MWT3exCbPgJUz4z1uMrHhwT0Vp2H+vhBnKgj1Hbo15w2m7gEDcOjTxOhUXBeBlpL6qyC/1R2M4StvGddUAyFfUtIMEvx56YyFdTUemIilvstyvLWXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765518872; c=relaxed/simple;
	bh=cdcoy/ylZqdFLf/FLYgDK9gISpuHcHDqocqci8DSTdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4TJ4ahpm2yDJRqTaaD7oRe/6QSXHvG70aK2PwM+JHprIn50y9h4vr89T0Iy0Uj1Rcs0BGK6ixX8OfmXcQmzDFdhRh98atiZcduz76y4F+lUJ6jXKLnOsbd4Ksps1YQjoK6YR41bmTU+2j2xz1oh91902i1kGQRxw0Bjx7UR19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jq1WRODw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jq1WRODw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765518871; x=1797054871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdcoy/ylZqdFLf/FLYgDK9gISpuHcHDqocqci8DSTdQ=;
  b=Jq1WRODwKJV+xfxJgq6FUadjHqMgkCq7Wp2P32f27xqySRELZ7PXkrTb
   fMBORvQlY1X27EziUHyyYMFRt4FPXA4fHDH1bnviVWCS5LZsCcrEk02bF
   OD8gYQ+H7Jy3OuZRoJdaBnrWxPk1GKpWBnL2nTQv1oERmsQ81oc2WcKsh
   vSyau8GJhk7ZlqKl5llzCmuxrxhlJ0xjnJv5KIzc2sbb1jjXZ6QuvupAW
   Apu7bZcUNaLNX787bpUJuv7EkrhsBb+QiTkDpCgsShKRbMzLkweTEdPZV
   xcUMHg0s5Tt+F2Fg74yTmZ4jy6DQFdoZ/zVaNf9rJpBThmUiIX37QbYBx
   w==;
X-CSE-ConnectionGUID: OJKwq8WdQyaad3M4JTwvcg==
X-CSE-MsgGUID: Tu9nsTYSRdexreySblnWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71376206"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71376206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:54:30 -0800
X-CSE-ConnectionGUID: 2ECIpUtlS06nmniSMBRjYg==
X-CSE-MsgGUID: upT922VTT/yKPiS/8R+ang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197481592"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 21:54:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTw6k-000000005d1-3m1O;
	Fri, 12 Dec 2025 05:54:26 +0000
Date: Fri, 12 Dec 2025 13:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Warning: drivers/accel/ethosu/ethosu_gem.c:674 function parameter
 'data' not described in 'ethosu_gem_cmdstream_create'
Message-ID: <202512121333.p47Cgn9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 5a5e9c0228e613f0ef2a58b9782d7c0ea8f1e58b accel: Add Arm Ethos-U NPU driver
date:   7 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121333.p47Cgn9e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121333.p47Cgn9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121333.p47Cgn9e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/accel/ethosu/ethosu_gem.c:674 function parameter 'data' not described in 'ethosu_gem_cmdstream_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
