Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F428628D;
	Wed, 19 Feb 2025 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739934377; cv=none; b=aQtasLBMnz1gPm5u+D+rFMh3WuqEzFiIqf2LJTPAlZKhab9po9CqR+wdA0tSziRRgTgE1Ag9aziylmgoMWHclryheAA/wwu5BbfQKqXdLvMlvki5tIk4rT7ZQmhxPAzWvFL3+Jp1GjcgZbrxcZKtnrq9FH7+4VYacILV7oxU0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739934377; c=relaxed/simple;
	bh=7s2MaAhykW1wFEzi3XpyyDyXkEhHs6DgxbWDJfp17gY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaNMitHF9e2u4timpBbn7sWGNxS79mNn0Yk2dzEWsr0LQAsZNpUS+i1guqTsJ2kTJDrko9xhe6ZaC75mB6FO0Dkbl6OUtCPWfvrOgmpZvHEWr0pd15j4OizePal0BuP5TTO1iEnn69bkHUApxXRSUbif0LfkVG6jSvgiP4d01+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7njXrLX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7njXrLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739934375; x=1771470375;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7s2MaAhykW1wFEzi3XpyyDyXkEhHs6DgxbWDJfp17gY=;
  b=l7njXrLXgQTjhY2OWb/AHjdFSaO9spnD/oAwcoAyLXj8gI8FIlX3BQyR
   sbUNotK5yc/2j8fmBcUyjrrN/P01QQUragKkUeOb7/xyUXFK5gFYyTUUg
   VlEQgKNmyabQQiO78oYuE+iUIaSgsfX3b+0DD8thquhekJ5NQYNMA5kpv
   yJs2Ud+0gp1tJueh48RYa3HsECUbL8BHE6eeDetIz/VizMsNvAHmSoEUw
   u6382tDzoItoKtGqJ2S8Jpy+7T0ohbljzabUBfH+qOtSwGmcOL2xj4yj4
   JnP1AwTHJ0hvUwyHuvWBg3lviYH5FvekNR48dEfKY3Ehe/DYY2jWtiSrF
   g==;
X-CSE-ConnectionGUID: Z1kNracvTdS8tMht01+5ig==
X-CSE-MsgGUID: Klhr+PhDTgimrvHFVaOLDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40864883"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40864883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 19:06:15 -0800
X-CSE-ConnectionGUID: h1/AKOk+QE206ZDZO7TWtw==
X-CSE-MsgGUID: +SnEaJ97QheAmVihK2P+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119565479"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2025 19:06:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkaPa-0001Ad-2r;
	Wed, 19 Feb 2025 03:06:10 +0000
Date: Wed, 19 Feb 2025 11:05:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [krzk-github:track/x1e80100-t14s 12/16] ld.lld: error:
 vmlinux.a(fs/bcachefs/time_stats.o):(function bch2_pick_time_units:
 .text+0xc): relocation R_RISCV_HI20 out of range: 530730 is not in [-524288,
 524287]; references 'time_units'
Message-ID: <202502191151.TI41JDHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: a76da941df9862c7d135bf2f5816bd6d1e799dfe [12/16] ASoC: qdsp6: lpass-dai: check if params have changed before re-prepare
config: riscv-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191151.TI41JDHF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191151.TI41JDHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191151.TI41JDHF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/bcachefs/time_stats.o):(function bch2_pick_time_units: .text+0xc): relocation R_RISCV_HI20 out of range: 530730 is not in [-524288, 524287]; references 'time_units'
   >>> referenced by time_stats.c:30 (fs/bcachefs/time_stats.c:30)
   >>> defined in vmlinux.a(fs/bcachefs/time_stats.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function put_task_struct: .text+0xb8): relocation R_RISCV_HI20 out of range: 532375 is not in [-524288, 524287]; references 'put_task_struct.put_task_map'
   >>> referenced by thread_with_file.c:18 (fs/bcachefs/thread_with_file.c:18)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function put_task_struct: .text+0xc0): relocation R_RISCV_HI20 out of range: 526860 is not in [-524288, 524287]; references '.Ltmp1'
   >>> referenced by thread_with_file.c:18 (fs/bcachefs/thread_with_file.c:18)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function bch2_run_thread_with_file: .text+0x14c): relocation R_RISCV_HI20 out of range: 530933 is not in [-524288, 524287]; references '.LCPI2_0'
   >>> referenced by task.h:132 (include/linux/sched/task.h:132)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function bch2_run_thread_with_file: .text+0x174): relocation R_RISCV_HI20 out of range: 531039 is not in [-524288, 524287]; references '.L.str'
   >>> referenced by task.h:132 (include/linux/sched/task.h:132)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function bch2_thread_with_stdio_init: .text+0x2d8): relocation R_RISCV_HI20 out of range: 531194 is not in [-524288, 524287]; references '.L.str.11'
   >>> referenced by atomic.h:138 (arch/riscv/include/asm/atomic.h:138)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function bch2_thread_with_stdio_init: .text+0x2e0): relocation R_RISCV_HI20 out of range: 533998 is not in [-524288, 524287]; references '.L_MergedGlobals'
   >>> referenced by thread_with_file.c
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function __bch2_run_thread_with_stdio: .text+0x3a0): relocation R_RISCV_HI20 out of range: 530730 is not in [-524288, 524287]; references 'thread_with_stdio_fops'
   >>> referenced by refcount.h:269 (include/linux/refcount.h:269)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function __bch2_run_thread_with_stdio: .text+0x3a8): relocation R_RISCV_HI20 out of range: 526860 is not in [-524288, 524287]; references 'thread_with_stdio_fn'
   >>> referenced by refcount.h:269 (include/linux/refcount.h:269)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/thread_with_file.o):(function bch2_run_thread_with_stdio: .text+0x494): relocation R_RISCV_HI20 out of range: 531194 is not in [-524288, 524287]; references '.L.str.11'
   >>> referenced by task.h:143 (include/linux/sched/task.h:143)
   >>> defined in vmlinux.a(fs/bcachefs/thread_with_file.o)
--
>> ld.lld: error: vmlinux.a(fs/bcachefs/time_stats.o):(function bch2_pick_time_units: .text+0xbc): relocation R_RISCV_HI20 out of range: 530932 is not in [-524288, 524287]; references '.LCPI0_0'
   >>> referenced by time_stats.c
   >>> defined in vmlinux.a(fs/bcachefs/time_stats.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
