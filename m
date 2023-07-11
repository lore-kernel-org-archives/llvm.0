Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AAE18C17;
	Tue, 11 Jul 2023 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689083526; x=1720619526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLW2AfZubKM5H5oA2vOTrS2GeEApIR1NkR0qa2is2yo=;
  b=HQAPBtdpxeYrefL9s3LFmrZDa8jkLVXMxGZU48/yGBiaRSSHqcC4aHNL
   LGhRGKnujD3nCHatz8vUMMghb/Xe0czx5h4jOkqQcxLL0oHOyxuwGYoRU
   UHcAKNrrA98ttD11KfPZDPvCsBIbwOmfWGILGpZdRJLFI2l1iI0C2iTX/
   +hulS2TJ3rdWRO3tsbcR6rAPsYRxj+hcEPReRqI+eQITB3fJHchdRZY/w
   ZDYAKLBs8oycnGA62k5VE1cvfeIvOVLoq4LbZrUqXgFWltwrUr7VvLVbu
   dilRZMSG8cR00Oun5izicW0jzSRkg9PzktMtZYaEbJXFjPPIIrdOAHw8p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368122582"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="368122582"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 06:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="895182871"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="895182871"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 06:52:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJDmd-0004qH-0s;
	Tue, 11 Jul 2023 13:52:03 +0000
Date: Tue, 11 Jul 2023 21:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 754/1391] /bin/bash: line 1: 50431 Segmentation
 fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/pcmcia/pcmcia_core.ko
Message-ID: <202307112158.3RFyuSZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
commit: c628747cc8800cf6d33d09f7f42c8b6f91e64dc7 [754/1391] libbpf: only reset sec_def handler when necessary
config: arm-randconfig-r032-20230710 (https://download.01.org/0day-ci/archive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112158.3RFyuSZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112158.3RFyuSZJ-lkp@intel.com/

Note: the linux-next/master HEAD 8e4b7f2f3d6071665b1dfd70786229c8a5d6c256 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   die__process_unit: DW_TAG_subrange_type (0x21) @ <0x14a5b> not handled!
   die__process_unit: tag not supported 0x21 (subrange_type)!
   die__process_unit: DW_TAG_subrange_type (0x21) @ <0x1e457> not handled!
   die__create_new_array: DW_TAG_union_type (0x17) @ <0x14a70> not handled!
   die__process_class: DW_TAG_compile_unit (0x11) @ <0x1e4bc> not handled!
   die__process_class: tag not supported 0x11 (compile_unit)!
>> /bin/bash: line 1: 50431 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/pcmcia/pcmcia_core.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
