Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F003201;
	Sat, 11 Feb 2023 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676142084; x=1707678084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sB7zbWeySrfbNlWMh8oMRU31Ax4GPbJ5HxNK92R3mk=;
  b=kS90/C1kgaWxA9FiOLNP1t6JbMm3fs8ySeFGm5Z+iE9Nx/IyXhbf8Clq
   ef2hmqnl5zu822yfABqxN91Uc5ljgxZqXEE1kuW2phN7gZv/m2hPzXn/P
   tDGPcx3ErxpKU3JP12aaeefgvAlQ3RIgb3IRaETqA9qBIhs8KuyG+jR6P
   BIPAvYsGv1bChe0BGbPesYyKYUcc5VL7OxoulYvte0luYzJcIBJ+govu1
   eg5zzNwJTlCNkGBO57iX85MJ/hcvlnUQLEkW5mrTBlhb97UpKoDlRFlIl
   SYvCEHsAnQxG4Ta03L/6U8+I3p1pnOdl6AyxxId3kFMhPdaYDGIwyW1hI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="329271044"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="329271044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 11:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="618205354"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="618205354"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2023 11:01:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQv7h-0006kD-1a;
	Sat, 11 Feb 2023 19:01:21 +0000
Date: Sun, 12 Feb 2023 03:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/shrink-reloc 9/9] ld.lld: error:
 drivers/net/pcs/pcs_xpcs.o: invalid symbol index
Message-ID: <202302120206.RA0fnuxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/shrink-reloc
head:   f6fc990282a852a0b9aefd96ebda944b953db021
commit: f6fc990282a852a0b9aefd96ebda944b953db021 [9/9] objtool: Single-linked reloc_list(s)
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230212/202302120206.RA0fnuxA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=f6fc990282a852a0b9aefd96ebda944b953db021
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/shrink-reloc
        git checkout f6fc990282a852a0b9aefd96ebda944b953db021
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120206.RA0fnuxA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/net/pcs/pcs_xpcs.o: invalid symbol index
--
>> ld.lld: error: drivers/usb/host/xhci-pci.o: invalid symbol index
--
>> ld.lld: error: drivers/usb/gadget/function/usb_f_hid.o: invalid symbol index
--
>> ld.lld: error: drivers/md/dm-multipath.o: invalid symbol index

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
