Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8F4D597F;
	Mon, 19 Oct 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406443; cv=none; b=SPAQiXoi4Ybfaj68z2mUzowqRWrmVokFwrL0vvptfVyVgJ4tGNCDdMW+LXTTFKrIDEqrgNr0exN1SnioLpkRbSy1sE2CnmgFQSalChbeIh6verLOk3a4LD16KZq8GBEvas2WZF/1oEppjsFXd4pKDCdye//3rO8s10Mno1CFdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406443; c=relaxed/simple;
	bh=uDyJHrAJC2AwpiwIgpu34IXWpGrJE1ez7QhcnYJ4ANk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qaIdc1rem6ghdvFaSNAD8jmqJefWPLq3yTw4cNTk+ml0IgH4IilaUoJcN/NdIMOheMZROgkxeIAUokWO0MuQFTdVlqD0qF2pxfedt7TZqBGrpvCjxRnSQxr9fwPRhKJTZ8cmkLd4Z6722skq5W0ch6CvHh5rqWNutT/G6zJMZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPvmXCUQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPvmXCUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792406442; x=1823942442;
  h=date:from:to:cc:subject:message-id;
  bh=uDyJHrAJC2AwpiwIgpu34IXWpGrJE1ez7QhcnYJ4ANk=;
  b=fPvmXCUQ61YQi6NEw0oVeoubAYnktBOxuPpbw4nMf2enNC/U0PKHCtBT
   jiPWsA/KH+KxoGvEE0Fq5aL7iLQJkKkcokYrgImJVq5zy4RMoOE/5lGMY
   CWC1qiF5mSqA0WttcL0kI1l0MPhing1zXxVjnWDBHYwNw/9891puoL63Y
   3U5YoL+NSePg28fit0McHvatvnz8lbo5iJBbMSepjXRErIXte/fxUeTDk
   gaPqeb81sbPYMnGPBUobc6xXltEh0GE70qUKfirpCBP8d6KS8AVRI54Yc
   iTWle8zeulVMEyJ8LSP6f08csDR4WV1QtYti0L9Gy//VIR1ITV4U1U5fj
   A==;
X-CSE-ConnectionGUID: F2Znt/5uQJSsURODC7MmUQ==
X-CSE-MsgGUID: AKpgkzAlSK2+i61iHNV0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="955741"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="955741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:40:42 -0700
X-CSE-ConnectionGUID: jzB48PF4QRKwOVAms56Ojg==
X-CSE-MsgGUID: MMLZBy98QOeoZx1RLIk4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2498783"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2026 03:40:41 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIknG-00000000LYM-3DZK;
	Mon, 19 Oct 2026 10:40:38 +0000
Date: Mon, 19 Oct 2026 18:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 3/22] ld.lld: error:
 ./arch/x86/kernel/vmlinux.lds:51: symbol not found: .init.data
Message-ID: <202610191847.32rKj4UN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   1abf4915b934f55c588e220cfc73188a5d4f13a7
commit: 068362bb0da766e787836ff1d76d4240bd0c09f7 [3/22] x86: Combine .data with .bss in kernel mapping
config: x86_64-randconfig-1007-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191847.32rKj4UN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191847.32rKj4UN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191847.32rKj4UN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:51: symbol not found: .init.data
>> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:51: symbol not found: .init.data
>> ld.lld: error: ./arch/x86/kernel/vmlinux.lds:51: symbol not found: .init.data

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
