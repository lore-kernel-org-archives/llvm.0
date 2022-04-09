Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B527E3
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 05:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649482379; x=1681018379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSZGrWvtL+Wz3crmHQOvxroGfbsxwsUHkARCKgPfTz4=;
  b=NepmRlTH6f2OhZk9u4LH0CvGPGE9/wvYNFAfRZq5653wwQKajB4zOBHX
   nEL2LI1hYJPDWv0Wz5E+xx7/F58KqJ/qPa6J1KuHJ/9cU2l8GqV1/ievU
   PlVueYn/1I2sHZIgkpqBbWG4D4Aa5BP65MAqocjn5YpXmkp5oMFyZQVAZ
   jOwjB8IRCB2UuQUHV+EDtgmScJWYwyQmkkfqQT78TbLS3mMbqXeSkhxkn
   VoYdA9iyVPdIviF4T91Z8lMNeeoTDoGfDM3D5d5tOxtHuEE7Wr1Zt95h4
   wAauALaBkkRWpCud/r7uNbDnOjmKU5H+s7uA+RS8F1UtNczHWFADQImnZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="259359645"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="259359645"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 22:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="653601731"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2022 22:32:57 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nd3iS-0000uV-Lw;
	Sat, 09 Apr 2022 05:32:56 +0000
Date: Sat, 9 Apr 2022 13:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morse:mpam/snapshot/v5.17 60/137] WARNING: modpost:
 vmlinux.o(.text+0x1e0027): Section mismatch in reference from the function
 resctrl_init() to the function .init.text:thread_throttle_mode_init()
Message-ID: <202204091306.bwxNJVQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v5.17
head:   fb7499c2de17b6b98e0e3ac5b7b023bfc5a6f3a4
commit: 0c3df0028a436752977109f708781e42e5dad5d1 [60/137] x86/resctrl: Drop __init/__exit on assorted symbols
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220409/202204091306.bwxNJVQN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=0c3df0028a436752977109f708781e42e5dad5d1
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v5.17
        git checkout 0c3df0028a436752977109f708781e42e5dad5d1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x1e0027): Section mismatch in reference from the function resctrl_init() to the function .init.text:thread_throttle_mode_init()
The function resctrl_init() references
the function __init thread_throttle_mode_init().
This is often because resctrl_init lacks a __init
annotation or the annotation of thread_throttle_mode_init is wrong.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
