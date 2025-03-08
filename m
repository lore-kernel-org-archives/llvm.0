Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F6137E;
	Sat,  8 Mar 2025 04:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741407828; cv=none; b=DtcWz05FXmdrlC0edPEBCWvHcS5D15gPewgF16gCW4VbmMNcf4Ib3aDipasukz3hQmdFmza5ze6ppkg5j6YF8iRcoVINlqgX3YjhGXswkxMxmEOTMeFWV6Q3zS491Epd14Ba1gYa40zfE0TG4wNfEc8d7e5MxjHAZ/OV/MfxpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741407828; c=relaxed/simple;
	bh=kvgsAJV+90xgV/pAns0j6Hj/CqGukrTbv0GV/hx1+Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWNuV3YhZ1YMdLK6spVJaAid0h5EVfx6FGCNNFwhH1saNpxdFrlJthG2/kZm7W1lzffVjvBAttR+FuiJ82Ygq+T3IforbZC0VDU88TTzNhzDe5F4dXhTrT3LR5SaAuOFIctk68pThRLrq9z9sFV9qTUfwyb96g9nStISkhGXc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRw0yzc5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRw0yzc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741407826; x=1772943826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvgsAJV+90xgV/pAns0j6Hj/CqGukrTbv0GV/hx1+Xo=;
  b=kRw0yzc5WlcHeTmdJcwWj85AXKYQuEeLa7GxTCHjp8o9lT1ahL51+s3p
   sp0ffPMSWiUKm5cM66Rlz7cYSYKUPFGtUXLoOWsq3mo25u1Y2XIMhvuhI
   bSU8dps0Cr9+02xaEjjNK68x5Y5FEZZQwq1JiJHaRujf5vGZD+huKpdol
   4vZdeEBRQ6JsyT05cNcuowyX+eNA+yGwD3sU5CQiNUhXNW8aOiABPqEYx
   +mNtDm9UFuaWmXX6V8uaQi7LqiNtTnjfB+6qKw53461wHN9VfOQ0wD0s4
   bZ7Am5S0xSwQpxtUS2c9eEWiKjbcgPdL3VSFsv+jGma6I/AMwOnDfOfds
   A==;
X-CSE-ConnectionGUID: SPziYSUVTNKNoXKIGAAuxg==
X-CSE-MsgGUID: juFMmg4pT52hook49N8MgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42604629"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42604629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:23:44 -0800
X-CSE-ConnectionGUID: sEi/n/KZQaa/z5zt+ydJMg==
X-CSE-MsgGUID: TPVcaNOkS++Bumol6X+BCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156712400"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2025 20:23:43 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqliu-0001Tf-1p;
	Sat, 08 Mar 2025 04:23:40 +0000
Date: Sat, 8 Mar 2025 12:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 147/149]
 fs/bcachefs/ec.c:1520:6: warning: variable 'ret' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202503081258.POphtF8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   65aa26b8b89cdbd4b03e0cf4320e52b76383a9c0
commit: b99bc31b4606942e15b0b905d0d9eddd74da3636 [147/149] bcachefs: trace_stripe_create
config: s390-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081258.POphtF8J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081258.POphtF8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081258.POphtF8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/ec.c:1520:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1520 |         if (ec_nr_failed(&s->new_stripe)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/ec.c:1543:33: note: uninitialized use occurs here
    1543 |         trace_stripe_create(c, s->idx, ret);
         |                                        ^~~
   fs/bcachefs/ec.c:1520:2: note: remove the 'if' if its condition is always false
    1520 |         if (ec_nr_failed(&s->new_stripe)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1521 |                 bch_err(c, "error creating stripe: error writing redundancy buckets");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1522 |                 goto err;
         |                 ~~~~~~~~~
    1523 |         }
         |         ~
   fs/bcachefs/ec.c:1495:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1495 |                 if (ec_do_recov(c, &s->existing_stripe)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/ec.c:1543:33: note: uninitialized use occurs here
    1543 |         trace_stripe_create(c, s->idx, ret);
         |                                        ^~~
   fs/bcachefs/ec.c:1495:3: note: remove the 'if' if its condition is always false
    1495 |                 if (ec_do_recov(c, &s->existing_stripe)) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1496 |                         bch_err(c, "error creating stripe: error reading existing stripe");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1497 |                         goto err;
         |                         ~~~~~~~~~
    1498 |                 }
         |                 ~
   fs/bcachefs/ec.c:1486:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1486 |         if (s->err) {
         |             ^~~~~~
   fs/bcachefs/ec.c:1543:33: note: uninitialized use occurs here
    1543 |         trace_stripe_create(c, s->idx, ret);
         |                                        ^~~
   fs/bcachefs/ec.c:1486:2: note: remove the 'if' if its condition is always false
    1486 |         if (s->err) {
         |         ^~~~~~~~~~~~~
    1487 |                 if (!bch2_err_matches(s->err, EROFS))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1488 |                         bch_err(c, "error creating stripe: error writing data buckets");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1489 |                 goto err;
         |                 ~~~~~~~~~
    1490 |         }
         |         ~
   fs/bcachefs/ec.c:1470:9: note: initialize the variable 'ret' to silence this warning
    1470 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


vim +1520 fs/bcachefs/ec.c

fba053d2aaca8f Kent Overstreet 2023-03-09  1460  
cd575ddf57af00 Kent Overstreet 2018-11-01  1461  /*
cd575ddf57af00 Kent Overstreet 2018-11-01  1462   * data buckets of new stripe all written: create the stripe
cd575ddf57af00 Kent Overstreet 2018-11-01  1463   */
cd575ddf57af00 Kent Overstreet 2018-11-01  1464  static void ec_stripe_create(struct ec_stripe_new *s)
cd575ddf57af00 Kent Overstreet 2018-11-01  1465  {
cd575ddf57af00 Kent Overstreet 2018-11-01  1466  	struct bch_fs *c = s->c;
cd575ddf57af00 Kent Overstreet 2018-11-01  1467  	struct open_bucket *ob;
bf5a261c7af80a Kent Overstreet 2023-08-01  1468  	struct bch_stripe *v = &bkey_i_to_stripe(&s->new_stripe.key)->v;
cd575ddf57af00 Kent Overstreet 2018-11-01  1469  	unsigned i, nr_data = v->nr_blocks - v->nr_redundant;
cd575ddf57af00 Kent Overstreet 2018-11-01  1470  	int ret;
cd575ddf57af00 Kent Overstreet 2018-11-01  1471  
cd575ddf57af00 Kent Overstreet 2018-11-01  1472  	BUG_ON(s->h->s == s);
cd575ddf57af00 Kent Overstreet 2018-11-01  1473  
81d8599e192e85 Kent Overstreet 2020-12-14  1474  	closure_sync(&s->iodone);
cd575ddf57af00 Kent Overstreet 2018-11-01  1475  
aebe7a679cbdd8 Kent Overstreet 2023-03-13  1476  	if (!s->err) {
94bc95c468344d Kent Overstreet 2023-02-26  1477  		for (i = 0; i < nr_data; i++)
94bc95c468344d Kent Overstreet 2023-02-26  1478  			if (s->blocks[i]) {
94bc95c468344d Kent Overstreet 2023-02-26  1479  				ob = c->open_buckets + s->blocks[i];
94bc95c468344d Kent Overstreet 2023-02-26  1480  
94bc95c468344d Kent Overstreet 2023-02-26  1481  				if (ob->sectors_free)
94bc95c468344d Kent Overstreet 2023-02-26  1482  					zero_out_rest_of_ec_bucket(c, s, i, ob);
94bc95c468344d Kent Overstreet 2023-02-26  1483  			}
aebe7a679cbdd8 Kent Overstreet 2023-03-13  1484  	}
94bc95c468344d Kent Overstreet 2023-02-26  1485  
cd575ddf57af00 Kent Overstreet 2018-11-01  1486  	if (s->err) {
858536c7cea8bb Kent Overstreet 2022-12-11  1487  		if (!bch2_err_matches(s->err, EROFS))
cd575ddf57af00 Kent Overstreet 2018-11-01  1488  			bch_err(c, "error creating stripe: error writing data buckets");
cd575ddf57af00 Kent Overstreet 2018-11-01  1489  		goto err;
cd575ddf57af00 Kent Overstreet 2018-11-01  1490  	}
cd575ddf57af00 Kent Overstreet 2018-11-01  1491  
81d8599e192e85 Kent Overstreet 2020-12-14  1492  	if (s->have_existing_stripe) {
81d8599e192e85 Kent Overstreet 2020-12-14  1493  		ec_validate_checksums(c, &s->existing_stripe);
81d8599e192e85 Kent Overstreet 2020-12-14  1494  
81d8599e192e85 Kent Overstreet 2020-12-14  1495  		if (ec_do_recov(c, &s->existing_stripe)) {
81d8599e192e85 Kent Overstreet 2020-12-14  1496  			bch_err(c, "error creating stripe: error reading existing stripe");
81d8599e192e85 Kent Overstreet 2020-12-14  1497  			goto err;
81d8599e192e85 Kent Overstreet 2020-12-14  1498  		}
81d8599e192e85 Kent Overstreet 2020-12-14  1499  
81d8599e192e85 Kent Overstreet 2020-12-14  1500  		for (i = 0; i < nr_data; i++)
bf5a261c7af80a Kent Overstreet 2023-08-01  1501  			if (stripe_blockcount_get(&bkey_i_to_stripe(&s->existing_stripe.key)->v, i))
81d8599e192e85 Kent Overstreet 2020-12-14  1502  				swap(s->new_stripe.data[i],
81d8599e192e85 Kent Overstreet 2020-12-14  1503  				     s->existing_stripe.data[i]);
81d8599e192e85 Kent Overstreet 2020-12-14  1504  
2a3731e34de936 Kent Overstreet 2021-01-11  1505  		ec_stripe_buf_exit(&s->existing_stripe);
81d8599e192e85 Kent Overstreet 2020-12-14  1506  	}
81d8599e192e85 Kent Overstreet 2020-12-14  1507  
f6b94a3baa956f Kent Overstreet 2020-07-06  1508  	BUG_ON(!s->allocated);
5be6a274ff7a7c Kent Overstreet 2023-03-05  1509  	BUG_ON(!s->idx);
f6b94a3baa956f Kent Overstreet 2020-07-06  1510  
81d8599e192e85 Kent Overstreet 2020-12-14  1511  	ec_generate_ec(&s->new_stripe);
cd575ddf57af00 Kent Overstreet 2018-11-01  1512  
81d8599e192e85 Kent Overstreet 2020-12-14  1513  	ec_generate_checksums(&s->new_stripe);
cd575ddf57af00 Kent Overstreet 2018-11-01  1514  
cd575ddf57af00 Kent Overstreet 2018-11-01  1515  	/* write p/q: */
cd575ddf57af00 Kent Overstreet 2018-11-01  1516  	for (i = nr_data; i < v->nr_blocks; i++)
81d8599e192e85 Kent Overstreet 2020-12-14  1517  		ec_block_io(c, &s->new_stripe, REQ_OP_WRITE, i, &s->iodone);
81d8599e192e85 Kent Overstreet 2020-12-14  1518  	closure_sync(&s->iodone);
cd575ddf57af00 Kent Overstreet 2018-11-01  1519  
81d8599e192e85 Kent Overstreet 2020-12-14 @1520  	if (ec_nr_failed(&s->new_stripe)) {
cd575ddf57af00 Kent Overstreet 2018-11-01  1521  		bch_err(c, "error creating stripe: error writing redundancy buckets");
ebe8bd75a073c3 Kent Overstreet 2023-02-18  1522  		goto err;
cd575ddf57af00 Kent Overstreet 2018-11-01  1523  	}
cd575ddf57af00 Kent Overstreet 2018-11-01  1524  
a0d11feefb1998 Kent Overstreet 2024-10-13  1525  	ret = bch2_trans_commit_do(c, &s->res, NULL,
cb52d23e77a6e5 Kent Overstreet 2023-11-11  1526  		BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  1527  		BCH_TRANS_COMMIT_no_enospc,
6bd68ec266ad71 Kent Overstreet 2023-09-12  1528  		ec_stripe_key_update(trans,
cb6055e66faa0d Kent Overstreet 2024-10-13  1529  				     s->have_existing_stripe
cb6055e66faa0d Kent Overstreet 2024-10-13  1530  				     ? bkey_i_to_stripe(&s->existing_stripe.key)
cb6055e66faa0d Kent Overstreet 2024-10-13  1531  				     : NULL,
cb6055e66faa0d Kent Overstreet 2024-10-13  1532  				     bkey_i_to_stripe(&s->new_stripe.key)));
cf904c8d964fa4 Kent Overstreet 2023-12-16  1533  	bch_err_msg(c, ret, "creating stripe key");
cd575ddf57af00 Kent Overstreet 2018-11-01  1534  	if (ret) {
ebe8bd75a073c3 Kent Overstreet 2023-02-18  1535  		goto err;
cd575ddf57af00 Kent Overstreet 2018-11-01  1536  	}
cd575ddf57af00 Kent Overstreet 2018-11-01  1537  
dea5647e16d15e Kent Overstreet 2022-10-09  1538  	ret = ec_stripe_update_extents(c, &s->new_stripe);
cf904c8d964fa4 Kent Overstreet 2023-12-16  1539  	bch_err_msg(c, ret, "error updating extents");
cf904c8d964fa4 Kent Overstreet 2023-12-16  1540  	if (ret)
4b1e669995a6c1 Kent Overstreet 2023-02-18  1541  		goto err;
cd575ddf57af00 Kent Overstreet 2018-11-01  1542  err:
b99bc31b460694 Kent Overstreet 2025-03-07  1543  	trace_stripe_create(c, s->idx, ret);
b99bc31b460694 Kent Overstreet 2025-03-07  1544  
af4d05c46b1ef2 Kent Overstreet 2020-07-09  1545  	bch2_disk_reservation_put(c, &s->res);
af4d05c46b1ef2 Kent Overstreet 2020-07-09  1546  
6c7585b098c519 Kent Overstreet 2021-01-18  1547  	for (i = 0; i < v->nr_blocks; i++)
6c7585b098c519 Kent Overstreet 2021-01-18  1548  		if (s->blocks[i]) {
6c7585b098c519 Kent Overstreet 2021-01-18  1549  			ob = c->open_buckets + s->blocks[i];
6c7585b098c519 Kent Overstreet 2021-01-18  1550  
6c7585b098c519 Kent Overstreet 2021-01-18  1551  			if (i < nr_data) {
cd575ddf57af00 Kent Overstreet 2018-11-01  1552  				ob->ec = NULL;
cd575ddf57af00 Kent Overstreet 2018-11-01  1553  				__bch2_open_bucket_put(c, ob);
6c7585b098c519 Kent Overstreet 2021-01-18  1554  			} else {
6c7585b098c519 Kent Overstreet 2021-01-18  1555  				bch2_open_bucket_put(c, ob);
6c7585b098c519 Kent Overstreet 2021-01-18  1556  			}
cd575ddf57af00 Kent Overstreet 2018-11-01  1557  		}
cd575ddf57af00 Kent Overstreet 2018-11-01  1558  
81c771b2663911 Kent Overstreet 2023-03-08  1559  	mutex_lock(&c->ec_stripe_new_lock);
81c771b2663911 Kent Overstreet 2023-03-08  1560  	list_del(&s->list);
81c771b2663911 Kent Overstreet 2023-03-08  1561  	mutex_unlock(&c->ec_stripe_new_lock);
99a3d39893615a Kent Overstreet 2023-06-10  1562  	wake_up(&c->ec_stripe_new_wait);
81c771b2663911 Kent Overstreet 2023-03-08  1563  
2a3731e34de936 Kent Overstreet 2021-01-11  1564  	ec_stripe_buf_exit(&s->existing_stripe);
2a3731e34de936 Kent Overstreet 2021-01-11  1565  	ec_stripe_buf_exit(&s->new_stripe);
81d8599e192e85 Kent Overstreet 2020-12-14  1566  	closure_debug_destroy(&s->iodone);
fba053d2aaca8f Kent Overstreet 2023-03-09  1567  
fba053d2aaca8f Kent Overstreet 2023-03-09  1568  	ec_stripe_new_put(c, s, STRIPE_REF_stripe);
cd575ddf57af00 Kent Overstreet 2018-11-01  1569  }
cd575ddf57af00 Kent Overstreet 2018-11-01  1570  

:::::: The code at line 1520 was first introduced by commit
:::::: 81d8599e192e85fa7e01d8a6e8e4095177ff46a3 bcachefs: Don't read existing stripes synchronously in write path

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
