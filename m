Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792620688;
	b=HM3Y0E+daRAEIelBmaZNetMYbl0s3tO1e0Jf9IV+G4frunXAcl8WEZ1hIues0YaFJm0h
	 UxgTgLN51zOI3TWJkiBHdAARRni2RBnN1wFW525LCG1kdXE023RsfYG1GRQkytPzpxILl
	 cFb/IxXGBTug6aLMPvtMUM1ltTPPUHaz1P0jIpHW8jdj48Kr1Oi5QByhp8bAyoJR3+1ak
	 HYHBC5riNuXNK6sK9z2o1ZJwpvEo4lirhrrPw/P0y1hcb/uAeNTEKJ1Fo/h7eGnif/vFx
	 A2XYHPTBQ0hXksriNoKE2HPi70IuI/W5qXGAZ77wfBREH/C/qRBpdZi19sG26qd8aSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620688;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pgp21LlpniNONu1v9skxOon6YyG3CjMokylGRRXBzjw=;
	b=FAkZrWewa9PyDFxuGEvgF5zOMjIWvEPcnlirHWaV4krLOJaa83MbEpLRGeQnuE1UbR58
	 5iVUmKHimn23rt4NcEE+K3QnFeWei+53/4jot5+4DjDv12DiLDej4wNUmqYx1PmtG8AfP
	 2LuAf7mLe/RlsWObRZdcSXRWykcK69haGZ11vuvvI1c7oPOPOkk6OueopcV68ve1jbM92
	 KHmRfaSgRuNEpcoGopkJ17f2uJzlIa70oXmfQK4udtoWj70gbW+jOYbY9hyADx/lQ/gr7
	 qscmM7sBDe69xYclzILhgZySRtPKX1opsPXe1ysrws0MQ/haf7Mq+axgrA9C4aIqhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxlguvmi;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAC606A319;
	Wed, 21 Oct 2026 22:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAAC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxlguvmi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792620682; x=1824156682;
  h=date:from:to:cc:subject:message-id;
  bh=EDYQvvNbc/yTYM764RogEVKsHxM2Gy0uOXos/HPxGKw=;
  b=GxlguvmikhW7joscEwvnpCiL11znDILGFYz9uQNAqskT19bPCwgyXbFr
   gSDqr7x1tM5JZnZjXRoqHtr5B9FsD0g43lTxpm534Fy3ByL93tRmJubAO
   riRYOD4KY6mAu2XwPF+u0VsZSMlBSpuqXoP7OAQr4ExIi4U2wW96kSKMb
   CoMv+SHrKtiSOul4fmL3UBTv8KE8GnBgMNuu7NGzZbeigaicTxOgL1pJz
   9gvKSJDNcb0hETSqoju3KS1LT8OR17cXCICIL85GCbGqvTzu9A0t7JPVM
   Sti4Q8kEkXX0jHSrsQkcdV7QzJSpYitVXm9XOCd3XvVRMGyVAHRee+/02
   w==;
X-CSE-ConnectionGUID: SK3usHv3S/CJKOqKOqdGhA==
X-CSE-MsgGUID: v13QLwd+ROCFCCwSSW7leA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1260501"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1260501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:11:20 -0700
X-CSE-ConnectionGUID: gYnR4aIuQ7iVEe18Dq+OyQ==
X-CSE-MsgGUID: qDfRhGpQT0GtCHDjV1VxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3237307"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2026 15:11:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJeWi-00000000Q8g-0cz0;
	Wed, 21 Oct 2026 22:11:16 +0000
Date: Thu, 22 Oct 2026 06:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:venus-8996-vmem 21/173]
 drivers/media/platform/qcom/venus/core.c:436:45: warning: diagnostic behavior
 may be improved by adding the 'format(printf, 2, 3)' attribute to the
 declaration of 'venus_fwtrace_add'
Message-ID: <202610220601.FUv6hw4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/lumag/msm venus-8996-vmem
head:   4dff7b31dd13e97b8f7abab7bc115d2875afd5e8
commit: 1c74759d645846cbcdd7907ffae600567bfdb220 [21/173] DEBUG: media: venus: trace firmware messages and HFI commands
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261022/202610220601.FUv6hw4D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220601.FUv6hw4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220601.FUv6hw4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/core.c:436:45: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'venus_fwtrace_add' [-Wmissing-format-attribute]
     436 |         vsnprintf(e->msg, sizeof(e->msg), fmt, args);
         |                                                    ^
   drivers/media/platform/qcom/venus/core.h:50:6: note: 'venus_fwtrace_add' declared here
      50 | void venus_fwtrace_add(struct venus_core *core, const char *fmt, ...);
         |      ^
   1 warning generated.


vim +436 drivers/media/platform/qcom/venus/core.c

   423	
   424	void venus_fwtrace_add(struct venus_core *core, const char *fmt, ...)
   425	{
   426		struct venus_fwtrace_entry *e;
   427		unsigned long flags;
   428		va_list args;
   429	
   430		spin_lock_irqsave(&core->fwtrace_lock, flags);
   431	
   432		e = &core->fwtrace[core->fwtrace_head];
   433		e->ts = local_clock();
   434	
   435		va_start(args, fmt);
 > 436		vsnprintf(e->msg, sizeof(e->msg), fmt, args);
   437		va_end(args);
   438	
   439		core->fwtrace_head++;
   440		if (core->fwtrace_head == VENUS_FWTRACE_ENTRIES) {
   441			core->fwtrace_head = 0;
   442			core->fwtrace_wrapped = true;
   443		}
   444	
   445		spin_unlock_irqrestore(&core->fwtrace_lock, flags);
   446	}
   447	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
