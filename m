Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C926ED37;
	Sat, 10 Oct 2026 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666744; cv=none; b=m1QTe3aLpZumqIhoJM70Q6POBWT1iGqbr/g8Erg+7fQnKll/DI0EnfcR43Bu6Oy1vEVowukWHvqcj7NHa5d8FGjy2dLFJ1+cfAIYz7mI/4BiTUSFPV/Aw2xr2DOZGaZR2aJlav8bmsRuWcJsbXNHEPP+YTudXi646anYCmyjndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666744; c=relaxed/simple;
	bh=T9oX7cdhaIhJH49AxnsK6BFI+vFiwMX4K4dG9IscGKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3b5chdPmX2ZqeNhsCJq3Il/dXvoSqgYiqhInJKDmVyyDTPz2KJM8Ia5D7nkyZTNB0aJufQTDizFodWZxX+nInKSDM01jolTjaDgCvmAGDt4iGwuXlnoxHhMZsrHfvIqT3/NyIU0lVjzpoCOwj83R6907H0UFV/hpEFWgCZEdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlT54a2c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlT54a2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791666742; x=1823202742;
  h=date:from:to:cc:subject:message-id;
  bh=T9oX7cdhaIhJH49AxnsK6BFI+vFiwMX4K4dG9IscGKY=;
  b=YlT54a2cLlSa6Wmux87tjQapZOBzYZavk3nwbEAsnf0M8ogNBEFhOfVV
   T7cJKDXHXeVpgi4UX5FdC4XhOvm25Vb2OEyN9TRCJGZnszeKlSbma6Lux
   nfok1xSKZNiC8efaYuh3XArXm+yndqy5e9kHAC1tAuOKCZ/U9R6lJwkSV
   gHL2XobEd2wwS7pzZeuHaq7tvhSkymjPGXUg5Nh0wlvs4aDt0gDCuucuV
   XdjC3eY8osPWfoaOERA49Lx9rH77IVmJ8pJ/fOwp6ou0HZf00djBtGYm+
   MCuOXdGpWWVv2WBs0C2Vam5UxtuKQiBKUfBbeT8RCuPHLDOK7SnorB+C9
   Q==;
X-CSE-ConnectionGUID: RdWie5zhSPCkODtSKt0UQQ==
X-CSE-MsgGUID: xYDwyr3+Q6SNt+DcQ/uM4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="421003"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="421003"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 14:12:21 -0700
X-CSE-ConnectionGUID: xPnlXTeyTeK0lgHwU3ISUQ==
X-CSE-MsgGUID: 6hUtmiFPTN+3D89xSuY0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="892097"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2026 14:12:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFeMb-00000000A5K-0uYY;
	Sat, 10 Oct 2026 21:12:17 +0000
Date: Sun, 11 Oct 2026 05:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-more 3/5]
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:485:7: warning: variable 'ret'
 is used uninitialized whenever 'if' condition is true
Message-ID: <202610110422.Ds1dqsa4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git ipu6-more
head:   80de48e2cab73a7c38171de3de224456c804f6bc
commit: 5793439341f94991ce1f137ce1e5fdb616d2e23a [3/5] media: ipu6: Prevent starting streaming if ISYS needs reset
config: x86_64-randconfig-1009-20261010 (https://download.01.org/0day-ci/archive/20261011/202610110422.Ds1dqsa4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110422.Ds1dqsa4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110422.Ds1dqsa4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:485:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     485 |                 if (av->isys->need_reset)
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:527:9: note: uninitialized use occurs here
     527 |         return ret;
         |                ^~~
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:485:3: note: remove the 'if' if its condition is always false
     485 |                 if (av->isys->need_reset)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
     486 |                         goto out_return_buffers;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:478:9: note: initialize the variable 'ret' to silence this warning
     478 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +485 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

   469	
   470	static int start_streaming(struct vb2_queue *q, unsigned int count)
   471	{
   472		struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
   473		struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
   474		struct device *dev = &av->isys->adev->auxdev.dev;
   475		const struct ipu6_isys_pixelformat *pfmt =
   476			ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
   477		struct media_pad *source_pad, *remote_pad;
   478		int ret;
   479	
   480		dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
   481			av->vdev.name, ipu6_isys_get_frame_width(av),
   482			ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
   483	
   484		scoped_guard(mutex, &av->isys->mutex) {
 > 485			if (av->isys->need_reset)
   486				goto out_return_buffers;
   487		}
   488	
   489		remote_pad = media_pad_remote_pad_unique(&av->pad);
   490		if (IS_ERR(remote_pad)) {
   491			dev_dbg(dev, "failed to get remote pad\n");
   492			ret = PTR_ERR(remote_pad);
   493			goto out_return_buffers;
   494		}
   495	
   496		source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
   497		if (IS_ERR(source_pad)) {
   498			dev_dbg(dev, "No external source entity\n");
   499			ret = PTR_ERR(source_pad);
   500			goto out_return_buffers;
   501		}
   502	
   503		ret = video_device_pipeline_alloc_start(&av->vdev);
   504		if (ret < 0)
   505			goto out_return_buffers;
   506	
   507		ret = ipu6_isys_link_fmt_validate(aq);
   508		if (ret) {
   509			dev_dbg(dev,
   510				"%s: link format validation failed (%d)\n",
   511				av->vdev.name, ret);
   512			goto out_pipeline_stop;
   513		}
   514	
   515		ret = ipu6_isys_stream_start(av);
   516		if (ret)
   517			goto out_pipeline_stop;
   518	
   519		return 0;
   520	
   521	out_pipeline_stop:
   522		ipu6_isys_stream_cleanup(av);
   523	
   524	out_return_buffers:
   525		return_buffers(aq, VB2_BUF_STATE_QUEUED);
   526	
   527		return ret;
   528	}
   529	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
