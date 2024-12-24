Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F9EC2;
	Tue, 24 Dec 2024 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735005701; cv=none; b=Q36WNLXIz18Y1DNxPMEuoc8tEer/PfT3YuNJiVWQgFMqCS0fFZXmRK5BqxMp5zyC25bRDTM1fDYYgelKjJ56G6JoxmjGhgeNra9Qqv8DVGTiAk2jel+AUd3XHlGQx16+HjD/j9s771IQWTOqFl+x+1BG/mYDkm52GRYv4EoWiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735005701; c=relaxed/simple;
	bh=bppVJI1S5FCdgUGe/0cv3T2Tpfj+ZuH9gWt2elHkJFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhNs14B0N7w/MQm6+jD/8ugYGTkvKMLPHUZxfe/00+S/haJvFlI/rcS1DdTDFMcpoj6kkKn7lFRjmx1y8RThqj95Xf6la3kbG3s3zZ/kIRd8gssw/pnnGhQr8WwvrQzHamt+6i8yoZAEkGCc95/c3LmrHV8Vuvd43rIlMd6Z01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DC/tkZTf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DC/tkZTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735005699; x=1766541699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bppVJI1S5FCdgUGe/0cv3T2Tpfj+ZuH9gWt2elHkJFM=;
  b=DC/tkZTfs1qWKOyu9SgQL6N4ru8tRexlsUyPVmYVBMwISQE6l27YqYxY
   yHvHqZ77kgI8rUAfHsv+M1ycYemy5b1AqVIKOcANE/4DYUMh9nWs/7Ts/
   MLLKLN3GUqqI8YQHicJJOGCQhwNvAalghbNnYiqhSLa9shVtNFGZovIHt
   Q0Jicn6quJyCQWQx/T2b+pnoqR8BVb4nqOvXP4e5yS7MPNo+2KmkDOCBE
   SuKIgmwjWke3SaTOrnW5YgMF2yyfHDZD9K6SRLU61yUVvExNHvkezCFNC
   OHaVqvelrLauoRXUTd6xXpU2PCpWa6qKHK904WW8rBJbXCdOEwiUYvcdR
   g==;
X-CSE-ConnectionGUID: M7zGBh6wREK/i1qX8DM59w==
X-CSE-MsgGUID: LMN4hc3vT7mUf7m5bVy2TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="38318056"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="38318056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:01:39 -0800
X-CSE-ConnectionGUID: YAD/n3aFSkW+vDmdYDUGww==
X-CSE-MsgGUID: 7rAHWUtFSyyU6UiNCrAGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104353174"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2024 18:01:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPuEp-0000kp-0u;
	Tue, 24 Dec 2024 02:01:35 +0000
Date: Tue, 24 Dec 2024 10:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 28/32] kernel/events/core.c:6944:3: error: call to
 undeclared function 'unwind_user_deferred'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202412240919.szVHGt00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   b610703fefd5a3a992e07a383e2e6f6cbf9a41c8
commit: ea5b03d9c57dc5e8656b844f96a4ca3b4ab73317 [28/32] perf: Add deferred user callchains
config: x86_64-buildonly-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241224/202412240919.szVHGt00-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240919.szVHGt00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240919.szVHGt00-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:12:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/events/core.c:6944:3: error: call to undeclared function 'unwind_user_deferred'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6944 |                 unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
         |                 ^
>> kernel/events/core.c:14218:2: error: call to undeclared function 'unwind_user_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    14218 |         unwind_user_register(&perf_unwind_callback_cb, perf_event_callchain_deferred);
          |         ^
   1 warning and 2 errors generated.


vim +/unwind_user_deferred +6944 kernel/events/core.c

  6938	
  6939	static void perf_pending_unwind_irq(struct irq_work *entry)
  6940	{
  6941		struct perf_event *event = container_of(entry, struct perf_event, pending_unwind_irq);
  6942	
  6943		if (event->pending_unwind) {
> 6944			unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
  6945			event->pending_unwind = 0;
  6946		}
  6947	}
  6948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
