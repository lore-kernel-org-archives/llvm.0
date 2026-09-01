Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79895B640;
	Tue,  1 Sep 2026 00:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221028; cv=none; b=UmG5Gy+gozgs6pMHKGoODCL+tiRAZxynD81OmPnbCJOaHKbcm6vqGpIw1ZvgWtddtPVIiDdVf7K9K1u4qyftbCSkgH8CLcW5007NPe53wEVUPZflQbW1hndM/jaTx1X3AcQriOPBgjHysVl8wHQt6tz3eYvo+zGmOiGULhC75NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221028; c=relaxed/simple;
	bh=+u+paPEl69EI8EJgLp/S44yzlA16FXZ/5JKDKEIBKDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ui2kTnTaV/urF3JfAir4IiRHLMq2lPlZBENw4Dzd40JsLa2PySmIETyGKxUwuXe+s8P8ovaBWbu8f4X1DCHrSE6LxI5cYmEwH1lvjSBiiPGpExgnEU8yM5gIvcTRB4PNlQlRwmkWZTZq8ueuDSqknstBpyxVZTVCtrh9LhQm55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHjEQhnz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHjEQhnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788221025; x=1819757025;
  h=date:from:to:cc:subject:message-id;
  bh=+u+paPEl69EI8EJgLp/S44yzlA16FXZ/5JKDKEIBKDk=;
  b=AHjEQhnzd/k49CrQUqwVlpPxnMyRVn+L0snt30zoxcw0D7TtyC54cKDS
   KnSttrYUddm5vReCA1xnh7qhX8GbWmeQk4g3y0sC/pSYKhHDfHlXKw9l3
   fofYsflQ4fDU98cSI/sWVrDa4u6C5CZUNBqWwVnQgfZ2GmtKIIyI0e2pX
   FdH+xR8idnQrF3eVNAKBqRyI+yodRIkcC+M1VNriPZ1iLKfoh+Jp7z0O7
   66/jZZB+qoHzRL9+vHFSgP1SyMgERyVUfUT1KyqehWUJtG8SIlEvcriC2
   Ecwb5r9YRH6pfGB8S+je5xaEzPOkj68YELEDb1/ug91VtMkgPg3x3MPhj
   A==;
X-CSE-ConnectionGUID: lMHN91A6T4i9h02zFyOmjA==
X-CSE-MsgGUID: HbDqn8XfSxSYBLPpnd1sMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114175916"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="114175916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 17:03:45 -0700
X-CSE-ConnectionGUID: kROgGcWsT2uMI3nzaAVQgw==
X-CSE-MsgGUID: S26Q+SOWSpCg9MtIq3WUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="273120702"
Received: from lkp-server01.sh.intel.com (HELO 793b8a0addc2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2026 17:03:43 -0700
Received: from kbuild by 793b8a0addc2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ByW-0000000008W-2TFX;
	Tue, 01 Sep 2026 00:03:40 +0000
Date: Tue, 01 Sep 2026 08:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: vmlinux.o: warning: objtool: kernel_entry+0x118:
 start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202609010734.HlRB5VXA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee9395acd8043be0644b25c34bfa86623f2b935
commit: 1b2f4706c6a20ab6ac41533dd8032d54322076e3 LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
date:   8 months ago
config: loongarch-randconfig-002-20260829 (https://download.01.org/0day-ci/archive/20260901/202609010734.HlRB5VXA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010734.HlRB5VXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1b2f4706c6a2 ("LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010734.HlRB5VXA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kernel_entry+0x118: start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: smpboot_entry+0xa4: start_secondary() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: kernel_kexec+0xb8: machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: wdt_interrupt+0x48: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: sama5d4_wdt_irq_handler+0x88: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: rzn1_wdt_irq+0x34: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: eurwdt_interrupt+0x40: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
