Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9E15AAD9;
	Fri, 22 Nov 2024 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732239997; cv=none; b=j44TT3rbSrQFxn3a4j+O/ObsAsSLiAbd2ioPYkYF1Sdpt7x8jeZ//j7qT/lWJNQoBnurD8c2ZiE3tdE1rk8XlJjXDN6kpvVm+gbPACidvcgl1phgZ6VE9uD81WA/+Vy+riU/aDCHID3iYf52Wc8Udyczvvdg/pXFjasoOBLyuE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732239997; c=relaxed/simple;
	bh=QFC02b/JhMAXmbVsoP5zp+da3OcWsdHbO3+OpmT9+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh4yGkf6YZw7ch13Etwow2sxZjrjiRZGmlgkq8aEAB4zhcfXMXw8//ztocb+r/U2C2EKH+1neRY9U3JcXk8qmF092FnBGflOAScS6xE9H8x66viniC2dmnq0Gm/FVC4w4urx7ewGl6K9bWfOTS+Kh/oEUK7YusOS8HqEYl1QZ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZVTqcPm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZVTqcPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732239996; x=1763775996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QFC02b/JhMAXmbVsoP5zp+da3OcWsdHbO3+OpmT9+u4=;
  b=aZVTqcPmlAD+F2QZE8fD4epRoFE0gER4DTOb+R/qf6CEaSilod/8Z+N/
   VWQMvrW/Bi0ITHWP+tUJ0P7ujfK3RRk1md9EBz4sRiga9qHmST1Nqz+2h
   IJ9RUBt0jJrxenkmHkV8lXhjOoJ+bC2zamE/YxbPOBj1YJEOUdeP7+fnQ
   CF1xQ2UN4L38wvnWfZggVXH/P1/wCYSg76KEPmaoJLTByt9PYoT9AUYKf
   uDlniK6uAe+7y5JDJ++gTk9MXXBU/eCQs5NaRiwlRm2tmE7WomaAh+UJM
   gAclPNWPiJbAKqF7VGxD231a2mbGxlI1k9sMllHl0JNp9OEa0kqbX3sJk
   Q==;
X-CSE-ConnectionGUID: YIsXQGnISQ6HSji9v9SZfA==
X-CSE-MsgGUID: MPiu9r3AQs65izh2C5Wlng==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43447929"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="43447929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 17:46:29 -0800
X-CSE-ConnectionGUID: gytPg7OPSLGnW4h/mYnOqA==
X-CSE-MsgGUID: txedwK5ZR2SI/OaiCKm0Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="113716352"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 17:46:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEIka-0003Yp-1R;
	Fri, 22 Nov 2024 01:46:24 +0000
Date: Fri, 22 Nov 2024 09:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: mingzhe.zou@easystack.cn, colyli@suse.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bcache@vger.kernel.org, dongsheng.yang@easystack.cn,
	zoumingzhe@qq.com
Subject: Re: [PATCH 3/3] bcache: remove unused parameters
Message-ID: <202411220924.whVi5QoT-lkp@intel.com>
References: <20241119032852.2511-3-mingzhe.zou@easystack.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119032852.2511-3-mingzhe.zou@easystack.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241121]
[also build test ERROR on v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe-zou-easystack-cn/bcache-fix-io-error-during-cache-read-race/20241121-142652
base:   next-20241121
patch link:    https://lore.kernel.org/r/20241119032852.2511-3-mingzhe.zou%40easystack.cn
patch subject: [PATCH 3/3] bcache: remove unused parameters
config: arm-randconfig-001-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220924.whVi5QoT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220924.whVi5QoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220924.whVi5QoT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/bcache/request.c:566:55: error: no member named 'sb' in 'struct cache_set'
     566 |                 pr_warn("%pU cache read race count: %lu", s->iop.c->sb.set_uuid,
         |                                                           ~~~~~~~~  ^
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> drivers/md/bcache/request.c:788:14: error: use of undeclared identifier 'cl'
     788 |         continue_at(cl, cached_dev_read_error_done, NULL);
         |                     ^
>> drivers/md/bcache/request.c:788:14: error: use of undeclared identifier 'cl'
   3 errors generated.


vim +/cl +788 drivers/md/bcache/request.c

cafe563591446cf Kent Overstreet 2013-03-23  785  
d4e3b928ab487a8 Kent Overstreet 2023-11-17  786  static CLOSURE_CALLBACK(cached_dev_read_error)
cafe563591446cf Kent Overstreet 2013-03-23  787  {
1568ee7e3c6305d Guoju Fang      2019-04-25 @788  	continue_at(cl, cached_dev_read_error_done, NULL);
1568ee7e3c6305d Guoju Fang      2019-04-25  789  }
1568ee7e3c6305d Guoju Fang      2019-04-25  790  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
