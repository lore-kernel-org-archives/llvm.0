Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B81CC155;
	Thu, 22 Aug 2024 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344163; cv=none; b=WZJTZW0F5dhSAGZ9MXH/D+V5PSszAjblsup/flmcBUTTN4ofCPN9xDjxrGrS9eclrnVfSnDIiC5Tj2xMjS4nIRFH+CTIYo4dNBv11Z3ADhrPJLRVIwNfJXq2MVbzdqF6pyNSIQkeGM0svlK50dVcx44I//aYfjgBbJUi0lz22yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344163; c=relaxed/simple;
	bh=gnExTwXXGMFYNSeojRbpiwnEt6ZOWND1xdb232R5joo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFgvG1SSOAiPRm9rRwY1CmFG/SetbNFvk11rY4um5ewBVKhw94h4xj38khFF5L/HlHet02AMMcmCkAK+OdoOw3aOJhWGNnY4ZUb8MlxzE0p5aI23vH68hciKyI5pg2anVl+rUgBNs07DX2/Gm1v2D3/TnAuG1A5vBQNRCF7jQRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbHhwzFF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbHhwzFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724344161; x=1755880161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnExTwXXGMFYNSeojRbpiwnEt6ZOWND1xdb232R5joo=;
  b=TbHhwzFF/6gRoFNCda6FaXwWiXwSXjacE9/Q2OF4lN+lIaMBc6jwk7Ge
   goACBB5p7ohyDvoT9xWRh6vNvBlYy0guyJW1/4puW91LojsQKMVja75MD
   LQB1ipTZMjIRrT4J5YwyX15iDZfniDl3Sy6baXLZlgtcjh9TfiRX3UvsQ
   Yto2dCrVFbq7SQpJ1o74+5K5Gsg6DO5d7fZyGllMc6bNAL16BQTCmbXI8
   WGRb18wLqIVgF4+0lIpvnZ55QxpZob8fjZn5OQ3a4s22rpKi+vV4P9EFv
   2ORQbyrevoq2YJ7u3lbl695Fle1bCRfIV55TjnUQlmshKSUyS8dXUWWrr
   w==;
X-CSE-ConnectionGUID: fd/24uO6SHuAMMRtJHvo0g==
X-CSE-MsgGUID: t4MxLd0yR4+GDfKlqb2yWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22377336"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22377336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 09:29:20 -0700
X-CSE-ConnectionGUID: NpPM7OdkSXqdESORulOpUA==
X-CSE-MsgGUID: DWUgxTSWT/CVPcZZOZHTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61506185"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2024 09:29:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shAgX-000CzQ-1U;
	Thu, 22 Aug 2024 16:29:17 +0000
Date: Fri, 23 Aug 2024 00:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] avoid extra path_get/path_put cycle in path_openat()
Message-ID: <202408230235.OhngVcX4-lkp@intel.com>
References: <20240822004149.GR504335@ZenIV>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822004149.GR504335@ZenIV>

Hi Al,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Al-Viro/lift-grabbing-path-into-caller-of-do_dentry_open/20240822-093519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240822004149.GR504335%40ZenIV
patch subject: [PATCH 3/3] avoid extra path_get/path_put cycle in path_openat()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240823/202408230235.OhngVcX4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230235.OhngVcX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230235.OhngVcX4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/open.c:1049:8: error: incompatible pointer types passing 'struct dentry **' to parameter of type 'struct dentry *'; remove & [-Werror,-Wincompatible-pointer-types]
    1049 |                 dget(&file->f_path.dentry);
         |                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:337:50: note: passing argument to parameter 'dentry' here
     337 | static inline struct dentry *dget(struct dentry *dentry)
         |                                                  ^
   1 warning and 1 error generated.


vim +1049 fs/open.c

  1022	
  1023	/**
  1024	 * finish_open - finish opening a file
  1025	 * @file: file pointer
  1026	 * @dentry: pointer to dentry
  1027	 * @open: open callback
  1028	 *
  1029	 * This can be used to finish opening a file passed to i_op->atomic_open().
  1030	 *
  1031	 * If the open callback is set to NULL, then the standard f_op->open()
  1032	 * filesystem callback is substituted.
  1033	 *
  1034	 * NB: the dentry reference is _not_ consumed.  If, for example, the dentry is
  1035	 * the return value of d_splice_alias(), then the caller needs to perform dput()
  1036	 * on it after finish_open().
  1037	 *
  1038	 * Returns zero on success or -errno if the open failed.
  1039	 */
  1040	int finish_open(struct file *file, struct dentry *dentry,
  1041			int (*open)(struct inode *, struct file *))
  1042	{
  1043		int err;
  1044		BUG_ON(file->f_mode & FMODE_OPENED); /* once it's opened, it's opened */
  1045	
  1046		file->f_path.dentry = dentry;
  1047		err = do_dentry_open(file, open);
  1048		if (file->f_mode & FMODE_OPENED)
> 1049			dget(&file->f_path.dentry);
  1050		return err;
  1051	}
  1052	EXPORT_SYMBOL(finish_open);
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
