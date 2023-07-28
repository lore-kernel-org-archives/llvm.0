Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634D14AA0;
	Fri, 28 Jul 2023 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690572571; x=1722108571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8aRBQf7t+k5Sr4K8mwAHKOil72nZliOx8Qi63WvbUvo=;
  b=GxsRGld17/gpyQ8uUXI4/GEfH6Qsb7vhWigqmor4Mo9/cXALdNWPd6U9
   aKnSGRrvQ302iPpmhLcM27/bAj81yQkop8Sps5rtCB6fVRSt6eI/kYuxw
   k8rwoW/AfznRadan7kWC0dOhWd3sF2itrToNSuOMF5H2KZ5dEyav6LFN6
   kUj8M3y38wGhrvX7VRKLE4BCvBQWdR3i5gQYHz3DKnCFgub8djN8hxR/T
   2ZIvH9Id4ukooRzcSFqnDlykf0lEmt2eyCBnojvDJ4xraKACGRHN6ad6g
   ny3Qx2M5Lb3GJrQhD8FAbzekEirxbJOrNXHPWa3RSSTb1wFgqq5IyyoCQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="399608749"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="399608749"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 12:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704683168"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="704683168"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 12:29:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPT9T-0003WJ-1q;
	Fri, 28 Jul 2023 19:29:27 +0000
Date: Sat, 29 Jul 2023 03:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>,
	Jan Kara <jack@suse.cz>
Subject: [linux-next:master 2208/5284] /bin/bash: line 1: 12782 Segmentation
 fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/media/radio/shark2.ko
Message-ID: <202307290344.l7PGPvbU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 880b9577855edddda1e732748e849c63199d489b [2208/5284] fs: distinguish between user initiated freeze and kernel initiated freeze
config: hexagon-randconfig-r006-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290344.l7PGPvbU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290344.l7PGPvbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290344.l7PGPvbU-lkp@intel.com/

All errors (new ones prefixed by >>):

   die__create_new_enumeration: DW_TAG_subrange_type (0x21) @ <0x20103> not handled!
   die__create_new_enumeration: DW_TAG_structure_type (0x13) @ <0x20109> not handled!
   die__process_unit: DW_TAG_member (0xd) @ <0x20199> not handled!
   die__process_unit: tag not supported 0xd (member)!
   die__process_unit: DW_TAG_subrange_type (0x21) @ <0x201a3> not handled!
   die__process_unit: tag not supported 0x21 (subrange_type)!
   die__create_new_enumeration: DW_TAG_member (0xd) @ <0xffcf> not handled!
   die__create_new_enumeration: DW_TAG_structure_type (0x13) @ <0xffd8> not handled!
   die__create_new_enumeration: DW_TAG_compile_unit (0x11) @ <0xfff2> not handled!
   die__process_class: DW_TAG_enumerator (0x28) @ <0x10089> not handled!
   die__process_class: tag not supported 0x28 (enumerator)!
   die__process_class: DW_TAG_INVALID (0) @ <0x10098> not handled!
   die__process_class: tag not supported 0 (INVALID)!
   namespace__recode_dwarf_types: couldn't find 0x100a1 type for 0x1008c (member)!
>> /bin/bash: line 1: 12782 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/media/radio/shark2.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
