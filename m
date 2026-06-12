Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A40371893;
	Fri, 12 Jun 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251668; cv=none; b=A+tgzVUu7sO3iH4DN3BbkpGBy1aJp/jWfsynzVWuntArgtmNheYtfIhdJne4l5X3RXvGEwVu/Em/eCT8su9GoCGqpNAR423hGRM6rZQo7olAPJj7S7YUKOqpzwXj7F8bOqevK5lWvTO+TT/LAfqzxntX4pc7nxX4MI4iJTIFWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251668; c=relaxed/simple;
	bh=9/PhghjZ+xd54UoLUQixk0uTuDw8IDQ6yDW5K3ErHBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Piwg/ilhu2sS0otyV74hsR90JPB75/Ey9KfS6/AxCTxfCHh7qXi+T3CZrGLa/eh3cGcDwoqqn8pdNk3u6FpVEsg+aPLIKywsqbb+Wbwunrp8NYmrhprT/gcpuBO2ogZv11NXfCvNNfKJxzfCVwwAradYnt82zWd3jwRdY8qzCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPKLEPp/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPKLEPp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251667; x=1812787667;
  h=date:from:to:cc:subject:message-id;
  bh=9/PhghjZ+xd54UoLUQixk0uTuDw8IDQ6yDW5K3ErHBA=;
  b=JPKLEPp/971bbiEkrBBlFLCNZhmpYn224YsYAvXuzcOb9thBgwRKqFRm
   XLsPJSP5bCTZyuzAcI556CdSSLZ8XGz9KY9NafHShh8yZjUINxk935luY
   RG3uJ7gQK1QNnMMiZ2+BSAhKrXNbbMwTEt7ZH8RPlm409618D6hXjda0d
   E3NcoBGf5PpR6/twgxOv0yzpMCS43gCjhhHYG20A5auX1MjUB47K+/Qz8
   PGBTzFm97Jm2kJRmHFB4QsxkFoyzJk+LW4rWtrFOyiRAjGVBhGrOB/ZXN
   lCEnGAhJMfJv/trzis7bG//gQEAsE1j5eDm4KwOTMI7RrpwVeU0pgsZF8
   Q==;
X-CSE-ConnectionGUID: gEsGRSLmSHC6QsCop2+dbg==
X-CSE-MsgGUID: 6L0KdUICSW2B3jztEyowdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81093721"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81093721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:07:46 -0700
X-CSE-ConnectionGUID: IWsIa/rLREa+/ZubCc3x4g==
X-CSE-MsgGUID: ozFMRujRTz2+xwZqd3OjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270414943"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2026 01:07:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXwvW-00000000OTt-1zfR;
	Fri, 12 Jun 2026 08:07:42 +0000
Date: Fri, 12 Jun 2026 16:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [jirislaby:next_master 96/223] Warning:
 drivers/phy/apple/atc.c:631 Excess struct member 'sw' description in
 'apple_atcphy'
Message-ID: <202606121555.hvvZntPB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git next_master
head:   a225caacc36546a09586e3ece36c0313146e7da9
commit: 2fc247190dcde0aee3596b0fb87a0b5afa600941 [96/223] Merge branch 'docs-next' of git://git.lwn.net/linux.git
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260612/202606121555.hvvZntPB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121555.hvvZntPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121555.hvvZntPB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/apple/atc.c:631 Excess struct member 'sw' description in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:631 Excess struct member 'mux' description in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:631 Excess struct member 'sw' description in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:631 Excess struct member 'mux' description in 'apple_atcphy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
