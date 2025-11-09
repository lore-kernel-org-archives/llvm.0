Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4156261573;
	Sun,  9 Nov 2025 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762723004; cv=none; b=V7jXYqlIdg4OZLMnTyJ/5RclhvdFbSsFvjraZTZM7jpa9jbL4z1wlpQyRvTnsr5JHqRDP0vfVkNXfIckWlB6nCrBYSIKB74m+fe84xOYBUG9U/ShM4rCFYmcqbpW12q7nTwsPHZYhdOw1o4V6CZq0BHWKTydPekS768+VHljrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762723004; c=relaxed/simple;
	bh=S8Bkb92OJMyXMKvZUFAyvThT4GeleZiL0HbmUi5vJog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4ajv34+Mrl3wIlwQb1Beox4NDfOsixTC0Y3DaDTS9U3aIE3CYtvPAJ5sQYX0W1Tcyw8ogCrB8wZEGFSjUdcA1Vu5jtCSaluHrF+KXJvi0b/X5g7BX8DLS82UuiF88jtduBDTmyt6sANURHDmK/k3ht3fLItpYRelVG69wUAhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+BEksNo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+BEksNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762723003; x=1794259003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S8Bkb92OJMyXMKvZUFAyvThT4GeleZiL0HbmUi5vJog=;
  b=Y+BEksNoYPsRGear93m92HKLk3ES+bmQZsEdJmNMFAH9K4/wwfaKDWcv
   tx1ss/5uZ4cNw3nFocaK799KmhAy0bQO/6U6cwXhRFzEM4ueGOm2WgAp4
   RtQEvIuPzxdjPA/SrKbbZDIT3hO0NZY2d6M9gC2Js7oSLb7bYiw1mVop6
   qpB7CumzGZkKC/IS7Ooi1Mja91g1JmH/tCwupnFoNX2Po6K+IeHXrLGKv
   V+y1p5avpv2h7dsJ2NC3SmRYkA76TOPSQT/86H9L/XzvqsjGF6N6qbka4
   6SqwKe/YHyqhJItl2MjkolL5yGB+KE0AebyFlP19OXLyO65sDUqbKMWXm
   A==;
X-CSE-ConnectionGUID: RYMJz7DfS2SWMoem8TBBsA==
X-CSE-MsgGUID: uot34t4iQN6L5pnUoaNgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82407924"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="82407924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 13:16:43 -0800
X-CSE-ConnectionGUID: 7ngbqzglT9iXUheDNKmajA==
X-CSE-MsgGUID: bRiH9hRkRH+/7ZEwROmCdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="211925996"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2025 13:16:41 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vICm7-0002PP-0D;
	Sun, 09 Nov 2025 21:16:39 +0000
Date: Mon, 10 Nov 2025 05:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [linux-next:master 6788/7207] ld.lld: error: undefined symbol:
 ip_send_check
Message-ID: <202511100558.L879JqRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: 862a64c83faf7708e7e79498193ff5270543a68d [6788/7207] amd-xgbe: introduce support ethtool selftest
config: i386-buildonly-randconfig-005-20251109 (https://download.01.org/0day-ci/archive/20251110/202511100558.L879JqRE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100558.L879JqRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100558.L879JqRE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ip_send_check
   >>> referenced by selftests.c:104 (net/core/selftests.c:104)
   >>>               net/core/selftests.o:(net_test_get_skb) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: udp4_hwcsum
   >>> referenced by selftests.c:148 (net/core/selftests.c:148)
   >>>               net/core/selftests.o:(net_test_get_skb) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=n] || PCI [=n]) && HAS_IOMEM [=y] && (X86 [=y] || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
