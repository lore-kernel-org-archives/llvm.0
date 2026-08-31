Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2F43C1D5E;
	Mon, 31 Aug 2026 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161127; cv=none; b=dbDc4G2iKHaaA0ityFqybgLGO7LF1eWABytNZ0W7UXrSDZdDwKb6fIqT+u7zOBE29DMpkv6C6Cbs1t4t0Ml4/u83rZsj8g5CFiRQzm7Gvi1xwxXaO1Y8BPuTwlt+6ET7WgXZUMT0+CCZiXcSiGfnGqbeYrPtbgzHJ1WjkMIl9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161127; c=relaxed/simple;
	bh=aU9wpk7BBC3namw6KBpNc+rexGH13OF0twavOKJZTxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fj+SHrV4CMgGPW8UVUoqs6EFXiBUDgxiwWSMdY3EByMEPSmMs51WVpP8LPI/yhVxwmZ4Mffc8dGejY0VHpWHXHoEigJRhUiPAXUE12EErJ3dKOixiRyfF8DOUlZNR4uLMh3pBS8wF9+g9Qj+TuVADZfxuf3ALfLPgcZolsCJbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz3LYotG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz3LYotG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788161125; x=1819697125;
  h=date:from:to:cc:subject:message-id;
  bh=aU9wpk7BBC3namw6KBpNc+rexGH13OF0twavOKJZTxw=;
  b=lz3LYotGafAEzKDPHcYAu4CAoNR67qB4GfMAEMB+n4fyepoVlg+A9YBk
   5IVaCKxmQBsy9PMwBDwKxIzRozkskL66QvMeAM5hLz5hg2x16cR3JxJC1
   stej/xp19JiD8pR0T+aAGV6QBqiSIw6wopgJkQ/jCmTqu2c1Tarq8xA3z
   jMoOZl2nYP+kuoAKTkI2G/zKYZZaVMnKff9cgpm6qD1YLO54g2a9hWfT4
   /Mm7P0IpwxunGhS0vw228kH4L6RwJgPA3mDx8J7hAWixXO3pkWgeH+SW4
   mnlfWVdGfhd8EXn8NAtnAOM1wXdE1GH9v/4vPVoRMoMFDh6cVanUcMlD7
   A==;
X-CSE-ConnectionGUID: tl07QmhUQviwlCHYET17xQ==
X-CSE-MsgGUID: KBo0Byw9R4GDc7IOn6Nqag==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99160096"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99160096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:25:25 -0700
X-CSE-ConnectionGUID: v5jeEOsoRQqZ1a+RY03wzQ==
X-CSE-MsgGUID: SjD4XI4fT02EfapYmC3kWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272236697"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 31 Aug 2026 00:25:24 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0wOP-000000000R9-1PHt;
	Mon, 31 Aug 2026 07:25:21 +0000
Date: Mon, 31 Aug 2026 09:25:02 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:irqflags 19/20] vmlinux.o: warning: objtool:
 rust_doctest_kernel_sync_lock_spinlock_rs_1+0x209:
 rust_helper_local_interrupt_enable() missing __noreturn in .c/.h or
 NORETURN() in noreturns.h
Message-ID: <202608310937.YzeF5j5i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git irqflags
head:   d5c6783a39c9f3ae4513eb61038d5306e4ba5f5b
commit: b12fc14f713d1916fc91d5c6bf49c98ab27c45cc [19/20] interrupt: Add {raw_}local_irq_resume()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260831/202608310937.YzeF5j5i-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310937.YzeF5j5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310937.YzeF5j5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_1+0x209: rust_helper_local_interrupt_enable() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
