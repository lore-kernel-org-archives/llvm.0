Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA11173A;
	Mon, 21 Aug 2023 21:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692652053; x=1724188053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bo8/PTq7MCFs00Px7x5WhlSNz/3L4ShOzWCE2VgyrC8=;
  b=bHqKDv/wV0YbCqOrGEkIxT/KosSDDZZMuCN5ie4w7p2ccKMaxTbdMCgi
   ViuOSc77N0JQhpOiBeWo3HdPcMjhchSpRkEbt7szClb3nFzbUt01gKvm0
   vD8DEkACWDgNaHenE9LOfMZiON3rSrCRghDu6/P409sbFkPyZmSmx3mPO
   xrtwPpXBGG5m7N6p+WKkt03qM6JOq4UUsUAArjf5VbhWu8lzZEqbaauAZ
   /abTdfkb5Eq/lVka/NVMfw9n08POOCTdhIF+BKnh72gMq5iS4DAt1hPWx
   oXFwaaNWEPxM5nWQ4IJzJJcaIWED2CU94sZ3SCNkEpb+wa1JqCxpN0NZG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371131876"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="371131876"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729561218"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="729561218"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 14:07:27 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYC7S-0000va-2S;
	Mon, 21 Aug 2023 21:07:26 +0000
Date: Tue, 22 Aug 2023 05:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair23@gmail.com>, bhelgaas@google.com,
	linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com,
	lukas@wunner.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alex.williamson@redhat.com, christian.koenig@amd.com,
	kch@nvidia.com, gregkh@linuxfoundation.org, logang@deltatee.com,
	linux-kernel@vger.kernel.org, alistair23@gmail.com,
	chaitanyak@nvidia.com, rdunlap@infradead.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v6 1/3] PCI/DOE: Expose the DOE features via sysfs
Message-ID: <202308220442.udC7U63t-lkp@intel.com>
References: <20230817235810.596458-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817235810.596458-1-alistair.francis@wdc.com>

Hi Alistair,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc7 next-20230821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Francis/sysfs-Add-a-attr_is_visible-function-to-attribute_group/20230818-080110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230817235810.596458-1-alistair.francis%40wdc.com
patch subject: [PATCH v6 1/3] PCI/DOE: Expose the DOE features via sysfs
config: i386-randconfig-006-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220442.udC7U63t-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220442.udC7U63t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220442.udC7U63t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/doe.c:61: warning: Function parameter or member 'sysfs_attrs' not described in 'pci_doe_mb'


vim +61 drivers/pci/doe.c

a4ff8e7a716013 Li Ming          2022-11-16  36  
9d24322e887b6a Jonathan Cameron 2022-07-19  37  /**
9d24322e887b6a Jonathan Cameron 2022-07-19  38   * struct pci_doe_mb - State for a single DOE mailbox
9d24322e887b6a Jonathan Cameron 2022-07-19  39   *
9d24322e887b6a Jonathan Cameron 2022-07-19  40   * This state is used to manage a single DOE mailbox capability.  All fields
9d24322e887b6a Jonathan Cameron 2022-07-19  41   * should be considered opaque to the consumers and the structure passed into
022b66f38195f6 Lukas Wunner     2023-03-11  42   * the helpers below after being created by pci_doe_create_mb().
9d24322e887b6a Jonathan Cameron 2022-07-19  43   *
9d24322e887b6a Jonathan Cameron 2022-07-19  44   * @pdev: PCI device this mailbox belongs to
9d24322e887b6a Jonathan Cameron 2022-07-19  45   * @cap_offset: Capability offset
9d24322e887b6a Jonathan Cameron 2022-07-19  46   * @prots: Array of protocols supported (encoded as long values)
9d24322e887b6a Jonathan Cameron 2022-07-19  47   * @wq: Wait queue for work item
9d24322e887b6a Jonathan Cameron 2022-07-19  48   * @work_queue: Queue of pci_doe_work items
9d24322e887b6a Jonathan Cameron 2022-07-19  49   * @flags: Bit array of PCI_DOE_FLAG_* flags
9d24322e887b6a Jonathan Cameron 2022-07-19  50   */
9d24322e887b6a Jonathan Cameron 2022-07-19  51  struct pci_doe_mb {
9d24322e887b6a Jonathan Cameron 2022-07-19  52  	struct pci_dev *pdev;
9d24322e887b6a Jonathan Cameron 2022-07-19  53  	u16 cap_offset;
9d24322e887b6a Jonathan Cameron 2022-07-19  54  	struct xarray prots;
9d24322e887b6a Jonathan Cameron 2022-07-19  55  
9d24322e887b6a Jonathan Cameron 2022-07-19  56  	wait_queue_head_t wq;
9d24322e887b6a Jonathan Cameron 2022-07-19  57  	struct workqueue_struct *work_queue;
9d24322e887b6a Jonathan Cameron 2022-07-19  58  	unsigned long flags;
2a8556606e90c6 Alistair Francis 2023-08-17  59  
2a8556606e90c6 Alistair Francis 2023-08-17  60  	struct device_attribute *sysfs_attrs;
9d24322e887b6a Jonathan Cameron 2022-07-19 @61  };
9d24322e887b6a Jonathan Cameron 2022-07-19  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
