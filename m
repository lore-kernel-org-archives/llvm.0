Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD801E1024;
	Sun, 24 May 2026 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779589754; cv=none; b=VOERNhy6sQHgH1BZfNaR3EukNbymKueeoKMvVu2DqbLF+Ergeib5L/JGbXXdLr1mKokcsewwKTFxOrLhPB4h3Q0GuDUwzZIkpNbpFGvMl/7shDOLyKCPKLX+gVMk6FhChbaZAfvEEQoLj15xhdA/bI1wcmYJoW7TQ6ScjXZVf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779589754; c=relaxed/simple;
	bh=Sv88Thol2q3paZBm6JsttNIqv0Jp5osaa4VbxgZRJhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IFccnlCbA0KwtLjD/barRzalNsKJ9Fr9SdIE+tKexoQOItwjF/NzN3ZaoSQvBe1PvksgCaA6x1b05ezQp5EtqSg3JVdK0mBu9rHiulpum+pXVeJFLeKEdVdEUMRv67FOA17yQN8W8BEu42YZDQChQRKPB1LE8vSWqXr/vK7WLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU6MEHgW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU6MEHgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779589752; x=1811125752;
  h=date:from:to:cc:subject:message-id;
  bh=Sv88Thol2q3paZBm6JsttNIqv0Jp5osaa4VbxgZRJhk=;
  b=AU6MEHgWG1p2YZsLYG8kBgqmJwVoyHYIOM3ScMVEMr8/28HY1sls50t9
   /xi+9zSZk9Kq7WwaZLI+3P27b1BwlQS3Ic5cg2f9RUFkyjE/8e2FSWvKY
   moh0sECY6E0I+1IPIfEzM1jQFDlsh/8baoLHWgDgiWuswnoByJAz9wo1x
   pCu2+fkRNcR8mbA20hKbTx77FFOg1ClB3MhFml4CFDA6d/V9nT5yhQzGv
   A6D182lRKaiJicjMQNOwzTZRaS2lKI8V7ZOE4snKfVL2oEPZfffAabb+O
   7/i3hSq+PW6PYynt0piE6UB2uYsrjoxEi93ttEBJJjCRUAeqd98E6JjC/
   A==;
X-CSE-ConnectionGUID: 8E1KtacVTk2uHMJp3hMooQ==
X-CSE-MsgGUID: L9SFlHl6QMm9qqUUyQurpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84081857"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84081857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:29:12 -0700
X-CSE-ConnectionGUID: tRJWJO+NTIu+L3FQsJ/82A==
X-CSE-MsgGUID: 9fpLeAtHTOKU8NZLeiyiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="265113068"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2026 19:29:10 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyaR-000000000bZ-38G9;
	Sun, 24 May 2026 02:29:07 +0000
Date: Sun, 24 May 2026 10:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/40] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/comet.dtb.S'.
Message-ID: <202605241006.bgMKtnDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 9ed7172993b8e76f687f481352d61a880dbc3084 [20/40] hexagon: update build system and Kconfig
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260524/202605241006.bgMKtnDS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241006.bgMKtnDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241006.bgMKtnDS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/comet.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
