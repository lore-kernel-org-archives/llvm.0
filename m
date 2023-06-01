Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AF539B;
	Thu,  1 Jun 2023 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685603473; x=1717139473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7QwTtXWCLrgrgBxa4hvrg0tIDMBH8BxqCxL0wocVc3o=;
  b=eoszDThIFV6knaRsQhCEvcyCUWb9xfDakML2ZbgRN2iENJZfdueriz1U
   wrVZH/ldLXRMj3dC15rdl2GyJoHFmeYVYtr1lYsRnVkvyOJTucsys7fL5
   upqOFtvPBKrvazCxRKTTCmA2P/Jmi9Nuq6fePfXSXVHGo654W+lRJm5nj
   tqbdEaytmWQYgxIq0N5GB4rUy2t2QeRAowVZXhh5IGEWfbKISe4UDP+5p
   /yvMhI6JyoVckIgghnwEyhXcEZeVTQ59yT75d+gM4OpJ1+ewduGFMm8x8
   UV9JsA/GhCw8I5RQL2JJG0pg/5+1A0gPJENkYXY2guPTftHyIHkU37FuN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357875337"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="357875337"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 00:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="1037371609"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="1037371609"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2023 00:11:09 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4cSj-00022M-0B;
	Thu, 01 Jun 2023 07:11:09 +0000
Date: Thu, 1 Jun 2023 15:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bongkyu Kim <bongkyu7.kim@samsung.com>, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	boqun.feng@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, jwook1.kim@samsung.com,
	lakkyung.jung@samsung.com, Bongkyu Kim <bongkyu7.kim@samsung.com>
Subject: Re: [PATCH] locking/rwsem: Optionally re-enable reader optimistic
 spinning
Message-ID: <202306011420.8opqhG4p-lkp@intel.com>
References: <20230531003436.7082-1-bongkyu7.kim@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531003436.7082-1-bongkyu7.kim@samsung.com>

Hi Bongkyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bongkyu-Kim/locking-rwsem-Optionally-re-enable-reader-optimistic-spinning/20230531-083658
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20230531003436.7082-1-bongkyu7.kim%40samsung.com
patch subject: [PATCH] locking/rwsem: Optionally re-enable reader optimistic spinning
config: x86_64-randconfig-x063-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011420.8opqhG4p-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8c4098eb89be5b82aded3d17b22f78013454d058
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bongkyu-Kim/locking-rwsem-Optionally-re-enable-reader-optimistic-spinning/20230531-083658
        git checkout 8c4098eb89be5b82aded3d17b22f78013454d058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/events/ arch/x86/kernel/fpu/ drivers/of/ drivers/usb/host/ kernel/locking/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011420.8opqhG4p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1163:24: warning: incompatible pointer to integer conversion passing 'struct rw_semaphore *' to parameter of type 'int' [-Wint-conversion]
               rwsem_no_spinners(sem)) {
                                 ^~~
   kernel/locking/rwsem.c:332:1: warning: unused function 'rwsem_owner_flags' [-Wunused-function]
   rwsem_owner_flags(struct rw_semaphore *sem, unsigned long *pflags)
   ^
   2 warnings generated.


vim +1163 kernel/locking/rwsem.c

  1133	
  1134	/*
  1135	 * Wait for the read lock to be granted
  1136	 */
  1137	static struct rw_semaphore __sched *
  1138	rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
  1139	{
  1140		long owner, adjustment = -RWSEM_READER_BIAS;
  1141		long rcnt = (count >> RWSEM_READER_SHIFT);
  1142		struct rwsem_waiter waiter;
  1143		DEFINE_WAKE_Q(wake_q);
  1144	
  1145		/*
  1146		 * To prevent a constant stream of readers from starving a sleeping
  1147		 * waiter, don't attempt optimistic spinning if the lock is currently
  1148		 * owned by readers.
  1149		 */
  1150		owner = atomic_long_read(&sem->owner);
  1151		if ((owner & RWSEM_READER_OWNED) && (rcnt > 1) &&
  1152		   !(count & RWSEM_WRITER_LOCKED))
  1153			goto queue;
  1154	
  1155		/*
  1156		 * Reader optimistic lock stealing
  1157		 *
  1158		 * We can take the read lock directly without doing
  1159		 * rwsem_optimistic_spin() if the conditions are right.
  1160		 * Also wake up other readers if it is the first reader.
  1161		 */
  1162		if (!(count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) &&
> 1163		    rwsem_no_spinners(sem)) {
  1164			rwsem_set_reader_owned(sem);
  1165			lockevent_inc(rwsem_rlock_steal);
  1166			if (rcnt == 1)
  1167				goto wake_readers;
  1168			return sem;
  1169		}
  1170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
