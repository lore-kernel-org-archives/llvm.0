Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87381625
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661887531; x=1693423531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QZqqfkBHhhYQi5HA7eLeFvajNA+cybZCZXRV9/tCCmk=;
  b=CQ7tCh9N2xITrthg+mXqspLdazA7bpAm4Z/49r3amUlg/U5D+5Mt8tuj
   iZYErK27bQvy1Uevcm92chWUBrz/TK52LfSq72M6UoWym3Y48uP+eofuo
   7Is3P59sPQuYIcFsT9xyvkq0x0WRtw/vtTIG5zh9BDtxwKdZHumjrqurq
   QXZzXWWZXJ1lHRrkBg/k6r6MJF14n66CsgAxtY1QnLr/4hzliulnRaEE6
   nlzNuat8CD1z9sgqv6l9qMhA5YFjBtV7uc8AA2XiYOPFyIXNiPA5iEJxv
   maw5cOUNc8HTi+FhLKHseZGrtZDEYGybKVcs2dmsWhwfKy4ry7fpRnSg4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="294022855"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="294022855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 12:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="641527978"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2022 12:25:29 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oT6rY-0000Wt-1N;
	Tue, 30 Aug 2022 19:25:28 +0000
Date: Wed, 31 Aug 2022 03:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3575/3976] mm/memory-tiers.c:647:35: error: use
 of undeclared identifier 'top_tier_adistance'
Message-ID: <202208310340.bfIiSHdK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   282342f2dc97ccf54254c5de51bcc1101229615f
commit: 2ec921a84615ee0665bcc369d40b92e2bed66cd5 [3575/3976] mm/demotion: expose memory tier details via sysfs
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220831/202208310340.bfIiSHdK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ec921a84615ee0665bcc369d40b92e2bed66cd5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2ec921a84615ee0665bcc369d40b92e2bed66cd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memory-tiers.c:647:35: error: use of undeclared identifier 'top_tier_adistance'
                   if (memtier->adistance_start >= top_tier_adistance)
                                                   ^
   1 error generated.


vim +/top_tier_adistance +647 mm/memory-tiers.c

   637	
   638	static ssize_t toptier_nodes_show(struct device *dev,
   639					     struct device_attribute *attr, char *buf)
   640	{
   641		int ret;
   642		nodemask_t nmask, top_tier_mask = NODE_MASK_NONE;
   643		struct memory_tier *memtier = to_memory_tier(dev);
   644	
   645		mutex_lock(&memory_tier_lock);
   646		list_for_each_entry(memtier, &memory_tiers, list) {
 > 647			if (memtier->adistance_start >= top_tier_adistance)
   648				break;
   649			nmask = get_memtier_nodemask(memtier);
   650			nodes_or(top_tier_mask, top_tier_mask, nmask);
   651		}
   652	
   653		ret = sysfs_emit(buf, "%*pbl\n", nodemask_pr_args(&top_tier_mask));
   654		mutex_unlock(&memory_tier_lock);
   655		return ret;
   656	}
   657	static DEVICE_ATTR_RO(toptier_nodes);
   658	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
