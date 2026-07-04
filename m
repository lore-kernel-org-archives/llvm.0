Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF1C30E84F;
	Sat,  4 Jul 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783160176; cv=none; b=Dz/3yVLpKyBN8bOQ7ZbbEquXJcMwsmli1pEKVfY8ySFF2jm0JMdHp2xpOnCUFXf5hzKRIDGUnkuSwggdDj0XwIsmQYaDRud2LSv2i89V8XCfXHJL6jz8oxLBnM6flydr+W139depsenGw1DNGrkvkv5EU3doGa5J05SE6kHPImg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783160176; c=relaxed/simple;
	bh=2ZFsMf6IBH9YYxW8ni580xMMfwS5zEaiHwjNXMxcwHg=;
	h=Date:From:Cc:Subject:Message-ID; b=eLMvCqNQOB1VZL+szyFR2ukr/netAeX//EwhRGt4+zSc0daH4tLFLFH6eaLfHeo0b7aof1masRCIOvhT0UXWK1Ck214DwjCbOBwP2cWtFF5x4QjrnyqY4gtgAWgJLlYQTKbFLbicIsDil9pn9qlzrOwxTTy7eguAOLaf+YV1a9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gr2KAYwG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gr2KAYwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783160174; x=1814696174;
  h=date:from:cc:subject:message-id;
  bh=2ZFsMf6IBH9YYxW8ni580xMMfwS5zEaiHwjNXMxcwHg=;
  b=gr2KAYwG5BhSAgI2pIRbIEPjqV3Jo4HX9ZBnNZQmHhnZCVUnzxsIdYg1
   +iUZDIBmSOO52lcUbSfuKHrONqjx4f7ugLHZG808KHuOu4qJsW0w8TZuN
   vItUQlx+/ZB35VRKiI+zUsSwHgjqdKXUVNlMRRRm5voSu3YpH/cxlYwbp
   YE4xQiFxq03F7I2fnc0jG4tW84XCH8y2UP8ck1v9ZcL3qL7P7JQ/zQ5bt
   9OFUYNVx6auJprGnF4xbq+XPvv4EP5BbUOSH9c5fayXReCrDta4GvYZ8G
   T4+BQtz4+KnJVyyUSZuD/vPtmUKhnyDTSte5b/s993xOXk3cQRWnPnfQ1
   A==;
X-CSE-ConnectionGUID: iNOYUNOiSo2eAVmJQuuvog==
X-CSE-MsgGUID: C7gMm7U8RO2O/E+zKS3H+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87559090"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87559090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 03:16:14 -0700
X-CSE-ConnectionGUID: 9mIXpEpmQgmJL/QfRyofQg==
X-CSE-MsgGUID: PNjCygNnTF2CNkrFrvIH6g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2026 03:16:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfxPu-00000000CzP-3kHN;
	Sat, 04 Jul 2026 10:16:10 +0000
Date: Sat, 04 Jul 2026 18:15:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:locking/core 4/9] ld.lld: error:
 vmlinux.a(fs/namei.o):(function do_getname_kernel: .text+0x962): relocation
 R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
Message-ID: <202607041829.Bp8QV9Na-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Charlie Jenkins <thecharlesjenkins@gmail.com>
CC: Guo Ren <guoren@kernel.org>

Hi Prateek,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   79d3fca9230cbd2108fa34ec54f2b1a319057252
commit: af9ae17c5bcc45648d9acf85b28369ed66e31e0f [4/9] riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260704/202607041829.Bp8QV9Na-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041829.Bp8QV9Na-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041829.Bp8QV9Na-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/namei.o):(function do_getname_kernel: .text+0x962): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by namei.c:202 (fs/namei.c:202)
   >>> defined in vmlinux.a(fs/namei.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
