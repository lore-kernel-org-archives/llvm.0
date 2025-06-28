Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9112EBE7;
	Sat, 28 Jun 2025 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751149520; cv=none; b=cqrqW22FGAg5+CsOc/FFDiHtsG7ubcN2R2H9pLvF//TSc5PX0OpxqX4jkqsETDDUipbkJDe6MUHRTQKexQ7BVh65YRJHOsBJ0WPVY4daMUsNYPV1AjR/e5GBvf13a4L8EJdRTJQ6YpFq2RsWw9WZzVFlkJKUUBGdponQqrN4S7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751149520; c=relaxed/simple;
	bh=p3PfMdPjk8XFyuvX5E5QXgstT35XZ9CGYKRH/kPqhT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jc/H/MNv5bsCZCc7qmHR5ZFiyKeFs6eVnyHXSNgajz17z9PLeEDweMZl1Wc8sBL3v5ZpcyugY6ZPRT1bJ5rUc6/5+SwpjrsPNA5cJPRgu3H4HrCYOFQhfhJMGGamS0Y2H3CnuXkcFy4ayhtrSpdWbvVs+9Y4yLpff5ZTVBsZhAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVtPjuR2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVtPjuR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751149519; x=1782685519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p3PfMdPjk8XFyuvX5E5QXgstT35XZ9CGYKRH/kPqhT4=;
  b=gVtPjuR2o5X4UymKmbHO/uiNiwxN1e/+ioR+RapxY15oN/QBPF//3HxY
   1byW8waS+Zgu2gRKcmgeNAil4L0w3lKGlPmvxdgPEPPs5TJqX/5pO/iAR
   +mXrdUyEbfUBXi+9XJhgzknjh9QxEV7AhT2fKwKygOHKVP5/PhIFGhlb8
   1fHwNdTzoQLCdKNwznNTNn0s7SKQqCx7TxRQvFR6ktpBirLbQQi+Iaj+J
   84/IZ1Ui8Vlp2KsXAVob9HbGPFsYR/PDpPA84A0I7rK3eVRNLUdJkY3Rs
   KJqqeBdZpSrnZCpr4akNlgDl9k7vtumgxrnzaRjWXawjgxUlxwF5deJ6G
   w==;
X-CSE-ConnectionGUID: VTlKgjwcTrmFM4s2VTMCRA==
X-CSE-MsgGUID: r7njHochSAaZdB757pGd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="70986142"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="70986142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 15:25:15 -0700
X-CSE-ConnectionGUID: yd4CPL8hTLWPHcGoOCHzAw==
X-CSE-MsgGUID: H5EP9NwTTxGglE+3y/bPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152611826"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2025 15:25:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVdyx-000XRU-1Z;
	Sat, 28 Jun 2025 22:25:11 +0000
Date: Sun, 29 Jun 2025 06:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Subject: [gdamjan:wip/ipu7-imx471 2/4]
 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c:717:22: warning: unused
 variable 'isp'
Message-ID: <202506290640.PNXIsrIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/gdamjan/linux wip/ipu7-imx471
head:   5340515315a1fa34442850491121fae1a3b0f42a
commit: 90640d505b4f1fe8958277855c11d0cfdd0c5e1f [2/4] media: pci: intel: Add IPU7 Kconfig & Makefile
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250629/202506290640.PNXIsrIB-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290640.PNXIsrIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290640.PNXIsrIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu7/ipu7-isys-queue.c:717:22: warning: unused variable 'isp' [-Wunused-variable]
     717 |         struct ipu7_device *isp = adev->isp;
         |                             ^~~
>> drivers/media/pci/intel/ipu7/ipu7-isys-queue.c:721:6: warning: unused variable 'ret' [-Wunused-variable]
     721 |         int ret, i, j;
         |             ^~~
   2 warnings generated.


vim +/isp +717 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c

8427c76ace11f4 Дамјан Георгиевски 2025-06-26  711  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  712  static int ipu_isys_reset(struct ipu7_isys_video *self_av,
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  713  			  struct ipu7_isys_stream *self_stream)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  714  {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  715  	struct ipu7_isys *isys = self_av->isys;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  716  	struct ipu7_bus_device *adev = isys->adev;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26 @717  	struct ipu7_device *isp = adev->isp;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  718  	struct ipu7_isys_video *av = NULL;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  719  	struct ipu7_isys_stream *stream = NULL;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  720  	struct device *dev = &adev->auxdev.dev;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26 @721  	int ret, i, j;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  722  	int has_streaming = 0;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  723  	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata =
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  724  		&isys->pdata->ipdata->csi2;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  725  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  726  	dev_dbg(dev, "%s\n", __func__);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  727  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  728  	mutex_lock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  729  	if (isys->in_reset) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  730  		mutex_unlock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  731  		return 0;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  732  	}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  733  	isys->in_reset = true;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  734  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  735  	while (isys->in_stop_streaming) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  736  		dev_dbg(dev, "isys reset: %s: wait for stop\n",
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  737  			self_av->vdev.name);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  738  		mutex_unlock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  739  		usleep_range(10000, 11000);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  740  		mutex_lock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  741  	}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  742  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  743  	mutex_unlock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  744  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  745  	dev_dbg(dev, "reset stop streams\n");
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  746  	for (i = 0; i < csi2_pdata->nports; i++) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  747  		for (j = 0; j < NR_OF_CSI2_SRC_PADS; j++) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  748  			av = &isys->csi2[i].av[j];
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  749  			if (av == self_av)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  750  				continue;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  751  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  752  			stream = av->stream;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  753  			if (!stream || stream == self_stream)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  754  				continue;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  755  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  756  			if (!stream->streaming && !stream->nr_streaming)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  757  				continue;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  758  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  759  			av->reset = true;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  760  			has_streaming = true;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  761  			reset_stop_streaming(av);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  762  		}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  763  	}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  764  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  765  	if (!has_streaming)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  766  		goto end_of_reset;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  767  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  768  	ipu7_cleanup_fw_msg_bufs(isys);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  769  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  770  	dev_dbg(dev, "reset start streams\n");
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  771  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  772  	for (j = 0; j < csi2_pdata->nports; j++) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  773  		for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  774  			av = &isys->csi2[j].av[i];
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  775  			if (!av->reset)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  776  				continue;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  777  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  778  			av->reset = false;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  779  			reset_start_streaming(av);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  780  		}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  781  	}
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  782  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  783  end_of_reset:
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  784  	mutex_lock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  785  	isys->in_reset = false;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  786  	mutex_unlock(&isys->reset_mutex);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  787  	dev_dbg(dev, "reset done\n");
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  788  
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  789  	return 0;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  790  }
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  791  #endif
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  792  static void stop_streaming(struct vb2_queue *q)
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  793  {
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  794  	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(q);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  795  	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  796  	struct ipu7_isys_stream *stream = av->stream;
8427c76ace11f4 Дамјан Георгиевски 2025-06-26  797  

:::::: The code at line 717 was first introduced by commit
:::::: 8427c76ace11f4a0292dc052cab902f2c4c3a188 copy drivers from github.com/intel/ipu7-drivers

:::::: TO: Дамјан Георгиевски <gdamjan@gmail.com>
:::::: CC: Дамјан Георгиевски <gdamjan@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
