Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4AA21C9F9;
	Fri, 12 Dec 2025 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499160; cv=none; b=nM5/YIrVwuyknpmq5p5FY12NxNeW8QMYyiT4Exz5kaIseHkJIkOcUm9+i91qE1KdXDh8m7eAYrJHgQKriw49iWUOdoxpQMuwu9RxLg066ZitisAuJpzFKWf2PgdSY/A1RRgrE5Kwz7Z3eUBirYV7bKTmzDCQRfxmEPvjs/XbskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499160; c=relaxed/simple;
	bh=guqtteHbF06T4cavo5vN1dlYRpn2RrseYDTSsnqZ3g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HL8glV5Nq8wEAVLyQhOkq+FDjcayu9I6bqMfq6Vhj4D77bxfw2RcQAJPjcbTsxcJ6CYg4atfaE+accHmtIw5LtsMhP5Zto09vV2i8S/01rzw0PnurTc+vTj3ujscwZy2cQgpftKy0exL2ejtaDpECaoL+0lOedcsnCUEhVM0y/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grG2DgMx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grG2DgMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765499160; x=1797035160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guqtteHbF06T4cavo5vN1dlYRpn2RrseYDTSsnqZ3g8=;
  b=grG2DgMxfEQNzd/+ijcWM+8ooUm/ZZn7wSgiETc3lEInEJzgcqy0RHlA
   a7WBBc6jbnFS8xWNdtJ6hZz0YRT3LGhlHxShua4Yg9wljd/OzUNtKFWFZ
   OpwUlURkQqQRCo/4u8g2Ra5+KduIs6rKb1NTTBGlWsCFkJBlYSLiDVETA
   cNMyvqp1OzXtW6GwiAVOHbRtEc1WinpsnPnlkoPa2pheXaCS0MMsm/Fsx
   p/xQHRzHYj0M5DlMtJYqaY92rqo1VWzU06BM0J/ohsLbK+cmO4WWkHwb1
   TW+UR2J3L4bg+3naQ3+hqI2M2ZUg75XFQyUssLxNYl+8vm1KJ3HmwUKEL
   A==;
X-CSE-ConnectionGUID: xkMgY40xSe+qPvuNY8ND1Q==
X-CSE-MsgGUID: p8JqN0v+TYStjHbgIEJ/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78112752"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78112752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:25:58 -0800
X-CSE-ConnectionGUID: l0C/s696QQCZcbd054FIMA==
X-CSE-MsgGUID: GAPbzblBQciB8JwPuJPnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197753394"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 16:25:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqyo-000000005Eh-0tVi;
	Fri, 12 Dec 2025 00:25:54 +0000
Date: Fri, 12 Dec 2025 08:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Warning: kernel/kexec_elf.c:63 function parameter 'ehdr' not
 described in 'elf_is_ehdr_sane'
Message-ID: <202512120844.nojoAn8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: fc9c112f804abcd984a20a66a909332a147a23e8 LoongArch: Add ELF binary support for kexec_file
date:   2 months ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251212/202512120844.nojoAn8R-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120844.nojoAn8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120844.nojoAn8R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/kexec_elf.c:63 function parameter 'ehdr' not described in 'elf_is_ehdr_sane'
>> Warning: kernel/kexec_elf.c:185 function parameter 'phdr' not described in 'elf_is_phdr_sane'
   Warning: kernel/kexec_elf.c:252 function parameter 'buf' not described in 'elf_read_phdrs'
>> Warning: kernel/kexec_elf.c:252 function parameter 'len' not described in 'elf_read_phdrs'
   Warning: kernel/kexec_elf.c:252 function parameter 'elf_info' not described in 'elf_read_phdrs'
   Warning: kernel/kexec_elf.c:319 function parameter 'elf_info' not described in 'kexec_free_elf_info'
   Warning: kernel/kexec_elf.c:328 function parameter 'buf' not described in 'kexec_build_elf_info'
   Warning: kernel/kexec_elf.c:328 function parameter 'len' not described in 'kexec_build_elf_info'
   Warning: kernel/kexec_elf.c:328 function parameter 'ehdr' not described in 'kexec_build_elf_info'
>> Warning: kernel/kexec_elf.c:328 function parameter 'elf_info' not described in 'kexec_build_elf_info'
>> Warning: kernel/kexec_elf.c:391 function parameter 'image' not described in 'kexec_elf_load'
>> Warning: kernel/kexec_elf.c:391 function parameter 'ehdr' not described in 'kexec_elf_load'
   Warning: kernel/kexec_elf.c:391 function parameter 'elf_info' not described in 'kexec_elf_load'
   Warning: kernel/kexec_elf.c:391 function parameter 'kbuf' not described in 'kexec_elf_load'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
