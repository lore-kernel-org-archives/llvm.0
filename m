Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A02F2A
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651514086; x=1683050086;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QSuAdWXNezg/43wQCSILPHE45X+zLQpYNOi9j9gxJbw=;
  b=bF78TxFq0AbMzWDokXJH4o+Z9KEsS6I1xfOAo2ePaiQcMcMl3GdJiIaK
   nSSYWVx86JM0NEPMu07rUiOg86puRxMJXfrz8hoiXNfyujY41JT1NzA/R
   UeNZjznZiSI4YEksZK+ULUxqOzPBejPGfnCLlXaUPwmc0G3B4LlgFvTbk
   eCChoA04lRf9oLqwcsB8EzNSCcNaMuURcKRtVDmqeM109kHA0TmlTdnKM
   ivol2KoZ6/EMM7qrxKRbPfbeDCM9PJNtpCML14p+d/yfcclsxMqCAMfox
   7LyPo99YddsMLGe6dZqr6/StIsq57GKCOm10GDiqrg7kcrUH+dRUg+3vO
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247192406"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="247192406"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 10:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="620007878"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 May 2022 10:54:34 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlaFm-0009kW-7d;
	Mon, 02 May 2022 17:54:34 +0000
Date: Tue, 3 May 2022 01:53:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [asahilinux:bits/100-shutdown-notifier 4/20] kernel/reboot.o:
 warning: objtool: sys_off_handler_power_off()+0x6a: sibling call from
 callable instruction with modified stack frame
Message-ID: <202205030138.Quaup1Vx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/100-shutdown-notifier
head:   06115822707a3ed6f89da2ea9c157c283b6750ee
commit: 6025f4b3d1a321e1cfc8a6b6651395cc43ceb2f3 [4/20] kernel: Add combined power-off+restart handler call chain API
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220503/202205030138.Quaup1Vx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/6025f4b3d1a321e1cfc8a6b6651395cc43ceb2f3
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/100-shutdown-notifier
        git checkout 6025f4b3d1a321e1cfc8a6b6651395cc43ceb2f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/reboot.o: warning: objtool: sys_off_handler_power_off()+0x6a: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
