Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256417EA
	for <llvm@lists.linux.dev>; Sat, 21 May 2022 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653118356; x=1684654356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTUzcVXLR1ZqjuyoEr0yZOCZkVI2qqgDn7omBlVDpE4=;
  b=e6R3QOL3a51NaaVYqyUGJNINsKT6LadUDkU/nWIoxFBxjjb9PuGar76F
   ST/u4TjtPa9XO/32vPD9HoV7zL6VNawK54yE9ycQ+Ajn256L+ZdYzeMwX
   PyduLuli4Xr6YwX/BdXtGj6H8Imij4gzQbks6RhVg0PvtYLJAxlc4mZvc
   dPFgavR1g/8/oo1YgTtVvR8neSeFR3E7+XRlGFbZvU2VED6UDW+y0wui/
   utno/EjbXdMBjHakftQfL8Ud+Y0squpMka/d+T/FfU6OOInfMdjt6kOBa
   b5j95+c4G/zV5WyxQtqYRTXyCCCvFyze2+uvM6SIaicSsw2/5OOtwCmf+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="260408973"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="260408973"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 00:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="702123546"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 May 2022 00:32:33 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsJbE-00064k-LD;
	Sat, 21 May 2022 07:32:32 +0000
Date: Sat, 21 May 2022 15:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12117/13468] llvm-objcopy: error: invalid output
 format: 'elf64-s390'
Message-ID: <202205211550.ifuEnz5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: adda746629b4a3950f313bc645fa0e54daee871c [12117/13468] s390/purgatory: workaround llvm's IAS limitations
config: s390-randconfig-r024-20220519 (https://download.01.org/0day-ci/archive/20220521/202205211550.ifuEnz5n-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=adda746629b4a3950f313bc645fa0e54daee871c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout adda746629b4a3950f313bc645fa0e54daee871c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: invalid output format: 'elf64-s390'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
