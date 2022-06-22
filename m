Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E810E8
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655862086; x=1687398086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TI0qxXJYU04o+VPhEDdU2KkAmGKtZmmgZVDd0z+UqMo=;
  b=TP0uCCg4sxiPZbO2XXzzlBy07YRCK6nld/FiE6nOBJcn8v0djhlOQ7v9
   xPOJmJZxfTjMPYq7K/JN/4GOizms7qAYZb6nKhh5KJYWZvUJ4VAbzu1M9
   XFuNchlrp+huowIIZ8aJekUtvgSc8imW8juQNOnPDkdFoN3q0b3AFlTAu
   lf/umNtXf7W4bvLPHlxU3u0gKHmXGptQAKkF70DX1s9eFhUvXVFd0OWGp
   Jv8nxSzqNSSewJxnt/NFcFLKiLvh7e4sfNKjQYQEZjIALiXXIG8ZLHpjg
   P3rYnxaDU9UbuNuOuSA8G6qxx/ZuLfHHblUg1NzNNPeSFNCBj80FJLdBa
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269002812"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="269002812"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 18:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="586561184"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 18:41:23 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3pMx-0000fh-14;
	Wed, 22 Jun 2022 01:41:23 +0000
Date: Wed, 22 Jun 2022 09:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Niklas Cassel <Niklas.Cassel@wdc.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 3/9] block: Generalize get_current_ioprio() for any task
Message-ID: <202206220956.wXt005QG-lkp@intel.com>
References: <20220621102455.13183-3-jack@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621102455.13183-3-jack@suse.cz>

Hi Jan,

I love your patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v5.19-rc3 next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/block-Fix-IO-priority-mess/20220621-183235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: s390-randconfig-r021-20220622 (https://download.01.org/0day-ci/archive/20220622/202206220956.wXt005QG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8421c851d4fe5f4b9d9d6870ada8ccd0b48a4012
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/block-Fix-IO-priority-mess/20220621-183235
        git checkout 8421c851d4fe5f4b9d9d6870ada8ccd0b48a4012
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:9:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:38:
>> include/linux/ioprio.h:60:27: error: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Werror,-Wint-conversion]
           return __get_task_ioprio(current);
                                    ^~~~~~~
   arch/s390/include/asm/current.h:17:17: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:52:41: note: passing argument to parameter 'ioprio' here
   static inline int __get_task_ioprio(int ioprio)
                                           ^
   1 error generated.


vim +60 include/linux/ioprio.h

    57	
    58	static inline int get_current_ioprio(void)
    59	{
  > 60		return __get_task_ioprio(current);
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
