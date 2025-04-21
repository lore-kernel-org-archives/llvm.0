Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0D255E20;
	Mon, 21 Apr 2025 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206091; cv=none; b=X+MLyVdGIj7MrGlVysQXyH+qjZd/Xxw5Fmy65pQWUxuTapihwHiZTE4rKgaOFcPuq7B2ae2N2u+Pu5a3HSzQHRGhjRxxtFQST5FxAA/IoDRsBNhCmWz1ttewAo8Qh8ub4lhpLr251n49u9f4NfAPbR+sMkU+FSAUB8obhZG43xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206091; c=relaxed/simple;
	bh=v6XAYbfBFV3E+XQrD6a864uNENvS5xfd6cUF1cf38z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dha5i+V34qAwvPGqVohm4EG+gRU3UO28/dNRQS/V+ohamKaj2gJBrhkMF22TOrOyZbMeeMrhjs8XUsnvhSumHi6TvBxxyJR+VssafnG/28qrI4qvxgZSt06h4yiyxbZbB+B3bbP/zw8ALQI1jLWYC7RycflvPgsBQODwk42PB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOtFyfqP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOtFyfqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206089; x=1776742089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v6XAYbfBFV3E+XQrD6a864uNENvS5xfd6cUF1cf38z8=;
  b=VOtFyfqPTaUwmQ4Ew41QYy86lTy/OeeEG+vCC/l35gKkv5WTZUa0oupH
   I5ai+opA3NZhPR5nx1rI/qPeB6K/FOnfz6ioDZ4Qkc46Ip4369Km0ba7u
   MVki7VxApDibr3uaVHNSgwvBcXtUyJ3kjzArxetfVKgJrf42xe63rwnBe
   SUoarmh05bNgF6sNsaKLp2Ru+X/HIsEAuuTvr9ZnU2LfH9m9xXH48ubRc
   wdkTKIZkM6lykkoQbkoGKIQNJ+aVnEk+le/q/ldZUrnEtyFKQps+p1+uj
   2CgMzs7GLHLdK+0vnnYNTc1sQHrAfHOLSUabBbnnNk0KATMCx6RBeXCHM
   g==;
X-CSE-ConnectionGUID: rgxIJzEYQAy13KCdogbHYQ==
X-CSE-MsgGUID: NyqMlpdSSauAa9bgL7t1nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58113618"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="58113618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:28:04 -0700
X-CSE-ConnectionGUID: Y1fF9rn9SO6bmrmVsoLjgw==
X-CSE-MsgGUID: 8lsqH1a7R1KH4ZYJaTW7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132129427"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Apr 2025 20:28:02 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6hpA-00005U-07;
	Mon, 21 Apr 2025 03:28:00 +0000
Date: Mon, 21 Apr 2025 11:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 16/19] famfs_fuse: Add holder_operations for dax
 notify_failure()
Message-ID: <202504211107.mDN9xA7M-lkp@intel.com>
References: <20250421013346.32530-17-john@groves.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421013346.32530-17-john@groves.net>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dev_dax_iomap-Move-dax_pgoff_to_phys-from-device-c-to-bus-c/20250421-094020
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250421013346.32530-17-john%40groves.net
patch subject: [RFC PATCH 16/19] famfs_fuse: Add holder_operations for dax notify_failure()
config: hexagon-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211107.mDN9xA7M-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211107.mDN9xA7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211107.mDN9xA7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/famfs.c:325:1: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
   }
   ^
   fs/fuse/famfs.c:402:30: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                          __func__, __LINE__, next_offset, fmap_buf_size);
                                              ^~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:402:43: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                          __func__, __LINE__, next_offset, fmap_buf_size);
                                                           ^~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:436:31: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                  __func__, __LINE__, next_offset, fmap_buf_size);
                                                      ^~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:436:44: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                  __func__, __LINE__, next_offset, fmap_buf_size);
                                                                   ^~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:501:32: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                          __func__, __LINE__, next_offset, fmap_buf_size);
                                                              ^~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:501:45: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                          __func__, __LINE__, next_offset, fmap_buf_size);
                                                                           ^~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:526:32: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                          __func__, __LINE__, next_offset, fmap_buf_size);
                                                              ^~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:526:45: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                          __func__, __LINE__, next_offset, fmap_buf_size);
                                                                           ^~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/fuse/famfs.c:593:20: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                          __func__, meta->file_size, extent_total);

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEV_DAX_IOMAP
   Depends on [n]: DEV_DAX [=n] && DAX [=y]
   Selected by [y]:
   - FUSE_FAMFS_DAX [=y] && FUSE_FS [=y]


vim +325 fs/fuse/famfs.c

   294	
   295	static void
   296	famfs_set_daxdev_err(
   297		struct fuse_conn *fc,
   298		struct dax_device *dax_devp)
   299	{
   300		int i;
   301	
   302		/* Gotta search the list by dax_devp;
   303		 * read lock because we're not adding or removing daxdev entries
   304		 */
   305		down_read(&fc->famfs_devlist_sem);
   306		for (i = 0; i < fc->dax_devlist->nslots; i++) {
   307			if (fc->dax_devlist->devlist[i].valid) {
   308				struct famfs_daxdev *dd = &fc->dax_devlist->devlist[i];
   309	
   310				if (dd->devp != dax_devp)
   311					continue;
   312	
   313				dd->error = true;
   314				up_read(&fc->famfs_devlist_sem);
   315	
   316				pr_err("%s: memory error on daxdev %s (%d)\n",
   317				       __func__, dd->name, i);
   318				goto done;
   319			}
   320		}
   321		up_read(&fc->famfs_devlist_sem);
   322		pr_err("%s: memory err on unrecognized daxdev\n", __func__);
   323	
   324	done:
 > 325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
