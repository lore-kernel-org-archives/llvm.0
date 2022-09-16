Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF848539C
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663330075; x=1694866075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzalq6mLhvry+CNbvFNURWSHXjt8ZM/cgS6R+jiYAHI=;
  b=JlZJvu1RiLRVqzU4/Q7ADxymtPWFDQzp6ykMeUZQBNBo9T5YG6Nhiasu
   OIuaBgrkabsW9jDPHHzNEX6vJ3WrSIM27jckwWHRo4tUgHiCa3vPZpdWR
   uInXrxS5u7r/tJTDrvC/uA8sRuEomybI/kEGH2RujkVO1+jgIGl252y7a
   QznCNtlyTBv/8BVR+m0JKTAn2UIC5gMtnZZxW4VWA5kXOnjpPcEyKHSWf
   spTqM/7g+P6ivXes11htzUdtkOdRctxb8rtjaDZZrPWH6DoNwpDvp5slK
   l70Evzyfyc38uDZ2Wu2OouOyp7Wj9fAVSJa7Ln6vFQxLoY7l13U4++YwM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="282004965"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="282004965"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 05:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="568809104"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 05:07:53 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZA8O-0001ko-26;
	Fri, 16 Sep 2022 12:07:52 +0000
Date: Fri, 16 Sep 2022 20:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hyunwoo Kim <imv4bel@gmail.com>, laforge@gnumonks.org, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] char: pcmcia: cm4040_cs: Fix use-after-free in
 reader_fops
Message-ID: <202209161923.cDLX4oW9-lkp@intel.com>
References: <20220916045834.GA188033@ubuntu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916045834.GA188033@ubuntu>

Hi Hyunwoo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on soc/for-next linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyunwoo-Kim/char-pcmcia-cm4040_cs-Fix-use-after-free-in-reader_fops/20220916-125917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git ceecbbddbf549fe0b7ffa3804a6e255b3360030f
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220916/202209161923.cDLX4oW9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/578c8f062f3dcbc2fb85f060f74d0522bcf34815
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hyunwoo-Kim/char-pcmcia-cm4040_cs-Fix-use-after-free-in-reader_fops/20220916-125917
        git checkout 578c8f062f3dcbc2fb85f060f74d0522bcf34815
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/char/pcmcia/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/char/pcmcia/cm4040_cs.c:472:17: warning: variable 'dev' is uninitialized when used here [-Wuninitialized]
                   mutex_unlock(&dev->lock);
                                 ^~~
   drivers/char/pcmcia/cm4040_cs.c:460:24: note: initialize the variable 'dev' to silence this warning
           struct reader_dev *dev;
                                 ^
                                  = NULL
   1 warning generated.


vim +/dev +472 drivers/char/pcmcia/cm4040_cs.c

   457	
   458	static int cm4040_open(struct inode *inode, struct file *filp)
   459	{
   460		struct reader_dev *dev;
   461		struct pcmcia_device *link;
   462		int minor = iminor(inode);
   463		int ret;
   464	
   465		if (minor >= CM_MAX_DEV)
   466			return -ENODEV;
   467	
   468		mutex_lock(&cm4040_mutex);
   469	
   470		link = dev_table[minor];
   471		if (link == NULL || !pcmcia_dev_present(link)) {
 > 472			mutex_unlock(&dev->lock);
   473			mutex_unlock(&cm4040_mutex);
   474			return -ENODEV;
   475		}
   476	
   477		if (link->open) {
   478			mutex_unlock(&dev->lock);
   479			mutex_unlock(&cm4040_mutex);
   480			return -EBUSY;
   481		}
   482	
   483		dev = link->priv;
   484		mutex_lock(&dev->lock);
   485	
   486		filp->private_data = dev;
   487	
   488		if (filp->f_flags & O_NONBLOCK) {
   489			DEBUGP(4, dev, "filep->f_flags O_NONBLOCK set\n");
   490			mutex_unlock(&dev->lock);
   491			mutex_unlock(&cm4040_mutex);
   492			return -EAGAIN;
   493		}
   494	
   495		link->open = 1;
   496	
   497		mod_timer(&dev->poll_timer, jiffies + POLL_PERIOD);
   498	
   499		DEBUGP(2, dev, "<- cm4040_open (successfully)\n");
   500		ret = nonseekable_open(inode, filp);
   501	
   502		kref_get(&dev->refcnt);
   503	
   504		mutex_unlock(&dev->lock);
   505		mutex_unlock(&cm4040_mutex);
   506	
   507		return ret;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
