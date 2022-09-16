Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A12C80
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663315858; x=1694851858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VF1urHLrZXDb1ERMuLgY6SLME86ioEfo4UKQ1oHzFlE=;
  b=IIFJHRaNpmDGt71BoUCcxL9i5IlKiEFfth44ZMHfNUW3E0Q9sWJwRO4A
   usA8mgEqL4Rt58/1tTf6NwfG6ytQx7mEK9XrRpkrQ5rfMYA5ky4E8jc3H
   9IeLUMjY7CixuGMOMWZoLLCkLrdRgCsfxiOFTZZw2A/W9BkV0PyP6HGVS
   b0HrohwB9LeAZw7fZIYbBbUzPebeatbpVlff/FZazYHlSktv2FR30k7jO
   BWdUyJEs5/pmnR+O4H9Id9mYVlpFYf0TScft1Di2qEGP5w0JtqKMkW6J3
   0EmHSZOJIhWWgvM/IIfWS+gil3W5eRxycAcGsAiHIDpgWF36G5cP9A1/a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300303398"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="300303398"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 01:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="613185311"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Sep 2022 01:10:48 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ6Qs-0001Zz-2q;
	Fri, 16 Sep 2022 08:10:42 +0000
Date: Fri, 16 Sep 2022 16:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nadav Amit <nadav.amit@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>, Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH 3/3] vmw_balloon: open-code vmballoon_compaction_init()
Message-ID: <202209161512.GNTVEnlu-lkp@intel.com>
References: <20220913094306.317734-4-namit@vmware.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913094306.317734-4-namit@vmware.com>

Hi Nadav,

I love your patch! Yet something to improve:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on linus/master v6.0-rc5 next-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nadav-Amit/vmw_balloon-misc-fixes-and-enhancements/20220914-021333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git ceecbbddbf549fe0b7ffa3804a6e255b3360030f
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220916/202209161512.GNTVEnlu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aa1f38765dd703cbeb3450454d0b5b2c7f5a8f8d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nadav-Amit/vmw_balloon-misc-fixes-and-enhancements/20220914-021333
        git checkout aa1f38765dd703cbeb3450454d0b5b2c7f5a8f8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/misc/vmw_balloon.c:1892:3: error: use of undeclared identifier 'b'
                   b->b_dev_info.migratepage = vmballoon_migratepage;
                   ^
   drivers/misc/vmw_balloon.c:1732:2: error: unterminated conditional directive
   #ifdef CONFIG_BALLOON_COMPACTION
    ^
   2 errors generated.


vim +/b +1892 drivers/misc/vmw_balloon.c

  1850	
  1851	static int __init vmballoon_init(void)
  1852	{
  1853		int error;
  1854	
  1855		/*
  1856		 * Check if we are running on VMware's hypervisor and bail out
  1857		 * if we are not.
  1858		 */
  1859		if (x86_hyper_type != X86_HYPER_VMWARE)
  1860			return -ENODEV;
  1861	
  1862		INIT_LIST_HEAD(&balloon.huge_pages);
  1863		spin_lock_init(&balloon.comm_lock);
  1864		init_rwsem(&balloon.conf_sem);
  1865		balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
  1866		balloon.batch_page = NULL;
  1867		balloon.page = NULL;
  1868		balloon.reset_required = true;
  1869	
  1870		/*
  1871		 * Reset the balloon to check that it is indeed supported.
  1872		 */
  1873		error = vmballoon_reset(&balloon);
  1874		if (error) {
  1875			pr_err("memory ballooning is disabled");
  1876			goto fail;
  1877		}
  1878	
  1879		INIT_DELAYED_WORK(&balloon.dwork, vmballoon_work);
  1880	
  1881		error = vmballoon_register_shrinker(&balloon);
  1882		if (error)
  1883			goto fail;
  1884	
  1885		/*
  1886		 * Initialization of compaction must be done after the call to
  1887		 * balloon_devinfo_init() .
  1888		 */
  1889		balloon_devinfo_init(&balloon.b_dev_info);
  1890	
  1891		if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> 1892			b->b_dev_info.migratepage = vmballoon_migratepage;
  1893	
  1894		queue_delayed_work(system_freezable_wq, &balloon.dwork, 0);
  1895	
  1896		vmballoon_debugfs_init(&balloon);
  1897	
  1898		return 0;
  1899	fail:
  1900		vmballoon_unregister_shrinker(&balloon);
  1901		return error;
  1902	}
  1903	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
