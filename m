Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71611E9900;
	Mon, 20 Jan 2025 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737405496; cv=none; b=rJb/IY+VcUKTwGDdZVvqvMVirn/navRQl2jWIg7uktczXKNzMSgHXYexTfv5LVs82Sq3beimbu1B64LoK2IcQnD3Cm7KUt1V/uUOPhUYXTAWf6TDDt9ybqfqy2dM+xDSycHRLS+Wd6BEfpBDYt4zphDeA49siMy61ZG4fQWHkXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737405496; c=relaxed/simple;
	bh=ZGlJcfb+mjvgEQKC7aceo3qv6vk+4Ok45JskTTIOMQQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdfYCDHBF6IkKX+HScNJyAUpOEn+rPdfJ1mKAxncWy2Xw2ia2v6kJFPHRukDxZYh8cxyy2HsFXowAZqHS86j1N3N38m5ByILGlqhUNuwtTm+F5/Vo95L2UxF6to9w2WS8hOjLxM+rkEW2PqF1aQVthg+g6RMyyE3BUgheZh1+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3U6IW7W; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3U6IW7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737405493; x=1768941493;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZGlJcfb+mjvgEQKC7aceo3qv6vk+4Ok45JskTTIOMQQ=;
  b=T3U6IW7WVxYg7RewWXgkOCSCsrlQh1d1uzpTRAEBJS5n+8SJ5cLYpvEA
   6W9GmM4tHQo+uU3qbMqbW+W/bSHSsqkqiC1qZ0yXxgx1DyopbBLvS09vD
   ghV1lBknlNd5SvBqWbnxR8X68v1lDOXZGhH3921lWEAxLA83mH/xNQjv5
   uktpeBNojtGn5aVVuzYcck4fkCfPiPdB9YJiOHtmLXlFyTFslS+77mp1Q
   bCBnNJHVuF5ZXxVuBzwPGaozRjhtPWenbE+bd4rmq42WRfCYf4hre7Jmq
   4iTivbbTzDYU5qW4lwy0RVuv7rBR7LWe3mVN9dmrbcHq8qP7J2GzcaCau
   A==;
X-CSE-ConnectionGUID: jimJYRTzQ8OusLC5j+4tPw==
X-CSE-MsgGUID: H8lUszdvR2yo9JgVx7KgDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55218694"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="55218694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 12:38:13 -0800
X-CSE-ConnectionGUID: QvxKx9fQRjywuE64EIdY1A==
X-CSE-MsgGUID: 7hdWKQQxRwmoWc9Tg/HLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107044780"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2025 12:38:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZyXB-000Wx5-2i;
	Mon, 20 Jan 2025 20:38:09 +0000
Date: Tue, 21 Jan 2025 04:37:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 8906/8908] ld.lld: error: vmlinux.o:(function
 btrfs_submit_bio: .text.btrfs_submit_bio+0x42): relocation R_RISCV_HI20 out
 of range: 525826 is not in [-524288, 524287]; references
 'btrfs_raid56_end_io'
Message-ID: <202501210435.wBJFjhHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: d368a0c80472b9d1b10c5ad2d971f1d71079f88d [8906/8908] Merge branch 'crc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210435.wBJFjhHC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210435.wBJFjhHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210435.wBJFjhHC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function btrfs_submit_bio: .text.btrfs_submit_bio+0x42): relocation R_RISCV_HI20 out of range: 525826 is not in [-524288, 524287]; references 'btrfs_raid56_end_io'
   >>> referenced by bio.c:495 (fs/btrfs/bio.c:495)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function pixcir_stop: .text.pixcir_stop+0x5c): relocation R_RISCV_HI20 out of range: 528428 is not in [-524288, 524287]; references '.L.str.51'
   >>> referenced by pixcir_i2c_ts.c:374 (drivers/input/touchscreen/pixcir_i2c_ts.c:374)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
