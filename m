Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE492904;
	Tue,  5 Aug 2025 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754371142; cv=none; b=exFiS7TJG+2hCcUJSK1YEsZqBAzV+9KLS9dy01nREC5xqvYuBaRCcalP3VF4Mwo84gRMa6P1k5kxfKzf+pogPcbQdEM+9z82eEnjAqwgv7uG+mpxNYVbaP/J47fIRNhjhGtyomTMuNebgVq3hGUGRsZS+sZwL0dH8Bt71S4vVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754371142; c=relaxed/simple;
	bh=N7axprnR4juTCWxX9fZU87guxMNeA4tjXa9z3u7ZVjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIkEw+IrqFAo2diUUgZ/vv1xEkSkmLRAa3rDrjDuo/ZbAB7lNnvVOocT3bNME1KQAMv098aydB+T+w6L2ShPY0dLEaM6QBThyzsAfMFeKuP/BVUyG7TYvITHAbXqPrxAztSSAzumec1iLTSgOTa6OMcPMk/BTPVo9LV62NsQLNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFw7525n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFw7525n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754371140; x=1785907140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7axprnR4juTCWxX9fZU87guxMNeA4tjXa9z3u7ZVjE=;
  b=SFw7525nJRAIrPqfwbD4vp06W50s5uZ4fwVo8VoeTimFq5LjZpvpuL0e
   UnjBjvjhUO1/V1gVRBLe3DLwDVSJvJhmnjk7g8E7nK/fzaMamLdsJLjDv
   NU8tVs5ArxsEpxbZP6q/k7jr8bXjZpM2nY4r9wYPDllzbXJT8J92YGlj3
   S2kmRsJf0r6VwU7pSr5jziEyWR3anWlUWiiZgv63byM6Vxrk/OS0puV/J
   x7t7dLuSMY2ZWxjfUTXEQVIFdzWEV3DhwS5BhSzDCvRI/OkYxwYNanUKJ
   3EfegDrspp39i5e6deDzG/QmTVc72mDXBhv+vmx8Qprhp9GAvoZQml6Er
   A==;
X-CSE-ConnectionGUID: xRYHBxrXTI6/lh+E0K7cRg==
X-CSE-MsgGUID: loPo97VtTGyCdjUEoajvwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56614418"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56614418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 22:19:00 -0700
X-CSE-ConnectionGUID: MEbucgLxQy25Q6vLeaA0Mg==
X-CSE-MsgGUID: md+VrXVzSnKbAqxwCHroYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="169653717"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2025 22:18:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujA4J-0000Qg-12;
	Tue, 05 Aug 2025 05:18:44 +0000
Date: Tue, 5 Aug 2025 13:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileG7mYfA 10/10] Warning: drivers/spi/spi-mem.c:592
 Excess function parameter 'mem' description in 'spi_mem_calc_op_duration'
Message-ID: <202508051310.ZfO89Wwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileG7mYfA
head:   a22cf645290878f354837c99b1ed0d6930b534cf
commit: a22cf645290878f354837c99b1ed0d6930b534cf [10/10] spi: spi-mem: Add missing kdoc argument
config: i386-buildonly-randconfig-001-20250805 (https://download.01.org/0day-ci/archive/20250805/202508051310.ZfO89Wwc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051310.ZfO89Wwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051310.ZfO89Wwc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-mem.c:592 Excess function parameter 'mem' description in 'spi_mem_calc_op_duration'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
