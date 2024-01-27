Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A12E62E;
	Sat, 27 Jan 2024 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706386443; cv=none; b=MbBa+ioBWj8JpTQzTj6bMBjiKmFGf7Gt8O827Jc20lVgvocQFJr3CfaG9sIQtKdfBDLCBsQrMmxT/1Vsh/uQD+qyt2YDFL8gxhC6zLG2Pvb1V/sshngXjFVtvYrXd/tsfPdOh5LNSy8mfb4kkJmPB01Q8S4U9PkG2xRJ6TIB+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706386443; c=relaxed/simple;
	bh=fiFLc1EElfSaAtTJgTayQ3vzNHq5YRGbmWAbNYwTowg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X41DaDkmS+elEYq3H952d43Mb4sosJqwfaQqvneD4X4XZPWswhqS+pwItgkEd4ORbiAk5HK81IM1aQ6Q+Aj823hJ9ZY/pIN25KCDUREGXU8yMoUOEx14WgfB6+7owbK5tXCzn4ateU3FXAnnpungEgARWaD2Clz9kmHkbOMlAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzgYE+Rm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzgYE+Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706386441; x=1737922441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiFLc1EElfSaAtTJgTayQ3vzNHq5YRGbmWAbNYwTowg=;
  b=DzgYE+RmfriWORs5Og6sVMu7U9lcoLn3kp9MQmClHNMVv1sNqvKveGvj
   M4JKt2nIjCDJMrTUrtkZwHZfK9iyyTFKkt0Dwkm2QsRH8RaZPFP7QUFdq
   LA37Bg5MR3c3okATYBbX+f7AkIBeQUNRgX0pUwnqCy+Ao0sjxu3BFMqWH
   v4nHKmt+TSYz/nnM6dMtJ+IB4h2c//ZXXTF4SWnYOzylw5Dx6/F3Up0Hr
   ZHhVUrYQCs2ccgv09hZs4UXlmucQqROh0y28M9W0pSlkFh7RgldGzO7Q4
   QSNxB9L9XPrIevcTPox9AFm/gL6CN7yGUrCjBmH3EcNWIad5fO09zaLkm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16236058"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16236058"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 12:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1118558780"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1118558780"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2024 12:13:59 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTp3s-0002gq-35;
	Sat, 27 Jan 2024 20:13:56 +0000
Date: Sun, 28 Jan 2024 04:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 24/90] block/fops.c:507:46: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202401280414.wu2Y9tAX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered.46
head:   9b93fddebc916105169c8a82d8f3f20fb30ff277
commit: 8f39bf920bebe813810c1d0d392e77dabb415006 [24/90] iomap: Make writeback_control a part of iomap_writepage_ctx
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240128/202401280414.wu2Y9tAX-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280414.wu2Y9tAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280414.wu2Y9tAX-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/fops.c:476:50: error: too few arguments to function call, expected 3, have 2
     476 |         return iomap_read_folio(folio, &blkdev_iomap_ops);
         |                ~~~~~~~~~~~~~~~~                         ^
   include/linux/iomap.h:280:5: note: 'iomap_read_folio' declared here
     280 | int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     281 |                 const struct iomap_read_folio_ops *);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/fops.c:481:40: error: too few arguments to function call, expected 3, have 2
     481 |         iomap_readahead(rac, &blkdev_iomap_ops);
         |         ~~~~~~~~~~~~~~~                       ^
   include/linux/iomap.h:282:6: note: 'iomap_readahead' declared here
     282 | void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops,
         |      ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     283 |                 const struct iomap_read_folio_ops *);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/fops.c:507:46: error: too many arguments to function call, expected 3, have 4
     507 |         return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
         |                ~~~~~~~~~~~~~~~~                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/iomap.h:357:5: note: 'iomap_writepages' declared here
     357 | int iomap_writepages(struct address_space *mapping,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                 struct iomap_writepage_ctx *wpc,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     359 |                 const struct iomap_writeback_ops *ops);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +507 block/fops.c

925c86a19bacf8 Christoph Hellwig 2023-08-01  501  
925c86a19bacf8 Christoph Hellwig 2023-08-01  502  static int blkdev_writepages(struct address_space *mapping,
925c86a19bacf8 Christoph Hellwig 2023-08-01  503  		struct writeback_control *wbc)
925c86a19bacf8 Christoph Hellwig 2023-08-01  504  {
925c86a19bacf8 Christoph Hellwig 2023-08-01  505  	struct iomap_writepage_ctx wpc = { };
925c86a19bacf8 Christoph Hellwig 2023-08-01  506  
925c86a19bacf8 Christoph Hellwig 2023-08-01 @507  	return iomap_writepages(mapping, wbc, &wpc, &blkdev_writeback_ops);
925c86a19bacf8 Christoph Hellwig 2023-08-01  508  }
925c86a19bacf8 Christoph Hellwig 2023-08-01  509  

:::::: The code at line 507 was first introduced by commit
:::::: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 fs: add CONFIG_BUFFER_HEAD

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
