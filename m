Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35FB1DC05F;
	Fri,  6 Dec 2024 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733467439; cv=none; b=o+vm/Z768JQCkX0TVB2MjrRgAQORjLzbE51KiIUe8a8e7FAdMUsBhG0FeIoAePAn2KDqXke1Da28McmYgMfDUnnSXyuNMMkMU4QSkCKbbRH/J0InvY4Vf2N+xXiSRqECPFOy19GN6OKQkLIwrYj1iCthHG4o/m0HWXzvY/PgEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733467439; c=relaxed/simple;
	bh=0Wzq3s30M7mBhOjex7CeLonBMvfoRmCEsb6hkDU9AdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLOnVXAAPYyfATYUSCUtuilYmMlTZo7md/E/edZlC97n/gpToHBjPkBx0XU2tb+3ln7qd7V95AYUNS3Jwqq1EmLal52Ld5kptGhIHi/Ry6RI+wxIutBeSfHnxGJ5ZN8rETs+SAJGurkSsZ8nP+IJXtdvvceNnJHJMGY3lassTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eImL3Thw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eImL3Thw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733467438; x=1765003438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Wzq3s30M7mBhOjex7CeLonBMvfoRmCEsb6hkDU9AdI=;
  b=eImL3ThwkVwYV66uKhiT9+znq5kNg9o425ho22SbVY6tOipBT49oYXe6
   DfNyF+W4xBm4kIi0CbA3acmcSl1sVQkn1AjB3mpogVKrQYWonGbPumOBG
   /+GDr2XQTmOYG2XcJeIkSK1TAFlGC5MrYdT/a3XXbAFn8fRWwh9acD9dp
   oRL3JWeG/1lX3U371xK9kTZUW9kGU1bG/G/zKr3VuOH42OVXIC8HKHqAQ
   2hwVo54K3pcCHaXrrR9qCphdOh2sPu2QsZVcGvhCTo2lf5sklXT3RPflU
   1rIYne36ZKhaP9/qRBTgzLf3IynsPpdjAdc8v4iXlYeFWyeXPbf40egZc
   Q==;
X-CSE-ConnectionGUID: mVmGY7ObTDGQdEibQpnjKw==
X-CSE-MsgGUID: PSIOMlpVT9W+npi9w0eH+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="56302933"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="56302933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 22:43:57 -0800
X-CSE-ConnectionGUID: nupjY1A4Q7WaBpe4TvJISw==
X-CSE-MsgGUID: xA+cNkmGSb6iLrQ5EVO5mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94199756"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2024 22:43:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJS49-0000lt-11;
	Fri, 06 Dec 2024 06:43:53 +0000
Date: Fri, 6 Dec 2024 14:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv11 07/10] block: expose write streams for block device
 nodes
Message-ID: <202412061434.7mqSO81h-lkp@intel.com>
References: <20241206015308.3342386-8-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206015308.3342386-8-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on next-20241205]
[cannot apply to brauner-vfs/vfs.all hch-configfs/for-next linus/master v6.13-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/fs-add-a-write-stream-field-to-the-kiocb/20241206-095707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241206015308.3342386-8-kbusch%40meta.com
patch subject: [PATCHv11 07/10] block: expose write streams for block device nodes
config: mips-loongson1b_defconfig (https://download.01.org/0day-ci/archive/20241206/202412061434.7mqSO81h-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061434.7mqSO81h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061434.7mqSO81h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/bdev.c:1299:22: error: use of undeclared identifier 'STATX_WRITE_STREAM'
           if ((request_mask & STATX_WRITE_STREAM) &&
                               ^
>> block/bdev.c:1301:9: error: no member named 'write_stream_max' in 'struct kstat'
                   stat->write_stream_max = bdev_max_write_streams(bdev);
                   ~~~~  ^
   block/bdev.c:1302:24: error: use of undeclared identifier 'STATX_WRITE_STREAM'
                   stat->result_mask |= STATX_WRITE_STREAM;
                                        ^
   3 errors generated.


vim +/STATX_WRITE_STREAM +1299 block/bdev.c

  1268	
  1269	/*
  1270	 * Handle STATX_{DIOALIGN, WRITE_ATOMIC} for block devices.
  1271	 */
  1272	void bdev_statx(struct path *path, struct kstat *stat,
  1273			u32 request_mask)
  1274	{
  1275		struct inode *backing_inode;
  1276		struct block_device *bdev;
  1277	
  1278		if (!(request_mask & (STATX_DIOALIGN | STATX_WRITE_ATOMIC)))
  1279			return;
  1280	
  1281		backing_inode = d_backing_inode(path->dentry);
  1282	
  1283		/*
  1284		 * Note that backing_inode is the inode of a block device node file,
  1285		 * not the block device's internal inode.  Therefore it is *not* valid
  1286		 * to use I_BDEV() here; the block device has to be looked up by i_rdev
  1287		 * instead.
  1288		 */
  1289		bdev = blkdev_get_no_open(backing_inode->i_rdev);
  1290		if (!bdev)
  1291			return;
  1292	
  1293		if (request_mask & STATX_DIOALIGN) {
  1294			stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
  1295			stat->dio_offset_align = bdev_logical_block_size(bdev);
  1296			stat->result_mask |= STATX_DIOALIGN;
  1297		}
  1298	
> 1299		if ((request_mask & STATX_WRITE_STREAM) &&
  1300		    bdev_max_write_streams(bdev)) {
> 1301			stat->write_stream_max = bdev_max_write_streams(bdev);
  1302			stat->result_mask |= STATX_WRITE_STREAM;
  1303		}
  1304	
  1305		if (request_mask & STATX_WRITE_ATOMIC && bdev_can_atomic_write(bdev)) {
  1306			struct request_queue *bd_queue = bdev->bd_queue;
  1307	
  1308			generic_fill_statx_atomic_writes(stat,
  1309				queue_atomic_write_unit_min_bytes(bd_queue),
  1310				queue_atomic_write_unit_max_bytes(bd_queue));
  1311		}
  1312	
  1313		blkdev_put_no_open(bdev);
  1314	}
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
