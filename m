Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308F374A17;
	Mon,  6 Jul 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345310; cv=none; b=XDmVcFfJmgaypwD+8pr5I29OsOQy1Sv3513eZNyJgKMkaxtbnznfrWVinHPmx/CM/E4w3klRzC2pFdBsbMdfR7LF1YfceZz+vh7zverVzkDMK5+CMqV3x7bEiCBX1LG8xHK/u+Yq3LO3VZr/dj71FSGo5NWu83fcdLYb3k0rTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345310; c=relaxed/simple;
	bh=XuJVtHYOyGVQts0dQep90q4IAC2wlpJT9Ps5zVRCQW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7PZykBE0Zxc/eTDzse9l0nxWVNg6ZFNaJSNBeNXm71QpO0bSKWZxNYxPXLcbUsnImSqruyHC+J8hQYArZ3dan2+iODGOEScP8Jf0A/PV+d2PqJqNK2MIb9ZTUNbJ+SJTOcLpl+Cf6RYH7OnPdXXRaTrZdYfVqnL0Y/2b15kGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdM2c3Go; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdM2c3Go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783345308; x=1814881308;
  h=date:from:to:cc:subject:message-id;
  bh=XuJVtHYOyGVQts0dQep90q4IAC2wlpJT9Ps5zVRCQW0=;
  b=QdM2c3Goa7eOxNseDJDL5sc3GAUXlJFU4oUZ8hwYXYPFKNhe/RCCC7Vh
   3GqOM8f+DRReSTC4IIDyOuIpJ7XXJrIBNQV/nMox9UzfhYA4mDN6sUvD4
   9fr323PoCb2QboQwBMfPDAwe88BR0kFs2xobrYPLyQJwLw3oywrOF2fZI
   C0v0tXy3gQD8/HboNP+8AjVTXOfclvPp7gw5jJnxBLTVkYB2r7cRbyYd9
   NY1L06X7FGH5fLRVC8O85h7ceuE+vwcUKjTCptoWS17jpEZSwSWwTey8L
   I3pCLfsFj5KwM5fhNOWyNVh8MgPPVrtbzR6ASp3egrUDxvBYpK+KJqfu9
   g==;
X-CSE-ConnectionGUID: x6+P4yZHQ9+ADhte0b8MOw==
X-CSE-MsgGUID: t6qUbDmcT6OX0lXbwZK4yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83087176"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83087176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:41:48 -0700
X-CSE-ConnectionGUID: tCcSfpWxSAyBUWCJvTP05Q==
X-CSE-MsgGUID: izO4/IjMTfS3msuXqrrQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249267780"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2026 06:41:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgjZq-00000000EP5-1Fn6;
	Mon, 06 Jul 2026 13:41:38 +0000
Date: Mon, 06 Jul 2026 21:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:direct-map/v0 5/7] mm/vmalloc.h:41:26: error: call to
 undeclared function 'get_vm_area_page_order'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202607062104.DeqKFZxf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git direct-map/v0
head:   21effbca0418e549e468c2141da5ba1ef83f06fb
commit: 741e3d404d2d11569c68f713ebd9345e283f8455 [5/7] mm/vmalloc: pull out set_direct_map into mm/vmalloc.h ...
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607062104.DeqKFZxf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062104.DeqKFZxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062104.DeqKFZxf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mm_init.c:38:
>> mm/vmalloc.h:41:26: error: call to undeclared function 'get_vm_area_page_order'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         unsigned int nr = (1 << get_vm_area_page_order(vm));
         |                                 ^
   mm/vmalloc.h:41:26: note: did you mean 'get_vm_area_caller'?
   include/linux/vmalloc.h:247:26: note: 'get_vm_area_caller' declared here
     247 | extern struct vm_struct *get_vm_area_caller(unsigned long size,
         |                          ^
   1 error generated.


vim +/get_vm_area_page_order +41 mm/vmalloc.h

    37	
    38	static inline void vm_area_set_direct_map(struct vm_struct *vm,
    39			int (*set_direct_map)(const void *addr, unsigned long numpages))
    40	{
  > 41		unsigned int nr = (1 << get_vm_area_page_order(vm));
    42		int err = 0;
    43	
    44		for (int i = 0; i < vm->nr_pages; i += nr) {
    45			err = set_direct_map(page_address(vm->pages[i]), nr);
    46			WARN_ON_ONCE(err);
    47		}
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
