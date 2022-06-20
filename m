Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DE3D6E
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655756940; x=1687292940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hUBdBb6ILpffwHa7sM2Q3sEI4C6GxR3yhUVEP/IqeC4=;
  b=Ay8UAeJWXE81Pq2LaoMWjaLDauOZR3E6py24qCFJztcdCcuPSYuDw9f/
   0dB1FGpibk4r/wXgAwl4GgPyg4DrDE8lH4gffFCFEtsJ4NWefb5GHWmVi
   XxCb+WrnW3J+qagTUYrUbDHV3E8gd9RLJ6DknH7cWNI3FH8OwkuAb5UWq
   Y0ZOhljul2boPZbsj2AQ+2s+9aOg4Nzcq8o2cEF071AK6OuRFi8GjQKYn
   PeLug0wxInjiPfbk8v2cpyQ2NI5rktV3JWY3FeG6LZJqWW8MVokA3ekdi
   N93/G0tizTt7uwX8R7LBJr9sib0cfYXqPPOSNh1ddk4bQTDvAsLtxCT28
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="259790802"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="259790802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="676671689"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2022 13:28:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3O13-000VxH-8v;
	Mon, 20 Jun 2022 20:28:57 +0000
Date: Tue, 21 Jun 2022 04:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Niklas Cassel <Niklas.Cassel@wdc.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 4/8] block: Fix handling of tasks without ioprio in
 ioprio_get(2)
Message-ID: <202206210431.uTcCuUoS-lkp@intel.com>
References: <20220620161153.11741-4-jack@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620161153.11741-4-jack@suse.cz>

Hi Jan,

I love your patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/block-Fix-IO-priority-mess/20220621-001427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: s390-randconfig-r044-20220620 (https://download.01.org/0day-ci/archive/20220621/202206210431.uTcCuUoS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/73f39284cec50db7a3e973a9a4ed56f7f706dd1b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/block-Fix-IO-priority-mess/20220621-001427
        git checkout 73f39284cec50db7a3e973a9a4ed56f7f706dd1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: fs/read_write.o: in function `get_current_ioprio':
>> include/linux/ioprio.h:53: undefined reference to `__get_task_ioprio'
>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: include/linux/ioprio.h:53: undefined reference to `__get_task_ioprio'
>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: include/linux/ioprio.h:53: undefined reference to `__get_task_ioprio'
>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: include/linux/ioprio.h:53: undefined reference to `__get_task_ioprio'
>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: include/linux/ioprio.h:53: undefined reference to `__get_task_ioprio'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: fs/seq_file.o:include/linux/ioprio.h:53: more undefined references to `__get_task_ioprio' follow


vim +53 include/linux/ioprio.h

    50	
    51	static inline int get_current_ioprio(void)
    52	{
  > 53		return __get_task_ioprio(current);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
