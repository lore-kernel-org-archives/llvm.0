Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43C2BD0B;
	Mon, 11 May 2026 04:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778472571; cv=none; b=i4isXTqSE0+h2vtmFRel9ZK3Ojqa9EWkHzzy9czzWUfjNPK7Z5xD9KImb7GUwn53H4y1LIFQJx154Zv7BoRQKEw1mcjg7mklG6IoKjbcZU9jwOt74PjeogUDYtQJGG0v4o6k3KNfvBecpYrkX/f/D5oca2JsghEnkuOZm+sOYS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778472571; c=relaxed/simple;
	bh=z0GbOLa1EaB7RnD7XMKWOgGGC01RBWJYQWdN9jVtIr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4riLBt41V162Rb71jlxZtacd5CP5J4VR/xoQMD4nRyEj12Y3fkrXJdfBdorvWbkwOHBLdInzkOgct8GcihnLrXpmzfu3VaYfekAhq6FDPnBsx6puL2kK9PWRavgB8n9ht9oOT7MdoD1Jq7lP/USYvC2/KSUKLHSMNusoTsW4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQv1qU2Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQv1qU2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778472569; x=1810008569;
  h=date:from:to:cc:subject:message-id;
  bh=z0GbOLa1EaB7RnD7XMKWOgGGC01RBWJYQWdN9jVtIr0=;
  b=cQv1qU2QY5RdrDYSK2Oe3IUJU0Ihini4rtgccYcDPl5Amuc8IlCvW+Rf
   Z/AftlkG8K30Thx3iKiGJy+TIlPUorFnLd4fZ/z6x4oaDhaNtBsYo9D0A
   47dQai61JSO67IL1YmkGobzFbgZHoLBkaHX7jI0ikxyodfFyiJHBcUUmg
   G2ZRg/XY582fj+y49GC71jgQBL2xloLUIn+9r8JtHCh3FzAK5RyGCDPap
   KHWQKm6EEPi7xb2wsQa6SmOAP+2cQLDM4kUAdnMvUkNna+jLleTjdRxbu
   T0tsU8FWywZ6BKT69/vF37IsG5tj8bJGfIl9/Oz4fM/lZm0ZScU4ma4Kf
   Q==;
X-CSE-ConnectionGUID: RUKtJAjfTmOFnUVk5XlZJw==
X-CSE-MsgGUID: 3FnkVuu+RbqaCdu3qKxRhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81917913"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="81917913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 21:09:28 -0700
X-CSE-ConnectionGUID: ydvD9aCzQGKyLecTa+A7fA==
X-CSE-MsgGUID: iLFErEZqRjG47tr7Ek1P2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237435843"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2026 21:09:27 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMHxM-00000000099-2Ca0;
	Mon, 11 May 2026 04:09:24 +0000
Date: Mon, 11 May 2026 12:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Chen-Yu Tsai" <wens@kernel.org>
Subject: [sunxi:sunxi/dt-for-7.2 2/4] FATAL ERROR: Syntax error
 parsing input tree
Message-ID: <202605111200.am4cLJ4C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-7.2
head:   c6895beaf5eab889ebdaffeb6210ad1111f3e72e
commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474 [2/4] riscv: dts: allwinner: d1s-t113: add hstimer node
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260511/202605111200.am4cLJ4C-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111200.am4cLJ4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111200.am4cLJ4C-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:301.18-25 Unexpected 'GIC_SPI'
   Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:302.11-18 Unexpected 'GIC_SPI'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
