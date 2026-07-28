Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481528688C;
	Tue, 28 Jul 2026 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202831; cv=none; b=eVE4F0U6wNIQUdSX4RSXjbnYehZISfcce4DoOlNRA4zulp+4WxEzveENgMbvm1qEmIbnz1UoaeDP/MZDiH5fnBFlruw3cEIdKMfXgz9yBXnYnAWvVceKoXb09Sc8+AZtnrb0qZnMgC1MfmwAN/O+BD0Uq1i2W+h/DMyuD6mN5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202831; c=relaxed/simple;
	bh=w1AmUfRU49tF6t6VpUt9zBUtrt54Y3HLvFOLNvuMp9Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Am7G0pxkUIDfQJQSdAkry6UYR1dUO22IteSAv/Wr/UXRllqHDtPJE2DhEofv0lf0k9aItU5JWHT7spunC6vMprD7AmktFEAxhxaBHPVcn5bUKNFYOxp/QIoq0SojgmNqtjKBTA2WMuLqY0SMx+Ura/1Mblyg+HoK7tYT4umsqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZvuJ1LX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZvuJ1LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785202829; x=1816738829;
  h=date:from:to:cc:subject:message-id;
  bh=w1AmUfRU49tF6t6VpUt9zBUtrt54Y3HLvFOLNvuMp9Q=;
  b=bZvuJ1LXKBDf+ZB37wNh2v/ekUjxK3+x2YZOSP2RnHJ07o5SCcgJduO3
   YAb2O9dCtafkJwFvs+1Jem1E+C9q4oUmlikImXlRrvwCpRBiT5qKVGWej
   b7UEo9Z1nGrV1h3ykBVDHeh+GKDzLp90FjjagaDp5Czd6w0MoDG7YlcAT
   GqhvwBaeYJUFUgv70PBeECWurvGTLKDBpbNJYgDr1bcQqIyM68ijm9HbV
   Q/3K907TdRhZEsStf5kygDbNBVGU7DmNO3n1H8tOs/2n9Gu3WCdwFpkZu
   ZmC7QuEkVa3QFNM52TGtGX0qfjGY+mXSoY/C7qWYaKv8fEQ5tLPIr2v6A
   Q==;
X-CSE-ConnectionGUID: fvGiywaJSKe5hHupa4Mpqg==
X-CSE-MsgGUID: duiWp0gEQe+EjMVMm4Tp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85819935"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85819935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 18:40:28 -0700
X-CSE-ConnectionGUID: 50xA8RmoSD6nUSYYuT/8Cg==
X-CSE-MsgGUID: Yk3tItDYTlyo1mvhJVJFPQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2026 18:40:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woWnv-000000001ok-18S7;
	Tue, 28 Jul 2026 01:40:23 +0000
Date: Tue, 28 Jul 2026 03:39:28 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 8/9]
 drivers/nvme/host/ioctl.c:668:8: error: call to undeclared function
 'blk_uring_cmd_alloc_iobuf'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607280347.T2hDTAgT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 7b61092440add7fbe6d72ae7ede11080113e193e [8/9] nvme: allocate pool-backed fixed buffers through namespace char devices
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260728/202607280347.T2hDTAgT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280347.T2hDTAgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280347.T2hDTAgT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/ioctl.c:668:8: error: call to undeclared function 'blk_uring_cmd_alloc_iobuf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     668 |         ret = blk_uring_cmd_alloc_iobuf(ioucmd, pool, buf_index, len,
         |               ^
   1 error generated.


vim +/blk_uring_cmd_alloc_iobuf +668 drivers/nvme/host/ioctl.c

   649	
   650	static int nvme_ns_alloc_iobuf(struct nvme_ns *ns, struct io_uring_cmd *ioucmd,
   651				       unsigned int issue_flags)
   652	{
   653		const struct io_uring_sqe *sqe = ioucmd->sqe;
   654		struct blk_iobuf_pool *pool;
   655		u64 buf_index, len;
   656		int ret;
   657	
   658		if (READ_ONCE(sqe->ioprio) || READ_ONCE(sqe->__pad1) ||
   659		    READ_ONCE(sqe->len) || READ_ONCE(sqe->rw_flags) ||
   660		    READ_ONCE(sqe->file_index))
   661			return -EINVAL;
   662		buf_index = READ_ONCE(sqe->addr);
   663		len = READ_ONCE(sqe->addr3);
   664	
   665		pool = blk_queue_get_iobuf_pool(ns->queue);
   666		if (!pool)
   667			return -EOPNOTSUPP;
 > 668		ret = blk_uring_cmd_alloc_iobuf(ioucmd, pool, buf_index, len,
   669					       issue_flags);
   670		blk_iobuf_pool_put(pool);
   671		return ret;
   672	}
   673	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
