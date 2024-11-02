Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F21AAE3F;
	Sat,  2 Nov 2024 23:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730590444; cv=none; b=qlAbyrsrG1dOl8HrMD3OkNCYIv9hDcGQdvsAyfxbYjZzJlLDkD780lWL/Z/yQTTMCJRdTlveeJbvn7O9nKTDR6slNRS2zrBm1JVU1ygFHFM+cGC5SeZlJQIL5QxLW+8jAhfPzBGaxgL3L7WYYbLg7+nld62cRr8wNH8T72y6jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730590444; c=relaxed/simple;
	bh=nHlfQKTvXjr/B6wrLrVbXS72ymWNEjYftlyHoTHouVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ui5h+Qp9VLxQ2U81P0y7MQWi90guvO8uOabTaB9XGEGKZ25zlLL8T7wicf5k7DDaUboPKdPKYyUUbuDjctKK5EAdN006JzNmsaBk6lcb4JVpBJYQXEd4+e+0gDVuJjG1xH03daHukkjOfto/XYm7oof418ctWqsRdtvJxOhQ0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVWjzPRb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVWjzPRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730590443; x=1762126443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHlfQKTvXjr/B6wrLrVbXS72ymWNEjYftlyHoTHouVA=;
  b=OVWjzPRbH8iBjTYb6T1wpi3EwdhOWUFPXbhVDdZ3rLKGqLptZfE8Sum6
   XJsokR6QdhESwVxP+AaQxJJVLcVbzRMZ92fbPv7/jAJ8hlxDE3QLldvUg
   q+DSUeUaT61AjW/JlWQuRFTNmQo2Kf2g0FP8sQJ7tVrMb8Uf5cT7N9U7/
   ykmgtijJp731klcn+VzbYIS1Nyu6cNcE3ULZtLKE/W23wW5AomG54uQ8T
   q8IKefi9r297Lll38obXQ/WtYsDa3axV5hTc/8/cZkfNUt5LpJv+ohLD3
   g+uYEa7meFBNZu1zSX3hWlZ3I34PuDcYmbjw19q447OURJJtyUfAXSqBq
   A==;
X-CSE-ConnectionGUID: kTR4mO0GQMGVfxHQOaMtyg==
X-CSE-MsgGUID: zbDUUaYFQrq+n3HCxVSA+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41413222"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41413222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 16:34:03 -0700
X-CSE-ConnectionGUID: 1BvyuQYGRY6lzgkUjJKKfQ==
X-CSE-MsgGUID: eRrDUtA2QJaC2bPv2/r4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83178342"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2024 16:34:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Nd1-000jSA-0c;
	Sat, 02 Nov 2024 23:33:59 +0000
Date: Sun, 3 Nov 2024 07:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 21/24] ld.lld: error: undefined
 symbol: arch_uprobe_optimize
Message-ID: <202411030757.quCx5yvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: 0200936b03cfee067eb7db4b44079104b561b726 [21/24] uprobes/x86: Add support to optimize uprobes
config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20241103/202411030757.quCx5yvm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030757.quCx5yvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030757.quCx5yvm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_uprobe_optimize
   >>> referenced by uprobes.c
   >>>               kernel/events/uprobes.o:(uprobe_notify_resume) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
