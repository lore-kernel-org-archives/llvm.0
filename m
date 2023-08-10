Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B37366;
	Thu, 10 Aug 2023 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691627332; x=1723163332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLRcOcqCWyLjEKQz2QW5+eKPiNNEsUrHMNvrCV27L+I=;
  b=M3BzJVAMNOo00kxLSqmo9F5aSpSpUNN9KUEVxleDs53mhK1cyvI5fNkv
   hTnXxtzvmxGsWWlc22LwbzKEKk9JKE39cjNkO/ncJGOCtkBZql7UndhSp
   bMYxF6iH1KcFE848i/+eOaFZnN0cYKuKqXH6b0jJoLrqfViMeRs1V3wfr
   1v2fpj3c4/dqApHkPDhJZ4H9grAYac7tc3ItIGMjXxz5IYbRVFQa4doXd
   alpztRXlKhI5DeBUdg9y6ChzPASeqyRfo3HeB7YGGgcBnKQVWfpzicpPM
   gOwOoqQUO/T5JnD8CUEzyOXWexrc+DbdjW1xGt/LT6uWMjQGK5bVHAMVR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437620208"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="437620208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 17:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="767058882"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="767058882"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2023 17:28:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTtXm-0006XM-0I;
	Thu, 10 Aug 2023 00:28:50 +0000
Date: Thu, 10 Aug 2023 08:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] Bluetooth: hci_sync: Add hci_cmd_sync_queue_once
Message-ID: <202308100811.4dzOf3kV-lkp@intel.com>
References: <20230809213916.1636311-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809213916.1636311-1-luiz.dentz@gmail.com>

Hi Luiz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_sync-Add-hci_cmd_sync_queue_once/20230810-054032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230809213916.1636311-1-luiz.dentz%40gmail.com
patch subject: [RFC] Bluetooth: hci_sync: Add hci_cmd_sync_queue_once
config: i386-randconfig-i012-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100811.4dzOf3kV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100811.4dzOf3kV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100811.4dzOf3kV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bluetooth/hci_sync.c:770:15: error: use of undeclared identifier 'hci_cmd_sync_pending'; did you mean 'hci_cmd_sync_init'?
   EXPORT_SYMBOL(hci_cmd_sync_pending);
                 ^~~~~~~~~~~~~~~~~~~~
                 hci_cmd_sync_init
   include/linux/export.h:86:44: note: expanded from macro 'EXPORT_SYMBOL'
   #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
                                                          ^
   include/linux/export.h:83:54: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                                           ^
   include/linux/export.h:74:16: note: expanded from macro '__EXPORT_SYMBOL'
           extern typeof(sym) sym;                                 \
                         ^
   net/bluetooth/hci_sync.c:628:6: note: 'hci_cmd_sync_init' declared here
   void hci_cmd_sync_init(struct hci_dev *hdev)
        ^
   1 error generated.


vim +770 net/bluetooth/hci_sync.c

   748	
   749	bool hci_cmd_sync_lookup(struct hci_dev *hdev, hci_cmd_sync_work_func_t func,
   750				 void *data, hci_cmd_sync_work_destroy_t destroy,
   751				 bool cancel)
   752	{
   753		struct hci_cmd_sync_work_entry *entry, *tmp;
   754	
   755		mutex_lock(&hdev->cmd_sync_work_lock);
   756		list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list) {
   757			if (entry->func == func && entry->data == data &&
   758			    entry->destroy == destroy) {
   759				if (cancel)
   760					_hci_cmd_sync_cancel_entry(hdev, entry,
   761								   -ECANCELED);
   762				mutex_unlock(&hdev->cmd_sync_work_lock);
   763				return true;
   764			}
   765		}
   766		mutex_unlock(&hdev->cmd_sync_work_lock);
   767	
   768		return false;
   769	}
 > 770	EXPORT_SYMBOL(hci_cmd_sync_pending);
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
