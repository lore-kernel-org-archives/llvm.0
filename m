Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD9274B53;
	Wed,  7 Oct 2026 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791351652; cv=none; b=RRoaHsXhAp+xYhcxMXHyIfXuM3lmFqzsVE7lWMXxKb5sVYcsuR9tccwWpj5CytOqY+pYrX/Ci06zJ/Rx/vlF4BJ0QDwCZ/ORQHFuhxbRbpC+rGfyRmmIj+huzPokVw5Sf2Ki5U+XeYg333OV9AyROWjqhZesBQYFp1eGuBntygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791351652; c=relaxed/simple;
	bh=jDUiqQlP85U2iSjlzbh5Lpmw0em3EP/Vc90exreybMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tUkH8qYG6JvrpQpCoC0r76Z7ZVw8ZT8eFC8cP4KfFcwhQnZzZ/QsDr1AT/zzcjMAjMO1o03O7wJsmd3I7fV4+hFGgriYZ6sIC1LLn5T9tclKxudUfT8VCvtqkQUgZHym5+ew60Y6PRdzlwIQ3GiyMklS39Px9AMxCC/0WuryL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIxRS5eD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIxRS5eD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791351650; x=1822887650;
  h=date:from:to:cc:subject:message-id;
  bh=jDUiqQlP85U2iSjlzbh5Lpmw0em3EP/Vc90exreybMQ=;
  b=LIxRS5eDTMLb7w1aKuX1OZ3INXA8pJmx1JdP2s8LDovJVvqCWnMlMdGF
   gRyax4z9nDno2LC0Yu+0D7aSnQKbyQ0ljK9VA2OyBbKpgdc9hY6s4ccJJ
   YGGh8mNgCKTfju3bMigbSn++MP4w2Mmrw34vwwrperBvvOySGE48NVDVs
   a7WfCnjtFjn3aLU5QZz0mSZvjNixhtsM38N0ZUk5ctfBFzCgApGmA4n2U
   5s6KCHcO0esRr60rAJgnwPGJAOKMgCc6B18IMGa3a7r1CJBzGe10yQLGq
   s3bIhFq9CCJaWlrUwzLtCqYddIMZIx9OfN7r+5AaZUtfkgk9PsSCHKnS/
   A==;
X-CSE-ConnectionGUID: t8zdwfbGTeaOL9UEsdQWAg==
X-CSE-MsgGUID: x4/kYdGFSBqoTOAJJleV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="203973"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="203973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 22:40:49 -0700
X-CSE-ConnectionGUID: U64+i35lRm6YT68R/q7h/g==
X-CSE-MsgGUID: ZEkSj9JNSl6tS6Ejt/35+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="275140550"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Oct 2026 22:40:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEKOT-000000002Xy-2QOo;
	Wed, 07 Oct 2026 05:40:45 +0000
Date: Wed, 07 Oct 2026 13:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [xilinx-xlnx:master 1071/1090]
 drivers/remoteproc/amd_mbv_bram_rproc.c:129:47: error: use of undeclared
 identifier 'dev_dbg'; did you mean 'cdev_del'?
Message-ID: <202610071345.F4lT1vwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: dfff428d04b81b2cfd96007517cf9c85a38f427f [1071/1090] remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610071345.F4lT1vwx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071345.F4lT1vwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071345.F4lT1vwx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/amd_mbv_bram_rproc.c:73:8: error: use of undeclared identifier 'rproc_mem_entry_ioremap_wc'; did you mean 'rproc_mem_entry_init'?
      73 |                                    rproc_mem_entry_ioremap_wc,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    rproc_mem_entry_init
   include/linux/remoteproc.h:677:1: note: 'rproc_mem_entry_init' declared here
     677 | rproc_mem_entry_init(struct device *dev,
         | ^
   drivers/remoteproc/amd_mbv_bram_rproc.c:74:8: error: use of undeclared identifier 'rproc_mem_entry_iounmap'; did you mean 'rproc_mem_entry_init'?
      74 |                                    rproc_mem_entry_iounmap,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    rproc_mem_entry_init
   include/linux/remoteproc.h:677:1: note: 'rproc_mem_entry_init' declared here
     677 | rproc_mem_entry_init(struct device *dev,
         | ^
   drivers/remoteproc/amd_mbv_bram_rproc.c:129:2: error: call to undeclared function 'rproc_elf_load_rsc_table_optional'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |         ^
   drivers/remoteproc/amd_mbv_bram_rproc.c:129:2: note: did you mean 'rproc_elf_load_rsc_table'?
   drivers/remoteproc/remoteproc_internal.h:117:5: note: 'rproc_elf_load_rsc_table' declared here
     117 | int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
         |     ^
>> drivers/remoteproc/amd_mbv_bram_rproc.c:129:47: error: use of undeclared identifier 'dev_dbg'; did you mean 'cdev_del'?
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |                                                      ^~~~~~~
         |                                                      cdev_del
   include/linux/cdev.h:35:6: note: 'cdev_del' declared here
      35 | void cdev_del(struct cdev *);
         |      ^
   4 errors generated.


vim +129 drivers/remoteproc/amd_mbv_bram_rproc.c

   125	
   126	static int amd_bram_rproc_parse_fw(struct rproc *rproc,
   127					   const struct firmware *fw)
   128	{
 > 129		rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
   130						  "no resource table found\n");
   131		return 0;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
