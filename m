Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA14D599;
	Wed, 12 Mar 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741823186; cv=none; b=GP5UuZx7NTqau5/q+ol+SS7S71bXAD6JK4p7YFmMO0rl4DAmjcQKHQHAZ+HIdIPNF3IptVDqtklw9YxgMnkn5isToH0eLhkt/A61v+RT1o99Hm59N0Wx/IWIIFD5UixTM8AnlGJiAj/m96QURZVxhzW1r1A9sfQb5NiwTxGZurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741823186; c=relaxed/simple;
	bh=cETY8plEkyOCckrlu+Z2ttfvHx2WRA/zocfD221JkDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUg1b2ILtPm4fVQI4HRUyd/B/ceF5PQWK6snDYCcx0gxaDRZpo3UYnNgZy4uXwL2kQR9fYBcvTKBLQyprzlIVab9vHVhQMd89an5nGp0UV7vdnkr8CckVPUdVabG8B2teRDVBcEkeM+UNuwqqrOJH93R9xTcgliKeJKM9R9u4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIBlIFRz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIBlIFRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741823184; x=1773359184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cETY8plEkyOCckrlu+Z2ttfvHx2WRA/zocfD221JkDo=;
  b=IIBlIFRza3Th12FUhkpbrjZxkqaFBLQ82lbrSiwRfJlnxb8Rb8AZGZa1
   z4TWd8mg8H9X1X6cqRBxfb2EQJ2bH5yR+uFH7ZXaUUZAtekx7iM8AhOui
   A1yCD/ehexlFS6sYPNSj6r4re9H1/EbUbW7BFdrBQwykz3WPcfgdZYEjv
   gfTu54SPGF1fx7Shs6751ycnGbX5GDLd25khK6ppFJZdEMbdJHttRRUlS
   bDK2fiZIPbBO+J809ORTzwAYui0CIpwRrc2pqfpPfEE1NWE4YYwLxCI1r
   KH7OxAfPHDd205WJ3MVHwoJjURu/ETedaXOMJJxzOebiqIhjsiWsu7BOy
   g==;
X-CSE-ConnectionGUID: MJqlvdXFR+SkyXicuDybdA==
X-CSE-MsgGUID: 9zC4UnSJSkm/G6Iy7neQDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43107187"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43107187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:46:23 -0700
X-CSE-ConnectionGUID: ghRiYHSyRTOZdNgdLgXFjg==
X-CSE-MsgGUID: X92QffH8QEm6vcC9p8XnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="151611773"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2025 16:46:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVmG-0008zE-0C;
	Wed, 12 Mar 2025 23:46:20 +0000
Date: Thu, 13 Mar 2025 07:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 41/45] fs/netfs/direct_read.c:403:47:
 warning: variable 'rreq' is uninitialized when used here
Message-ID: <202503130754.ZlXzcA9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   0ce16824859c4d7209abe27da17e23679b6c7c69
commit: ad803558dd62a6ec29196f0a62d96a13e57e5135 [41/45] ceph: Use netfslib
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130754.ZlXzcA9k-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130754.ZlXzcA9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130754.ZlXzcA9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_read.c:403:47: warning: variable 'rreq' is uninitialized when used here [-Wuninitialized]
     403 |         if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags) &&
         |                                                      ^~~~
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   fs/netfs/direct_read.c:395:31: note: initialize the variable 'rreq' to silence this warning
     395 |         struct netfs_io_request *rreq;
         |                                      ^
         |                                       = NULL
   1 warning generated.


vim +/rreq +403 fs/netfs/direct_read.c

   376	
   377	/**
   378	 * netfs_unbuffered_read_from_inode - Perform an unbuffered sync I/O read
   379	 * @inode: The inode being accessed
   380	 * @pos: The file position to read from
   381	 * @iter: The output buffer (also specifies read length)
   382	 * @nohole: True to return short/ENODATA if hole encountered
   383	 *
   384	 * Perform a synchronous unbuffered I/O from the inode to the output buffer.
   385	 * No use is made of the pagecache.  The output buffer must be suitably aligned
   386	 * if content encryption is to be used.  If @nohole is true then the read will
   387	 * stop short if a hole is encountered and return -ENODATA if the read begins
   388	 * with a hole.
   389	 *
   390	 * The caller must hold any appropriate locks.
   391	 */
   392	ssize_t netfs_unbuffered_read_from_inode(struct inode *inode, loff_t pos,
   393						 struct iov_iter *iter, bool nohole)
   394	{
   395		struct netfs_io_request *rreq;
   396		ssize_t ret;
   397		size_t orig_count = iov_iter_count(iter);
   398	
   399		_enter("");
   400	
   401		if (WARN_ON(user_backed_iter(iter)))
   402			return -EIO;
 > 403		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags) &&

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
