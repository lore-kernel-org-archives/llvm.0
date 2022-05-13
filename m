Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A919B
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652401810; x=1683937810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=orlb0ncJgJClud3H9qKLlbyLViKgSYsLoRo7/EE0OCQ=;
  b=Bg6MYdwIYA9AAhwmHeRCCb5CdOmebsVrJBxSj4yFFfIgDZKohxKfmkJG
   3w2Yat8OvW2RYS0PnSMS2jmiUlA+g0ddT/TCd2l5nh1hRW6loxpXDzmHJ
   gpTbNlW8aCP9MAc2n91Ek1VlbtAqmqttdu5RBBwPr2A2olO4kMRm8DktJ
   j5xjw3B/zjrFlg3EJVEq/a7TngodoWnftDtySyxjrGQrIbSPAwXX1BaTA
   VJfZ+17cmpVlt4DJ6IGzAxcjW4NINdqDPE2iyvpAQ/6HoSTXoMWeRNILs
   YG1yp6Be5KHh/pfuyr3IlI8wATqhnRBV64JT44RZrIAiYj70ux9ro0dtE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250705063"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="250705063"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 17:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="521197730"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2022 17:30:08 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npJC3-000L6Q-H2;
	Fri, 13 May 2022 00:30:07 +0000
Date: Fri, 13 May 2022 08:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/3] mtd: parsers: add support for Sercomm partitions
Message-ID: <202205130802.ScXfu9JP-lkp@intel.com>
References: <20220510162655.21011-1-csharper2005@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510162655.21011-1-csharper2005@gmail.com>

Hi Mikhail,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on mtd/mtd/fixes v5.18-rc6 next-20220512]
[cannot apply to mtd/mtd/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikhail-Zhilkin/Add-support-for-Sercomm-partitions/20220511-003050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm-buildonly-randconfig-r004-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130802.ScXfu9JP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/4e746c022f0e23b585b21e8b9f42a1ee6a75471f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mikhail-Zhilkin/Add-support-for-Sercomm-partitions/20220511-003050
        git checkout 4e746c022f0e23b585b21e8b9f42a1ee6a75471f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by scpart.c:72 (drivers/mtd/parsers/scpart.c:72)
   >>>               mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
