Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9020E7;
	Thu, 21 Sep 2023 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695309779; x=1726845779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FnsWRBzdZgNAyCUwkFjj8/oqtFBd7nKiOnqkBC+QPZk=;
  b=Kn1G9GCjG7cMxUBfZG9Qjbodz4uIYMMQnGm8byLwOYPeIcxIZK4gLGPi
   Cj+NuhfloqjKf+CbhJ7ONrsmmKj2YuXNInqfg5ngxhDYIU1KHqXs/w7K8
   5p6gnnWgVfm8/OcgFWyntC+KtXKGmqLpGN4i6X//Q7TldlQpSz3sJFH/e
   YuKe2Bho4NSOrEiWneQusBEcX7T0ed0h+eACcK81LwrbJwjneP6CS5R5Q
   PkcWusIMHfIp9RztulBfTjuaETxv/1vSn2E21xwZF0JU8KcoNwEZtXnqB
   O0MltF6q7SHjK8SgpZzT6r5L+ja4ydA4UFkfF1EBtLvJLub/H6G2T6uMC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444669431"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="444669431"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 08:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994120427"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="994120427"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2023 08:22:52 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjLVv-00005Z-1X;
	Thu, 21 Sep 2023 15:22:48 +0000
Date: Thu, 21 Sep 2023 23:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tanjore Suresh <tansuresh@google.com>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH v3] driver core: shut down devices asynchronously
Message-ID: <202309212351.tXxMovlT-lkp@intel.com>
References: <20230920185923.3422-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920185923.3422-1-stuart.w.hayes@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayes/driver-core-shut-down-devices-asynchronously/20230921-030141
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20230920185923.3422-1-stuart.w.hayes%40gmail.com
patch subject: [PATCH v3] driver core: shut down devices asynchronously
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230921/202309212351.tXxMovlT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212351.tXxMovlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212351.tXxMovlT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/core.c:25:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/base/core.c:25:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/base/core.c:25:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/base/core.c:4811:19: warning: variable 'parent' is uninitialized when used here [-Wuninitialized]
    4811 |                         dev->parent ? &parent->p->child_domain : &top_domain);
         |                                        ^~~~~~
   drivers/base/core.c:4785:29: note: initialize the variable 'parent' to silence this warning
    4785 |         struct device *dev, *parent;
         |                                    ^
         |                                     = NULL
   13 warnings generated.


vim +/parent +4811 drivers/base/core.c

  4778	
  4779	/**
  4780	 * device_shutdown - call ->shutdown() on each device to shutdown.
  4781	 */
  4782	void device_shutdown(void)
  4783	{
  4784		ASYNC_DOMAIN_EXCLUSIVE(top_domain);
  4785		struct device *dev, *parent;
  4786	
  4787		wait_for_device_probe();
  4788		device_block_probing();
  4789	
  4790		cpufreq_suspend();
  4791	
  4792		spin_lock(&devices_kset->list_lock);
  4793		/*
  4794		 * Walk the devices list backward, scheduling shutdown of each in
  4795		 * turn. Beware that device unplug events may also start pulling
  4796		 * devices offline, even as the system is shutting down.
  4797		 */
  4798		while (!list_empty(&devices_kset->list)) {
  4799			dev = list_entry(devices_kset->list.prev, struct device,
  4800					kobj.entry);
  4801	
  4802			get_device(dev);
  4803			/*
  4804			 * Make sure the device is off the kset list, in the
  4805			 * event that dev->*->shutdown() doesn't remove it.
  4806			 */
  4807			list_del_init(&dev->kobj.entry);
  4808			spin_unlock(&devices_kset->list_lock);
  4809	
  4810			async_schedule_domain(shutdown_device, dev,
> 4811				dev->parent ? &parent->p->child_domain : &top_domain);
  4812	
  4813			spin_lock(&devices_kset->list_lock);
  4814		}
  4815		spin_unlock(&devices_kset->list_lock);
  4816		async_synchronize_full_domain(&top_domain);
  4817	}
  4818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
