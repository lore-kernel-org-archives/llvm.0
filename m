Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1E19471;
	Tue, 19 Dec 2023 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdnNzIxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702993244; x=1734529244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KwP2vfopAQzY7f3UPaKoL34PBQwixcfYslItesQ9Nw4=;
  b=UdnNzIxPuoTZUYiPdrIa+5nNPKAkz8AuS+pEJW6NuTdMDMHoLNvreYwB
   Jlr+l3gLxCgLHHZMIo2lsL8dRJYuhblaVnXLacCFGljYjbne2P7EL6T/0
   VpjjstKH+ej9bUnZm1IZhZ7QqOwYSA/XoiFo4aMQoCzTBRqkfvk6MOjYv
   EbRxAPL8sYFj3JHtHxfxwEsrYekk5lSSuL/94TWKs0WD8EAxWFAll1bUK
   le5J5T5ctcY3aqjmjlXxFQgxacL5WRy+3wudbWMxkwi1+jhfVjKy1meV4
   cEQLyfvwB6lz2AsvtUTdvAK3qEKJ3DLOUSqNKJl4pBVHXN14S5LAfEzCh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2487167"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2487167"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 05:40:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="804898667"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="804898667"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Dec 2023 05:40:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFaKu-0005O0-23;
	Tue, 19 Dec 2023 13:40:40 +0000
Date: Tue, 19 Dec 2023 21:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:header_cleanup 21/51] /bin/bash: line 1: 19420
 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J
 --btf_gen_floats -j --lang_exclude=rust
 --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base
 vmlinux drivers/misc/eeprom/at24.ko
Message-ID: <202312192107.wMIKiZWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   89188fceb7a49e3c4b0578d86f6f6e647f202821
commit: 1db61740aeb7d6b1c7bfb2a98708a65a6679d068 [21/51] locking/seqlock: Split out seqlock_types.h
config: hexagon-randconfig-r005-20220913 (https://download.01.org/0day-ci/archive/20231219/202312192107.wMIKiZWw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192107.wMIKiZWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192107.wMIKiZWw-lkp@intel.com/

All errors (new ones prefixed by >>):

   die__process_unit: DW_TAG_member (0xd) @ <0xc689> not handled!
   die__process_unit: tag not supported 0xd (member)!
   die__process_function: DW_TAG_compile_unit (0x11) @ <0xc697> not handled!
   die__process_function: tag not supported 0x11 (compile_unit)!
   die__process_function: DW_TAG_member (0xd) @ <0xc6db> not handled!
   die__process_function: DW_TAG_compile_unit (0x11) @ <0xc6e5> not handled!
   die__process_class: DW_TAG_compile_unit (0x11) @ <0xc778> not handled!
   namespace__recode_dwarf_types: couldn't find 0xc689 type for 0xc66b (member)!
   namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc674 (member)!
   namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc67e (member)!
>> /bin/bash: line 1: 19420 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/misc/eeprom/at24.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
