Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508BE17CA09;
	Sun,  1 Sep 2024 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199189; cv=none; b=nZxwLNyrzd/Ow7zEI6t4bai5hHPOyIEHpSLnRs8LwgKyDJtngmGkclkgBbGeq3AEMfUbxu1ul1GPDwXWDr633kJRKd4gAOrNf/07//74KV7m8uqnPFywmQLgAohvuncW7FBuLXFam7ATuqnl3pupoGtRHhKoKqesIn7aZ4wZctU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199189; c=relaxed/simple;
	bh=8PIFY8LG34AjsukZzVTGF0xAjNP4Y9QybWb1k8i7YIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXx8jwZfo1fSlz4llS4Mz9ZUMwE25swRYipPFbR8fkqgSNwGHA228ibb9jbSJL0psKZHCiD2K+IcRLyle0vUS/bjEdQruSDQmrWcrYSki7sCIFEqRkpXgNMeGXHmjQQ6SLyjdjxPYC9vBckaPIJRS0nP7nXungAI/R3M/bS6Yik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW+izhTg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW+izhTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725199188; x=1756735188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PIFY8LG34AjsukZzVTGF0xAjNP4Y9QybWb1k8i7YIE=;
  b=XW+izhTgKHLCXZ8Y1ZF3ZKCjwN3OArq8Kvjhnf3jjTOTRJcA6FhOuSjA
   yfXRAE/hWqqR/SQKh5lV7ppHdPoTEfd13hQzOU0pXKT+buhqDzOYC09sQ
   J+JP32WyRB2fokaWTF74XBmgCbYbgeCs2q3siKrRVOpZU+LZ4MSyWAOLE
   FUSepWyaIK9nT6tpHt0qG+8mZsZzH4XSKh1vHTWfcXm93b2UWsYqCanm+
   XlYCvw+8emojAOg2BjftGTG0l3n3D49sP1m8blKrSSa50eMuWOefNAUih
   +cpktLpG1oxxZdctTt+OIbC/TmdkNWxGlMV0pmDQYfF3CadPAsYPax1+d
   Q==;
X-CSE-ConnectionGUID: lOUYgVebSxW4IjjPom4zQg==
X-CSE-MsgGUID: 0LBSLXoHRAWnBoTYoYH1Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27576186"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="27576186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 06:59:47 -0700
X-CSE-ConnectionGUID: G+zkmi1VSs6AISZpXUW1Gg==
X-CSE-MsgGUID: JEuX1tH0SGynNNpfRmHgzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64301483"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Sep 2024 06:59:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skl7H-0003hu-1b;
	Sun, 01 Sep 2024 13:59:43 +0000
Date: Sun, 1 Sep 2024 21:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] NFS: Fix missing files in `ls` command output
Message-ID: <202409012146.wYz4Qg5V-lkp@intel.com>
References: <20240829091340.2043-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829091340.2043-1-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/NFS-Fix-missing-files-in-ls-command-output/20240829-171711
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240829091340.2043-1-laoar.shao%40gmail.com
patch subject: [RFC PATCH] NFS: Fix missing files in `ls` command output
config: i386-randconfig-001-20240901 (https://download.01.org/0day-ci/archive/20240901/202409012146.wYz4Qg5V-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012146.wYz4Qg5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012146.wYz4Qg5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:326:6: warning: variable 'cache_entry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     326 |         if (ret) {
         |             ^~~
   fs/nfs/dir.c:345:17: note: uninitialized use occurs here
     345 |         *prev_cookie = cache_entry->cookie;
         |                        ^~~~~~~~~~~
   fs/nfs/dir.c:326:2: note: remove the 'if' if its condition is always false
     326 |         if (ret) {
         |         ^~~~~~~~~~
     327 |                 kfree(name);
         |                 ~~~~~~~~~~~~
     328 |                 goto out;
         |                 ~~~~~~~~~
     329 |         }
         |         ~
   fs/nfs/dir.c:323:6: warning: variable 'cache_entry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     323 |         if (!name)
         |             ^~~~~
   fs/nfs/dir.c:345:17: note: uninitialized use occurs here
     345 |         *prev_cookie = cache_entry->cookie;
         |                        ^~~~~~~~~~~
   fs/nfs/dir.c:323:2: note: remove the 'if' if its condition is always false
     323 |         if (!name)
         |         ^~~~~~~~~~
     324 |                 goto out;
         |                 ~~~~~~~~
   fs/nfs/dir.c:316:43: note: initialize the variable 'cache_entry' to silence this warning
     316 |         struct nfs_cache_array_entry *cache_entry;
         |                                                  ^
         |                                                   = NULL
   2 warnings generated.


vim +326 fs/nfs/dir.c

d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  310  
ec108d3cc7663d Anna Schumaker        2023-04-04  311  static int nfs_readdir_folio_array_append(struct folio *folio,
0adf85b445c7fb Trond Myklebust       2022-02-27  312  					  const struct nfs_entry *entry,
b04660a1b4ac01 Yafang Shao           2024-08-29  313  					  u64 *cookie, u64 *prev_cookie)
d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  314  {
a52a8a6adad99e Trond Myklebust       2020-11-01  315  	struct nfs_cache_array *array;
4a201d6e3f4253 Trond Myklebust       2010-10-23  316  	struct nfs_cache_array_entry *cache_entry;
a52a8a6adad99e Trond Myklebust       2020-11-01  317  	const char *name;
0adf85b445c7fb Trond Myklebust       2022-02-27  318  	int ret = -ENOMEM;
4a201d6e3f4253 Trond Myklebust       2010-10-23  319  
a52a8a6adad99e Trond Myklebust       2020-11-01  320  	name = nfs_readdir_copy_name(entry->name, entry->len);
3020093f578fb6 Trond Myklebust       2010-11-20  321  
4b71e2416ec4cb Fabio M. De Francesco 2023-05-03  322  	array = kmap_local_folio(folio, 0);
0adf85b445c7fb Trond Myklebust       2022-02-27  323  	if (!name)
0adf85b445c7fb Trond Myklebust       2022-02-27  324  		goto out;
b1e21c97437f64 Trond Myklebust       2020-11-01  325  	ret = nfs_readdir_array_can_expand(array);
a52a8a6adad99e Trond Myklebust       2020-11-01 @326  	if (ret) {
a52a8a6adad99e Trond Myklebust       2020-11-01  327  		kfree(name);
4a201d6e3f4253 Trond Myklebust       2010-10-23  328  		goto out;
a52a8a6adad99e Trond Myklebust       2020-11-01  329  	}
d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  330  
b1e21c97437f64 Trond Myklebust       2020-11-01  331  	cache_entry = &array->array[array->size];
0adf85b445c7fb Trond Myklebust       2022-02-27  332  	cache_entry->cookie = array->last_cookie;
4a201d6e3f4253 Trond Myklebust       2010-10-23  333  	cache_entry->ino = entry->ino;
0b26a0bf6ff398 Trond Myklebust       2010-11-20  334  	cache_entry->d_type = entry->d_type;
a52a8a6adad99e Trond Myklebust       2020-11-01  335  	cache_entry->name_len = entry->len;
a52a8a6adad99e Trond Myklebust       2020-11-01  336  	cache_entry->name = name;
d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  337  	array->last_cookie = entry->cookie;
762567b7c798af Trond Myklebust       2020-11-04  338  	if (array->last_cookie <= cache_entry->cookie)
762567b7c798af Trond Myklebust       2020-11-04  339  		array->cookies_are_ordered = 0;
8cd51a0ccd1bed Trond Myklebust       2010-11-15  340  	array->size++;
47c716cbf638a1 Trond Myklebust       2010-12-07  341  	if (entry->eof != 0)
b1e21c97437f64 Trond Myklebust       2020-11-01  342  		nfs_readdir_array_set_eof(array);
4a201d6e3f4253 Trond Myklebust       2010-10-23  343  out:
0adf85b445c7fb Trond Myklebust       2022-02-27  344  	*cookie = array->last_cookie;
b04660a1b4ac01 Yafang Shao           2024-08-29  345  	*prev_cookie = cache_entry->cookie;
4b71e2416ec4cb Fabio M. De Francesco 2023-05-03  346  	kunmap_local(array);
4a201d6e3f4253 Trond Myklebust       2010-10-23  347  	return ret;
d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  348  }
d1bacf9eb2fd0e Bryan Schumaker       2010-09-24  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
