Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584EC27978C;
	Tue, 18 Nov 2025 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763430438; cv=none; b=pnFAiQx5GXykiClGStmhts6nRfBqILvGjzS6wsxfyFdpGfBzNQeOPNA0buh0jpzQI6WCnpWERVAOmX15vKf4arlKscY1a451+QJpAijkM/Jklqm/77ZKXTq3NxKM4mfVP5SMrQPskI1lAn1EXM2yg5qusrPTcHSaqqWB+qlkYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763430438; c=relaxed/simple;
	bh=ArEvxetBec/vUF/GVXDpbjvfHhc9BlLmAkNVxj8Zp8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMAKOHjhhNiTRnoatxDxivkbaSN5Ri1J9m4jIa4rxzdB9sixXMepfDUFCo6yaKpX+4PAyaXcD7yEIN9pr11uUkLkAD3bvylpbB7Ig8KHKDakKPt1TjahlVgwG+Jjo/HtO+y4wgcfasy2speY1pwtLekaw01CznDBMexdofg+UIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibK0yzx/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibK0yzx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763430437; x=1794966437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ArEvxetBec/vUF/GVXDpbjvfHhc9BlLmAkNVxj8Zp8E=;
  b=ibK0yzx/p404bMjqRYcNqGfY6LqL+9Zp1iu19v8BLydC1MQACHLjXjRx
   4kNTmCmW+ER7nXjida5M3hoHVGWK6axyTj+3ddjvah5tRz5j5QsUvdKpt
   2J/ShLcUkKgf3qxd6j/CD+8rh+6HOgZOOtbR3REHZBHG0MgSlrpcoguk/
   fwXCnhv7WOT1rHo+a/dwBlJXXOZDGpsMdNSTRwq2p+FNRCyHcpwgjh1Jm
   d0+EhqgDXCH22UXIO6l1nBgk9A/J5ZDaNBVripnhPutu9OwdVGsVEzN4o
   tfSNKk1tCsnivwy6UP0B8Nu22EtKb1lDHlfq+aK9JUMnV+tc1W2Ew4Rqa
   g==;
X-CSE-ConnectionGUID: s5zBKoelT9OucwwPH2w3Dw==
X-CSE-MsgGUID: Q823mQrxR8mYNDsfewgNVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76044659"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="76044659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 17:47:16 -0800
X-CSE-ConnectionGUID: 21PmUJVuQ22J4GBOpjQMfQ==
X-CSE-MsgGUID: 27ToNhMHRnqmmz0+fyFf9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 17:47:16 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLAoL-0001ER-2V;
	Tue, 18 Nov 2025 01:47:13 +0000
Date: Tue, 18 Nov 2025 09:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 11/14] mm/vmscan.o: error: objtool:
 reclaim_throttle+0xfb: can't find switch jump table
Message-ID: <202511180920.PCCek90F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   63117b5289cf043ba592754a72ed16608428e1bb
commit: 7a98647d5f5badfa99588a7f64cd39be668fc283 [11/14] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-004-20251116 (https://download.01.org/0day-ci/archive/20251118/202511180920.PCCek90F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180920.PCCek90F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180920.PCCek90F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.o: error: objtool: reclaim_throttle+0xfb: can't find switch jump table
--
>> mm/shmem.o: error: objtool: shmem_parse_one+0x9c: can't find switch jump table
--
>> mm/madvise.o: error: objtool: madvise_should_skip+0x2f: can't find switch jump table
--
>> mm/khugepaged.o: error: objtool: madvise_collapse+0x571: can't find switch jump table
--
>> mm/mremap.o: error: objtool: move_pgt_entry+0x162: can't find switch jump table
--
>> mm/vmalloc.o: error: objtool: pcpu_get_vm_areas+0xf70: can't find switch jump table
--
>> mm/fadvise.o: error: objtool: generic_fadvise+0x12b: can't find switch jump table
--
>> mm/list_lru.o: error: objtool: __list_lru_walk_one+0x1d6: can't find switch jump table
--
>> security/commoncap.o: error: objtool: cap_task_fix_setuid+0x33: can't find switch jump table
--
>> net/compat.o: error: objtool: __ia32_compat_sys_socketcall+0x15e: can't find switch jump table
--
>> block/bfq-iosched.o: error: objtool: bfq_bfqq_expire+0x658: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
