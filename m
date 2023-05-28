Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88E7E;
	Sun, 28 May 2023 04:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685247598; x=1716783598;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IAArgVt+F4ilcf8aIjDVOxNkZhE16aW1VQSi0Re0MzQ=;
  b=DL0VC41T1LU5lL8YPHMG9alnBnWwysw78xnLYrQ+ztf8chFbH2+diVa4
   n3IQhYxPuBgpzPMsl3wmLTZ2A7vf5AUDuQthZ/YZ/VJ0PUtzaphG2GBnB
   YA0jl1zPnc9shCUpD7GK8BtL8RQihtqzG3n88kTOe0KzhxUs3ZUXI1i+Q
   s+IShgxjvVnr7swiglwWPCx8IScdaOo5BOUZbeYSX3m0/63wsVnoheWwY
   lZ/QgzRPEjEDQjrG1MRkrmIPv3XxSBjvFpI/8WtRYOEJLmt2GjOwL6V1y
   ESrlpKErmV+KY70o9qqNXHmmaVso5dqqRWr/ezpC49o72I5uOSULxm/3q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420241571"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420241571"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 21:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="683148753"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="683148753"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2023 21:19:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q37sn-000KQa-34;
	Sun, 28 May 2023 04:19:53 +0000
Date: Sun, 28 May 2023 12:19:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-diet 24/34] drivers/regulator/rk808-regulator.o:
 warning: objtool: elf_init_reloc: bad reloc_idx 24 for .rela__mcount_loc
 with 19 relocs
Message-ID: <202305281245.yZUx5ZM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diet
head:   e83011919f26dc7d7363b27a94472cfe8e586ffe
commit: fd9700f546f95421601b679868422e8a14b96a09 [24/34] objtool: Get rid of reloc->list
config: x86_64-randconfig-x091-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281245.yZUx5ZM4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=fd9700f546f95421601b679868422e8a14b96a09
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-diet
        git checkout fd9700f546f95421601b679868422e8a14b96a09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281245.yZUx5ZM4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/rk808-regulator.o: warning: objtool: elf_init_reloc: bad reloc_idx 24 for .rela__mcount_loc with 19 relocs
--
>> drivers/comedi/drivers/pcl724.o: warning: objtool: elf_init_reloc: bad reloc_idx 8 for .rela__mcount_loc with 3 relocs
--
>> drivers/comedi/drivers/multiq3.o: warning: objtool: elf_init_reloc: bad reloc_idx 16 for .rela__mcount_loc with 10 relocs
--
>> drivers/comedi/drivers/cb_das16_cs.o: warning: objtool: elf_init_reloc: bad reloc_idx 16 for .rela__mcount_loc with 9 relocs
--
>> drivers/comedi/drivers/das08_cs.o: warning: objtool: elf_init_reloc: bad reloc_idx 8 for .rela__mcount_loc with 3 relocs
--
>> drivers/comedi/drivers/ni_labpc_cs.o: warning: objtool: elf_init_reloc: bad reloc_idx 8 for .rela__mcount_loc with 4 relocs
--
>> drivers/comedi/drivers/das08.o: warning: objtool: elf_init_reloc: bad reloc_idx 16 for .rela__mcount_loc with 10 relocs
--
>> drivers/comedi/drivers/pcl816.o: warning: objtool: elf_init_reloc: bad reloc_idx 16 for .rela__mcount_loc with 16 relocs
--
>> drivers/comedi/drivers/pcm3724.o: warning: objtool: elf_init_reloc: bad reloc_idx 8 for .rela__mcount_loc with 3 relocs

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
