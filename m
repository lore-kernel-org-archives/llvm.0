Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11551FA1
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523553; x=1682059553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ny/t573XxmBPMvgs6kdlkybOpMmWgeRx2GkUhaOPr/k=;
  b=WWSyt0WSDPXEcniy/N8B8qjlmbmlIJ20HG5t77Hp3xU9nkn0XSAbj6gY
   VuhfGwaP7IdVXpNc3w+kS8FORklYOcwQUn7Be2IF+tv7AqDAkDadpUFTf
   dqPShnxerVs113knsw188mJkWR9fpraBCEU0qA8Q2OnBsgnonOwtVp/aL
   m6nGtfPn1fP4+KVH+ltTdy0CXITcT5x3I3ep2JDOMZ8lVYdXP+y3YHljz
   mm+HpoNVYSaXi2CcrkY9TxrwgifOgS6QQrNfyBafB42bP/x9ccUb+UDhI
   FQ32qz9jN2kdcigrQrSVKM+THlk128LUks+Z4FOgd6j0thrbhE5TnP28Q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251570910"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="251570910"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="593513491"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2022 23:45:52 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQZb-00082T-Kk;
	Thu, 21 Apr 2022 06:45:51 +0000
Date: Thu, 21 Apr 2022 14:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1711/2579]
 usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file not
 found
Message-ID: <202204211350.dqMcqQJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: d2d700a2eb67346fe31986e3915499c53959f5eb [1711/2579] headers/deps: net: Optimize <uapi/linux/netlink.h>
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220421/202204211350.dqMcqQJM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=d2d700a2eb67346fe31986e3915499c53959f5eb
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout d2d700a2eb67346fe31986e3915499c53959f5eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/entry/ arch/x86/kernel/cpu/ arch/x86/pci/ kernel/bpf/ kernel/trace/ net/ipv6/ samples/connector/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from samples/connector/ucon.c:14:
>> usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
