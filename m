Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385709;
	b=O+edPOZd6YWYi1fJjmrHx0MGbchG+rByTa9Wi/GDqpQTCJUenQh13iF9BzTptpocl0VC
	 E77aT536Jhg+zznYCYT9YwpIN2qwdQFc1mc8KNv4lDGdpL8dpWuMpB3m9bh200MvL/28E
	 4Jz5AbqxiiQASjAGfGJRz0DeeWwj0c5xjCAfBHI7xCQKbH3l2SDJt4Zf0q9gnya7IaXqb
	 /x3eniOJZ4VeHXeIJPU1jCFRyiMmEB0aMBxfmc+zXKDo15bkjvhr1NfUS80u5AQD4+ThD
	 nMwKM1mUEjxgWtVmrIjHjL52Ldnau6+8hB0KMVeaws/33Dy70gKqji1wFd8sQrq28UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385709;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BM2z5rQD/0zOwuMVHeFkDnyqQdb8koUoCxqoZKzxWZg=;
	b=zQt5wPvf/jxcol+JaxRha6ZGS3pfuT99bpi0Q33ogoHTu6SoaGI3/2xpQYf0AQJqBa5b
	 LW+myD3bGsHKfFW8Jh0E+6wLSUm/N5hl/vkOeKMzOXaLJtiCRyxXlsG22IeP3jLDeIzd0
	 fux/tG95qF5v4m7LmQ57aiBgMrX9msNW3wr6WfVAPefmHZOJgDHacZWxRYhcER7v5ah3o
	 vBT9u/c1DsOYY75b3Axo7xGgix4Ud8PSuNp7YkxPiON+8oHADbBYUoOLps5+geymEDocn
	 o5EVvfOQzXdnt2Q+87vjlqqv1DEvuOxlY5Pe3i/GJpA+weKTMwev7/sejkEWcVzbOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjoHNtpn;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBE606A31D;
	Fri, 30 Oct 2026 18:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBBE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjoHNtpn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793385709; x=1824921709;
  h=date:from:to:cc:subject:message-id;
  bh=mBgv421BW9yunCOY+KUuaACZB4V95/9H4QBCYfA6YKA=;
  b=LjoHNtpn6N3jo8EH2iP73iCvCfgM852u72Qnms5onzR5JQ9cnrvIE6Oj
   RYrU/O2gO9Sj8XdgjRj6vUjHb8Q8fpf3NXnSBaPIXUqOnHdJB6oN1xRFQ
   /lwcuQgpBeSqe/wH7DVi6d5mrwWQzP+ZZrLFmmcSm2rfd/pq2lLOeftRV
   SqdPjY5QZqfO218AbJPUXLNBm8XdWdPH1lam2Lt95hWm/iAnA4xlDw5Vl
   rTLgV9dv8ywMHhNhDFN8SHFXeUwDssqQBtRdimh6mdALI7l82rM3VvUkf
   UpqhtTbE0pjY+R9lBYSB9JfElV9eGSuEX5u8dL0ITz0eXxsL2YYmJ7Wus
   w==;
X-CSE-ConnectionGUID: EEHj99QiSVC3xAYy5eIP6g==
X-CSE-MsgGUID: PYS9Y1I9THOcS74j6Q84Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2185605"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2185605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:41:47 -0700
X-CSE-ConnectionGUID: cnpdeB1oQb2vybZE45ZUug==
X-CSE-MsgGUID: l6OtPwUnRayCvICXIgjEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5911282"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2026 11:41:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMrXq-00000000c72-3CEq;
	Fri, 30 Oct 2026 18:41:42 +0000
Date: Sat, 31 Oct 2026 02:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 88/94]
 drivers/media/platform/apple/avd/avd-drv.c:155:5: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610310246.uoJRTKaf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi sofus,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   2e6ef8294919b4bd7b23756d836b447b0b4ffb5f
commit: 0765a0974a15233ed105e144fec796291dacb32d [88/94] media: apple: avd: add a dedicated "submit" step
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261031/202610310246.uoJRTKaf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310246.uoJRTKaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310246.uoJRTKaf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/apple/avd/avd-drv.c:155:5: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |                                 AVD_OP_EXEC_REV3_VP9_MASK :
         |                                 ^
   drivers/media/platform/apple/avd/avd-inst.h:16:35: note: expanded from macro 'AVD_OP_EXEC_REV3_VP9_MASK'
      16 | #define AVD_OP_EXEC_REV3_VP9_MASK       FIELD_PREP(GENMASK(23, 12), 0xfff)
         |                                         ^
   1 error generated.


vim +/FIELD_PREP +155 drivers/media/platform/apple/avd/avd-drv.c

   145	
   146	int avd_submit_job(struct avd_ctx *ctx)
   147	{
   148		struct avd_dev *avd = ctx->dev;
   149		struct avd_job *sub = &ctx->job;
   150		struct avd_segment *seg;
   151		int i, idx = 0, vp = 0;
   152		void __iomem *reg;
   153		u32 exec_mask = sub->codec == AVD_CODEC_VP9 &&
   154						avd->variant->revision == 3 ?
 > 155					AVD_OP_EXEC_REV3_VP9_MASK :
   156					0;
   157		u32 exec_rev_flag =
   158			AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision == 4) |
   159			AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision == 3);
   160	
   161		ctx->fifo_idx = 0;
   162		for (i = 0; i < sub->codec; i++)
   163			vp += avd->variant->vp_slots[i];
   164	
   165		schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
   166		avd->variant->configure_stream(avd, ctx->inst.addr, ctx->fifo_idx, vp);
   167		reg = avd->ctrl + avd->variant->vp_slot_offset + vp * 4;
   168	
   169		/* the first segment is always the header (needs special handling) */
   170	
   171		writel(AVD_OP_EXEC | exec_mask | exec_rev_flag |
   172			       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx),
   173		       reg);
   174		seg = &sub->segments[idx++];
   175		for (i = 0; i < seg->num; i++)
   176			writel(seg->instructions[i], reg);
   177		for (; idx <= sub->num; idx++) {
   178			seg = &sub->segments[idx];
   179			for (i = 0; i < seg->num; i++)
   180				writel(seg->instructions[i], reg);
   181			if (avd_wait_submission_queue(ctx, vp))
   182				break;
   183			writel(AVD_OP_EXEC | exec_mask |
   184				       AVD_OP_EXEC_FLAG_END(idx == sub->num),
   185			       reg);
   186		}
   187	
   188		kfree(sub->segments);
   189		sub->segments = NULL;
   190		return 0;
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
