Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF931C2333;
	Fri, 16 Aug 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723837758; cv=none; b=gKjWd0B2jcn6LGGuhAsSt4PwGBH6h16dvuXeYHC4iFAHm7yN0ZbByitrDwvqBI8sMBvHSwKt3cgT0Icq1VePwX+ZkgfFWmQbGlp0/qkKhH622ZGDmT6Gp3syeJdUi1zjEkzVxznMPCZilVUeW6hBh2R7BHne2KEoiqNZTs9p4Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723837758; c=relaxed/simple;
	bh=0cgYsIY7VHBlhZviS3M+xw+k9K3gqD6liBSEnFl9h6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxylFFulBEdgO2d2xEigmzUQQmQANVvZ6BYxhBV9BtDHQ1S/PAITl1a9ETsgis2r9LlIhhu0LsHYGUVP5irzl/CQQwE4ZPqPwl+kf/ZUTkAe8md+ySMBKF4V83qdyJODRH3nN2LiVkgnqjiUSJj5vLhaXuwyoisXDbhkHyXWz48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sa2Tcj1h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sa2Tcj1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723837756; x=1755373756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cgYsIY7VHBlhZviS3M+xw+k9K3gqD6liBSEnFl9h6A=;
  b=Sa2Tcj1hjXunZu0h1k4Tot2hi6zDRFaX5NCza91uKzjOOrlEc52GmBtD
   6PGRpqaJ/yED1kBOcbH0WtU4GNxa+h4oZYtIC8ivTKaMUkoOgr1y1/g06
   lGwvkbx1NHOwzWT1IPT7qFx7oNRgys96zuXTJC+/nVLMaXiOOKpo8JMpd
   8JnZoP6OrUSYYHB2BN/AFQGk2LamRR6oWBZHFQBb8GlhYkiMK3xkdBiJV
   RRtUJIX+6/Z3FmTAuCUHOFFGbZpk/GzWYRjsFJVXOVmYO908cnzVpDnpj
   A6mbb9ZbFkZEeI9RA0CP0NbBGBKw21vJIwZUgDHHaqtzOCeUckZ92nJb9
   A==;
X-CSE-ConnectionGUID: KbRVTNVKQJG13V6VqLDhrw==
X-CSE-MsgGUID: DMsInQckScSHvWywuXsvBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32814974"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32814974"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 12:49:15 -0700
X-CSE-ConnectionGUID: 1Q9IT2oDRWGdo8pJlXR6tw==
X-CSE-MsgGUID: IVw04nXjQdWt+UG0m0hpKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59728947"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2024 12:49:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf2wg-0006sE-3B;
	Fri, 16 Aug 2024 19:49:10 +0000
Date: Sat, 17 Aug 2024 03:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.dio 36/36] fs/netfs/locking.c:22:12: error: static
 declaration of 'inode_dio_wait_interruptible' follows non-static declaration
Message-ID: <202408170349.2r0BubsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.dio
head:   547ff50a106c7fda7594b19819588fbf9356e85c
commit: 547ff50a106c7fda7594b19819588fbf9356e85c [36/36] inode: remove __I_DIO_WAKEUP
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240817/202408170349.2r0BubsG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170349.2r0BubsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170349.2r0BubsG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/netfs/locking.c:9:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/locking.c:22:12: error: static declaration of 'inode_dio_wait_interruptible' follows non-static declaration
      22 | static int inode_dio_wait_interruptible(struct inode *inode)
         |            ^
   include/linux/fs.h:3229:6: note: previous declaration is here
    3229 | void inode_dio_wait_interruptible(struct inode *inode);
         |      ^
>> fs/netfs/locking.c:24:6: error: call to undeclared function 'inode_dio_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      24 |         if (inode_dio_finished(inode))
         |             ^
   fs/netfs/locking.c:24:6: note: did you mean 'inode_dio_end'?
   include/linux/fs.h:3251:20: note: 'inode_dio_end' declared here
    3251 | static inline void inode_dio_end(struct inode *inode)
         |                    ^
>> fs/netfs/locking.c:37:9: error: returning 'void' from a function with incompatible result type 'int'
      37 |         return inode_dio_wait_interruptible(&ictx->inode);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 3 errors generated.


vim +/inode_dio_wait_interruptible +22 fs/netfs/locking.c

46ed60dcd4f2c94 David Howells     2023-10-11  11  
46ed60dcd4f2c94 David Howells     2023-10-11  12  /*
46ed60dcd4f2c94 David Howells     2023-10-11  13   * inode_dio_wait_interruptible - wait for outstanding DIO requests to finish
46ed60dcd4f2c94 David Howells     2023-10-11  14   * @inode: inode to wait for
46ed60dcd4f2c94 David Howells     2023-10-11  15   *
46ed60dcd4f2c94 David Howells     2023-10-11  16   * Waits for all pending direct I/O requests to finish so that we can
46ed60dcd4f2c94 David Howells     2023-10-11  17   * proceed with a truncate or equivalent operation.
46ed60dcd4f2c94 David Howells     2023-10-11  18   *
46ed60dcd4f2c94 David Howells     2023-10-11  19   * Must be called under a lock that serializes taking new references
46ed60dcd4f2c94 David Howells     2023-10-11  20   * to i_dio_count, usually by inode->i_mutex.
46ed60dcd4f2c94 David Howells     2023-10-11  21   */
46ed60dcd4f2c94 David Howells     2023-10-11 @22  static int inode_dio_wait_interruptible(struct inode *inode)
46ed60dcd4f2c94 David Howells     2023-10-11  23  {
547ff50a106c7fd Christian Brauner 2024-08-16 @24  	if (inode_dio_finished(inode))
46ed60dcd4f2c94 David Howells     2023-10-11  25  		return 0;
46ed60dcd4f2c94 David Howells     2023-10-11  26  
547ff50a106c7fd Christian Brauner 2024-08-16  27  	inode_dio_wait_interruptible(inode);
547ff50a106c7fd Christian Brauner 2024-08-16  28  	return !inode_dio_finished(inode) ? -ERESTARTSYS : 0;
46ed60dcd4f2c94 David Howells     2023-10-11  29  }
46ed60dcd4f2c94 David Howells     2023-10-11  30  
46ed60dcd4f2c94 David Howells     2023-10-11  31  /* Call with exclusively locked inode->i_rwsem */
46ed60dcd4f2c94 David Howells     2023-10-11  32  static int netfs_block_o_direct(struct netfs_inode *ictx)
46ed60dcd4f2c94 David Howells     2023-10-11  33  {
46ed60dcd4f2c94 David Howells     2023-10-11  34  	if (!test_bit(NETFS_ICTX_ODIRECT, &ictx->flags))
46ed60dcd4f2c94 David Howells     2023-10-11  35  		return 0;
46ed60dcd4f2c94 David Howells     2023-10-11  36  	clear_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
46ed60dcd4f2c94 David Howells     2023-10-11 @37  	return inode_dio_wait_interruptible(&ictx->inode);
46ed60dcd4f2c94 David Howells     2023-10-11  38  }
46ed60dcd4f2c94 David Howells     2023-10-11  39  

:::::: The code at line 22 was first introduced by commit
:::::: 46ed60dcd4f2c94d27735743ce55cd8d6b93cc1d netfs: Implement unbuffered/DIO vs buffered I/O locking

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
