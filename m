Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F99280014;
	Fri, 13 Feb 2026 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010807; cv=none; b=L833U9ylkyS4x1xHjz8rma+VlAok9nLoUSNnZqLyOf/ase+McIdb23vP+of0ZgsWyirA+gFL8xvRdA1gh6Rm3KMbkfbALPcUUi2afMy5l3uW1zxEb+J29AlRYIBzpiyUPoOcB25UvXvygRKHXWaO4+9uq8AoXf5ZySQCT3heMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010807; c=relaxed/simple;
	bh=CFsTNibMoX3JymlGIzKmI0+4G8nbxiLX/GpZt45ngU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OlFs1OA9wtRRp7JO42C16ArYSLtO5UfMww3LpG0ebjpaz+SoQOTnv+9KIvNEEcyTMXAENxtNxOAqocAxFN2+oj89VKTslxAm1ii470N6OqhHp3nKOwapP8y9VRZaOMMnhI57/GFx89hgoV3bRlFt4E1tUxuoez7GUwQp63Q9aXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSIfcPRg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSIfcPRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771010805; x=1802546805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFsTNibMoX3JymlGIzKmI0+4G8nbxiLX/GpZt45ngU8=;
  b=nSIfcPRgfhC3vNccRbbG+16f31T2jtqf99B3QviGHtY9RjsdR/hQq4qf
   PpgAzqnKk0cc0WBCwu3VK1RQBpGDhyHy2RQTjTIeq+IZ4j4hm/9Ox/3g/
   plC9bWlBOLfcXqv6KjZwwjBS30QGWLsVAgK6N2rS/ueNtL9uN6/tx4fQV
   3SKdYo4NuRwILGiX8s4TJvc7lwBQrMiXihv7fHezVZ1IDiCkCZcqpurrS
   9hnNK70C3Y6tn7QI0/de2TUAG6JUKoFIGUiY7W90ILO55rRGMoXR0Os+d
   VgpfVG9oKZKwdv+UzZAskODNRXDn/qe4ce2u72LIMQPL+SRmP6lBA8iL4
   g==;
X-CSE-ConnectionGUID: 2FYEcKJhSJaq1dFcaWTr3w==
X-CSE-MsgGUID: rPG8E20KSYC2iFELe5Tiew==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97659164"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="97659164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 11:26:44 -0800
X-CSE-ConnectionGUID: EQyDCMq2Rdi2ar0xwEniuw==
X-CSE-MsgGUID: TnlLwFHLT06yxb4bK00d8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213022147"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2026 11:26:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqyoK-00000000vmG-1T4z;
	Fri, 13 Feb 2026 19:26:40 +0000
Date: Sat, 14 Feb 2026 03:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 5/7] ld.lld:
 error: ./arch/s390/kernel/vmlinux.lds:13: symbol not found: TEXT_OFFSET
Message-ID: <202602140311.tvFN8qa4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   f3f3c2f9cf8c8793e126868a6f934bd8c333ccfa
commit: 3348250fad3005f91f96ab4967e4589c9e234235 [5/7] s390: Trim includes in linker scripts
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260214/202602140311.tvFN8qa4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140311.tvFN8qa4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140311.tvFN8qa4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:13: symbol not found: TEXT_OFFSET
>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:122: symbol not found: AMODE31_SIZE
>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:13: symbol not found: TEXT_OFFSET
>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:122: symbol not found: AMODE31_SIZE
>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:13: symbol not found: TEXT_OFFSET
>> ld.lld: error: ./arch/s390/kernel/vmlinux.lds:122: symbol not found: AMODE31_SIZE
>> ld.lld: error: section .amode31.text file range overlaps with .init.data
   >>> .amode31.text range is [0x486000, 0x486FFF]
   >>> .init.data range is [0x486000, 0x49DDF7]
--
>> ld.lld: error: section .init.data file range overlaps with .amode31.ex_table
   >>> .init.data range is [0x486000, 0x49DDF7]
   >>> .amode31.ex_table range is [0x487000, 0x48702F]
--
>> ld.lld: error: section .amode31.text virtual address range overlaps with .init.data
   >>> .amode31.text range is [0x485000, 0x485FFF]
   >>> .init.data range is [0x485000, 0x49CDF7]
--
>> ld.lld: error: section .init.data virtual address range overlaps with .amode31.ex_table
   >>> .init.data range is [0x485000, 0x49CDF7]
   >>> .amode31.ex_table range is [0x486000, 0x48602F]
--
>> ld.lld: error: section .amode31.text load address range overlaps with .init.data
   >>> .amode31.text range is [0x485000, 0x485FFF]
   >>> .init.data range is [0x485000, 0x49CDF7]
--
>> ld.lld: error: section .init.data load address range overlaps with .amode31.ex_table
   >>> .init.data range is [0x485000, 0x49CDF7]
   >>> .amode31.ex_table range is [0x486000, 0x48602F]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
