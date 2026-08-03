Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602135C183;
	Mon,  3 Aug 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761747; cv=none; b=C2MrA+5lr7ats64MWLmQdv1FOiVquTyzPIe7KLGkuXqw+RubLkwgSfx9cI+YMZ/OIqpmjMPaxyeQMFcXIaY1FfcI6Uj7vNPDSA6+q3ai+MkQ7cspgRw2/AB3YprMb6Lc9iDMC35FahoCuZW7VwIF5Z109nYRsM9bD8EVgq5DA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761747; c=relaxed/simple;
	bh=Th0Wiu+Dicd+R2zy4lVM9VJScxk+BaVoF9bs+K4JhBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cv5KwcoafCvXnX54Wl97Rnibjp1gawt49ZPs7bBXX3JN4N5bazentdG8jV1JDrm4x3wGW2M3KUFBt8Vwa5j8eHQs6GOLZlpDZpmO5Uzu84Y43Sm4g7Cu7+E8HgVnrvRk3cZgZd4dbXq1YxggB/eAHfu//HPAA1/ABJaoPYCrxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0S5wqNj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0S5wqNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785761744; x=1817297744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Th0Wiu+Dicd+R2zy4lVM9VJScxk+BaVoF9bs+K4JhBw=;
  b=C0S5wqNjd+xq2lnDAo57NYRXZvJw91ky68iif2vGbxmZGn+IkaST1ws+
   C4kZDdxaV7NSN+32g1qD9LE/Y97ekaZM2jKBDnG6EkVtEEas2Sfk6pE2W
   jXtuADPdRE3035oI6wwsIRNRVuBs2q3vKi0m9jfctKzp+SVcO2hfsyACL
   xLd7vZTJ4QPd5YYP+98uqfboB5NxlGM8DHsaPorr5EBP8FHOPBhoTzpY+
   g7XOT0WVKofHv0m9dXwy9dPCy8YwOUfwOkOAwqCEn6XksrwmA/GXM9hXv
   2HnzaridoEuw9Nt/HsH0AMrdlvRpxvC+n78NCMCEf+kaL/Fs96evcT/yY
   g==;
X-CSE-ConnectionGUID: vE/iyw2ER0622s9ZLHgnmw==
X-CSE-MsgGUID: qxiuELNWS9+mv4FsXjesfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86497993"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86497993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 05:55:43 -0700
X-CSE-ConnectionGUID: +wzxwPWjTuyivh+Qz8rzIw==
X-CSE-MsgGUID: URf5YnKhTKmKfzsllNgY0g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 05:55:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqsCf-000000006x7-1an8;
	Mon, 03 Aug 2026 12:55:37 +0000
Date: Mon, 3 Aug 2026 20:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>, Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: drain hardware completion before
 freeing context
Message-ID: <202608032056.zBdPisX5-lkp@intel.com>
References: <20260708120833.755998-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708120833.755998-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.2-rc6 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mtk-jpeg-drain-hardware-completion-before-freeing-context/20260803-143440
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260708120833.755998-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
config: arm-randconfig-004-20260803 (https://download.01.org/0day-ci/archive/20260803/202608032056.zBdPisX5-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608032056.zBdPisX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608032056.zBdPisX5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1207:3: error: call to undeclared function 'mtk_jpeg_release_hw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1207 |                 mtk_jpeg_release_hw(jpeg, ctx);
         |                 ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1207:3: note: did you mean 'mtk_jpeg_release'?
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1200:12: note: 'mtk_jpeg_release' declared here
    1200 | static int mtk_jpeg_release(struct file *file)
         |            ^
    1201 | {
    1202 |         struct mtk_jpeg_dev *jpeg = video_drvdata(file);
    1203 |         struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
    1204 | 
    1205 |         if (jpeg->variant->jpeg_worker) {
    1206 |                 cancel_work_sync(&ctx->jpeg_work);
    1207 |                 mtk_jpeg_release_hw(jpeg, ctx);
         |                 ~~~~~~~~~~~~~~~~~~~
         |                 mtk_jpeg_release
   1 error generated.


vim +/mtk_jpeg_release_hw +1207 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1199	
  1200	static int mtk_jpeg_release(struct file *file)
  1201	{
  1202		struct mtk_jpeg_dev *jpeg = video_drvdata(file);
  1203		struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
  1204	
  1205		if (jpeg->variant->jpeg_worker) {
  1206			cancel_work_sync(&ctx->jpeg_work);
> 1207			mtk_jpeg_release_hw(jpeg, ctx);
  1208		}
  1209	
  1210		mutex_lock(&jpeg->lock);
  1211		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
  1212		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
  1213		v4l2_fh_del(&ctx->fh, file);
  1214		v4l2_fh_exit(&ctx->fh);
  1215		kfree(ctx);
  1216		mutex_unlock(&jpeg->lock);
  1217		return 0;
  1218	}
  1219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
