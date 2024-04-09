Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999FA433A6;
	Tue,  9 Apr 2024 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703073; cv=none; b=h+Xy18/IB1xJqkpOE6iudA3ZeQU1e93c01QW/GI9d2TnT/Q1Bn+aL+n5sBKqz7ZgofUGTS5qfIuq23iv8+4BkqNnHVnmd/61mEyCHgZB6f+UiBlMYrLivcH03XK4PcNiOqans4F7Sg1zupOC4pkQREkI6pETFZJ0D7m8/g7U8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703073; c=relaxed/simple;
	bh=o5Ss2J7KkJOZ4/tqj9coyyE7LvtPovvJ+h6lEe1vhpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEh4JNAfkl3B3jOM1tT7l40JpGH+iuZaMy46wEkMc1tWdrLz1b0UsSjXbtDmlr7A0VxJpqyEmyDtMlhfkNqNU/94RXqk2oCeiVHh3msKa1zJSLkWgSvL+aumY4OlGcc+h8gxTnuVqyXMjIMfyZdjWQWrveF0IxazuEPlI+1TqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQn07hd5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQn07hd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703071; x=1744239071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5Ss2J7KkJOZ4/tqj9coyyE7LvtPovvJ+h6lEe1vhpw=;
  b=BQn07hd5Jl73dWnSqSpDLC7/vwD/Uu+1vJxXUahdZfja0OAMzgL0Tp+u
   ppN2ob2HbC1aN8fd3IdtsJEBMb2dB55YmprSVYSyMSPwQazUzPU5G54/2
   zPc6I9qgFFn/Vja/TuOt/1wd5JktFwX4Bn7SmOOMgSRsTmAPYl2VlO293
   lQJZs8FLQ3v42YsC9PFuZ7qJKGqKrMShHs16KFaSvGKIfqYoM/cRcHP56
   QDn+/lLIn++XulmpQzLk7Z+JnQiKGGH0U7Bh4MO2N4373ZpFYWgYy5Kqn
   yV5iLJWKKvm1u+LZiDJwug/BCF5q0w4CcP8uYDjFB5tYGua8R8I1Is/2o
   g==;
X-CSE-ConnectionGUID: LV5IidxaSwS1M0cjqc/KAA==
X-CSE-MsgGUID: VvLQRDAKQJqPxMiPcsX/Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11884116"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11884116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 15:51:10 -0700
X-CSE-ConnectionGUID: YHvWEnK5SqWGoyY0mJtleA==
X-CSE-MsgGUID: JzEutDPpQkypI6+JAjnAFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20337144"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2024 15:51:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKJ0-0006ag-1M;
	Tue, 09 Apr 2024 22:51:06 +0000
Date: Wed, 10 Apr 2024 06:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 289/304]
 drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Function parameter or
 struct member 'iocb' not described in 'dvb_ca_en50221_io_write'
Message-ID: <202404100642.8acuabTO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8159659b8a66f8084c9210927ef017e7baa50faa
commit: 8ed9579e1f8538f0cdddc293aa66acaea022337d [289/304] media/dvb-core: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240410/202404100642.8acuabTO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100642.8acuabTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100642.8acuabTO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Function parameter or struct member 'iocb' not described in 'dvb_ca_en50221_io_write'
>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Function parameter or struct member 'from' not described in 'dvb_ca_en50221_io_write'
>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Excess function parameter 'file' description in 'dvb_ca_en50221_io_write'
>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Excess function parameter 'buf' description in 'dvb_ca_en50221_io_write'
>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Excess function parameter 'count' description in 'dvb_ca_en50221_io_write'
>> drivers/media/dvb-core/dvb_ca_en50221.c:1447: warning: Excess function parameter 'ppos' description in 'dvb_ca_en50221_io_write'


vim +1447 drivers/media/dvb-core/dvb_ca_en50221.c

^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1435  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1436  /**
a4184b4f99019f5 drivers/media/dvb-core/dvb_ca_en50221.c     Hans Verkuil          2021-03-03  1437   * dvb_ca_en50221_io_write - Implementation of write() syscall.
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1438   *
fbefb1a87c7e6e2 drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2015-08-22  1439   * @file: File structure.
fbefb1a87c7e6e2 drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2015-08-22  1440   * @buf: Source buffer.
fbefb1a87c7e6e2 drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2015-08-22  1441   * @count: Size of source buffer.
fbefb1a87c7e6e2 drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2015-08-22  1442   * @ppos: Position in file (ignored).
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1443   *
46e42a303178ca1 drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2017-11-27  1444   * return: Number of bytes read, or <0 on error.
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1445   */
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1446  static ssize_t dvb_ca_en50221_io_write(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16 @1447  {
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1448  	struct dvb_device *dvbdev = iocb->ki_filp->private_data;
0c53c70f6afa2d3 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Johannes Stezenbach   2005-05-16  1449  	struct dvb_ca_private *ca = dvbdev->priv;
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1450  	size_t count = iov_iter_count(from);
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1451  	struct dvb_ca_slot *sl;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1452  	u8 slot, connection_id;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1453  	int status;
260f8d7c4cda79b drivers/media/dvb/dvb-core/dvb_ca_en50221.c Oliver Endriss        2007-07-13  1454  	u8 fragbuf[HOST_LINK_BUF_SIZE];
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1455  	int fragpos = 0;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1456  	int fraglen;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1457  	unsigned long timeout;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1458  	int written;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1459  
46b4f7c176a2dd4 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Harvey Harrison       2008-04-08  1460  	dprintk("%s\n", __func__);
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1461  
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1462  	/*
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1463  	 * Incoming packet has a 2 byte header.
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1464  	 * hdr[0] = slot_id, hdr[1] = connection_id
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1465  	 */
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1466  	if (count < 2)
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1467  		return -EINVAL;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1468  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1469  	/* extract slot & connection id */
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1470  	if (!copy_from_iter_full(&slot, 1, from))
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1471  		return -EFAULT;
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1472  	if (!copy_from_iter_full(&connection_id, 1, from))
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1473  		return -EFAULT;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1474  	count -= 2;
a24e6348e5a0e85 drivers/media/dvb-core/dvb_ca_en50221.c     Colin Ian King        2017-09-20  1475  
a24e6348e5a0e85 drivers/media/dvb-core/dvb_ca_en50221.c     Colin Ian King        2017-09-20  1476  	if (slot >= ca->slot_count)
a24e6348e5a0e85 drivers/media/dvb-core/dvb_ca_en50221.c     Colin Ian King        2017-09-20  1477  		return -EINVAL;
4f5ab5d7a5e765a drivers/media/dvb-core/dvb_ca_en50221.c     Mauro Carvalho Chehab 2018-05-15  1478  	slot = array_index_nospec(slot, ca->slot_count);
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1479  	sl = &ca->slot_info[slot];
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1480  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1481  	/* check if the slot is actually running */
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1482  	if (sl->slot_state != DVB_CA_SLOTSTATE_RUNNING)
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1483  		return -EINVAL;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1484  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1485  	/* fragment the packets & store in the buffer */
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1486  	while (fragpos < count) {
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1487  		fraglen = sl->link_buf_size - 2;
624f0c186978f9c drivers/media/dvb/dvb-core/dvb_ca_en50221.c Mauro Carvalho Chehab 2012-01-10  1488  		if (fraglen < 0)
624f0c186978f9c drivers/media/dvb/dvb-core/dvb_ca_en50221.c Mauro Carvalho Chehab 2012-01-10  1489  			break;
624f0c186978f9c drivers/media/dvb/dvb-core/dvb_ca_en50221.c Mauro Carvalho Chehab 2012-01-10  1490  		if (fraglen > HOST_LINK_BUF_SIZE - 2)
624f0c186978f9c drivers/media/dvb/dvb-core/dvb_ca_en50221.c Mauro Carvalho Chehab 2012-01-10  1491  			fraglen = HOST_LINK_BUF_SIZE - 2;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1492  		if ((count - fragpos) < fraglen)
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1493  			fraglen = count - fragpos;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1494  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1495  		fragbuf[0] = connection_id;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1496  		fragbuf[1] = ((fragpos + fraglen) < count) ? 0x80 : 0x00;
8ed9579e1f8538f drivers/media/dvb-core/dvb_ca_en50221.c     Jens Axboe            2024-04-09  1497  		status = !copy_from_iter_full(fragbuf + 2, fraglen, from);
e252984c5279dde drivers/media/dvb/dvb-core/dvb_ca_en50221.c Dan Carpenter         2010-06-04  1498  		if (status) {
e252984c5279dde drivers/media/dvb/dvb-core/dvb_ca_en50221.c Dan Carpenter         2010-06-04  1499  			status = -EFAULT;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1500  			goto exit;
e252984c5279dde drivers/media/dvb/dvb-core/dvb_ca_en50221.c Dan Carpenter         2010-06-04  1501  		}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1502  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1503  		timeout = jiffies + HZ / 2;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1504  		written = 0;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1505  		while (!time_after(jiffies, timeout)) {
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1506  			/*
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1507  			 * check the CAM hasn't been removed/reset in the
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1508  			 * meantime
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1509  			 */
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1510  			if (sl->slot_state != DVB_CA_SLOTSTATE_RUNNING) {
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1511  				status = -EIO;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1512  				goto exit;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1513  			}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1514  
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1515  			mutex_lock(&sl->slot_lock);
96375b7a7046f8d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1516  			status = dvb_ca_en50221_write_data(ca, slot, fragbuf,
a4315e5be7020aa drivers/media/dvb-core/dvb_ca_en50221.c     YongSu Yoo            2022-08-18  1517  							   fraglen + 2, 0);
a75aa90c7c2fd82 drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1518  			mutex_unlock(&sl->slot_lock);
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1519  			if (status == (fraglen + 2)) {
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1520  				written = 1;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1521  				break;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1522  			}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1523  			if (status != -EAGAIN)
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1524  				goto exit;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1525  
b9af29e15a7cf9d drivers/media/dvb-core/dvb_ca_en50221.c     Jasmin Jessich        2017-07-15  1526  			usleep_range(1000, 1100);
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1527  		}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1528  		if (!written) {
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1529  			status = -EIO;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1530  			goto exit;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1531  		}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1532  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1533  		fragpos += fraglen;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1534  	}
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1535  	status = count + 2;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1536  
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1537  exit:
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1538  	return status;
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1539  }
^1da177e4c3f415 drivers/media/dvb/dvb-core/dvb_ca_en50221.c Linus Torvalds        2005-04-16  1540  

:::::: The code at line 1447 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
