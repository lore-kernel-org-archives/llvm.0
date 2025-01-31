Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F425760;
	Fri, 31 Jan 2025 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350895; cv=none; b=XNMvJaSBY6SMpqdoNxJOYEjoAMr70VubMRNnFFWgOb/exOxRFpSFfPCnGdlRVxyxN7Fs3jNUlqxdbd2tycSUM2HktrHu8win5TEgl5262LVkziq4pT7WDn8kB7cokeby8P8lS7UvrlaNC5y5KoilQQ8hxiqHH70MEDmN8Bke524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350895; c=relaxed/simple;
	bh=DIsKm1iFZ3pJzVPjHRPeQbx7XndtXv/0EmG6t+Tb/3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihCUK4Cn0NoNI65WzEij3atA3zXSISHmbmKfnANPDbthfH0hj+5uGcKgNJSt0t3PYgBZNOiUOcvgGSpTW1c+ReA6GffAz1190EWuqDeiBXZno+ersx+6sCglz/lq7SF+JmldChDdZW3NYzc9go38Xq9FyibriNr8EG/4AW31xn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRqTIO2U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRqTIO2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738350894; x=1769886894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DIsKm1iFZ3pJzVPjHRPeQbx7XndtXv/0EmG6t+Tb/3Y=;
  b=PRqTIO2UUQcFwYla2r/uGD2d/JfP4s4ke5snDRZbEzV6VqKvbHANvvoP
   hzyb76Pxhji5FU3PgR2LWdb+p1+VUHKRPtAtJn6t5JAwkh9keH5aZnTjv
   D3dlZN0yWI9rK2WfvL2epCxdoGzBxNimRCRGWMJa14Yk2DAMRkmMUrUIg
   tX+VvqcPOmEMJNchmLNLs88BS+l/4+yMUaukJmd/5/FMjjcHjHOE7X1BB
   PmINA6lZqm+pVDaqG1RCz+ub1051/3rav1LWnQiR3lNX25jJ9FyDKxmll
   MJCQwfLnkBFnHWDtw+4pRZ1C3tAvW+47Ct++LWcGQnkUETtAZi+AwuQBw
   A==;
X-CSE-ConnectionGUID: e2kzr+FlTYq1fao2p/41kw==
X-CSE-MsgGUID: N+hjnYwASxGBwwG9uXs7fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="42848865"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="42848865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:14:53 -0800
X-CSE-ConnectionGUID: la1/A1W6QN6DvfKEvx41CQ==
X-CSE-MsgGUID: s7QZKNLQQOyx1bNkS0ljRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140589114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 11:14:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdwTZ-000mm6-25;
	Fri, 31 Jan 2025 19:14:49 +0000
Date: Sat, 1 Feb 2025 03:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: drivers/cpufreq/airoha-cpufreq.c:109:34: warning: unused variable
 'airoha_cpufreq_match_list'
Message-ID: <202502010323.RZE0k8gB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: 84cf9e541cccb8cb698518a9897942e8c78f1d83 cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
date:   2 weeks ago
config: x86_64-buildonly-randconfig-001-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010323.RZE0k8gB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010323.RZE0k8gB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010323.RZE0k8gB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/airoha-cpufreq.c:109:34: warning: unused variable 'airoha_cpufreq_match_list' [-Wunused-const-variable]
     109 | static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/airoha_cpufreq_match_list +109 drivers/cpufreq/airoha-cpufreq.c

   108	
 > 109	static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
   110		{ .compatible = "airoha,en7581" },
   111		{},
   112	};
   113	MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
