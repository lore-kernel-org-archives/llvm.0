Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E813EFF3;
	Wed, 23 Oct 2024 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661015; cv=none; b=Fp2IlhkJkuh2oht4K0fXPuPDCHWI+koypbltjiZmnn8vdJ5ZjAjFafH0NMAYcQ+LlRCoU34THMvLvkzJr9t9JM9DAM+DP0IYYvpfbtHardnBXTWWCyRIpMdwAeOVQgXEN0nML7aczZ1njedIFios434q+n0Cit7UpLgLxze0yPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661015; c=relaxed/simple;
	bh=07pVQr24RzgZEjSE9FGwNGUFHhb3lItrp/6o9WXdfac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMgDzlZZ60XGBv8s84Fsvh8cbl94U/HUAWz6HsWaEUbIuZclhJV/ZBc6H1ZhN9JcYCFGXhFD5AJAEsTP+cSBRvO9EXaylxxRE3vwh5K0qQJBFzVmMe3zgGAjvbU3jYTT7eNpG/3KqbdRAAHvptJ6KrOIhifvTV1yYVF1Ive9GvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTQEY3pI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTQEY3pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729661014; x=1761197014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07pVQr24RzgZEjSE9FGwNGUFHhb3lItrp/6o9WXdfac=;
  b=WTQEY3pISMFeTCuRW1T2MjcA8FErJh+yOSCVwXF2W3UwViPczdF4+QgW
   ZLcel4H2idb9npYoEOuF/6I2B2xhhOCFfjvvPL0BrN3ln/SMib6Qb5mDt
   zinMZZS/MEdVu74ksRjk3gNJV0Od6+Sc397kJONEo3M7slR5G0YzjRRp3
   mUUm5+nCgP59jz7rqSjfoMVwSEQANH+JRuOmTmgmN+A/0OP2RluYvKtC1
   v8LlSnbZMiDCJbkswjAH6GkQcq4ucY3cgnYyAeTKHLL7vFvf5W2t5a0OT
   lQlokqDN5OsT07+gnBtQX3V7r0BlER0o2cs1c87ZtGXGmHT7PP3JB4WUw
   A==;
X-CSE-ConnectionGUID: j8Zcbg3bREyvnGGz8J11bA==
X-CSE-MsgGUID: xDxBVJVrSZKXVZmESGeYSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39774825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39774825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:23:28 -0700
X-CSE-ConnectionGUID: uR/ZG5McRWWYeeZr0CDEGg==
X-CSE-MsgGUID: OG4yxbiPRAmbZVrMWn2qVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110882531"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 22:23:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Tq7-000UTc-3A;
	Wed, 23 Oct 2024 05:23:23 +0000
Date: Wed, 23 Oct 2024 13:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page
 related macros and flags.
Message-ID: <202410231353.YRTCHb8J-lkp@intel.com>
References: <20241020132722.20565-4-SkyLake.Huang@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020132722.20565-4-SkyLake.Huang@mediatek.com>

Hi Sky,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/mtd-nand-Create-param-c-to-do-CRC-check-and-bitwise-majority-for-Parameter-CASN-page/20241020-212938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20241020132722.20565-4-SkyLake.Huang%40mediatek.com
patch subject: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page related macros and flags.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241023/202410231353.YRTCHb8J-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231353.YRTCHb8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231353.YRTCHb8J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:411:23: error: use of undeclared identifier 'SPINAND_HAS_READ_PLANE_SELECT_BIT'
     411 |         if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
         |                              ^
>> drivers/mtd/nand/spi/core.c:495:23: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     495 |         if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
         |                              ^
   2 errors generated.
--
>> drivers/mtd/nand/spi/macronix.c:158:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     158 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT |
         |                      ^
>> drivers/mtd/nand/spi/macronix.c:159:8: error: use of undeclared identifier 'SPINAND_HAS_READ_PLANE_SELECT_BIT'
     159 |                      SPINAND_HAS_READ_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:200:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     200 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:219:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     219 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:259:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     259 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT |
         |                      ^
   drivers/mtd/nand/spi/macronix.c:260:8: error: use of undeclared identifier 'SPINAND_HAS_READ_PLANE_SELECT_BIT'
     260 |                      SPINAND_HAS_READ_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:271:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     271 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:303:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     303 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT |
         |                      ^
   drivers/mtd/nand/spi/macronix.c:304:8: error: use of undeclared identifier 'SPINAND_HAS_READ_PLANE_SELECT_BIT'
     304 |                      SPINAND_HAS_READ_PLANE_SELECT_BIT,
         |                      ^
   drivers/mtd/nand/spi/macronix.c:315:8: error: use of undeclared identifier 'SPINAND_HAS_PROG_PLANE_SELECT_BIT'
     315 |                      SPINAND_HAS_PROG_PLANE_SELECT_BIT,
         |                      ^
>> drivers/mtd/nand/spi/macronix.c:441:12: error: invalid application of 'sizeof' to an incomplete type 'const struct spinand_info[]'
     441 |         .nchips = ARRAY_SIZE(macronix_spinand_table),
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   11 errors generated.


vim +/SPINAND_HAS_READ_PLANE_SELECT_BIT +411 drivers/mtd/nand/spi/core.c

7529df4652482c Peter Pan       2018-06-22  376  
7529df4652482c Peter Pan       2018-06-22  377  static int spinand_read_from_cache_op(struct spinand_device *spinand,
7529df4652482c Peter Pan       2018-06-22  378  				      const struct nand_page_io_req *req)
7529df4652482c Peter Pan       2018-06-22  379  {
7529df4652482c Peter Pan       2018-06-22  380  	struct nand_device *nand = spinand_to_nand(spinand);
e708789c4a8798 Miquel Raynal   2021-01-07  381  	struct mtd_info *mtd = spinand_to_mtd(spinand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  382  	struct spi_mem_dirmap_desc *rdesc;
7529df4652482c Peter Pan       2018-06-22  383  	unsigned int nbytes = 0;
7529df4652482c Peter Pan       2018-06-22  384  	void *buf = NULL;
7529df4652482c Peter Pan       2018-06-22  385  	u16 column = 0;
981d1aa0697ce1 Boris Brezillon 2019-01-24  386  	ssize_t ret;
7529df4652482c Peter Pan       2018-06-22  387  
7529df4652482c Peter Pan       2018-06-22  388  	if (req->datalen) {
7529df4652482c Peter Pan       2018-06-22  389  		buf = spinand->databuf;
631cfdd0520d19 Miquel Raynal   2024-08-26  390  		if (!req->continuous)
981d1aa0697ce1 Boris Brezillon 2019-01-24  391  			nbytes = nanddev_page_size(nand);
631cfdd0520d19 Miquel Raynal   2024-08-26  392  		else
631cfdd0520d19 Miquel Raynal   2024-08-26  393  			nbytes = round_up(req->dataoffs + req->datalen,
631cfdd0520d19 Miquel Raynal   2024-08-26  394  					  nanddev_page_size(nand));
981d1aa0697ce1 Boris Brezillon 2019-01-24  395  		column = 0;
7529df4652482c Peter Pan       2018-06-22  396  	}
7529df4652482c Peter Pan       2018-06-22  397  
7529df4652482c Peter Pan       2018-06-22  398  	if (req->ooblen) {
7529df4652482c Peter Pan       2018-06-22  399  		nbytes += nanddev_per_page_oobsize(nand);
7529df4652482c Peter Pan       2018-06-22  400  		if (!buf) {
7529df4652482c Peter Pan       2018-06-22  401  			buf = spinand->oobbuf;
7529df4652482c Peter Pan       2018-06-22  402  			column = nanddev_page_size(nand);
7529df4652482c Peter Pan       2018-06-22  403  		}
7529df4652482c Peter Pan       2018-06-22  404  	}
7529df4652482c Peter Pan       2018-06-22  405  
f9d7c7265bcff7 Miquel Raynal   2022-01-27  406  	if (req->mode == MTD_OPS_RAW)
981d1aa0697ce1 Boris Brezillon 2019-01-24  407  		rdesc = spinand->dirmaps[req->pos.plane].rdesc;
f9d7c7265bcff7 Miquel Raynal   2022-01-27  408  	else
f9d7c7265bcff7 Miquel Raynal   2022-01-27  409  		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
7529df4652482c Peter Pan       2018-06-22  410  
ca229bdbef29be Cheng Ming Lin  2024-09-09 @411  	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
ca229bdbef29be Cheng Ming Lin  2024-09-09  412  		column |= req->pos.plane << fls(nanddev_page_size(nand));
ca229bdbef29be Cheng Ming Lin  2024-09-09  413  
7529df4652482c Peter Pan       2018-06-22  414  	while (nbytes) {
981d1aa0697ce1 Boris Brezillon 2019-01-24  415  		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
981d1aa0697ce1 Boris Brezillon 2019-01-24  416  		if (ret < 0)
7529df4652482c Peter Pan       2018-06-22  417  			return ret;
7529df4652482c Peter Pan       2018-06-22  418  
981d1aa0697ce1 Boris Brezillon 2019-01-24  419  		if (!ret || ret > nbytes)
981d1aa0697ce1 Boris Brezillon 2019-01-24  420  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  421  
981d1aa0697ce1 Boris Brezillon 2019-01-24  422  		nbytes -= ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  423  		column += ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  424  		buf += ret;
631cfdd0520d19 Miquel Raynal   2024-08-26  425  
631cfdd0520d19 Miquel Raynal   2024-08-26  426  		/*
631cfdd0520d19 Miquel Raynal   2024-08-26  427  		 * Dirmap accesses are allowed to toggle the CS.
631cfdd0520d19 Miquel Raynal   2024-08-26  428  		 * Toggling the CS during a continuous read is forbidden.
631cfdd0520d19 Miquel Raynal   2024-08-26  429  		 */
631cfdd0520d19 Miquel Raynal   2024-08-26  430  		if (nbytes && req->continuous)
631cfdd0520d19 Miquel Raynal   2024-08-26  431  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  432  	}
7529df4652482c Peter Pan       2018-06-22  433  
7529df4652482c Peter Pan       2018-06-22  434  	if (req->datalen)
7529df4652482c Peter Pan       2018-06-22  435  		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
7529df4652482c Peter Pan       2018-06-22  436  		       req->datalen);
7529df4652482c Peter Pan       2018-06-22  437  
e708789c4a8798 Miquel Raynal   2021-01-07  438  	if (req->ooblen) {
e708789c4a8798 Miquel Raynal   2021-01-07  439  		if (req->mode == MTD_OPS_AUTO_OOB)
e708789c4a8798 Miquel Raynal   2021-01-07  440  			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
e708789c4a8798 Miquel Raynal   2021-01-07  441  						    spinand->oobbuf,
e708789c4a8798 Miquel Raynal   2021-01-07  442  						    req->ooboffs,
e708789c4a8798 Miquel Raynal   2021-01-07  443  						    req->ooblen);
e708789c4a8798 Miquel Raynal   2021-01-07  444  		else
868cbe2a6dcee4 Miquel Raynal   2020-10-01  445  			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
868cbe2a6dcee4 Miquel Raynal   2020-10-01  446  			       req->ooblen);
e708789c4a8798 Miquel Raynal   2021-01-07  447  	}
868cbe2a6dcee4 Miquel Raynal   2020-10-01  448  
7529df4652482c Peter Pan       2018-06-22  449  	return 0;
7529df4652482c Peter Pan       2018-06-22  450  }
7529df4652482c Peter Pan       2018-06-22  451  
7529df4652482c Peter Pan       2018-06-22  452  static int spinand_write_to_cache_op(struct spinand_device *spinand,
7529df4652482c Peter Pan       2018-06-22  453  				     const struct nand_page_io_req *req)
7529df4652482c Peter Pan       2018-06-22  454  {
7529df4652482c Peter Pan       2018-06-22  455  	struct nand_device *nand = spinand_to_nand(spinand);
3d1f08b032dc4e Miquel Raynal   2020-10-01  456  	struct mtd_info *mtd = spinand_to_mtd(spinand);
981d1aa0697ce1 Boris Brezillon 2019-01-24  457  	struct spi_mem_dirmap_desc *wdesc;
981d1aa0697ce1 Boris Brezillon 2019-01-24  458  	unsigned int nbytes, column = 0;
13c15e07eedf26 Boris Brezillon 2019-01-24  459  	void *buf = spinand->databuf;
981d1aa0697ce1 Boris Brezillon 2019-01-24  460  	ssize_t ret;
7529df4652482c Peter Pan       2018-06-22  461  
13c15e07eedf26 Boris Brezillon 2019-01-24  462  	/*
13c15e07eedf26 Boris Brezillon 2019-01-24  463  	 * Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
13c15e07eedf26 Boris Brezillon 2019-01-24  464  	 * the cache content to 0xFF (depends on vendor implementation), so we
13c15e07eedf26 Boris Brezillon 2019-01-24  465  	 * must fill the page cache entirely even if we only want to program
13c15e07eedf26 Boris Brezillon 2019-01-24  466  	 * the data portion of the page, otherwise we might corrupt the BBM or
13c15e07eedf26 Boris Brezillon 2019-01-24  467  	 * user data previously programmed in OOB area.
3d1f08b032dc4e Miquel Raynal   2020-10-01  468  	 *
3d1f08b032dc4e Miquel Raynal   2020-10-01  469  	 * Only reset the data buffer manually, the OOB buffer is prepared by
3d1f08b032dc4e Miquel Raynal   2020-10-01  470  	 * ECC engines ->prepare_io_req() callback.
13c15e07eedf26 Boris Brezillon 2019-01-24  471  	 */
13c15e07eedf26 Boris Brezillon 2019-01-24  472  	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
3d1f08b032dc4e Miquel Raynal   2020-10-01  473  	memset(spinand->databuf, 0xff, nanddev_page_size(nand));
13c15e07eedf26 Boris Brezillon 2019-01-24  474  
13c15e07eedf26 Boris Brezillon 2019-01-24  475  	if (req->datalen)
13c15e07eedf26 Boris Brezillon 2019-01-24  476  		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
13c15e07eedf26 Boris Brezillon 2019-01-24  477  		       req->datalen);
7529df4652482c Peter Pan       2018-06-22  478  
7529df4652482c Peter Pan       2018-06-22  479  	if (req->ooblen) {
7529df4652482c Peter Pan       2018-06-22  480  		if (req->mode == MTD_OPS_AUTO_OOB)
7529df4652482c Peter Pan       2018-06-22  481  			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
7529df4652482c Peter Pan       2018-06-22  482  						    spinand->oobbuf,
7529df4652482c Peter Pan       2018-06-22  483  						    req->ooboffs,
7529df4652482c Peter Pan       2018-06-22  484  						    req->ooblen);
7529df4652482c Peter Pan       2018-06-22  485  		else
7529df4652482c Peter Pan       2018-06-22  486  			memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
7529df4652482c Peter Pan       2018-06-22  487  			       req->ooblen);
7529df4652482c Peter Pan       2018-06-22  488  	}
7529df4652482c Peter Pan       2018-06-22  489  
f9d7c7265bcff7 Miquel Raynal   2022-01-27  490  	if (req->mode == MTD_OPS_RAW)
981d1aa0697ce1 Boris Brezillon 2019-01-24  491  		wdesc = spinand->dirmaps[req->pos.plane].wdesc;
f9d7c7265bcff7 Miquel Raynal   2022-01-27  492  	else
f9d7c7265bcff7 Miquel Raynal   2022-01-27  493  		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
7529df4652482c Peter Pan       2018-06-22  494  
ca229bdbef29be Cheng Ming Lin  2024-09-09 @495  	if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
ca229bdbef29be Cheng Ming Lin  2024-09-09  496  		column |= req->pos.plane << fls(nanddev_page_size(nand));
ca229bdbef29be Cheng Ming Lin  2024-09-09  497  
7529df4652482c Peter Pan       2018-06-22  498  	while (nbytes) {
981d1aa0697ce1 Boris Brezillon 2019-01-24  499  		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
981d1aa0697ce1 Boris Brezillon 2019-01-24  500  		if (ret < 0)
7529df4652482c Peter Pan       2018-06-22  501  			return ret;
7529df4652482c Peter Pan       2018-06-22  502  
981d1aa0697ce1 Boris Brezillon 2019-01-24  503  		if (!ret || ret > nbytes)
981d1aa0697ce1 Boris Brezillon 2019-01-24  504  			return -EIO;
7529df4652482c Peter Pan       2018-06-22  505  
981d1aa0697ce1 Boris Brezillon 2019-01-24  506  		nbytes -= ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  507  		column += ret;
981d1aa0697ce1 Boris Brezillon 2019-01-24  508  		buf += ret;
7529df4652482c Peter Pan       2018-06-22  509  	}
7529df4652482c Peter Pan       2018-06-22  510  
7529df4652482c Peter Pan       2018-06-22  511  	return 0;
7529df4652482c Peter Pan       2018-06-22  512  }
7529df4652482c Peter Pan       2018-06-22  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
