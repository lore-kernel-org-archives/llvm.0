Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7FC147;
	Mon,  5 Feb 2024 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707117379; cv=none; b=jxTmh5+he6p124OHiQr6AYw+e1rmQ2kv8KhPQ897pkQoCOweMuMCMGX3JSoGszHWNdFQ9VdEB8z8lLZo4UEf9AA5kkY1rs2cKCZMKWylAAXc7ohnlk/UVHVbGOxtnxBDREBISdaqEVWXgg1HEaWp9e4NjUpJdPH0zx3xv++Cxrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707117379; c=relaxed/simple;
	bh=0WhUf1wD3hiVly0e61c91gFYligm75XwZo7AQzce5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzYHgJyjYkn5+M8SP6IDsSJq97xR67WkQhe4o4HLrI8GVXfCaH98As9eLpE4qUtkiDkvGDW8ite3zUnc/fAW8GaH+D6WUbKvlDE85pVvgYloroAYYNY/Y4Q75FgP2sz0NfH1fntB7AHp9A7t9a5swFlrjKRZFnnivlf0AFMcuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mepj8N2N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mepj8N2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707117378; x=1738653378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WhUf1wD3hiVly0e61c91gFYligm75XwZo7AQzce5PI=;
  b=mepj8N2NaikZ4RLDIkv34g+svumQZlFGznLDwK1DFflPx2zehRF0Md5e
   YHVDqWJ/pHvhjBx7caj6cEwlpCR4nVt2bnQJbEvjubKx4akIawnLG8yox
   pMBnnqvawg6PP6NJdvDO3sXeOAzN7sZ1VstYfK5JkYPVhtO7nDNTvj5Xg
   3evW4XBSeWU4phM1QpfxOQt8VGdrVUBDtN2Vi2Em9OIyha8ZlXVD4zzbP
   TAK5HIv8qOjTQd0AOHBSTioEBjXRjRM73BEnv+o49aCYLvyGnZXRooszj
   5OjweEGdbtgbuZK4UNdwdcIg2NW2W7zA5cct/UPAhEHK7fM4tr9t4+znH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11822716"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11822716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 23:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="31442291"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2024 23:16:16 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWtDB-0000Dc-0Q;
	Mon, 05 Feb 2024 07:16:13 +0000
Date: Mon, 5 Feb 2024 15:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 3841/4021] kernel/workqueue.c:6798:32: error:
 passing 'const struct bus_type *' to parameter of type 'struct bus_type *'
 discards qualifiers
Message-ID: <202402051505.kM9Rr3CJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: d412ace11144aa2bf692c7cf9778351efc15c827 [3841/4021] workqueue: make wq_subsys const
config: i386-buildonly-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051505.kM9Rr3CJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051505.kM9Rr3CJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051505.kM9Rr3CJ-lkp@intel.com/

Note: the linux-next/master HEAD 23e11d0318521e8693459b0e4d23aec614b3b68b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> kernel/workqueue.c:6798:32: error: passing 'const struct bus_type *' to parameter of type 'struct bus_type *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    6798 |         err = subsys_virtual_register(&wq_subsys, NULL);
         |                                       ^~~~~~~~~~
   include/linux/device.h:77:46: note: passing argument to parameter 'subsys' here
      77 | int subsys_virtual_register(struct bus_type *subsys,
         |                                              ^
   1 error generated.


vim +6798 kernel/workqueue.c

b05a79280b346e Frederic Weisbecker 2015-04-27  6792  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6793  static int __init wq_sysfs_init(void)
2d3854a37e8b76 Rusty Russell       2008-11-05  6794  {
686f669780276d Greg Kroah-Hartman  2023-03-13  6795  	struct device *dev_root;
b05a79280b346e Frederic Weisbecker 2015-04-27  6796  	int err;
b05a79280b346e Frederic Weisbecker 2015-04-27  6797  
b05a79280b346e Frederic Weisbecker 2015-04-27 @6798  	err = subsys_virtual_register(&wq_subsys, NULL);
b05a79280b346e Frederic Weisbecker 2015-04-27  6799  	if (err)
b05a79280b346e Frederic Weisbecker 2015-04-27  6800  		return err;
b05a79280b346e Frederic Weisbecker 2015-04-27  6801  
686f669780276d Greg Kroah-Hartman  2023-03-13  6802  	dev_root = bus_get_dev_root(&wq_subsys);
686f669780276d Greg Kroah-Hartman  2023-03-13  6803  	if (dev_root) {
fe28f631fa941f Waiman Long         2023-10-25  6804  		struct device_attribute *attr;
fe28f631fa941f Waiman Long         2023-10-25  6805  
fe28f631fa941f Waiman Long         2023-10-25  6806  		for (attr = wq_sysfs_cpumask_attrs; attr->attr.name; attr++) {
fe28f631fa941f Waiman Long         2023-10-25  6807  			err = device_create_file(dev_root, attr);
fe28f631fa941f Waiman Long         2023-10-25  6808  			if (err)
fe28f631fa941f Waiman Long         2023-10-25  6809  				break;
fe28f631fa941f Waiman Long         2023-10-25  6810  		}
686f669780276d Greg Kroah-Hartman  2023-03-13  6811  		put_device(dev_root);
686f669780276d Greg Kroah-Hartman  2023-03-13  6812  	}
686f669780276d Greg Kroah-Hartman  2023-03-13  6813  	return err;
2d3854a37e8b76 Rusty Russell       2008-11-05  6814  }
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6815  core_initcall(wq_sysfs_init);
2d3854a37e8b76 Rusty Russell       2008-11-05  6816  

:::::: The code at line 6798 was first introduced by commit
:::::: b05a79280b346eb24ddb73b39988398015291075 workqueue: Create low-level unbound workqueues cpumask

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
