Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A89C486647;
	Thu, 10 Sep 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051334; cv=none; b=d8KthSHlziWzr4FgbAXpKe6vfLFS4d6FUbcypSE1zHiGzvXKLyxSDSBDImoS3dIxO/n4yvHG2lI9FCeIrvWPADTJg9LQrDGt5nOnbemcYEGlXeDtVmsksPzb9Ppure5n65QTat8oApN/2a3mGaohv+TBi2YDkyyXZrt+SX7Ko1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051334; c=relaxed/simple;
	bh=c5vdxtg/iwsq5TyrZd4Qk+Gsxwt2E0kpnD7sMv3V/p0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ogJOkqx+MAfikIVpDdiZHMyLQcFbvKOU6oF9o1/rIWtcJoYqL4yfSPTcVDNbZ8dwIjb2//qiq5X1XCN6DbkAqLS0ApY36D0ZGMisrNpEyg5k7JRtrDVQG5UPN3KXAdqXNIHByT6Ey1GDjG7Y7QaaFTU3S7041igjfF9uKc+RGRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jw5SUSt3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jw5SUSt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789051333; x=1820587333;
  h=date:from:to:cc:subject:message-id;
  bh=c5vdxtg/iwsq5TyrZd4Qk+Gsxwt2E0kpnD7sMv3V/p0=;
  b=Jw5SUSt3kUbIFgg9qt0R03SOoiaB1GTOEjtCihxTWJd12djbJyJHV0oG
   uNNg6JsMWs32Z8IvYG2AzeYylFQu8fZPBHb3734qfdACgKKgdshtznM7x
   Bu9xQe09eljQWVTQhBfol/9Fh0bWDJwdbjo0nkY/rB909fzDkVLkLNI3q
   9jRuQ9KQt2RZj+Z/zX8OPmOPP1mMoqAvoAc8N56n4N2mwCz/Mu6pm6SBH
   Mz0ZvwbHrQKjJbhQs5q5OmX2ncDm63vLuy6rjRvf/QO5owYQyRp5VmLo4
   pz0+Ucrr0oXCcPLkXZiOchwnBZZlNTidaKIFDkBXMIsePiVUdAXPZ1gHi
   Q==;
X-CSE-ConnectionGUID: 5ldG8ZjaStS/s+rpVuxcGg==
X-CSE-MsgGUID: z79oELETRxip3+UGXjJ+PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77061432"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77061432"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:42:12 -0700
X-CSE-ConnectionGUID: xseAEMBoTzOZR0tSVC2N/Q==
X-CSE-MsgGUID: a0uferJTRuqXO2PUI3YQwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="309908247"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 07:42:10 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4fyA-0000000007h-1YJv;
	Thu, 10 Sep 2026 14:41:48 +0000
Date: Thu, 10 Sep 2026 22:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 88/89]
 drivers/media/platform/apple/avd/avd-drv.c:155:5: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609102230.0CiPrrA3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   e31aa85e339c10dbf872c0759d5a6c35954af0cc
commit: 0765a0974a15233ed105e144fec796291dacb32d [88/89] media: apple: avd: add a dedicated "submit" step
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609102230.0CiPrrA3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102230.0CiPrrA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609102230.0CiPrrA3-lkp@intel.com/

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
