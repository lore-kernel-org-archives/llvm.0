Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A429A3
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651689382; x=1683225382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rGo3gMl35NcWi6CiO2p7kI7eRAQlLpcb0ks6FH80HI=;
  b=kU2hTEzDqwwm0wi+77DJTZ/iXk3pt1DKz2qnbTyzfq7YddEm1s5G1ddh
   ew3cA0vyHqI5jK3h5bO8JIJPlZoZRx1zswImWQG1xP0kteB1lZhmVHf62
   RTfe7DT4fcvJJUFkybeXPm0s9ooy7p3pEP9DTcYDSPIiNDIoykrkePGEG
   kksXldAzERgVGTB6lgxfFBQLAklXijpvb8eyY8Lm1ngP/WmoeOPwAzF8c
   pdCYRLRbw0ZCrF+A8oKZSKgAYjNY4pv0SUfNcWiw/BaQYTgB5uwzsh4Sq
   +EUcpCylql7C6zjSyqKVzCYMw7HW9kBxWdIGvWWQjs7fh96DjOzMOoKLM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268014348"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="268014348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 11:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="734526208"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2022 11:36:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmJrH-000BhL-Km;
	Wed, 04 May 2022 18:36:19 +0000
Date: Thu, 5 May 2022 02:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jirislaby:devel 57/73] include/linux/consolemap.h:50:9: error: use
 of undeclared identifier 'c'
Message-ID: <202205050202.8dNFQmxj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   fab642eca5e0ca41e656c8a0685cadf975b7ff88
commit: b2c621c008e401176daf2b3a1ca78fa8d6ff01af [57/73] consolemap.h: convert macros to static inlines
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220505/202205050202.8dNFQmxj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=b2c621c008e401176daf2b3a1ca78fa8d6ff01af
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout b2c621c008e401176daf2b3a1ca78fa8d6ff01af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/panic.c:19:
   In file included from include/linux/vt_kern.h:16:
>> include/linux/consolemap.h:50:9: error: use of undeclared identifier 'c'
           return c & 0xff;
                  ^
   1 error generated.


vim +/c +50 include/linux/consolemap.h

    47	
    48	static inline int conv_uni_to_8bit(u32 uni)
    49	{
  > 50		return c & 0xff;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
