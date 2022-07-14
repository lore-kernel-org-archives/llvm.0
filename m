Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB537E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657834189; x=1689370189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3c8rieG5/+3xGe+SwE823C2HKOyaQKK2fvLIkpyKg6c=;
  b=QOy5gVn4M8kAuRM3OJQluDkjnP9paeY9/Fpi7+o4zw2Ky1pQr3cm6mOS
   /mcnyK8T3uETOtITCZruK3AhxR7f0/w+88izJzxgXtM3jvE9YaEpMMdjr
   zuql4zy392tNDfHqUeK2wv9491rGpgI5sXCBokbyzEQYT+hIJXz+BfU8/
   gVl0qyqL6OXs4GgYtutkJHOyoVSePjIK8INwYKhEa3jRFriCmtvH6+O0A
   0edF1TrHsplXdMnnVQKUPvbvAA4eynnY3RZiQpdXId+iZPhjLt0dbRrFy
   Wkiay5V7ziAse1R6vk6y3yJZin6nL/w3c/yAU1dtWlDHe/CCEXsEruWbZ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286373894"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="286373894"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 14:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="923237838"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 14:29:44 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC6P1-0001An-Qp;
	Thu, 14 Jul 2022 21:29:43 +0000
Date: Fri, 15 Jul 2022 05:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:lkdtm 2/3] drivers/misc/lkdtm/rodata.c:14:26: error:
 expected string literal in 'asm'
Message-ID: <202207150539.2uMSuhwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git lkdtm
head:   91b11c81a070d7a1c75c467ccf6703b01cf78cfb
commit: 26fe5d8405b16b3153bdb867dda090256a561b80 [2/3] lkdtm: Disable return thunks in rodata.c
config: hexagon-randconfig-r024-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150539.2uMSuhwL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=26fe5d8405b16b3153bdb867dda090256a561b80
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe lkdtm
        git checkout 26fe5d8405b16b3153bdb867dda090256a561b80
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/rodata.c:14:26: error: expected string literal in 'asm'
                   asm(ANNOTATE_UNRET_SAFE);
                                          ^
   1 error generated.


vim +/asm +14 drivers/misc/lkdtm/rodata.c

     8	
     9	void noinstr lkdtm_rodata_do_nothing(void)
    10	{
    11		/* Does nothing. We just want an architecture agnostic "return". */
    12	
    13		if (IS_ENABLED(CONFIG_OBJTOOL))
  > 14			asm(ANNOTATE_UNRET_SAFE);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
