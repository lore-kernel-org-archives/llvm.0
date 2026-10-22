Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702798;
	b=odWgOeaSSQ+MJESiA+SeySOaMewcHTod501Mq3Vs1QyQwTIbSBdazZXu2jpbP5rFeWpO
	 EbKFnxLld7rEj1xhbj19y5CfZHx2IO/l2T+DAVTgLP4UIoAWFLrG0aXwwL15BmECZKISF
	 yQq3RtCI3k+5WG/m0bnQ+qZDS3RexSEkdqrcIGcj5Wtz7uMZ1NiWujwGd69zloAgxqB7p
	 HXXCjayyqBp2YQMUq/3yfouS3fipVVVOlc2hi253DUyr2TYEbZRxJGTsekNKHuuxPYnen
	 u9E9yVFXYU4JjpLQjERGGVhu9nzB9dTovc1Q8O9pj9gv0uOfYyKtgntZ7B8Gv1Eg6eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LCQAjjx6Qo3ZdnnblLrKZedxr8BqxunBK8aDR956IOk=;
	b=DlmN2manDWerm4D9jggAk888ZviPgV/2A8iWuH5qK2wDmuIMudEdNvRdpy7R4a4pwQzT
	 lQa3B8LqMm8sCFXcq7oaGJzUNKFERJWA2t4ZPBhdJoXjuHQTUZDK1MDhGyijUu+8uyY0/
	 2JOOoBEWwUPy6iSxzR6E74xpMOE1jJJ3F+33NsYJ/cC5BerZ4W+9W9/0zncLTNAsSf/0T
	 P4e/PWfvUNaqX+VTsuRIoCpn4GQnWxDBMTr4cvYMQiWuLUScds1ac98QSqwZJWHoyoaRY
	 0F9hgbD3ib0unZQACR3xoJKx3Tsjd8dJxc5iG7Vm5TaRCdxIQksBw93Glao8fp1+BEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lVGP6Nzj;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A1606A319;
	Thu, 22 Oct 2026 20:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87A1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lVGP6Nzj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792702796; x=1824238796;
  h=date:from:to:cc:subject:message-id;
  bh=YiZUbk4lkJlIPUyPgPoNGI8hAayyU2AErkkDd7PWI1s=;
  b=lVGP6NzjYPH+WM39JufWaftfYplhQFhI4axL51RdJmabubuJupcXckL5
   xINSCHwgCPuiq10t+QfR7I01/s2RXwctyEwP8B9eGsRU36/DZvEkTRbvN
   Ek1eHe5Ghi9KdQvk7J0bGKtuPntxxDrI0SjjrFTQryM1453GZOru2i9MJ
   W7JUJypimBlPHNS/i8I0wqf1YxulVSpwc2rCHov8hy28RuMYPOhO8l3oj
   sqtSW1H/BXozG0xYXgbckZF+IXER83pyOh4mSqm3CI/w8uZgOOtvH2VeW
   lyY3oUScn4YSZtntrw+8KIPDVbjmKaks7d5R1hECHUL9/Ta0mBGhMp/L8
   Q==;
X-CSE-ConnectionGUID: +cMzZYyNQeKFon4IkztiQQ==
X-CSE-MsgGUID: krOxDvRCRoikfHzT16p7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1352711"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1352711"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 13:59:56 -0700
X-CSE-ConnectionGUID: W5Z5Y/qRSDah1hOMD2GuKw==
X-CSE-MsgGUID: dKATUnQ4RWqaabO8ZN6psg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3503659"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2026 13:59:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJzt9-00000000Req-16wC;
	Thu, 22 Oct 2026 20:59:51 +0000
Date: Fri, 23 Oct 2026 04:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 21/27]
 drivers/media/test-drivers/vim2m.c:1537:44: warning: format specifies type
 'unsigned int' but the argument has type '__size_t' (aka 'unsigned long')
Message-ID: <202610230433.v7bfVQgL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   bb43fe9fe0f40894bec0e5045aade6652ef6a46c
commit: 5df2cfc0b2f0f0b584050f1b56cf75c78c6e0091 [21/27] koe
config: x86_64-randconfig-1007-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230433.v7bfVQgL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230433.v7bfVQgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230433.v7bfVQgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vim2m.c:1537:44: warning: format specifies type 'unsigned int' but the argument has type '__size_t' (aka 'unsigned long') [-Wformat]
    1537 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |                                       ~~          ^~~~~~~~~~~~
         |                                       %zx
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1537 drivers/media/test-drivers/vim2m.c

  1526	
  1527	static int vim2m_probe(struct platform_device *pdev)
  1528	{
  1529		struct vim2m_dev *dev;
  1530		struct video_device *vfd;
  1531		int ret;
  1532	
  1533		dev = kzalloc_obj(*dev);
  1534		if (!dev)
  1535			return -ENOMEM;
  1536	
> 1537		printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
  1538	
  1539		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
  1540		if (ret)
  1541			goto error_free;
  1542	
  1543		atomic_set(&dev->num_inst, 0);
  1544		mutex_init(&dev->dev_mutex);
  1545	
  1546		dev->multiplanar = (multiplanar == 2);
  1547	
  1548		dev->vfd = vim2m_videodev;
  1549		vfd = &dev->vfd;
  1550		vfd->lock = &dev->dev_mutex;
  1551		vfd->v4l2_dev = &dev->v4l2_dev;
  1552		vfd->device_caps |= (dev->multiplanar) ? V4L2_CAP_VIDEO_M2M_MPLANE :
  1553			V4L2_CAP_VIDEO_M2M;
  1554	
  1555		video_set_drvdata(vfd, dev);
  1556		platform_set_drvdata(pdev, dev);
  1557	
  1558		dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
  1559		if (IS_ERR(dev->m2m_dev)) {
  1560			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
  1561			ret = PTR_ERR(dev->m2m_dev);
  1562			dev->m2m_dev = NULL;
  1563			goto error_dev;
  1564		}
  1565	
  1566		dev->mdev.dev = &pdev->dev;
  1567		strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
  1568		strscpy(dev->mdev.bus_info, "platform:vim2m",
  1569			sizeof(dev->mdev.bus_info));
  1570		media_device_init(&dev->mdev);
  1571		dev->mdev.ops = &m2m_media_ops;
  1572		dev->v4l2_dev.mdev = &dev->mdev;
  1573	
  1574		ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
  1575		if (ret) {
  1576			v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
  1577			goto error_m2m;
  1578		}
  1579	
  1580		v4l2_info(&dev->v4l2_dev,
  1581			  "Device registered as /dev/video%d\n", vfd->num);
  1582	
  1583		ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
  1584							 MEDIA_ENT_F_PROC_VIDEO_SCALER);
  1585		if (ret) {
  1586			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
  1587			goto error_v4l2;
  1588		}
  1589	
  1590		ret = media_device_register(&dev->mdev);
  1591		if (ret) {
  1592			v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
  1593			goto error_m2m_mc;
  1594		}
  1595	
  1596		return 0;
  1597	
  1598	error_m2m_mc:
  1599		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
  1600	error_v4l2:
  1601		video_unregister_device(&dev->vfd);
  1602		/* vim2m_device_release called by video_unregister_device to release various objects */
  1603		return ret;
  1604	error_m2m:
  1605		v4l2_m2m_release(dev->m2m_dev);
  1606	error_dev:
  1607		v4l2_device_unregister(&dev->v4l2_dev);
  1608	error_free:
  1609		kfree(dev);
  1610	
  1611		return ret;
  1612	}
  1613	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
