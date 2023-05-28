Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CE7E;
	Sun, 28 May 2023 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685246336; x=1716782336;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dZ1SIja9t+0aibvzfhEe9/NEfBlkHyVIaZ+2evuAS7U=;
  b=Nv1IVEB1c3P8D0oWtIEBiXQLOrzujuErqjpZJW9/fb5pd30phGMkrejb
   PTWgW68VZaHEi51vum7txocYhbWvA3lufG3ky7V0QaPbsV2BrefQjOwPU
   Y6JrhwP1nk6lNuLDIk/qCpKKoCAFLH2HM3bbcb7rhN9yVcCk2yYceR/OX
   GMSbazVae+9F7UAcTmrFg27PuyVdIblg02HqcjFaRFt527W7nGpKOa0/p
   3Wgujf2AwZGnAw05qb9POWzdSh9kypprJd4HkBayJoPHzQUhAwwQfIJ/R
   rBR77SDCDOWCbUcIy7dfgxK/WrSC/nYhW9OvM+S/lCIUZ5LvZrjZvuFne
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="351981150"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="351981150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 20:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="738710190"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="738710190"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2023 20:58:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q37YT-000KQA-1d;
	Sun, 28 May 2023 03:58:53 +0000
Date: Sun, 28 May 2023 11:58:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-diet 24/34]
 drivers/platform/x86/classmate-laptop.o: warning: objtool: elf_init_reloc:
 bad reloc_idx 32 for .rela__mcount_loc with 31 relocs
Message-ID: <202305281142.GD8T1iq2-lkp@intel.com>
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
config: x86_64-randconfig-x065-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281142.GD8T1iq2-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/ drivers/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281142.GD8T1iq2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/classmate-laptop.o: warning: objtool: elf_init_reloc: bad reloc_idx 32 for .rela__mcount_loc with 31 relocs
--
>> drivers/media/pci/intel/ipu3/ipu3-cio2-main.o: warning: objtool: elf_init_reloc: bad reloc_idx 40 for .rela__mcount_loc with 40 relocs
--
>> drivers/media/pci/intel/ipu3/cio2-bridge.o: warning: objtool: elf_init_reloc: bad reloc_idx 8 for .rela__mcount_loc with 2 relocs

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
