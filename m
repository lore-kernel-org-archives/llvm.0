Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC07E1;
	Wed, 26 Jul 2023 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690398470; x=1721934470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JypMb7SS9P1QKnvQJON1uLs7AHkP7rkWDhicYQXL8GQ=;
  b=hLsmbAw71O++KgZgz/U9GVxxBMD3L8aFWJC1vtJzSLN2cqgHiyLU/UwC
   qOpH6qS+JtzECfkXwGrIW5kIhWNCwv+k0NdO376OU/Nus+6mzKoprVkTq
   zwH5NvATxoZBCxAZ9AHS2PNrtOfGZyMjFFphbXmzLqxptJlucuPGDu7Gz
   L6oO3PHlG5cJ5tH5GBY6R1AZt3rrnBYvj+U6z4ju8aK70MnVaRs5ublY8
   CVxH0S1Ym3gIhKlDpox98+enc1dpYqffbgUNp7BajpaWqeLlJRhNAarHI
   Pz1JiUMQwa0dQhoqFIB25X6UtAmT6TwSc4+u06BA5OvSaueWm/g3TMJCR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365568475"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="365568475"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900548836"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="900548836"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 12:07:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOjrP-0001Dd-2k;
	Wed, 26 Jul 2023 19:07:47 +0000
Date: Thu, 27 Jul 2023 03:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/3] powerpc/eeh: Synchronization for safety
Message-ID: <202307270301.SCREaz0f-lkp@intel.com>
References: <20230724070020.239173-2-ganeshgr@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724070020.239173-2-ganeshgr@linux.ibm.com>

Hi Ganesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes awilliam-vfio/next awilliam-vfio/for-linus akpm-mm/mm-everything linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ganesh-Goudar/powerpc-eeh-Synchronization-for-safety/20230724-150512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230724070020.239173-2-ganeshgr%40linux.ibm.com
patch subject: [RFC PATCH v2 1/3] powerpc/eeh: Synchronization for safety
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20230727/202307270301.SCREaz0f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270301.SCREaz0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270301.SCREaz0f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/eeh_driver.c:310:18: error: no previous prototype for function 'pdev_cache_list_create' [-Werror,-Wmissing-prototypes]
     310 | struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
         |                  ^
   arch/powerpc/kernel/eeh_driver.c:310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     310 | struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
         | ^
         | static 
>> arch/powerpc/kernel/eeh_driver.c:579:16: error: unused variable 'flags' [-Werror,-Wunused-variable]
     579 |         unsigned long flags;
         |                       ^
   2 errors generated.


vim +/pdev_cache_list_create +310 arch/powerpc/kernel/eeh_driver.c

   309	
 > 310	struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
   311	{
   312		struct eeh_pe *pe;
   313		struct eeh_dev *edev, *tmp;
   314		struct pci_dev **pdevs;
   315		int i, n;
   316	
   317		n = 0;
   318		eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
   319			if (edev->pdev)
   320				n++;
   321		}
   322		pdevs = kmalloc(sizeof(*pdevs) * (n + 1), GFP_KERNEL);
   323		if (WARN_ON_ONCE(!pdevs))
   324			return NULL;
   325		i = 0;
   326		eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
   327			if (i < n) {
   328				get_device(&edev->pdev->dev);
   329				pdevs[i++] = edev->pdev;
   330			}
   331		}
   332		if (WARN_ON_ONCE(i < n))
   333			n = i;
   334		pdevs[n] = NULL; /* terminator */
   335		return pdevs;
   336	}
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
