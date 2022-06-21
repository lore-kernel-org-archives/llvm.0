Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539E1C0C
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 23:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655855963; x=1687391963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YjwFAUooq/ib+Rloguw7WdWKzElE9xijXQXkcyU9l8s=;
  b=WZ7Dz5hUh+BmN3AjVwdBuwWIFf9pu/cspL6YKPisOIHxUnQk400XjMoB
   bz4G8c/avqrr8Z/7CBcD9I3ijyRWPZeajbs2ulNaiTyFZvBnlbKX/ig9F
   R0YfFtqnV1lyzQqadTTlCyM5ng7DvWuIar57D+zS6AVmKJsX8lklRHJJs
   DJ4dLrXWDRmZtNFuQAilAwvT8y2YNMhViawIiDhEgaQADEJqs3azrqR+V
   xL43azPKclVsnGkhRUSA8QTy+stJSgg3euUwurkmDH/TWdh/EjMC22DZH
   2X07SJGVSYfpkozQO9A5Bwfp4/zfbTXgSsgGMUq9qRH5mD5yr1SrTPn9A
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263302679"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="263302679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 16:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="538237889"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2022 16:59:19 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3nmA-0000aH-UA;
	Tue, 21 Jun 2022 23:59:18 +0000
Date: Wed, 22 Jun 2022 07:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Niklas Cassel <Niklas.Cassel@wdc.com>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 3/9] block: Generalize get_current_ioprio() for any task
Message-ID: <202206220716.sxn2tinw-lkp@intel.com>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.19-rc3 next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/block-Fix-IO-priority-mess/20220621-183235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-randconfig-r016-20220622 (https://download.01.org/0day-ci/archive/20220622/202206220716.sxn2tinw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8421c851d4fe5f4b9d9d6870ada8ccd0b48a4012
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/block-Fix-IO-priority-mess/20220621-183235
        git checkout 8421c851d4fe5f4b9d9d6870ada8ccd0b48a4012
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:38:
>> include/linux/ioprio.h:60:27: warning: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Wint-conversion]
           return __get_task_ioprio(current);
                                    ^~~~~~~
   include/asm-generic/current.h:8:17: note: expanded from macro 'current'
   #define current get_current()
                   ^~~~~~~~~~~~~
   include/asm-generic/current.h:7:23: note: expanded from macro 'get_current'
   #define get_current() (current_thread_info()->task)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:52:41: note: passing argument to parameter 'ioprio' here
   static inline int __get_task_ioprio(int ioprio)
                                           ^
   1 warning generated.
--
   In file included from drivers/iio/proximity/isl29501.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:38:
>> include/linux/ioprio.h:60:27: warning: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Wint-conversion]
           return __get_task_ioprio(current);
                                    ^~~~~~~
   include/asm-generic/current.h:8:17: note: expanded from macro 'current'
   #define current get_current()
                   ^~~~~~~~~~~~~
   include/asm-generic/current.h:7:23: note: expanded from macro 'get_current'
   #define get_current() (current_thread_info()->task)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:52:41: note: passing argument to parameter 'ioprio' here
   static inline int __get_task_ioprio(int ioprio)
                                           ^
   drivers/iio/proximity/isl29501.c:1000:34: warning: unused variable 'isl29501_i2c_matches' [-Wunused-const-variable]
   static const struct of_device_id isl29501_i2c_matches[] = {
                                    ^
   2 warnings generated.
--
   In file included from drivers/iio/proximity/sx9500.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:38:
>> include/linux/ioprio.h:60:27: warning: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Wint-conversion]
           return __get_task_ioprio(current);
                                    ^~~~~~~
   include/asm-generic/current.h:8:17: note: expanded from macro 'current'
   #define current get_current()
                   ^~~~~~~~~~~~~
   include/asm-generic/current.h:7:23: note: expanded from macro 'get_current'
   #define get_current() (current_thread_info()->task)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:52:41: note: passing argument to parameter 'ioprio' here
   static inline int __get_task_ioprio(int ioprio)
                                           ^
   drivers/iio/proximity/sx9500.c:1035:36: warning: unused variable 'sx9500_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id sx9500_acpi_match[] = {
                                      ^
   2 warnings generated.
--
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:38:
>> include/linux/ioprio.h:60:27: warning: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Wint-conversion]
           return __get_task_ioprio(current);
                                    ^~~~~~~
   include/asm-generic/current.h:8:17: note: expanded from macro 'current'
   #define current get_current()
                   ^~~~~~~~~~~~~
   include/asm-generic/current.h:7:23: note: expanded from macro 'get_current'
   #define get_current() (current_thread_info()->task)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:52:41: note: passing argument to parameter 'ioprio' here
   static inline int __get_task_ioprio(int ioprio)
                                           ^
   1 warning generated.
   <stdin>:1517:2: warning: syscall clone3 not implemented [-W#warnings]
   #warning syscall clone3 not implemented
    ^
   1 warning generated.


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
