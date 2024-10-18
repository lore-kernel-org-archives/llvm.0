Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7516F13D51E;
	Fri, 18 Oct 2024 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236676; cv=none; b=Yr+8osyjoe0/r+zfivDossgiX/KWsvhcHjREMrMko4el3P7+nSI7heQzCSF1JplR0eGQGp1ncXJU0vrPnL1nL7Utua56pdyeuWXDFyov/viAPdFtujEhVjPVHpofkace7rOf9WQvnDpHPRj5tVCUYqpRSy4Ytk/uvhIZIz55Pq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236676; c=relaxed/simple;
	bh=RTvj8DeFCvE6dk1HGC2IE/UVpb1WXHdT+U+EIQpBTys=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0l76Qs8MR4GQjD/6CZN8BKFWQrooihy4t+6DythuCG2cBQkPtAO0BdkoZhVDJMuUdhwcT2Ch7qMUzaH50xhJbOeSUZy1ojfgNjuAbIXG3FYlj3/vpAPGuDdUXjgAxUEMm4wCnnXVaTlLyueQ2jmfstoL9pr9CAg8ZRpKVrWyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cC9J7acg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cC9J7acg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729236674; x=1760772674;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RTvj8DeFCvE6dk1HGC2IE/UVpb1WXHdT+U+EIQpBTys=;
  b=cC9J7acgo7Gh9KYXoGVt9uDG7x7Kn/fc+X7tLKWbVl14p8ZJCArHWxUF
   p9+qLQ07u8F50S/JyHHUFCMJ873KiQXon1gA2bWQgoOQ7W9M/TsfxI56X
   pvH0wnoJFXEojyNof5PyLI/LVDm9nXbCXEgNe14nZk0Kezir/KRKvrkj1
   pz0GXgEYmXTdMteqPu2uWEE51JsXJNS4KzLtiwTnlEs1aJXg/t48567Rz
   60KHLLkBup9cFDgPQgVOoM+J10m+DRinDgOxnCarBvEAck3E6d9g2wa0h
   ocLmcYCOLpXW2lBK0MlkyY1qXofpcBd0I3wq46AtRrPJ3SHzaqYxSlFkW
   w==;
X-CSE-ConnectionGUID: msV1SAmpTY2+0G2re3Os1w==
X-CSE-MsgGUID: NL1f/4C9Rl6IR6NiyO6GkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28856007"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28856007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 00:31:13 -0700
X-CSE-ConnectionGUID: vCwBNBLFSIi6piRg/XRDhA==
X-CSE-MsgGUID: XM8GfauARX25fwGW7Kixjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78454280"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2024 00:31:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1hS2-000NQ7-1c;
	Fri, 18 Oct 2024 07:31:10 +0000
Date: Fri, 18 Oct 2024 15:30:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 4087/5321] vmlinux.o: warning: objtool:
 xway_gphy_led_polarity_set+0xaa: can't find jump dest instruction at
 .text.xway_gphy_led_polarity_set+0x136
Message-ID: <202410181554.dT1KnkLl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Daniel Golle <daniel@makrotopia.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: 1758af47b98c17da464cb45f476875150955dd48 [4087/5321] net: phy: intel-xway: add support for PHY LEDs
config: x86_64-randconfig-016-20241017 (https://download.01.org/0day-ci/archive/20241018/202410181554.dT1KnkLl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181554.dT1KnkLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181554.dT1KnkLl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: xway_gphy_led_polarity_set+0xaa: can't find jump dest instruction at .text.xway_gphy_led_polarity_set+0x136

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
