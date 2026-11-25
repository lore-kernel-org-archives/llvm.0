Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613649;
	b=E/c9jb8WRlCFBBn1QnA/A6MAQCkJF7HhJBtRp4mey46SMtwNWMGZ3T5YABTU4pHEmFxT
	 vlsjZpZtzZJhGCraz1QBEA30QrEiBtmOncfFbCJK+npPXvtGz8K2oMVU5Jxn4Ye90mFaz
	 enXt9KUTDeO2BtrCAgXL/5r+lqD7Rx8Zv+tVblD+Mw/lRMomBylFz8dDNj/RB8vt+OYKz
	 nCqqK1q5Yp9F2DOrZvx4SsDOx76ygyMzwgmAWQWv5PoNsjSp85ThNFebO33JFGShwm5Me
	 cKZTvvv0vvz4vz+g4x4133BwQmceWvkWNPn9XTEUZ4RxQt4Hl6zIxl6+QC0wTCbT76A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=CjyZI3I3YtrsHweoenoPnGVmLVmidyOQwQFSpD5ktls=;
	b=EP/xm+mgvnutfU9I02wKw8QbYXk6oGySANVmbfIllzOjKIsGFcaiT3IF9g04k6/ODmeS
	 I4+Eae086M/KJ4vxb82i+sP9Y628s3ZHwXDQgtf9dh7r086muLJJEYwf+EuKOTqzKCA1H
	 UPINF+UZA9WEPDB5HYIZ47JbKewAVu6JyJZIfApZI1DMHVB+76sKzUp3OB/IJwu/mcV61
	 +ehocPVwKirHMsZJno/JI0i76bZEMCusDPHiATwXsApICJknQQo+6MngyAbMDK174/CwK
	 tG9Vy5AZwIJv98juzbM2qJiPwqjPoS2P2QVzq3A3N8f0l9NAoLwPVowCyd3kRbUBi0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0WV+iIE;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1AB606A321;
	Wed, 25 Nov 2026 13:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0WV+iIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795613649; x=1827149649;
  h=date:from:cc:subject:message-id:mime-version;
  bh=m0GEYOc7oC7RVL5MMVeqBv/QS7qVsfdJsx6/NX1RibA=;
  b=e0WV+iIEmiPyTtYmRZ+kshM/5XAnPX8e4devsYG7IyeVG8PAimHC7wd1
   yHmwhLHN7m3gcerl85nD1rSG/LlDIDTJ8Q1tY1Gu7bEqCt07lpmukZyiv
   rtO9/EABswRJA/TBxZCT6ebEcgRNdmi4DNOZ7kbFKXIdKM26ZiBtdDGXn
   QZQoOLFMEeOxhL5os/+HYQEBT8noaBU2/QOdMCRNQMgKsEH3038JCYDBl
   /qbqhVUXV2kmz0tJ58HhiUlw4G1zMr8+WMWOjyXbrjqywfEtx7Xrn3yGV
   sT4VVUY35I3EbhGNxVHizeRR/aivfuitgCWtQLlocJsboZA8cJeSjdaYA
   Q==;
X-CSE-ConnectionGUID: J/UREjSQSv+IFgKbfcHqlw==
X-CSE-MsgGUID: BcI+nrnIR7+n4Yy19CyzYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4394562"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4394562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:34:09 -0800
X-CSE-ConnectionGUID: T4gnnzuSRtiZ1mhJKNynwQ==
X-CSE-MsgGUID: ZywsQPHCQgim2VWmC6U2Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11677802"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2026 05:34:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWD8P-00000001RkU-3ZD0;
	Wed, 25 Nov 2026 13:34:05 +0000
Date: Wed, 25 Nov 2026 21:33:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v20 01/15] media: mediatek: jpeg: fix jpeg cores' amounts
 setting
Message-ID: <20261125212932.zj5VBZnO-lkp@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20261125061618.2544386-2-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-2-kyrie.wu@mediatek.com>
TO: Kyrie Wu <kyrie.wu@mediatek.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Bin Liu <bin.liu@mediatek.com>
TO: kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
TO: Hans Verkuil <hverkuil@kernel.org>
TO: irui wang <irui.wang@mediatek.com>
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Kyrie Wu <kyrie.wu@mediatek.com>

Hi Kyrie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyrie-Wu/media-mediatek-jpeg-fix-jpeg-cores-amounts-setting/20261125-141604
base:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
patch link:    https://lore.kernel.org/r/20261125061618.2544386-2-kyrie.wu%40mediatek.com
patch subject: [PATCH v20 01/15] media: mediatek: jpeg: fix jpeg cores' amounts setting
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261125/20261125212932.zj5VBZnO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125212932.zj5VBZnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125212932.zj5VBZnO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1330:69: warning: conditional expression between different enumeration types ('enum mtk_jpegenc_hw_id' and 'enum mtk_jpegdec_hw_id') [-Wenum-compare-conditional]
    1330 |                 hw_max = jpeg->variant->cap_q_default_fourcc == V4L2_PIX_FMT_JPEG ?
         |                                                                                   ^
    1331 |                          MTK_JPEGENC_HW_MAX : MTK_JPEGDEC_HW_MAX;
         |                          ~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1330 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1291	
  1292	static int mtk_jpeg_probe(struct platform_device *pdev)
  1293	{
  1294		struct mtk_jpeg_dev *jpeg;
  1295		struct device_node *child;
  1296		int num_child = 0;
  1297		int hw_max;
  1298		int ret;
  1299	
  1300		jpeg = devm_kzalloc_obj(&pdev->dev, *jpeg);
  1301		if (!jpeg)
  1302			return -ENOMEM;
  1303	
  1304		mutex_init(&jpeg->lock);
  1305		spin_lock_init(&jpeg->hw_lock);
  1306		atomic_set(&jpeg->hw_rdy, 0);
  1307		jpeg->dev = &pdev->dev;
  1308		jpeg->variant = of_device_get_match_data(jpeg->dev);
  1309	
  1310		platform_set_drvdata(pdev, jpeg);
  1311	
  1312		ret = devm_of_platform_populate(&pdev->dev);
  1313		if (ret) {
  1314			v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
  1315			return -EINVAL;
  1316		}
  1317	
  1318		if (!jpeg->variant->multi_core) {
  1319			ret = mtk_jpeg_single_core_init(pdev, jpeg);
  1320			if (ret) {
  1321				v4l2_err(&jpeg->v4l2_dev, "mtk_jpeg_single_core_init failed.");
  1322				return -EINVAL;
  1323			}
  1324		} else {
  1325			init_waitqueue_head(&jpeg->hw_wq);
  1326	
  1327			for_each_child_of_node(pdev->dev.of_node, child)
  1328				num_child++;
  1329	
> 1330			hw_max = jpeg->variant->cap_q_default_fourcc == V4L2_PIX_FMT_JPEG ?
  1331				 MTK_JPEGENC_HW_MAX : MTK_JPEGDEC_HW_MAX;
  1332			if (num_child > hw_max)
  1333				return dev_err_probe(jpeg->dev, -EINVAL,
  1334						     "Too many JPEG cores: %d (max %d)\n",
  1335						     num_child, hw_max);
  1336	
  1337			jpeg->max_hw_count = num_child;
  1338			atomic_set(&jpeg->hw_index, 0);
  1339	
  1340			jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
  1341								  WQ_MEM_RECLAIM
  1342								  | WQ_FREEZABLE);
  1343			if (!jpeg->workqueue)
  1344				return -EINVAL;
  1345			ret = devm_add_action_or_reset(&pdev->dev,
  1346						       mtk_jpeg_destroy_workqueue,
  1347						       jpeg->workqueue);
  1348			if (ret)
  1349				return ret;
  1350		}
  1351	
  1352		ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
  1353		if (ret) {
  1354			dev_err(&pdev->dev, "Failed to register v4l2 device\n");
  1355			return -EINVAL;
  1356		}
  1357	
  1358		jpeg->m2m_dev = v4l2_m2m_init(jpeg->variant->m2m_ops);
  1359	
  1360		if (IS_ERR(jpeg->m2m_dev)) {
  1361			v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\n");
  1362			ret = PTR_ERR(jpeg->m2m_dev);
  1363			goto err_m2m_init;
  1364		}
  1365	
  1366		jpeg->vdev = video_device_alloc();
  1367		if (!jpeg->vdev) {
  1368			ret = -ENOMEM;
  1369			goto err_vfd_jpeg_alloc;
  1370		}
  1371		snprintf(jpeg->vdev->name, sizeof(jpeg->vdev->name),
  1372			 "%s", jpeg->variant->dev_name);
  1373		jpeg->vdev->fops = &mtk_jpeg_fops;
  1374		jpeg->vdev->ioctl_ops = jpeg->variant->ioctl_ops;
  1375		jpeg->vdev->minor = -1;
  1376		jpeg->vdev->release = video_device_release;
  1377		jpeg->vdev->lock = &jpeg->lock;
  1378		jpeg->vdev->v4l2_dev = &jpeg->v4l2_dev;
  1379		jpeg->vdev->vfl_dir = VFL_DIR_M2M;
  1380		jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
  1381					  V4L2_CAP_VIDEO_M2M_MPLANE;
  1382	
  1383		ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
  1384		if (ret) {
  1385			v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
  1386			goto err_vfd_jpeg_register;
  1387		}
  1388	
  1389		video_set_drvdata(jpeg->vdev, jpeg);
  1390		v4l2_info(&jpeg->v4l2_dev,
  1391			  "%s device registered as /dev/video%d (%d,%d)\n",
  1392			  jpeg->variant->dev_name, jpeg->vdev->num,
  1393			  VIDEO_MAJOR, jpeg->vdev->minor);
  1394	
  1395		pm_runtime_enable(&pdev->dev);
  1396	
  1397		return 0;
  1398	
  1399	err_vfd_jpeg_register:
  1400		video_device_release(jpeg->vdev);
  1401	
  1402	err_vfd_jpeg_alloc:
  1403		v4l2_m2m_release(jpeg->m2m_dev);
  1404	
  1405	err_m2m_init:
  1406		v4l2_device_unregister(&jpeg->v4l2_dev);
  1407	
  1408		return ret;
  1409	}
  1410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
