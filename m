Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2D1AA1C4;
	Sat,  8 Feb 2025 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051290; cv=none; b=c60um6zEpQoumAkVolCrmtcuJR1F2FyTKIiOWqSXQmKtcGK1PLbLaCBrMzcVbQP1rQWEhyESQJiMBDAXu6a85T2nEW8iNZJXGSbvLOL4f4hW2w6fCGE8Sd4Z8eLJyizxzRXhaRh/YfoRmOTWjnAB5fpe+79JQIeycpMyiyeT7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051290; c=relaxed/simple;
	bh=yRpAji//R/+zihpMPNWtd4Ml08zDCqdUxeAInT0LxVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nv5+gsReKKDCXDg/YXad4BOLyLseEb+xYGtYICb8NGVlTLexrKWsM63InUgwqWwk8fFcne2qViapBl1gua8gyz8+O8XJfjQiEP07nN9dyG7t5BCaoY4kP+LIxRnSsD1ni6NKdIJ9dqKAWInzv4OVmRqc8ucdBPgEla/xYK6++zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOug9e73; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOug9e73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739051289; x=1770587289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRpAji//R/+zihpMPNWtd4Ml08zDCqdUxeAInT0LxVQ=;
  b=lOug9e73sxz5gBbg4Hn4EhKmzubcVqII5jl5W5G4NxdgJuZ/rM37H5IY
   mpH5yVkVhhhlWgcGw+wXZBQw/nateiTOmch1lIwpsIqi0MLf94p0dWEzg
   sv6quOAms0earxbPoR8F+vaBMSjloAxZ5YIhjQTjQrYQ2gLsjuav8XdcJ
   22Viifm1GeZxhH76NZqhqnnSkBrORHZ7H9Kw0Mdqv1xNE1aL7Za69n3+7
   wumVtehoYi+0l0JdOuGeckwOxGc1W9aQ+ljaIMJpt1DJyp2g5FLOrikDU
   gj94Yw/vZRoQf59ubT1lht8uFM/BuHuM8WBavCKUQuWFFQb2Uh4rIKL0n
   w==;
X-CSE-ConnectionGUID: 5njoEu/hRy28Cfi8kTBMCg==
X-CSE-MsgGUID: Dg2pu10sSGC/4kKUqammDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43433789"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43433789"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 13:48:08 -0800
X-CSE-ConnectionGUID: JhPo+tfyT3ic4RAVJ2wTPQ==
X-CSE-MsgGUID: 98u/e39ERZC59KM4A3bgmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="142702542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 13:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgsgG-0010g1-1n;
	Sat, 08 Feb 2025 21:48:04 +0000
Date: Sun, 9 Feb 2025 05:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 28/77] ERROR: modpost:
 "imsic_acpi_get_fwnode" [drivers/mailbox/riscv-sbi-mpxy-mbox.ko] undefined!
Message-ID: <202502090549.bb59bxLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   aa50b53026d20b9d37c6d17a3cf2f42e65a2a636
commit: 13851aef320d7e43e85b08933a00593dd1322653 [28/77] mailbox/riscv-sbi-mpxy: Add ACPI support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502090549.bb59bxLC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090549.bb59bxLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090549.bb59bxLC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "imsic_acpi_get_fwnode" [drivers/mailbox/riscv-sbi-mpxy-mbox.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
