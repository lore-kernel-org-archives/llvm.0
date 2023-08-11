Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E961172F;
	Fri, 11 Aug 2023 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691774213; x=1723310213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5BBxQbhgYW43hCw+ByPcuzFN1UnPvUH5Tx4ynzXR2sg=;
  b=nE33rrF2Uw4QvHbdP8ScNWp8SD2gou0oyUWvjQo3GvRwHR2LuacHqSob
   kKiQ0/fT24F3foMoVx5zGWEhozqVlcZzU9FXpqLlGmhILsuRPgY76cFlO
   znXi0Kvd9fBl1xyzS8e0UTBHYLPpw0ypQZKdUBP/PF+y0SZ6XOHSEZ1kY
   IUTjX6xTVQe4n3IXEALRtLaPcMdcIRNQ/OO4C6cTImLa4lsPZcMjDTTMS
   +eR9G/k1PO/mC2UzWjgqt5xgRSM7hF0GE1tBaEo5GLUx2jxxiqvZ+yxbs
   ZzirgcEf3AfHUgbtDy5+Zs0V5KqImJV8eG/h3ewaZ4wQale4Pj1KI8Vcq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402696531"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="402696531"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 10:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979291531"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="979291531"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 10:16:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUVkj-0007uS-3C;
	Fri, 11 Aug 2023 17:16:45 +0000
Date: Sat, 12 Aug 2023 01:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nitesh Shetty <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	martin.petersen@oracle.com, mcgrof@kernel.org, dlemoal@kernel.org,
	gost.dev@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Vincent Fu <vincent.fu@samsung.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v14 11/11] null_blk: add support for copy offload
Message-ID: <202308120029.elW3y1RM-lkp@intel.com>
References: <20230811105300.15889-12-nj.shetty@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811105300.15889-12-nj.shetty@samsung.com>

Hi Nitesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-Introduce-queue-limits-and-sysfs-for-copy-offload-support/20230811-192259
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230811105300.15889-12-nj.shetty%40samsung.com
patch subject: [PATCH v14 11/11] null_blk: add support for copy offload
config: hexagon-randconfig-r032-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120029.elW3y1RM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120029.elW3y1RM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120029.elW3y1RM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/null_blk/main.c:12:
   In file included from drivers/block/null_blk/null_blk.h:8:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/block/null_blk/main.c:12:
   In file included from drivers/block/null_blk/null_blk.h:8:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/block/null_blk/main.c:12:
   In file included from drivers/block/null_blk/null_blk.h:8:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/block/null_blk/main.c:1303:2: warning: variable 'sector_in' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1303 |         __rq_for_each_bio(bio, req) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blk-mq.h:1008:6: note: expanded from macro '__rq_for_each_bio'
    1008 |         if ((rq->bio))                  \
         |             ^~~~~~~~~
   drivers/block/null_blk/main.c:1316:8: note: uninitialized use occurs here
    1316 |                             sector_in << SECTOR_SHIFT, rem);
         |                             ^~~~~~~~~
   drivers/block/null_blk/main.c:1303:2: note: remove the 'if' if its condition is always true
    1303 |         __rq_for_each_bio(bio, req) {
         |         ^
   include/linux/blk-mq.h:1008:2: note: expanded from macro '__rq_for_each_bio'
    1008 |         if ((rq->bio))                  \
         |         ^
   drivers/block/null_blk/main.c:1287:20: note: initialize the variable 'sector_in' to silence this warning
    1287 |         sector_t sector_in, sector_out;
         |                           ^
         |                            = 0
>> drivers/block/null_blk/main.c:1303:2: warning: variable 'sector_out' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1303 |         __rq_for_each_bio(bio, req) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blk-mq.h:1008:6: note: expanded from macro '__rq_for_each_bio'
    1008 |         if ((rq->bio))                  \
         |             ^~~~~~~~~
   drivers/block/null_blk/main.c:1315:27: note: uninitialized use occurs here
    1315 |         trace_nullb_copy_op(req, sector_out << SECTOR_SHIFT,
         |                                  ^~~~~~~~~~
   drivers/block/null_blk/main.c:1303:2: note: remove the 'if' if its condition is always true
    1303 |         __rq_for_each_bio(bio, req) {
         |         ^
   include/linux/blk-mq.h:1008:2: note: expanded from macro '__rq_for_each_bio'
    1008 |         if ((rq->bio))                  \
         |         ^
   drivers/block/null_blk/main.c:1287:32: note: initialize the variable 'sector_out' to silence this warning
    1287 |         sector_t sector_in, sector_out;
         |                                       ^
         |                                        = 0
   8 warnings generated.


vim +1303 drivers/block/null_blk/main.c

  1283	
  1284	static inline int nullb_setup_copy(struct nullb *nullb, struct request *req,
  1285					   bool is_fua)
  1286	{
  1287		sector_t sector_in, sector_out;
  1288		loff_t offset_in, offset_out;
  1289		void *in, *out;
  1290		ssize_t chunk, rem = 0;
  1291		struct bio *bio;
  1292		struct nullb_page *t_page_in, *t_page_out;
  1293		u16 seg = 1;
  1294		int status = -EIO;
  1295	
  1296		if (blk_rq_nr_phys_segments(req) != COPY_MAX_SEGMENTS)
  1297			return status;
  1298	
  1299		/*
  1300		 * First bio contains information about source and last bio contains
  1301		 * information about destination.
  1302		 */
> 1303		__rq_for_each_bio(bio, req) {
  1304			if (seg == blk_rq_nr_phys_segments(req)) {
  1305				sector_out = bio->bi_iter.bi_sector;
  1306				if (rem != bio->bi_iter.bi_size)
  1307					return status;
  1308			} else {
  1309				sector_in = bio->bi_iter.bi_sector;
  1310				rem = bio->bi_iter.bi_size;
  1311			}
  1312			seg++;
  1313		}
  1314	
  1315		trace_nullb_copy_op(req, sector_out << SECTOR_SHIFT,
  1316				    sector_in << SECTOR_SHIFT, rem);
  1317	
  1318		spin_lock_irq(&nullb->lock);
  1319		while (rem > 0) {
  1320			chunk = min_t(size_t, nullb->dev->blocksize, rem);
  1321			offset_in = (sector_in & SECTOR_MASK) << SECTOR_SHIFT;
  1322			offset_out = (sector_out & SECTOR_MASK) << SECTOR_SHIFT;
  1323	
  1324			if (null_cache_active(nullb) && !is_fua)
  1325				null_make_cache_space(nullb, PAGE_SIZE);
  1326	
  1327			t_page_in = null_lookup_page(nullb, sector_in, false,
  1328						     !null_cache_active(nullb));
  1329			if (!t_page_in)
  1330				goto err;
  1331			t_page_out = null_insert_page(nullb, sector_out,
  1332						      !null_cache_active(nullb) ||
  1333						      is_fua);
  1334			if (!t_page_out)
  1335				goto err;
  1336	
  1337			in = kmap_local_page(t_page_in->page);
  1338			out = kmap_local_page(t_page_out->page);
  1339	
  1340			memcpy(out + offset_out, in + offset_in, chunk);
  1341			kunmap_local(out);
  1342			kunmap_local(in);
  1343			__set_bit(sector_out & SECTOR_MASK, t_page_out->bitmap);
  1344	
  1345			if (is_fua)
  1346				null_free_sector(nullb, sector_out, true);
  1347	
  1348			rem -= chunk;
  1349			sector_in += chunk >> SECTOR_SHIFT;
  1350			sector_out += chunk >> SECTOR_SHIFT;
  1351		}
  1352	
  1353		status = 0;
  1354	err:
  1355		spin_unlock_irq(&nullb->lock);
  1356		return status;
  1357	}
  1358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
