Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAEC1643A;
	Tue, 16 Jul 2024 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721156118; cv=none; b=ZoOB0SMsUBrkJZjlA/VSbypSS+8ceYUTokrz0AMqKOsH+BWKrmQ50ylCHffAfCyWzWf3D0gCH8Tro0OMS5TPz7ncpVHb994F9fP01ny+4w7yRZhFPbZeW33M+QONymoZfFFVpQyREClVl52yw+IX7XoCJU6VfoYTZB7paBcAT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721156118; c=relaxed/simple;
	bh=6Hbux0N7M6pMB005K7wDKLTV5DAQ3bpn+v80VPcPfiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ptS8yeTlhG6t5SjgUmYpOSafL6A2dbEcwajbmffcZ4xUPbcLm9Qj+gfMs2m/Obopw+FW5UWWvSPx6+9MdPbvWuLtqn3O+SZ6l+G8FIPnmTmjJSI06s+YcpPaHc5wyemwv53ueC5gV9nnZZfIAf8h9h7yfm70kb6vbW4Wmz0gNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YopOD2zA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YopOD2zA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721156116; x=1752692116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Hbux0N7M6pMB005K7wDKLTV5DAQ3bpn+v80VPcPfiA=;
  b=YopOD2zAP+90dsb6Yodj8cs3rXbFK+gnnsqyqKDlJvRPKG8O41gNQLzu
   f8rss5sjr1tu7DSiyrh3MqMyWWXEztVWL7NmcPTKckosDqXRmzQCcggvP
   /EkfrpX+zzpRLqjctKy1rNKCkPH6rZkFNTyHANLNXZdgx0zdVZWRJE+tf
   EQ94SPfI7unebt2NEHc4w94KvZ2loeQThW8X1HpgEdfOg9khwuSmvHiAg
   6nt29DWlvQT+w7dh0vy7pleKUflrUMB6og5/NOhmanX+wU4P+1PXf5/3o
   edIBWGlapEpWLLjAmIE0LFT4rFvfYg3VByAi8MYZGyBZJCVujYBsB8rDg
   A==;
X-CSE-ConnectionGUID: YauJ7cYoR6K6z1RLo6WqMw==
X-CSE-MsgGUID: H+Z/3H7uSU6FruwpQKOo4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36060713"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="36060713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 11:55:14 -0700
X-CSE-ConnectionGUID: 2yyVFAh2QbO55QhzcBldBw==
X-CSE-MsgGUID: 57H7ShSTTVul3PZmwQWwwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50476111"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2024 11:55:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTnKQ-000fYA-2E;
	Tue, 16 Jul 2024 18:55:10 +0000
Date: Wed, 17 Jul 2024 02:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 11036/13217] ld.lld: error: undefined symbol:
 gpio_set_wake
Message-ID: <202407170241.yBgRPvz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: 917195d6f8293c35fcf9ed4bfe18f52cc1c9d2e6 [11036/13217] ARM: pxa: consolidate GPIO chip platform data
config: arm-pxa3xx_defconfig (https://download.01.org/0day-ci/archive/20240717/202407170241.yBgRPvz0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170241.yBgRPvz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170241.yBgRPvz0-lkp@intel.com/

Note: the linux-next/master HEAD 4f40be61af99a67d5580c1448acd9b74c0376389 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: gpio_set_wake
   >>> referenced by devices.c
   >>>               arch/arm/mach-pxa/devices.o:(pxa2xx_gpio_info) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
