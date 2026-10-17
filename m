Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815F381B1C;
	Sat, 17 Oct 2026 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206196; cv=none; b=ZGxXggcGkm/9Nz5hmgxysY+hPvI6q7Hwdk2fBgyEEbjrTTzfnmQjCIlYrULBy8Dz2n5eumMRJ9k7ejhfhkKTO5kRWY9H0DKyLDGFMHEKdc/7ubJiL5sULahGUKAjXhVaeq8EKnHXAiIywLvVNlmOLjB4OY8OmG1f/rNxogHuQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206196; c=relaxed/simple;
	bh=mygFMgWqiSHfafZnQjJ7WAZSC3efl0oJYGIKaHBWrvA=;
	h=Date:From:Cc:Subject:Message-ID; b=WSZteCEa3xvfQlFk4wbwQBTYiEqw6RDK49l/sTtPKChof3sh8fKXbe9PalhnrL3tcaCkGG3h82Mw/GumN8FEfRW8MReUjZSgV9aqSLl2ealghOTmw9Tbygpmdn1e5eXfHoUum1V7dqxvhYlq7eyVqu52OqtLbm1oZh78RYpGwnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBFVUFcj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBFVUFcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792206195; x=1823742195;
  h=date:from:cc:subject:message-id;
  bh=mygFMgWqiSHfafZnQjJ7WAZSC3efl0oJYGIKaHBWrvA=;
  b=PBFVUFcjZCM/5OlENH9dWfor4feBrh9ffeep/uQSSUcE8Kg+w+D4Z22A
   2hjOl+AyP1QsNT6Odz1EV7CVqvd1HF+vJlNuTff8teZOrzLpSaP/8vYq7
   gGlsmotBKozInLeb5Kg16VHz2BuS0+TpP4Ln/J1YjYdkCAscmdNW/HjwZ
   7hG7rrkpkQrDJKqDKx1+FRP2N1STauODzpbWAqoC7Xy4kMnjZDDw0IsRE
   tKrZDX15j9L+bPZj4qmDG3AxF/2Kh496lwMC/AgA6WZfUdJmyqUtdgxj2
   187IFNOZWD2d5I9KOM/6Jp/Blnnm7YImEmjKTXeGtRejU5XyN4K9YoNxc
   g==;
X-CSE-ConnectionGUID: s3/FHTcITymp8yO5NloHxg==
X-CSE-MsgGUID: W/X2Iqg2Ss6iBPZc4tbVfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="873977"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="873977"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 20:03:15 -0700
X-CSE-ConnectionGUID: ulNf+x2nTwO8oINHpuLMrw==
X-CSE-MsgGUID: k7EgTTSQSNKZEmsE3pk/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2086243"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2026 20:03:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHuhT-00000000Izg-0sSk;
	Sat, 17 Oct 2026 03:03:11 +0000
Date: Sat, 17 Oct 2026 11:02:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:sched/core 18/25] ld.lld: error:
 vmlinux.a(drivers/scsi/scsi_trace.o):(function scsi_trace_parse_cdb:
 .text+0xb0): relocation R_RISCV_HI20 out of range: 531330 is not in [-524288,
 524287]; references '.L.str.1'
Message-ID: <202610171107.6ZxJvZXv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   b99b7f60c5b473d374c68b53753153b4aa9e0702
commit: 5b9a28eeed37513778ca6b636253aa8dcf39d55f [18/25] sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
config: riscv-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171107.6ZxJvZXv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171107.6ZxJvZXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171107.6ZxJvZXv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/scsi/scsi_trace.o):(function scsi_trace_parse_cdb: .text+0xb0): relocation R_RISCV_HI20 out of range: 531330 is not in [-524288, 524287]; references '.L.str.1'
   >>> referenced by scsi_trace.c:0 (drivers/scsi/scsi_trace.c:0)
   >>> defined in vmlinux.a(drivers/scsi/scsi_trace.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
