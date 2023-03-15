Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051335665;
	Wed, 15 Mar 2023 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678897760; x=1710433760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCweUOLkxiBG9O5ZD5J4q/vufhlKl1IcsEeKQuENlJc=;
  b=f3kNqKrweFhka3Plt7UZVg33FLj0SL4UKc6AJvaPrcL6HYz+jwewNodo
   oSrKMsN0m/VrIYcxZKfYl3KZ/gQrv4Xj2Re3AuzsLD86u8EJ4hZ+tdfAv
   jak2lkQAzGkc2j6uhFOCYeO/B57XVfFo+zn8Q5fW7W6C1DDXWgGbrCNp9
   4nFZaGZyv0NhEpmpDyKm1ASIxA1XjPGeUmzuVpSY1jd79LxIG3SV+E+G7
   AMqQ3llcR1HCsT/ME4SSzkyRLDaAolwrMT/XniKLm0XPXW1cDKvVcbu7N
   mgca4NoQ2jK/wemggdnv+WQhoFaNSNAm36QqI0mMluAC41Ue02ysNrdLU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339292295"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="339292295"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 09:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1008893470"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008893470"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 09:28:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcTzm-0007sR-0v;
	Wed, 15 Mar 2023 16:28:58 +0000
Date: Thu, 16 Mar 2023 00:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cai Xinchen <caixinchen1@huawei.com>
Subject: [linux-stable-rc:linux-4.19.y 5631/5633]
 kernel/cgroup/cgroup.c:2237:2: error: implicit declaration of function
 'get_online_cpus'
Message-ID: <202303160030.RoNHau1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   cb91edfa52f0b1a9fca6342d158744cd1d673a57
commit: b37fb75964cc116d7c3a776df22fbe90724503b8 [5631/5633] cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
config: mips-randconfig-r013-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160030.RoNHau1K-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b37fb75964cc116d7c3a776df22fbe90724503b8
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.19.y
        git checkout b37fb75964cc116d7c3a776df22fbe90724503b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/cgroup/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160030.RoNHau1K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:2237:2: error: implicit declaration of function 'get_online_cpus' [-Werror,-Wimplicit-function-declaration]
           get_online_cpus();
           ^
   kernel/cgroup/cgroup.c:2237:2: note: did you mean 'get_online_mems'?
   include/linux/memory_hotplug.h:258:20: note: 'get_online_mems' declared here
   static inline void get_online_mems(void) {}
                      ^
>> kernel/cgroup/cgroup.c:2248:2: error: implicit declaration of function 'put_online_cpus' [-Werror,-Wimplicit-function-declaration]
           put_online_cpus();
           ^
   kernel/cgroup/cgroup.c:2248:2: note: did you mean 'put_online_mems'?
   include/linux/memory_hotplug.h:259:20: note: 'put_online_mems' declared here
   static inline void put_online_mems(void) {}
                      ^
   2 errors generated.


vim +/get_online_cpus +2237 kernel/cgroup/cgroup.c

  2211	
  2212	/**
  2213	 * cgroup_attach_lock - Lock for ->attach()
  2214	 * @lock_threadgroup: whether to down_write cgroup_threadgroup_rwsem
  2215	 *
  2216	 * cgroup migration sometimes needs to stabilize threadgroups against forks and
  2217	 * exits by write-locking cgroup_threadgroup_rwsem. However, some ->attach()
  2218	 * implementations (e.g. cpuset), also need to disable CPU hotplug.
  2219	 * Unfortunately, letting ->attach() operations acquire cpus_read_lock() can
  2220	 * lead to deadlocks.
  2221	 *
  2222	 * Bringing up a CPU may involve creating and destroying tasks which requires
  2223	 * read-locking threadgroup_rwsem, so threadgroup_rwsem nests inside
  2224	 * cpus_read_lock(). If we call an ->attach() which acquires the cpus lock while
  2225	 * write-locking threadgroup_rwsem, the locking order is reversed and we end up
  2226	 * waiting for an on-going CPU hotplug operation which in turn is waiting for
  2227	 * the threadgroup_rwsem to be released to create new tasks. For more details:
  2228	 *
  2229	 *   http://lkml.kernel.org/r/20220711174629.uehfmqegcwn2lqzu@wubuntu
  2230	 *
  2231	 * Resolve the situation by always acquiring cpus_read_lock() before optionally
  2232	 * write-locking cgroup_threadgroup_rwsem. This allows ->attach() to assume that
  2233	 * CPU hotplug is disabled on entry.
  2234	 */
  2235	static void cgroup_attach_lock(void)
  2236	{
> 2237		get_online_cpus();
  2238		percpu_down_write(&cgroup_threadgroup_rwsem);
  2239	}
  2240	
  2241	/**
  2242	 * cgroup_attach_unlock - Undo cgroup_attach_lock()
  2243	 * @lock_threadgroup: whether to up_write cgroup_threadgroup_rwsem
  2244	 */
  2245	static void cgroup_attach_unlock(void)
  2246	{
  2247		percpu_up_write(&cgroup_threadgroup_rwsem);
> 2248		put_online_cpus();
  2249	}
  2250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
