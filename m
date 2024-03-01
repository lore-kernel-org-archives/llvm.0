Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCD36D1BB;
	Fri,  1 Mar 2024 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709294951; cv=none; b=LgGRASkcqsZQb6OHalrb3WdFof64zw2pPP/lfkKGk8b5tCiNIBYa2qBdirm1qdxJRPWgsL3SG9rW4/ORuLZiu/cFlxneo7z8uxh7DCpQDBGEhzGGiaCGdV8JhWU0xC/s1qeDy39EnpzRyKHc+m6rDwWUYct5yjokPBLOlyQoP/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709294951; c=relaxed/simple;
	bh=EbLAQNSS3Pm3QYvTcV3hpjWBdOguLcx05zflaG0H2lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEzVVEBAVP4Ph+faCkrgYpKqR2bucYccCSKmsNgM7jX3TOfe0X7X2mNC/0hZ8CpVYSuOO7mhYMlLylzgNDSKJsAYzPFTlo6kBPtytZ+h+LNPlPvzHH1/joHQeYoa5P8KsmDPWHXE0ac/aKJex+x+B9hdqyUhAva1RKCOWZACak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nB1LhmHL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nB1LhmHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709294949; x=1740830949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbLAQNSS3Pm3QYvTcV3hpjWBdOguLcx05zflaG0H2lo=;
  b=nB1LhmHLS+XgiePTHb0/XztourLw06oMrd7TVqOgSv3TdDSm8G+VUZsW
   pfCQx2NmjgM4UqCE11qJl9SSun+EXYq2SKYt7/WiA3aIgBpwsk7XJXi6b
   q1yHSBbhjG9rBb8jOar7LXir6l6nuVCz8R3eKHmu6LRXAnBaYpleYYLUe
   XhlcjjfTjSqH6lCsDQagooT7/55EIJWZID5GNKA1w5NXYlZRS8iLn6IEC
   KFWsGjL04o0XsfGSKEWnQQJ3IAKOPFfvz7HZBkQTuPQc8yHPwIeqmEpXx
   Kbi4YTDTwsRGPu24Ax3YsFSbXVe56Lr/5DmghMvf7TgLKYUkEEUrWLOoi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3717187"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3717187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 04:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12732728"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2024 04:09:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg1hH-000Dpn-2B;
	Fri, 01 Mar 2024 12:09:04 +0000
Date: Fri, 1 Mar 2024 20:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 8/48] net/ipv4/nexthop.c:826:7:
 warning: variable 'nest' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202403012001.jTkxJeiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f8e2d2b1d2a7d523921c4b02caf453919b7a7df5
commit: 001978ea519441f0295912034d00dd1af9eb5b93 [8/48] net: nexthop: Expose nexthop group HW stats to user space
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240301/202403012001.jTkxJeiu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403012001.jTkxJeiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403012001.jTkxJeiu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/nexthop.c:826:7: warning: variable 'nest' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     826 |                 if (nla_put_u32(skb, NHA_HW_STATS_USED, hw_stats_used))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/nexthop.c:845:23: note: uninitialized use occurs here
     845 |         nla_nest_cancel(skb, nest);
         |                              ^~~~
   net/ipv4/nexthop.c:826:3: note: remove the 'if' if its condition is always false
     826 |                 if (nla_put_u32(skb, NHA_HW_STATS_USED, hw_stats_used))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     827 |                         goto nla_put_failure;
         |                         ~~~~~~~~~~~~~~~~~~~~
   net/ipv4/nexthop.c:823:7: warning: variable 'nest' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     823 |                 if (err)
         |                     ^~~
   net/ipv4/nexthop.c:845:23: note: uninitialized use occurs here
     845 |         nla_nest_cancel(skb, nest);
         |                              ^~~~
   net/ipv4/nexthop.c:823:3: note: remove the 'if' if its condition is always false
     823 |                 if (err)
         |                 ^~~~~~~~
     824 |                         goto hw_stats_update_fail;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/nexthop.c:817:6: warning: variable 'nest' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     817 |         if (nla_put_u32(skb, NHA_HW_STATS_ENABLE, nhg->hw_stats))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/nexthop.c:845:23: note: uninitialized use occurs here
     845 |         nla_nest_cancel(skb, nest);
         |                              ^~~~
   net/ipv4/nexthop.c:817:2: note: remove the 'if' if its condition is always false
     817 |         if (nla_put_u32(skb, NHA_HW_STATS_ENABLE, nhg->hw_stats))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     818 |                 goto nla_put_failure;
         |                 ~~~~~~~~~~~~~~~~~~~~
   net/ipv4/nexthop.c:812:21: note: initialize the variable 'nest' to silence this warning
     812 |         struct nlattr *nest;
         |                            ^
         |                             = NULL
   3 warnings generated.


vim +826 net/ipv4/nexthop.c

   807	
   808	static int nla_put_nh_group_stats(struct sk_buff *skb, struct nexthop *nh,
   809					  u32 op_flags)
   810	{
   811		struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
   812		struct nlattr *nest;
   813		bool hw_stats_used;
   814		int err;
   815		int i;
   816	
   817		if (nla_put_u32(skb, NHA_HW_STATS_ENABLE, nhg->hw_stats))
   818			goto nla_put_failure;
   819	
   820		if (op_flags & NHA_OP_FLAG_DUMP_HW_STATS &&
   821		    nhg->hw_stats) {
   822			err = nh_grp_hw_stats_update(nh, &hw_stats_used);
   823			if (err)
   824				goto hw_stats_update_fail;
   825	
 > 826			if (nla_put_u32(skb, NHA_HW_STATS_USED, hw_stats_used))
   827				goto nla_put_failure;
   828		}
   829	
   830		nest = nla_nest_start(skb, NHA_GROUP_STATS);
   831		if (!nest)
   832			return -EMSGSIZE;
   833	
   834		for (i = 0; i < nhg->num_nh; i++)
   835			if (nla_put_nh_group_stats_entry(skb, &nhg->nh_entries[i],
   836							 op_flags))
   837				goto nla_put_failure;
   838	
   839		nla_nest_end(skb, nest);
   840		return 0;
   841	
   842	nla_put_failure:
   843		err = -EMSGSIZE;
   844	hw_stats_update_fail:
   845		nla_nest_cancel(skb, nest);
   846		return err;
   847	}
   848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
