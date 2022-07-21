Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936EA23BB
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 06:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658383674; x=1689919674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1fqzcYm1On03+b7DdxammYXGgXXTPdTxM5qfsq4iUCo=;
  b=hriUW5UzjIrKMHA/wh0iPwLtxnil5l088r3lNR1lm83daBS60gq4T81O
   0Febrga8dgJD0Vf/tRzFH+glY02njyNChaO3uZq0sB3TT//lvGIJHfu4V
   5ktfvUjdvLtWWevB+UXuU8yfcZxZhhh9E6ZWPMttYVftE8cEPsiyigE1q
   v/V6bvEsoGTRtAgIew6h9fhHXcNyW79dh/sgreTLK5fQWbQiTI/67J7Ml
   u/ryPg/HPoZQH5djPSzxuxxCcKi6xYO0pk/6yiosFDvx/OAtOE1l4ewOs
   AkhWhx46JClZMPiTwL3g2FfWnnjceIzdwh74XleU2ljayhWuSQAzRFMNN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="267359512"
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="267359512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 23:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="740558274"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2022 23:07:38 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oEPLV-0001XH-Tf;
	Thu, 21 Jul 2022 06:07:37 +0000
Date: Thu, 21 Jul 2022 14:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Wei Xu <weixugc@google.com>, Huang Ying <ying.huang@intel.com>,
	Yang Shi <shy828301@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>,
	Tim C Chen <tim.c.chen@intel.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hesham Almatary <hesham.almatary@huawei.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alistair Popple <apopple@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>, jvgediya.oss@gmail.com,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v10 4/8] mm/demotion/dax/kmem: Set node's performance
 level to MEMTIER_PERF_LEVEL_PMEM
Message-ID: <202207211403.1K7X9mSi-lkp@intel.com>
References: <20220720025920.1373558-5-aneesh.kumar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720025920.1373558-5-aneesh.kumar@linux.ibm.com>

Hi "Aneesh,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-demotion-Memory-tiers-and-demotion/20220720-110356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: x86_64-randconfig-r004-20220718 (https://download.01.org/0day-ci/archive/20220721/202207211403.1K7X9mSi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d94a14b8fe93ff567d64b793ce1939698ca0b834
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aneesh-Kumar-K-V/mm-demotion-Memory-tiers-and-demotion/20220720-110356
        git checkout d94a14b8fe93ff567d64b793ce1939698ca0b834
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/nfit/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/acpi/nfit/core.c:1719:13: warning: no previous prototype for function 'nfit_intel_shutdown_status' [-Wmissing-prototypes]
   __weak void nfit_intel_shutdown_status(struct nfit_mem *nfit_mem)
               ^
   drivers/acpi/nfit/core.c:1719:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak void nfit_intel_shutdown_status(struct nfit_mem *nfit_mem)
          ^
          static 
>> drivers/acpi/nfit/core.c:3495:37: error: use of undeclared identifier 'MEMTIER_PERF_LEVEL_PMEM'
                                   node_devices[nid]->perf_level = MEMTIER_PERF_LEVEL_PMEM;
                                                                   ^
>> drivers/acpi/nfit/core.c:3551:41: error: use of undeclared identifier 'MEMTIER_HOTPLUG_PRIO'
           hotplug_memory_notifier(nfit_callback, MEMTIER_HOTPLUG_PRIO + 1);
                                                  ^
   1 warning and 2 errors generated.


vim +/MEMTIER_PERF_LEVEL_PMEM +3495 drivers/acpi/nfit/core.c

  3474	
  3475	static int nfit_callback(struct notifier_block *self,
  3476				 unsigned long action, void *arg)
  3477	{
  3478		bool found = false;
  3479		struct memory_notify *mnb = arg;
  3480		int nid = mnb->status_change_nid;
  3481		struct nfit_spa *nfit_spa;
  3482		struct acpi_nfit_desc *acpi_desc;
  3483	
  3484		if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
  3485			return NOTIFY_OK;
  3486	
  3487		mutex_lock(&acpi_desc_lock);
  3488		list_for_each_entry(acpi_desc, &acpi_descs, list) {
  3489			mutex_lock(&acpi_desc->init_mutex);
  3490			list_for_each_entry(nfit_spa, &acpi_desc->spas, list) {
  3491				struct acpi_nfit_system_address *spa = nfit_spa->spa;
  3492				int target_node = pxm_to_node(spa->proximity_domain);
  3493	
  3494				if (target_node == nid) {
> 3495					node_devices[nid]->perf_level = MEMTIER_PERF_LEVEL_PMEM;
  3496					found = true;
  3497					break;
  3498				}
  3499			}
  3500			mutex_unlock(&acpi_desc->init_mutex);
  3501			if (found)
  3502				break;
  3503		}
  3504		mutex_unlock(&acpi_desc_lock);
  3505		return NOTIFY_OK;
  3506	}
  3507	
  3508	static __init int nfit_init(void)
  3509	{
  3510		int ret;
  3511	
  3512		BUILD_BUG_ON(sizeof(struct acpi_table_nfit) != 40);
  3513		BUILD_BUG_ON(sizeof(struct acpi_nfit_system_address) != 64);
  3514		BUILD_BUG_ON(sizeof(struct acpi_nfit_memory_map) != 48);
  3515		BUILD_BUG_ON(sizeof(struct acpi_nfit_interleave) != 20);
  3516		BUILD_BUG_ON(sizeof(struct acpi_nfit_smbios) != 9);
  3517		BUILD_BUG_ON(sizeof(struct acpi_nfit_control_region) != 80);
  3518		BUILD_BUG_ON(sizeof(struct acpi_nfit_data_region) != 40);
  3519		BUILD_BUG_ON(sizeof(struct acpi_nfit_capabilities) != 16);
  3520	
  3521		guid_parse(UUID_VOLATILE_MEMORY, &nfit_uuid[NFIT_SPA_VOLATILE]);
  3522		guid_parse(UUID_PERSISTENT_MEMORY, &nfit_uuid[NFIT_SPA_PM]);
  3523		guid_parse(UUID_CONTROL_REGION, &nfit_uuid[NFIT_SPA_DCR]);
  3524		guid_parse(UUID_DATA_REGION, &nfit_uuid[NFIT_SPA_BDW]);
  3525		guid_parse(UUID_VOLATILE_VIRTUAL_DISK, &nfit_uuid[NFIT_SPA_VDISK]);
  3526		guid_parse(UUID_VOLATILE_VIRTUAL_CD, &nfit_uuid[NFIT_SPA_VCD]);
  3527		guid_parse(UUID_PERSISTENT_VIRTUAL_DISK, &nfit_uuid[NFIT_SPA_PDISK]);
  3528		guid_parse(UUID_PERSISTENT_VIRTUAL_CD, &nfit_uuid[NFIT_SPA_PCD]);
  3529		guid_parse(UUID_NFIT_BUS, &nfit_uuid[NFIT_DEV_BUS]);
  3530		guid_parse(UUID_NFIT_DIMM, &nfit_uuid[NFIT_DEV_DIMM]);
  3531		guid_parse(UUID_NFIT_DIMM_N_HPE1, &nfit_uuid[NFIT_DEV_DIMM_N_HPE1]);
  3532		guid_parse(UUID_NFIT_DIMM_N_HPE2, &nfit_uuid[NFIT_DEV_DIMM_N_HPE2]);
  3533		guid_parse(UUID_NFIT_DIMM_N_MSFT, &nfit_uuid[NFIT_DEV_DIMM_N_MSFT]);
  3534		guid_parse(UUID_NFIT_DIMM_N_HYPERV, &nfit_uuid[NFIT_DEV_DIMM_N_HYPERV]);
  3535		guid_parse(UUID_INTEL_BUS, &nfit_uuid[NFIT_BUS_INTEL]);
  3536	
  3537		nfit_wq = create_singlethread_workqueue("nfit");
  3538		if (!nfit_wq)
  3539			return -ENOMEM;
  3540	
  3541		nfit_mce_register();
  3542		ret = acpi_bus_register_driver(&acpi_nfit_driver);
  3543		if (ret) {
  3544			nfit_mce_unregister();
  3545			destroy_workqueue(nfit_wq);
  3546		}
  3547		/*
  3548		 * register a memory hotplug notifier at prio 2 so that we
  3549		 * can update the perf level for the node.
  3550		 */
> 3551		hotplug_memory_notifier(nfit_callback, MEMTIER_HOTPLUG_PRIO + 1);
  3552		return ret;
  3553	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
