Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786973469F6;
	Mon, 29 Jun 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754426; cv=none; b=SNscExJPXu9+EcmhajqNFvjN0dwMzdnLSLylw4ft19zZLAvz5+slRIEl+RQsxsgTekjlKpTkjVc2IHa3YQEaGI6CziMMPvkAqOovyI8zHzAjcZ838yMQ398jKro1WooDas/y3uNstp4Sv/b9r2exU62DI6p4zZM94hIpdxVo56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754426; c=relaxed/simple;
	bh=YR43sClRXWiAsQb8lEupyJYaTdAW4DsglZa9nPm9eDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=baS/FRne3BmGhcKMOlPZyw7ZYzvQjPRGDS7PBigfMddIVg9nZU/X15z0f7WYfJ/jRMjyvK9H5F195V+bLVvUDUcSDXxhdhWvU8rjQD9nzFVQ51wdyfVjJ+JuIW9Pb7Ydx6FNVyPpTQHCIv1qb7+Q+kXWlNHm+rgc9B6r/hHOc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBbcnJ00; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBbcnJ00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782754426; x=1814290426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YR43sClRXWiAsQb8lEupyJYaTdAW4DsglZa9nPm9eDA=;
  b=dBbcnJ00IAi55fzCAu5Hh3Q3nstUR03DhwOh6EnCeyLwitL0UetGGOfc
   4hM/DfMRGIL/iBD/ZL+UqV3C1MHA55iWR4hJaNRRz9PH0lNy1/4TmzM4W
   dB/vvZz/5oOHoX3X+tWomcRYoGBzHWwhHK8aht5Cgk6N3X5prJAc2Pfpp
   //6J2YBVLtMulawrzDxoGdMXQExPDUY9jQlvqYLCnnwqNNqz+GEAiVbyW
   UbZTMyrRoFFQHFpCfV+kBdkTJ3UZyajXQRAzQpXZFgalQK56gDzuH+hut
   r3B9qAmFkmY/4j7by+vwI6DY6FZywihlUlZNHIB3yJEj3aq5CQsResNkC
   Q==;
X-CSE-ConnectionGUID: Z/nIEpLTQUGdzDDI3pkIGg==
X-CSE-MsgGUID: tErB39H0RJa2TYT1vyoqTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83229362"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83229362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:33:45 -0700
X-CSE-ConnectionGUID: d22/3cKvRy+dAL4fHuVN3w==
X-CSE-MsgGUID: X6ltGpj1TKKwIvoZtUaEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="253928510"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jun 2026 10:33:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weFrY-000000007cV-3UvT;
	Mon, 29 Jun 2026 17:33:40 +0000
Date: Tue, 30 Jun 2026 01:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 36/123] ERROR: modpost:
 "sdio_claim_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202606300155.AlMOLuJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   657e76ed3917dff420bac3ef896d1a908149e32b
commit: d1281d56698342b1c67d5abf64fd11e73eba0e75 [36/123] rtl81xxx: Hack in SDIO.
config: hexagon-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300155.AlMOLuJ2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300155.AlMOLuJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300155.AlMOLuJ2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sdio_claim_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_readb" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_release_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_writeb" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "__sdio_register_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_unregister_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_enable_func" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_set_block_size" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_claim_irq" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_disable_func" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
