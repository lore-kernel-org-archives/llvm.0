Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857240C15;
	Fri, 12 Apr 2024 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919467; cv=none; b=DzwVHgO9wj9F+Re2jMpFzBhWnCGKSOJlPwEnXGqUoKNXo8lFkE0BZSFz0JuLGVhGg2GNAsyEds57a1xhM+UWXxyyBA+BdD/L5hUo2iZepJqcIN1nwsNXbfZbj89AWmwqQqXYfjr8+GJeUdqHuRbTFGKbgpxl/EyHwr4omdAzjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919467; c=relaxed/simple;
	bh=bPfeGcjtCbcW1VJfpN45wWyCoPyZuzazmle3F6R9d5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iiqBDDhNw4fihSjIGuVaT28CrPHqAPMH1eUcxaqqZjAh9Qlx5/wRxd1pEyrIT/+uPt77ARTb87YxCdxEGpwFMbvILvFdZvsEMytnDPC5kPBk+3Hs7bSvTdF/7o01RRknZfh7YDYlyQoZZqRkeWtfd31KHT1DNBy17nC4/w6ceQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3L4E6Th; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3L4E6Th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712919466; x=1744455466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPfeGcjtCbcW1VJfpN45wWyCoPyZuzazmle3F6R9d5s=;
  b=U3L4E6ThjHMXU1NM3AhxOBghKAYSEr3bVllR2C15zqrboudl0vWsT3Yj
   H5IHvB0r1JrN/WJ74QUkWuMJlZw0eHe2Uxf/Vr0nt03D8It3gF+qhoHUw
   h/5qFYUcts79PUMNRnpxwNVLJZqLD5I7/MHwTcAh+ZqdO/Sa+CRivnaV8
   Kv6SIauDxNXTk+dCx2pR/nsjf2ATPjqESvmhDJmAE5HomthhAb6eyVCEQ
   RK+xJhHhKREfAc94jHV5fDQ+xW0KI5uaZNrTf6RmtkSzpJMaJCttDDEYd
   SuOJuRYG+uilLVeU5QF1f6u9aKEFEv3YxWnsHc4T2+kd/esH2GyQJ71aM
   Q==;
X-CSE-ConnectionGUID: TmWckTnAQTW3JB0M/SfM9A==
X-CSE-MsgGUID: hMryjbT3ScyW5UZu7Atq7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8539035"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8539035"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:57:43 -0700
X-CSE-ConnectionGUID: 3ESTvGl4SxKG9TJtn1o+mw==
X-CSE-MsgGUID: 5MnVUBu+R06uM6dvQhBjGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="52358596"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2024 03:57:42 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEbE-0009hB-0C;
	Fri, 12 Apr 2024 10:57:40 +0000
Date: Fri, 12 Apr 2024 18:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 130/438]
 drivers/firmware/tegra/bpmp-debugfs.c:380:24: error: too few arguments to
 function call, expected 2, have 1
Message-ID: <202404121817.Q5tkcCNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: a0649f5174bca9a940d82fb67ef1ff078ff52843 [130/438] firmware: tegra: convert to read/write iterators
config: arm64-randconfig-003-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121817.Q5tkcCNh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121817.Q5tkcCNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121817.Q5tkcCNh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/tegra/bpmp-debugfs.c:6:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/tegra/bpmp-debugfs.c:380:24: error: too few arguments to function call, expected 2, have 1
     380 |         databuf = iterdup(from);
         |                   ~~~~~~~     ^
   include/linux/string.h:23:7: note: 'iterdup' declared here
      23 | void *iterdup(struct iov_iter *, size_t);
         |       ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/tegra/bpmp-debugfs.c:666:31: error: use of undeclared identifier 'buf'
     666 |         if (copy_from_user(datavirt, buf, count)) {
         |                                      ^
   1 warning and 2 errors generated.


vim +380 drivers/firmware/tegra/bpmp-debugfs.c

   365	
   366	static ssize_t bpmp_debug_store(struct kiocb *iocb, struct iov_iter *from)
   367	{
   368		struct inode *inode = file_inode(iocb->ki_filp);
   369		struct tegra_bpmp *bpmp = inode->i_private;
   370		size_t count = iov_iter_count(from);
   371		char *databuf = NULL;
   372		char fnamebuf[256];
   373		const char *filename;
   374		ssize_t err;
   375	
   376		filename = get_filename(bpmp, iocb->ki_filp, fnamebuf, sizeof(fnamebuf));
   377		if (!filename)
   378			return -ENOENT;
   379	
 > 380		databuf = iterdup(from);
   381		if (IS_ERR(databuf))
   382			return PTR_ERR(databuf);
   383	
   384		err = mrq_debug_write(bpmp, filename, databuf, count);
   385		kfree(databuf);
   386	
   387		return err ?: count;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
