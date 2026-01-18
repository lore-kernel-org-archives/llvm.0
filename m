Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB2500967;
	Sun, 18 Jan 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768735359; cv=none; b=A3GtNXugQKYsBfR5hDLyFbCsQ1yqp4asYubCuQqENN6F1kHwIRZIKS63xrZaI01nXwtEDAAknpx549RrB3URMxAKkGDqYTxBX8iP1ogzFxCZdIHGhaIGICtj5k+isoBtKL1CvSfijGtss6WKKaiILPjKp+ZeWLn4U5p4nasmaQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768735359; c=relaxed/simple;
	bh=4tRR2GdbslNDqbjfAAIjuWCUZJ0X+e70y6FVtq+8CKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EKVx9eWq5q8O+foX/R80bgt+yTdwDwDO/T7sDd+PC/bKBMGpvgUaraYmUqSolQR8gdn1+iklLoMwnsm1jz2bIDCEOVqxoqKH5fE/E7LaxgKyoBcYP8wbTqg7GOMOPmq4//0uW0X2CWUtDer81EZUbSo1CJfMNl2dyajVIOn6P+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCi5UqbK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCi5UqbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768735358; x=1800271358;
  h=date:from:to:cc:subject:message-id;
  bh=4tRR2GdbslNDqbjfAAIjuWCUZJ0X+e70y6FVtq+8CKs=;
  b=LCi5UqbK7S5jUHZ2oi7nJQGFotkWRCKWOiAu3MfjNdfFx7kcR7tMMU+S
   SQpGO2iwKzr+wYs+oF0biAtKcjdpOxsNI8PEj54Hxbzhbpf2shiKMF92J
   PWrzKosGSydiikX6hjhd1NFvj6v9oLKwlcARYPEGIz7tlo7B2UTsjJiwr
   RXnHOedqUw3oJWvUxyZ9hwMwJ0M8V03+s9dIdknUS+oTmZIn1CmyrgWRw
   hAiFMGX/lBcUeckYZAq6rXT5hnphAR42S2uj4t+SoO9NZpxKSVMtH70Na
   j01YlKyRYMZaPmMs9CBafsQURSylybeE2urZCHPeP57j8F4k7f5Uv8rhp
   g==;
X-CSE-ConnectionGUID: wagxnVNoRBW74Fen3S+Uug==
X-CSE-MsgGUID: lxkXRosgRkygTrx2DmwkjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="68987864"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="68987864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 03:22:37 -0800
X-CSE-ConnectionGUID: q5OQvt3wRDy0NiveS3GQOQ==
X-CSE-MsgGUID: DjEw/1TSRZep+9Q5REZviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205682675"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jan 2026 03:22:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhQrY-00000000MuO-0flj;
	Sun, 18 Jan 2026 11:22:32 +0000
Date: Sun, 18 Jan 2026 19:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [tip:irq/drivers 15/18]
 drivers/irqchip/irq-loongson-pch-pic.c:451:22: error: use of undeclared
 identifier 'physaddr_t'; did you mean 'phys_addr_t'?
Message-ID: <202601181914.0ft2oolW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   fba6ab8010bb3e77f7a590deae9ab23b49cb051d
commit: 6e419473461bda5be6888de436d89753c1d260b3 [15/18] irqchip/loongson-pch-pic: Adjust irqchip driver for 32BIT/64BIT
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260118/202601181914.0ft2oolW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181914.0ft2oolW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181914.0ft2oolW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-pch-pic.c:451:22: error: use of undeclared identifier 'physaddr_t'; did you mean 'phys_addr_t'?
     451 |         phys_addr_t addr = (physaddr_t)acpi_pchpic->address;
         |                             ^~~~~~~~~~
   include/linux/types.h:169:13: note: 'phys_addr_t' declared here
     169 | typedef u64 phys_addr_t;
         |             ^
   1 error generated.


vim +451 drivers/irqchip/irq-loongson-pch-pic.c

   448	
   449	int __init pch_pic_acpi_init(struct irq_domain *parent, struct acpi_madt_bio_pic *acpi_pchpic)
   450	{
 > 451		phys_addr_t addr = (physaddr_t)acpi_pchpic->address;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
