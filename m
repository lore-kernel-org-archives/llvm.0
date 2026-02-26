Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F026364923;
	Thu, 26 Feb 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772136778; cv=none; b=YqsxQcNKTYEvNP0cdXMzD4ULWQmmJVqtVYgRmro419KXraDux4lPBm4HCrDfjSb8xnoRA3mhxZWh6BgPSl1FSnDc3WkUtoxEWwjUgE7wo1D1WNDkNX4yav2CGmnirP/f7GvTAaMsGlCjWoJyVlxkGGzKU+8E8d4UzgrhJw9aq08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772136778; c=relaxed/simple;
	bh=epoq6hEcZgCbi5OgFb8zjBbfz5DLbOPrXB01WZv7d5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE+Ws+wGIi5vkR8GCvyblOgxAzWyGN7ev8z7TGZzP4UjmReC6tDITnhWv1O/euVU+w8d5F+rbPaPVPI2a+0+t6EjFbN8jPo9yrwMXWPcU+KvWDa971Knc0oPPkEdsq2OuyM1K6qvwWw9fioo8nn4/ReVZToTxI/cdfl/MrDfdB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNX5yHtR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNX5yHtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772136777; x=1803672777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epoq6hEcZgCbi5OgFb8zjBbfz5DLbOPrXB01WZv7d5s=;
  b=ZNX5yHtR2jFfMExgc0AvyXdHHZX6AdA/reSpbRH+EjsDz/L8+Jsu7LQH
   nklrkmH8/EOP4i+Gn6+k7J+GHJa2cncIhAHr9iTr1kLqI1+H6VNdaDWZv
   XZSq1FPtCDGGtPujA7xnwI6B1NyGZMmDkWc2qx6eJJhNyL6yb/8KfDC71
   wbKZ9AXWQ+JcfHV6MPqKxKqtw2pP5EAxNuw6Y9Ovp+Whr+7rja6aBWHwj
   nNkQ4AZWquoTHom0k+wV48rn41uFE9ZtMK+a86gSmnNe7VuwhwHhvZL90
   T6TYBtjL8SNf1bNyrkEJa6LqA7OHyBiqBNK6l2I62C2bGTj4ztq8kwhHw
   A==;
X-CSE-ConnectionGUID: CaFnasitQJmuXS8Wacwi2A==
X-CSE-MsgGUID: 2R1VUHykRWWhlYKdPjD92Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83847322"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83847322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:12:57 -0800
X-CSE-ConnectionGUID: 23aT6sILSdurNFtrUxN/ew==
X-CSE-MsgGUID: xGtECWVVTfOFJLEej9ZexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214606197"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 12:12:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvhjB-000000009qX-15KF;
	Thu, 26 Feb 2026 20:12:53 +0000
Date: Fri, 27 Feb 2026 04:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-ipc@vger.kernel.org,
	Mathura_Kumar <academic1mathura@gmail.com>
Subject: Re: [PATCH] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek
  syscall] for non-destructive receive             and inspection
Message-ID: <202602270407.RLRGqxJd-lkp@intel.com>
References: <20260226174010.118080-1-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226174010.118080-1-academic1mathura@gmail.com>

Hi Mathura_Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v7.0-rc1 next-20260226]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/mqueue-introduce-new-do_mq_timedreceive2-mq_peek-syscall-for-non-destructive-receive-and-inspection/20260227-021340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260226174010.118080-1-academic1mathura%40gmail.com
patch subject: [PATCH] mqueue: introduce new  do_mq_timedreceive2() [ mq_peek  syscall] for non-destructive receive             and inspection
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602270407.RLRGqxJd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270407.RLRGqxJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270407.RLRGqxJd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1630:2: warning: syscall mq_timedreceive2 not implemented [-W#warnings]
    1630 | #warning syscall mq_timedreceive2 not implemented
         |  ^
   <stdin>:1633:2: warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]
    1633 | #warning syscall mq_timedreceive2_time64 not implemented
         |  ^
   2 warnings generated.
--
>> <stdin>:1630:2: warning: syscall mq_timedreceive2 not implemented [-W#warnings]
    1630 | #warning syscall mq_timedreceive2 not implemented
         |  ^
   <stdin>:1633:2: warning: syscall mq_timedreceive2_time64 not implemented [-W#warnings]
    1633 | #warning syscall mq_timedreceive2_time64 not implemented
         |  ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
