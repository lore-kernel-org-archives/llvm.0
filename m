Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF33E6DF5;
	Tue, 14 Apr 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173405; cv=none; b=ZfYeDAQk7kiyqotC3wVrnWTXUPrN0t8gpO5JO6qnXEZLjg/GGIBDdHZHUzDsyKodv451p9IsgK0F3HX3fagrMbp5YKg7SJwTQb7QQ2zBmNKhjfGG/tKp8TsPszVnSChcQxbbaV5oFf8hLQ0uy32tWFQR/YGWtlZFb4hiIJCWnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173405; c=relaxed/simple;
	bh=jHZRFojegG7x5yEulKgFktUL9EK+eNjEZIEwNqc6xcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AAivB0APJphfXQW73Zjd4y00vOAD+J8u5Pl4pL+cMBQ+at+7NS0vFw/5BeqyOJZKfQq2n90/YMLbh1+kDnkEdmfiWTJgYOSJ3gStnP5f6mGQuYAQPI7dbnOEyXDJl79GA89QTm2nKxYCfak/AoY2DdddlLFJr5WqQzNLIDEiaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVrFR9pt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVrFR9pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776173403; x=1807709403;
  h=date:from:to:cc:subject:message-id;
  bh=jHZRFojegG7x5yEulKgFktUL9EK+eNjEZIEwNqc6xcg=;
  b=IVrFR9ptGAUPHkh1FsNu3Kdj7VS9A7EJN0q9PN9ZoBaIWR2ADJUr4AI/
   JPYq9SiuBkBflYkho7AD1eEwYdbcJE0YLisGLRrxt3dlEO8h0EzVXFrg1
   ANu/Va4WKGEP+QY3MOS6+yFSp8aUS9NG8KdxNBm2npA/slaA38ZuKFMkZ
   surZKPMTZS0b63G7UHE/d2e+5A0f2VCRogqWstcOn3yQsj18z2EuwvXBV
   g1t92ud1lTzVqRIVHAxY66eWgNmM7W2c42mRiXGyqQV0Z4bpFMYuul6q4
   qyJrHMdunKx0HZ7mE6GU4wHIkP4v+4WZCozOfx+KEpnowhQ0RJeM9xKAS
   w==;
X-CSE-ConnectionGUID: 75uk62Q+TN+dMF6XytsM9A==
X-CSE-MsgGUID: gkFmDURqSludzvkd7tyl1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87752411"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87752411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:30:03 -0700
X-CSE-ConnectionGUID: xP3G/fSGQhavDgy6sxzAtg==
X-CSE-MsgGUID: WvPXS+XiRYyo3E6kX9Kbzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260536846"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2026 06:30:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCdq3-000000000Ph-2wrX;
	Tue, 14 Apr 2026 13:29:59 +0000
Date: Tue, 14 Apr 2026 15:29:48 +0200
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/rcu/tree_nocb.h:1680:6: error: redefinition of
 'rcu_spawn_cpu_nocb_kthread'
Message-ID: <202604141521.vhPCPgu3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Separate-housekeeping-types-in-enum-hk_type/20260414-163427
head:   94092df65446492ae8451145df6310099cf5a855
commit: f37abc5ce4b876e9d13b12b144ea472ed4af4a80 rcu: Support runtime NOCB initialization and dynamic offloading
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141521.vhPCPgu3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141521.vhPCPgu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141521.vhPCPgu3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4930:
>> kernel/rcu/tree_nocb.h:1680:6: error: redefinition of 'rcu_spawn_cpu_nocb_kthread'
    1680 | void rcu_spawn_cpu_nocb_kthread(int cpu)
         |      ^
   kernel/rcu/rcu.h:671:20: note: previous definition is here
     671 | static inline void rcu_spawn_cpu_nocb_kthread(int cpu) { }
         |                    ^
   1 error generated.


vim +/rcu_spawn_cpu_nocb_kthread +1680 kernel/rcu/tree_nocb.h

  1679	
> 1680	void rcu_spawn_cpu_nocb_kthread(int cpu)
  1681	{
  1682	}
  1683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
