Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780F306754;
	Tue, 28 Jul 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252372; cv=none; b=czhvb3nqtMGo0EW5nLXPF7WYYBupBGru6QwQNW3BcVfs+Xyacivt9ARTI7ZfedO3vCdom2Ce6FgPtx/UOGM92kGv4T9zTEBtxzjy2oPzKVw2t74uRQnxnmITVx45HdxW21+Se60NfPfDblTKeL64XU5vUf+qiCuG4qe+50oSU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252372; c=relaxed/simple;
	bh=Z0LZswwBlXT9iVICwNN07E7ZqErA1MOr73/VAOUdbrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=It3uNL253gK4Nl8zH1oXCULb6aaxXg7uXUR2dGg342hScmMd5i4lRhnBALybQf2QoavUJFdLA1DhMhHpISYvaTEi+Adz8xBBeVfJKPOSp3YTaBRpEgsdvjwQlrPrzhh/+npfqjacdQlau8Owwtw5TpygVH2d3VAGhV1ZDHheNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAEYEyMz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAEYEyMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785252370; x=1816788370;
  h=date:from:to:cc:subject:message-id;
  bh=Z0LZswwBlXT9iVICwNN07E7ZqErA1MOr73/VAOUdbrU=;
  b=UAEYEyMz2DGQKS3Dwnumuhb3dB4bEHYnVidlqDskXaNUR+zG50KfvJAt
   sKMxv/xTshrpvhTW1WD94hs0fQgw5nUhAuZ8819Gdg5BhMGpoC3hiWQeP
   qBtGpsxhy2KYqEZFndMA341O7/7peshoCeM/ajIBsRxAasnjPHQGRhS2i
   ennJaK9bZGf7Jb9l+vqBjYiW/yDo8E/w5iP9lMEE8dR89l+PHRmHB8fzf
   Gl1frv+zol9lfbn1kLpMS9XdezgCOrOpmtpfleJHmeEVhC9WbWcdYBQNr
   vuJ3GagOeu2iNq2CkZtEpOSDEA4W2UQeA4xyEi3tHsG7t5pvS6CS6cnIY
   Q==;
X-CSE-ConnectionGUID: Rg79zB5lSKmy2oBCWhLTtw==
X-CSE-MsgGUID: xjpIhTJtS8i9jCVGa4kjRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89660764"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89660764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:26:07 -0700
X-CSE-ConnectionGUID: ftXQV2zSRgqih8AqH+5X+w==
X-CSE-MsgGUID: EH9OG5EqQu2mIujYlR9ESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264032165"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 08:26:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wojgy-00000000eTf-0ms0;
	Tue, 28 Jul 2026 15:26:04 +0000
Date: Tue, 28 Jul 2026 23:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 8/9]
 drivers/nvme/host/ioctl.c:668:8: error: call to undeclared function
 'blk_uring_cmd_alloc_iobuf'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607282300.TiDP3wkt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 7b61092440add7fbe6d72ae7ede11080113e193e [8/9] nvme: allocate pool-backed fixed buffers through namespace char devices
config: hexagon-randconfig-001-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282300.TiDP3wkt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282300.TiDP3wkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282300.TiDP3wkt-lkp@intel.com/

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
