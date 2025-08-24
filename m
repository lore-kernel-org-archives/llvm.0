Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D814A4DB;
	Sun, 24 Aug 2025 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756067638; cv=none; b=O5Dv0cV1RFKSmd/85ls61wjchT9eh92uFVK7dkdBupSz37b/f8hIysZjLRGZgc/i0kHbqJjgRwUzM0/XD+eZl+4RLm6/CLWBhe3vel0r6dmhANtgpGqbh5cCUUnqyUUSlsBKPhcVCs4PEnb6MBnfvFnKhbfW6vMXwZZwZYbWE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756067638; c=relaxed/simple;
	bh=SqDeRpNwXPBzlkYaa0OI0H95790e1SkY3SUzUL3lKMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFq1yARh40ls/MzX9HLdXWsKJJzLjFJBcf/yhRmS9Uqrj+GWkHH4r/X2ZYsU+vaswGhneFkq49YUVuVLN+U2JTwGVQ+tC1z9sdcrhyxRHvXKWXiG9XiBIVsnZSA4d6sAE65IPlTezm47OZ6W9i8pF6ieNjoL8MpXz4/uOSpwvZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7gxIoB8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7gxIoB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756067637; x=1787603637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqDeRpNwXPBzlkYaa0OI0H95790e1SkY3SUzUL3lKMI=;
  b=g7gxIoB8GFksXV7BXLX46nsZHjnG3rORJF5GErENkYUacDWhk7ozILFH
   R+H6Qw6ta8CbUgSztdLIj/WIBFD3gjxA+zl/yk0qBTEh3LfSESwC/lANN
   hprrB3+BGvp65lochDoNn6yEwJ8js04x6hDO2eaZZqWXOv9XJqmX6S87d
   STdlSc9as3/nFG1YsCh8s9M3GkMj8JoHrDuK5qJsUW+9loCxiRIzJBQj0
   usrcd6y7zGr1N+8hHqmohtZyEnKh3bfvStCjKu/24ckjH964L0iivdzvg
   0Ab0lmQv5G5uMLWIgvVcnQDDJieHApf5MXq/cFrSwDTonmLHlAu9H9MXk
   w==;
X-CSE-ConnectionGUID: oLLj+2lNSIGhSq9GcHpKZA==
X-CSE-MsgGUID: ZwWRmCcURc2FB3E3xRmQJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58210404"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58210404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 13:33:56 -0700
X-CSE-ConnectionGUID: RmZtcAGqQyO7HDtWHxjVyQ==
X-CSE-MsgGUID: nyo8PQIiToqxBURW4Jxo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206304745"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2025 13:33:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqHOJ-000NCf-2p;
	Sun, 24 Aug 2025 20:33:06 +0000
Date: Mon, 25 Aug 2025 04:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.17-rc2 136/139]
 drivers/resctrl/mpam_resctrl.c:2076:2: warning: label at end of compound
 statement is a C23 extension
Message-ID: <202508250402.1K4EvfIp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.17-rc2
head:   4c30cf5050a1d18551d882cb084196e0f8f1fbff
commit: c34144538a91d139236500e17de8f4a83abd60bf [136/139] arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250825/202508250402.1K4EvfIp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250402.1K4EvfIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250402.1K4EvfIp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/resctrl/mpam_resctrl.c:492:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     492 |         struct mpam_resctrl_res *l3;
         |                                  ^
   drivers/resctrl/mpam_resctrl.c:561:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     561 |         struct mpam_resctrl_res *l3;
         |                                  ^
   drivers/resctrl/mpam_resctrl.c:1245:3: warning: variable 'dom' is uninitialized when used here [-Wuninitialized]
    1245 |                 dom->mbm_local_evt_cfg = 0;
         |                 ^~~
   drivers/resctrl/mpam_resctrl.c:1239:30: note: initialize the variable 'dom' to silence this warning
    1239 |         struct mpam_resctrl_dom *dom;
         |                                     ^
         |                                      = NULL
>> drivers/resctrl/mpam_resctrl.c:2076:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    2076 |         }
         |         ^
   4 warnings generated.


vim +2076 drivers/resctrl/mpam_resctrl.c

  2049	
  2050	static int mpam_resctrl_node_notifier(struct notifier_block *self,
  2051					      unsigned long action, void *arg)
  2052	{
  2053		struct node_notify *nn = arg;
  2054	
  2055		if (nn->nid < 0 || !mb_uses_numa_nid)
  2056			return NOTIFY_OK;
  2057	
  2058		/*
  2059		 * Ignore nid that have CPUs. Resctrl needs to see the cpu offline
  2060		 * call for each CPU to update the CPUs in control groups. Moving
  2061		 * the overflow handler isn't an issue as only L3 can be mon_capable,
  2062		 * and NUMA nid used as domain-id are only an option for MBA.
  2063		 */
  2064		if (!cpumask_empty(cpumask_of_node(nn->nid)))
  2065			return NOTIFY_OK;
  2066	
  2067		switch (action) {
  2068		case NODE_ADDED_FIRST_MEMORY:
  2069			mpam_resctrl_online_node(nn->nid);
  2070			break;
  2071		case NODE_REMOVED_LAST_MEMORY:
  2072			mpam_resctrl_offline_node(nn->nid);
  2073			break;
  2074		default:
  2075			/* don't care */
> 2076		}
  2077	
  2078		return NOTIFY_OK;
  2079	}
  2080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
