Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378AD26738B;
	Sat, 27 Jun 2026 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782559707; cv=none; b=m5Y3yubqmj9uUHyQd1G4ZqVB+NeeXHldxCvJD/0kgBrTSZ8spYUPusFdG6xurAS4E4HUaQ0is5k5uPZ2hL5ijLU4ZX+ZZu4hVdJiAy2Om7I/T0jPEv/HS8sdutM63rpnvv/Cvg74+OY0JgPPj0MRTDSru1eQZvQVu9vBX7kfVqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782559707; c=relaxed/simple;
	bh=0L1XyYucC16rXjHfe+STM1Whcte9oeOxB8MobY9FtDw=;
	h=Date:From:Cc:Subject:Message-ID; b=QvZEWVCm4BniAem5m/Y+vm0Jgh0xjj/R7qq5m9neXKQOqlcvZaD2Qa9DSPzRbLO/CwVF4Nh86ICk/RU8bN+u63/vgvK7uDmEv94PaifbKrXj29YCcYXgZUm1uAqAgpBwDofrEuNm5/vnVHrT4qKrxEYED5K8BfLldiNI/QD2yUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqmN9rG2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqmN9rG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782559705; x=1814095705;
  h=date:from:cc:subject:message-id;
  bh=0L1XyYucC16rXjHfe+STM1Whcte9oeOxB8MobY9FtDw=;
  b=BqmN9rG291Om6kVw/jHqVnfaswr82dcjqYyM0qCCV+7ZItLGWI7Sb4k9
   SnAXyIyj+e4FcVpCY9GhyxiDlswTsHuzaXJspGfcmPQS8T4jvV3sCrzQH
   80Al09gkhmeevuJ4BQTErd8It+j/ZA0b9U3tBe/Vwtcykqvr2F3+GDE6q
   4ZD6pSq5tn7a77bptKusvrdMA8huL8HGo3div8btokk6qkwpk50RmUXig
   NLcXoEEHNzl7acJr7TjTiGTHugVT0qKT4dS4+WHjP5tADsFr9YvIV1HVv
   uVskYq6ako5kc0CE10s88xoJn+12O3/Bl3QmLQeXvYHFWMoU+2brVmZUE
   w==;
X-CSE-ConnectionGUID: sNdk2ankT8ytV7Hmpm6TuQ==
X-CSE-MsgGUID: IeWetf4eSvqJozV8vKhM/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="82322471"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="82322471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 04:28:24 -0700
X-CSE-ConnectionGUID: f3JvveUuQAqKNZwNzrjIOg==
X-CSE-MsgGUID: pnLtbK5JTRGEfX2eZqV2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="255934254"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2026 04:28:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdRCu-000000005p7-0jFL;
	Sat, 27 Jun 2026 11:28:20 +0000
Date: Sat, 27 Jun 2026 19:27:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error:
 vmlinux.a(kernel/locking/test-ww_mutex.o):(function test_ww_mutex_exit:
 .exit.text+0x18): relocation R_RISCV_HI20 out of range: 542468 is not in
 [-524288, 524287]; references '.L_MergedGlobals.103'
Message-ID: <202606271935.vmCzvhP8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

CC: linux-kernel@vger.kernel.org
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a66900afbd6b2a063eebad35294038a654de2b0
commit: f0285c286bca5a1e018ba25040cef6c7806c31ef i2c: qcom-cci: Remove overcautious disable_irq() calls
date:   11 days ago
config: riscv-randconfig-001-20260627 (https://download.01.org/0day-ci/archive/20260627/202606271935.vmCzvhP8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606271935.vmCzvhP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f0285c286bca ("i2c: qcom-cci: Remove overcautious disable_irq() calls")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606271935.vmCzvhP8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/locking/test-ww_mutex.o):(function test_ww_mutex_exit: .exit.text+0x18): relocation R_RISCV_HI20 out of range: 542468 is not in [-524288, 524287]; references '.L_MergedGlobals.103'
   >>> referenced by test-ww_mutex.c:768 (kernel/locking/test-ww_mutex.c:768)
   >>> defined in vmlinux.a(kernel/locking/test-ww_mutex.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
