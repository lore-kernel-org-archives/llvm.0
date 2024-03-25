Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCD19F50F;
	Mon, 25 Mar 2024 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711327664; cv=none; b=fZlqf08iHxK5xd3vLF7+wNB20tXe0cJ4acgTHr+YdIhzzekdCC065hye2M/0fja4hrew8i5szrcYMN2zFBqhxh/SUOT+PDIBjjI/zJlVsk0CTIlyS+fGyWNYYfGcEij4mScs9D5MA6zeX3i9m9OweF/VuahpRWv3p+SN6JHU6wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711327664; c=relaxed/simple;
	bh=o6p3yrMtviZtfUJ3VVhVVm6R/oHw+uO31hrKIhWbyjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LglB3TVlaskM9dGtJRV+CivgP6sQm2udj9n0NXehwfU9LZUSecFVpXWg/9Vg290cXKTYDdEy/4nM91SeZUVs6dgRHWjdjNDCXwiQeXUxvCK+CpiVE1LXCIJVCNl2UkxPTuQ1sz8hqMlo2ZwAmYkIgPMYghByAIz0vFm6md9wTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMan77If; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMan77If"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711327663; x=1742863663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6p3yrMtviZtfUJ3VVhVVm6R/oHw+uO31hrKIhWbyjo=;
  b=OMan77IfDc6lSx/H3K6E2X1cZnNChj9hduoT3FgtU8LPVY1kMoaFJiJt
   e3/163+BPzWr1w5J6XeoQYoEL4IE9rUpGZIkA8S+Y0t6bg/pezzRqfPpv
   xuoXfRWJXmogAf7YYaHyHvNJpsRiDIs7puBusvjsp+ovvCoijG2Oqc30J
   A2Ehre2Ea+93gf1GxKpsmCpnqfVjPrWDoxr7Med01CZLRhL4iBOzBXEIQ
   LjkIDA3TvPzPqFCxP6htsBNAu3Ve9J0crFlLLgafBxg/dHaUh/Reb8x8G
   KAeMjEJGpqp3oC8NsI6UEIQOVtg+wF+otiQ1eYeCPOvXrO5U2olFlyD7O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10082510"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="10082510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 17:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="15505460"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Mar 2024 17:47:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roYUy-000M5p-1u;
	Mon, 25 Mar 2024 00:47:36 +0000
Date: Mon, 25 Mar 2024 08:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>,
	Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [cel:nfsd-5.15.y 1/391] include/linux/fsnotify.h:235:52: error: too
 few arguments to function call, expected 6, have 5
Message-ID: <202403250847.mkfBiQLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   00f016a743ef8a7ac9a13c48499a67614a0077ed
commit: af7130545d85312d5caf9c37e308db100ac172ac [1/391] fsnotify: pass data_type to fsnotify_name()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240325/202403250847.mkfBiQLx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250847.mkfBiQLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250847.mkfBiQLx-lkp@intel.com/

Note: the cel/nfsd-5.15.y HEAD 00f016a743ef8a7ac9a13c48499a67614a0077ed builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/kernfs/file.c:14:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/kernfs/file.c:16:
>> include/linux/fsnotify.h:235:52: error: too few arguments to function call, expected 6, have 5
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |         ~~~~~~~~~~~~~                                     ^
   include/linux/fsnotify.h:29:19: note: 'fsnotify_name' declared here
      29 | static inline int fsnotify_name(__u32 mask, const void *data, int data_type,
         |                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      30 |                                 struct inode *dir, const struct qstr *name,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                                 u32 cookie)
         |                                 ~~~~~~~~~~
   fs/kernfs/file.c:128:15: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     128 |                 return NULL + !*ppos;
         |                        ~~~~ ^
   2 warnings and 1 error generated.


vim +235 include/linux/fsnotify.h

ece95912db94d9 Jan Kara       2008-02-06  218  
3d7b7272ce9deb Amir Goldstein 2022-01-20  219  /*
3d7b7272ce9deb Amir Goldstein 2022-01-20  220   * fsnotify_delete - @dentry was unlinked and unhashed
3d7b7272ce9deb Amir Goldstein 2022-01-20  221   *
3d7b7272ce9deb Amir Goldstein 2022-01-20  222   * Caller must make sure that dentry->d_name is stable.
3d7b7272ce9deb Amir Goldstein 2022-01-20  223   *
3d7b7272ce9deb Amir Goldstein 2022-01-20  224   * Note: unlike fsnotify_unlink(), we have to pass also the unlinked inode
3d7b7272ce9deb Amir Goldstein 2022-01-20  225   * as this may be called after d_delete() and old_dentry may be negative.
3d7b7272ce9deb Amir Goldstein 2022-01-20  226   */
3d7b7272ce9deb Amir Goldstein 2022-01-20  227  static inline void fsnotify_delete(struct inode *dir, struct inode *inode,
3d7b7272ce9deb Amir Goldstein 2022-01-20  228  				   struct dentry *dentry)
3d7b7272ce9deb Amir Goldstein 2022-01-20  229  {
3d7b7272ce9deb Amir Goldstein 2022-01-20  230  	__u32 mask = FS_DELETE;
3d7b7272ce9deb Amir Goldstein 2022-01-20  231  
3d7b7272ce9deb Amir Goldstein 2022-01-20  232  	if (S_ISDIR(inode->i_mode))
3d7b7272ce9deb Amir Goldstein 2022-01-20  233  		mask |= FS_ISDIR;
3d7b7272ce9deb Amir Goldstein 2022-01-20  234  
3d7b7272ce9deb Amir Goldstein 2022-01-20 @235  	fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
3d7b7272ce9deb Amir Goldstein 2022-01-20  236  }
3d7b7272ce9deb Amir Goldstein 2022-01-20  237  

:::::: The code at line 235 was first introduced by commit
:::::: 3d7b7272ce9deb7157670f584274f37d8b12f81f fsnotify: invalidate dcache before IN_DELETE event

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
