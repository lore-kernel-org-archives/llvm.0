Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD998248F6F;
	Mon,  4 Aug 2025 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754304118; cv=none; b=kwwXlZ5O5cCDSGZfxq9ztM19H/5Rshl85918jJOf7Vy9zQMo9OHpm1ASKL/t1bRXJOnRDMABBH3WnsVDZ9jS5+OQGkA/mJ0TQJNhFvEH8bA7H81/klE8pzhnod0rJdyUhpV+Iel2GoMx+QI12QykxDJ1lEYXaiMOJrhVJDWJlrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754304118; c=relaxed/simple;
	bh=wT2ib0cs2IfLomlbUPRPjouD4xOg12ssiEJpfJfmSSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+ligQQSa0eBC+Uxed0WybGuCkATHyA/tnpTJky4cD6CjbaZljifRHaExHFN4p/zVEdIbYZwow5DxdPG5adKw0HkCnd4rTbqQpuOYGXah8TO2Vm4bTXwgKTBo93COz3VY/2c4VP6KVCxToAlhfyifSGbZhEgHosHb0Rgfi6EhfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hxhc9Xjf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hxhc9Xjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754304117; x=1785840117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wT2ib0cs2IfLomlbUPRPjouD4xOg12ssiEJpfJfmSSs=;
  b=Hxhc9XjfkjuA3TBw2kmcHxe1ETRyku97dKqwjINuMjQxpivzLZVE3MZ4
   QHCMd+K6g7BkyROr4bHIpgQo9eAix/Go4bMhxc9Rt3n0UVgJOd76YhMQl
   Hpxncr7jpqKqCMl+BdRvCA51N7156uq1CL3hdS0Li5jHFuaA/QHwgdIAX
   nx0KSf2cvCLiqjJmSJdSK+9jA+L7Hs2Uuiv5D6tu4vWDPB0rffbWbSZkK
   9ZjuEffA5c+3QAQVuOO6XYm2hWHPA6GVWX91AE1ICXq1ecQozMacJghsF
   NnGVK/8fNgMxWjGT2/C6nqq5DoISfyT6tnA1sHeGcffQIVVdpOLQFUVEw
   g==;
X-CSE-ConnectionGUID: 9zBem5X1ThGgJS19Nq310Q==
X-CSE-MsgGUID: uTXDKRgsSsyYA9iPy0yTcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56266383"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56266383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:41:57 -0700
X-CSE-ConnectionGUID: E5g9QdiJSBW68WdGIPrF2Q==
X-CSE-MsgGUID: +1XpQieISf28lPjy/pXiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168313101"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2025 03:41:54 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uisdb-0006ye-31;
	Mon, 04 Aug 2025 10:41:51 +0000
Date: Mon, 4 Aug 2025 18:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 25/53]
 drivers/media/platform/apple/isp/isp-ipc.c:226:10: warning: variable 'dwork'
 is uninitialized when used here
Message-ID: <202508041818.AkRny7yB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   a6b9c182c34b8219390dc76a566a1f275e7245c3
commit: 6dc724a0e741df8d453d27c8f78c5d4871eb7d9c [25/53] media: apple: isp: Remove ioread/iowrite and stop doing raw address translation
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250804/202508041818.AkRny7yB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041818.AkRny7yB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041818.AkRny7yB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-ipc.c:238:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     237 |                         isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                                                             ~~~~
         |                                                             %x
     238 |                                 surf->iova, surf->size);
         |                                 ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:267:47: note: expanded from macro 'isp_err'
     267 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> drivers/media/platform/apple/isp/isp-ipc.c:226:10: warning: variable 'dwork' is uninitialized when used here [-Wuninitialized]
     226 |                         kfree(dwork);
         |                               ^~~~~
   drivers/media/platform/apple/isp/isp-ipc.c:219:37: note: initialize the variable 'dwork' to silence this warning
     219 |                 struct isp_sm_deferred_work *dwork;
         |                                                   ^
         |                                                    = NULL
   2 warnings generated.


vim +/dwork +226 drivers/media/platform/apple/isp/isp-ipc.c

a1dceff4188d136 Eileen Yoon 2023-08-31  212  
a1dceff4188d136 Eileen Yoon 2023-08-31  213  int ipc_sm_handle(struct apple_isp *isp, struct isp_channel *chan)
a1dceff4188d136 Eileen Yoon 2023-08-31  214  {
a1dceff4188d136 Eileen Yoon 2023-08-31  215  	struct isp_message *req = &chan->req, *rsp = &chan->rsp;
6dc724a0e741df8 Asahi Lina  2023-09-29  216  	int err;
a1dceff4188d136 Eileen Yoon 2023-08-31  217  
a1dceff4188d136 Eileen Yoon 2023-08-31  218  	if (req->arg0 == 0x0) {
a1dceff4188d136 Eileen Yoon 2023-08-31  219  		struct isp_sm_deferred_work *dwork;
a1dceff4188d136 Eileen Yoon 2023-08-31  220  		struct isp_surf *surf;
a1dceff4188d136 Eileen Yoon 2023-08-31  221  
a1dceff4188d136 Eileen Yoon 2023-08-31  222  		surf = isp_alloc_surface_gc(isp, req->arg1);
a1dceff4188d136 Eileen Yoon 2023-08-31  223  		if (!surf) {
a1dceff4188d136 Eileen Yoon 2023-08-31  224  			isp_err(isp, "failed to alloc requested size 0x%llx\n",
a1dceff4188d136 Eileen Yoon 2023-08-31  225  				req->arg1);
a1dceff4188d136 Eileen Yoon 2023-08-31 @226  			kfree(dwork);
a1dceff4188d136 Eileen Yoon 2023-08-31  227  			return -ENOMEM;
a1dceff4188d136 Eileen Yoon 2023-08-31  228  		}
6dc724a0e741df8 Asahi Lina  2023-09-29  229  		surf->type = req->arg2;
a1dceff4188d136 Eileen Yoon 2023-08-31  230  
a1dceff4188d136 Eileen Yoon 2023-08-31  231  		rsp->arg0 = surf->iova | ISP_IPC_FLAG_ACK;
a1dceff4188d136 Eileen Yoon 2023-08-31  232  		rsp->arg1 = 0x0;
a1dceff4188d136 Eileen Yoon 2023-08-31  233  		rsp->arg2 = 0x0; /* macOS uses this to index surfaces */
a1dceff4188d136 Eileen Yoon 2023-08-31  234  
6dc724a0e741df8 Asahi Lina  2023-09-29  235  		err = isp_surf_vmap(isp, surf);
6dc724a0e741df8 Asahi Lina  2023-09-29  236  		if (err < 0) {
6dc724a0e741df8 Asahi Lina  2023-09-29  237  			isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
6dc724a0e741df8 Asahi Lina  2023-09-29  238  				surf->iova, surf->size);
6dc724a0e741df8 Asahi Lina  2023-09-29  239  		} else {
6dc724a0e741df8 Asahi Lina  2023-09-29  240  			switch (surf->type) {
6dc724a0e741df8 Asahi Lina  2023-09-29  241  			case 0x4c4f47: /* "LOG" */
6dc724a0e741df8 Asahi Lina  2023-09-29  242  				isp->log_surf = surf;
6dc724a0e741df8 Asahi Lina  2023-09-29  243  				break;
6dc724a0e741df8 Asahi Lina  2023-09-29  244  			case 0x4d495343: /* "MISC" */
6dc724a0e741df8 Asahi Lina  2023-09-29  245  				/* Hacky... maybe there's a better way to identify this surface? */
6dc724a0e741df8 Asahi Lina  2023-09-29  246  				if (surf->size == 0xc000)
6dc724a0e741df8 Asahi Lina  2023-09-29  247  					isp->bt_surf = surf;
6dc724a0e741df8 Asahi Lina  2023-09-29  248  				break;
6dc724a0e741df8 Asahi Lina  2023-09-29  249  			}
a1dceff4188d136 Eileen Yoon 2023-08-31  250  		}
6dc724a0e741df8 Asahi Lina  2023-09-29  251  

:::::: The code at line 226 was first introduced by commit
:::::: a1dceff4188d13636358dd59856716a88c1349e7 media: apple: Add Apple ISP driver

:::::: TO: Eileen Yoon <eyn@gmx.com>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
