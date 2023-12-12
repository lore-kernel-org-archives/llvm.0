Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195036359A;
	Tue, 12 Dec 2023 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boqi7+0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702410894; x=1733946894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrNtDaHDEHt75jee9nBiRP4qnezfbYvMWhStDWh4qs4=;
  b=boqi7+0nukRiSauWh2UcB5kq1wBXUipevSttRETC5J/Ci7mQ4Q7OXCQD
   t6tcI3IFRlh4CfqnRNM7APZCUhHHwJga9Jzsg7f2efHlCW8p0rZ7h85db
   LO/C8gvv5Pczc5EySicPgP27YPSCrn+fsDpwcbc8W8wOOJtQ1ZFODzfFi
   44hqNz4GhBVU+ZruAzDALBHqa0GtUueGCA5wIgkiqwChvvjMqRojdsUUo
   h1EFGgC4XlPDQzdVZliu/LCLB+X5HGOOCUWwAw0tmFF6A96o2MjJzBx62
   3YQ4uWD8YDnV+LRSQCbGsLGAzHV45Nk8kIdIw8l9K2FWeK2/rUrZ/qbID
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398704154"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="398704154"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 11:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802601536"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="802601536"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Dec 2023 11:54:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD8q8-000JeU-3D;
	Tue, 12 Dec 2023 19:54:48 +0000
Date: Wed, 13 Dec 2023 03:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-ioprio 1/1] include/linux/blk-mq.h:1161:25: error:
 no member named 'bi_disk' in 'struct bio'
Message-ID: <202312130353.K81VpYuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-ioprio
head:   1541e2e932ed4580c4c40941c837512846386cf9
commit: 1541e2e932ed4580c4c40941c837512846386cf9 [1/1] block/blk-ioprio: Skip zoned writes that are not append operations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231213/202312130353.K81VpYuM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130353.K81VpYuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130353.K81VpYuM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/scsi.c:61:
   In file included from include/scsi/scsi_cmnd.h:7:
   In file included from include/linux/t10-pi.h:6:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   2 errors generated.
--
   In file included from drivers/scsi/ips.c:184:
   In file included from include/scsi/scsi_cmnd.h:7:
   In file included from include/linux/t10-pi.h:6:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/ips.c:6905:38: warning: shift count >= width of type [-Wshift-count-overflow]
               !dma_set_mask(&ha->pcidev->dev, DMA_BIT_MASK(64))) {
                                               ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/qla1280.c:355:
   In file included from include/scsi/scsi_cmnd.h:7:
   In file included from include/linux/t10-pi.h:6:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/qla1280.c:1712:15: warning: variable 'num' set but not used [-Wunused-but-set-variable]
           int err = 0, num, i;
                        ^
   drivers/scsi/qla1280.c:4181:48: warning: shift count >= width of type [-Wshift-count-overflow]
           if (dma_set_mask_and_coherent(&ha->pdev->dev, DMA_BIT_MASK(64))) {
                                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/scsi/hpsa.c:33:
   In file included from include/linux/blktrace_api.h:5:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/hpsa.c:8739:32: warning: shift count >= width of type [-Wshift-count-overflow]
           rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/megaraid.c:49:
   In file included from include/scsi/scsi_cmnd.h:7:
   In file included from include/linux/t10-pi.h:6:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/megaraid.c:4409:28: warning: shift count >= width of type [-Wshift-count-overflow]
                   dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
                                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/myrs.c:22:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/myrs.c:492:31: warning: shift count >= width of type [-Wshift-count-overflow]
           if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/3w-9xxx.c:97:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/3w-9xxx.c:2014:49: warning: shift count >= width of type [-Wshift-count-overflow]
           retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/scsi/3w-9xxx.c:2223:49: warning: shift count >= width of type [-Wshift-count-overflow]
           retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/scsi/3w-sas.c:69:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/3w-sas.c:1568:49: warning: shift count >= width of type [-Wshift-count-overflow]
           retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/scsi/3w-sas.c:1785:49: warning: shift count >= width of type [-Wshift-count-overflow]
           retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/scsi/ipr.c:68:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/ipr.c:9487:46: warning: shift count >= width of type [-Wshift-count-overflow]
                   rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/stex.c:29:
   In file included from include/scsi/scsi_device.h:8:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/stex.c:1698:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/mvumi.c:22:
   In file included from include/scsi/scsi_cmnd.h:7:
   In file included from include/linux/t10-pi.h:6:
>> include/linux/blk-mq.h:1161:25: error: no member named 'bi_disk' in 'struct bio'
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                    ~~~  ^
>> include/linux/blk-mq.h:1161:37: error: member reference type 'struct bio *' is a pointer; did you mean to use '->'?
                   disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
                                                  ~~~^
                                                     ->
   drivers/scsi/mvumi.c:658:32: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
                                                ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
..


vim +1161 include/linux/blk-mq.h

  1151	
  1152	/**
  1153	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
  1154	 * @bio: Bio to examine.
  1155	 *
  1156	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
  1157	 */
  1158	static inline bool blk_bio_is_seq_zoned_write(struct bio *bio)
  1159	{
  1160		return op_needs_zoned_write_locking(bio_op(bio)) &&
> 1161			disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
  1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
