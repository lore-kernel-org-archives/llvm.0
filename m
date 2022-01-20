Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E652C9C
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 03:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642649269; x=1674185269;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XidIl6c/NOOubGQSg9lYmsb8RMcs1BDkchlBA1k1zmA=;
  b=XnjFannVRjWGD1Q2hDePcDF5klwlPlg6XBPad+cZJgy9PqIWqSW6Xy2/
   d2f7KcwNYUnflRdycRvZJNeU2LF5qpWUvFvhC78VnMxZK6aBW+LpaReW8
   9gsS4eaZ+T3zSOIoQo9q8MHUGmroDaLQQtJmySXqJmC3x5+vcYTX3EerJ
   OH730FXkX44LtvNvWNMyUgRw/Hzi7tXLVMllkBVrg2p1w+IGsFmwy/Ds8
   4KFRcOkpjtZmK3NcV6ttFVdeaQl05pIzjMMFKe8KIgyCxWGsbpuQHcZe9
   Kmee0XLvnd3eA8z/PPS8lJ6gYN4RuVZihBVwEeelzak5ugR5TJulmqXJZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="305993446"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="305993446"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 19:27:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; 
   d="scan'208";a="493279217"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2022 19:27:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAO71-000DxP-GT; Thu, 20 Jan 2022 03:27:47 +0000
Date: Thu, 20 Jan 2022 11:27:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 248/360] ERROR: modpost:
 "dwc3_gadget_exit_hibernation" [drivers/usb/dwc3/dwc3.ko] undefined!
Message-ID: <202201200811.ALRs8uxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   dc405906cdb8a89cd81b6ca4f438fe213c187cb2
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [248/360] Merge tag 'v5.15' into master
config: x86_64-randconfig-a006-20220117 (https://download.01.org/0day-ci/archive/20220120/202201200811.ALRs8uxb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9b62852ec04b7d48971ce8016b13c27403929908
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 9b62852ec04b7d48971ce8016b13c27403929908
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_gadget_exit_hibernation" [drivers/usb/dwc3/dwc3.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
