Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430F1FD4
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654467264; x=1686003264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OqAu0TIQgKHqhNgNYHS6ymIPIAjfxpIImb7kHTeFIag=;
  b=XjPOJBJgzBiQUziO13008vO4Z6s6e3JUOSE+SbjOJ4IGDN2icsmPBMCQ
   41+Foh5/ixfzwnOItyorhEKrcdK+WDJjl3IKhBv8h3sUzF0wxgMdE2oqy
   QeyaArJT+fEDDLwr1ewsgp/cueKs7jY0ZDCZ972WWANjOHdwF1RSAI1mQ
   TFr1jXHLpPRBcIwxGUJfQOuvIlUEXO9XMOt+vbEMPPOC/QEB+6qU7VVxM
   hQN0201Kg9mzse9oAg3K+LAkyXFmklp/6lCfKfHuIv7d5vtC930EYqy3x
   m3HtADzK1RhWz0t/8w+zVJza2dcD2XXEqCYiSxoviSpIDSsq21qJBFhBI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="301956386"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="301956386"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 15:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="758314031"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jun 2022 15:13:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxyVS-000CI3-CX;
	Sun, 05 Jun 2022 22:13:58 +0000
Date: Mon, 6 Jun 2022 06:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/1] kernel.h: Move sysfs related macro to sysfs.h
Message-ID: <202206060647.TvX3UWaq-lkp@intel.com>
References: <20220603172101.49950-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603172101.49950-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/kernel-h-Move-sysfs-related-macro-to-sysfs-h/20220606-004344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: arm-pcm027_defconfig (https://download.01.org/0day-ci/archive/20220606/202206060647.TvX3UWaq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/0fad3ce70c6f6736d3913e3238642a056f70b123
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/kernel-h-Move-sysfs-related-macro-to-sysfs-h/20220606-004344
        git checkout 0fad3ce70c6f6736d3913e3238642a056f70b123
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mm/alignment.c:87:1: error: call to undeclared function 'VERIFY_OCTAL_PERMISSIONS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   core_param(alignment, ai_usermode, int, 0600);
   ^
   include/linux/moduleparam.h:330:2: note: expanded from macro 'core_param'
           __module_param_call("", name, &param_ops_##type, &var, perm, -1, 0)
           ^
   include/linux/moduleparam.h:294:6: note: expanded from macro '__module_param_call'
               VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
               ^
>> arch/arm/mm/alignment.c:87:1: error: initializer element is not a compile-time constant
   core_param(alignment, ai_usermode, int, 0600);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:330:2: note: expanded from macro 'core_param'
           __module_param_call("", name, &param_ops_##type, &var, perm, -1, 0)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:294:6: note: expanded from macro '__module_param_call'
               VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/VERIFY_OCTAL_PERMISSIONS +87 arch/arm/mm/alignment.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  86  
d944d549aa86e0 Russell King   2010-02-20 @87  core_param(alignment, ai_usermode, int, 0600);
d944d549aa86e0 Russell King   2010-02-20  88  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
