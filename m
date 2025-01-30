Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53543E499;
	Thu, 30 Jan 2025 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738220750; cv=none; b=UeVcJpieVtoplgAAJ/SP2pfHMzn4yBuTgahSjz1+ASeT0fVEqmmhGpXPeKGIRnFw8keb7qoUSY1O56fhLDbdqF4mf8i+9bSCa9FyES9HJejL2duLsBtP1UV6I4E8bzexEDOqPiZl16XoX7aZXPuR7zMC5vOBTF8fv6QUo53JY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738220750; c=relaxed/simple;
	bh=RDeW8bj1tYdD08HCGCCy3DoOCZqiu5uTnHDIEa5y5d4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sf+gX6SBlfioQ6fpVuB0HDpKQRmvsTqSuB3Ci1NcWL0407DGUPX+wbRrM55D0eiyRsJlOqjsUIvJkabX6uHPtZRVtuKFvs8E1P2FPoai0i9A35y8yOyeoJuxxmLtRwBi4mCpLfnLISRs8Z0kiNMCAYVg547/1H8qy7em+785zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4HFx5Wk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4HFx5Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738220748; x=1769756748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RDeW8bj1tYdD08HCGCCy3DoOCZqiu5uTnHDIEa5y5d4=;
  b=m4HFx5WkzXJabRJle636yKoCjqNNv93mApsD17wqgVBMJYVJeo5h0eID
   WADCUgTWm17A5QQyNZbtuQqDzjXqL+hgRUxJDNY5qWnL/Jjz7PkfTTHg8
   Z/Q3npwgQ/JtgpBFi2TspjAC9/D+B/vt5ku6I1LUN/I0gbtDOLfPZGnNF
   kIU9DdB+fS5rI/gz7eJEIrKWQ11+tBVQR5MZqpRzAsBCye+gcT3crHPoW
   u86I2fj+vTlAZZ9AXHBFv9OwdsJEMhaNOlE5sKg2D+SqwTcDCmKlIKd8/
   sF5FsWT7Nj44AdLcz/+OQpkbBtYQKUBSvQhnBoxElml1QwaR2Y3ZFxHOJ
   A==;
X-CSE-ConnectionGUID: STfp8sCuRYmaxMJWHQdslQ==
X-CSE-MsgGUID: jpDMzpXiSLSc/arEUwiQUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38644879"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38644879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 23:05:48 -0800
X-CSE-ConnectionGUID: f/tVfKVLRkOc78i1K4xcWQ==
X-CSE-MsgGUID: otEA4r2nQM+B6NdcUoNX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114229325"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2025 23:05:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdOcS-000jnI-0F;
	Thu, 30 Jan 2025 07:05:44 +0000
Date: Thu, 30 Jan 2025 15:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/43] include/linux/poll.h:134:27: warning:
 division by zero is undefined
Message-ID: <202501301508.7Z6gbNaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   99bca1b95b54b7a3e7260c2431b587639482a71d
commit: 99bca1b95b54b7a3e7260c2431b587639482a71d [43/43] ceph: Use netfslib
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/20250130/202501301508.7Z6gbNaF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301508.7Z6gbNaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301508.7Z6gbNaF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/client/smb2pdu.c:27:
   include/trace/events/netfs.h:249:25: error: redefinition of enumerator 'netfs_sreq_trace_need_retry'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^
   include/trace/events/netfs.h:110:5: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |            ^
   include/trace/events/netfs.h:249:25: note: previous definition is here
   include/trace/events/netfs.h:107:5: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |            ^
   In file included from fs/smb/client/smb2pdu.c:28:
   In file included from fs/smb/client/cifsglob.h:28:
   In file included from fs/smb/client/smb2pdu.h:14:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   2 warnings and 1 error generated.


vim +134 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  129  
7a163b2195cda0 Al Viro 2018-02-01  130  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  131  {
7a163b2195cda0 Al Viro 2018-02-01  132  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  133  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @134  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  135  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  136  #undef M
7a163b2195cda0 Al Viro 2018-02-01  137  }
7a163b2195cda0 Al Viro 2018-02-01  138  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  139  
7a163b2195cda0 Al Viro 2018-02-01  140  

:::::: The code at line 134 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
