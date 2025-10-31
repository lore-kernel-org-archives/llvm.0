Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7455522655B;
	Fri, 31 Oct 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761913855; cv=none; b=NgG4bpzo2aJ2e+TWU2XdfcLa15bQqK0cimF2kE/jQYI1FDQ4S/OaCAeekLbjv0DTkDIKTm49PX2Ei8LicHIHhuGOfCfsSNKuNc5O3VDCW7utd+Sukvge3Mst6IPmxtFvjyFX9eNUV2NvtMddcDtX0ketb62+Ui/iHcP12DZZ/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761913855; c=relaxed/simple;
	bh=EKUBekgrM5YHzOr1CYFWpexPh2n9tyOsa3c5XVlztVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C54pnqJpOK4E3c6qxj6z80J2q+WGoDc4XvsRgqDpbtW6tfwj/pU/loXmtZuojgmNISNigUXw9sLCDweIhq4KF2/0k/UQdXwXYB94cqWRwaG8iffpEXxAPYw18Y4DuNft1UPmjl/J4e8yM/QH1nhbnU00e4PGCktDh62ZwAXVh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gl0jKVVb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gl0jKVVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761913853; x=1793449853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKUBekgrM5YHzOr1CYFWpexPh2n9tyOsa3c5XVlztVs=;
  b=Gl0jKVVblX7TItUCdswlZhMyit9RIwFSm6VFtdX2Hygq1iAMox4GwBTF
   kvMh42kEuF4l56CQS6kCTskb2FMjTGqF4HlAISa6N+05p5YITteT7KW6x
   MWBV8ftQRrQE/A3KjJpBi9hjCE1eG8w80u58RHrld6EhY5/qzv8l2A2ON
   8HcP9Ojrhoxy4MsUpMKWwaG6IxJLMKcgKxhKWqfQhy5bnmbbNOq8oB+R4
   B8BXPn2RYIQzI1ypEPetChDrs9xg3ML6JY+8cQVqKuiEHjoyXnB2i5j/g
   Qeoxl/7FtLmmh8vUn7NIC8+YoAuX+pbtcP2bim1gcGpRANETDtU7tdFtw
   w==;
X-CSE-ConnectionGUID: 8W8P3cMzQIeEt32O2GYpeQ==
X-CSE-MsgGUID: PjfP9VdAT5uiT01wK1VKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89538227"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89538227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:30:52 -0700
X-CSE-ConnectionGUID: XmVY6QafQyWfspjt3dEkwQ==
X-CSE-MsgGUID: YLrRAJLMSxe/Mv9d4uWDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185498784"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 Oct 2025 05:30:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEoHH-000N64-0O;
	Fri, 31 Oct 2025 12:30:47 +0000
Date: Fri, 31 Oct 2025 20:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Wu <wusamuel@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tuhaowen@uniontech.com, Samuel Wu <wusamuel@google.com>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] PM: Support aborting sleep during filesystem sync
Message-ID: <202510312012.eHtS316T-lkp@intel.com>
References: <20251030210110.298612-1-wusamuel@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030210110.298612-1-wusamuel@google.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Wu/PM-Support-aborting-sleep-during-filesystem-sync/20251031-050330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251030210110.298612-1-wusamuel%40google.com
patch subject: [PATCH v6] PM: Support aborting sleep during filesystem sync
config: sparc64-randconfig-002-20251031 (https://download.01.org/0day-ci/archive/20251031/202510312012.eHtS316T-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312012.eHtS316T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312012.eHtS316T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/main.c:1159:10: error: call to undeclared function 'pm_start_fs_sync_workqueue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1159 |         error = pm_start_fs_sync_workqueue();
         |                 ^
   kernel/power/main.c:1159:10: note: did you mean 'pm_start_workqueue'?
   kernel/power/main.c:1147:19: note: 'pm_start_workqueue' declared here
    1147 | static int __init pm_start_workqueue(void)
         |                   ^
    1148 | {
    1149 |         pm_wq = alloc_workqueue("pm", WQ_FREEZABLE | WQ_UNBOUND, 0);
    1150 | 
    1151 |         return pm_wq ? 0 : -ENOMEM;
    1152 | }
    1153 | 
    1154 | static int __init pm_init(void)
    1155 | {
    1156 |         int error = pm_start_workqueue();
    1157 |         if (error)
    1158 |                 return error;
    1159 |         error = pm_start_fs_sync_workqueue();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pm_start_workqueue
   1 error generated.


vim +/pm_start_fs_sync_workqueue +1159 kernel/power/main.c

  1153	
  1154	static int __init pm_init(void)
  1155	{
  1156		int error = pm_start_workqueue();
  1157		if (error)
  1158			return error;
> 1159		error = pm_start_fs_sync_workqueue();
  1160		if (error)
  1161			return error;
  1162		hibernate_image_size_init();
  1163		hibernate_reserved_size_init();
  1164		pm_states_init();
  1165		power_kobj = kobject_create_and_add("power", NULL);
  1166		if (!power_kobj)
  1167			return -ENOMEM;
  1168		error = sysfs_create_groups(power_kobj, attr_groups);
  1169		if (error)
  1170			return error;
  1171		pm_print_times_init();
  1172		return pm_autosleep_init();
  1173	}
  1174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
