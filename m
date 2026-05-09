Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6A2AEE4;
	Sat,  9 May 2026 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285980; cv=none; b=hjZ54dZefnWqVS+86gwxYvDiLRYPFZ5wQ+s4JhLK8MqDkDCPUGI3KtpN8buzK97IdZnxyglYOtEwxlQp4BNqGqf4QwRHhBLK0sTEXZ8RgrV2PT1zACuVzwGHxSQGEQdQLZ0zad4xMF7IU3R+N2IfTdmuhgYSDavaAGkDJvPYOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285980; c=relaxed/simple;
	bh=Tmj0FFTkLIPAVG2fa6nYY2zql4qjjtdvgY0TA0+/xBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HUztE+2lRh3O82X/se7zMslHnELnL++GTtGEldO2RNMkgtUyq3V2lr2dW8DCeA/U/5zRJDPda66lU78CDMcsCuZxUjlDzwmbeKucEcwnaKRCgBByXOsE+FLXDE3ojKtQxemud1hM+ZaSEuKiHww/OT1UXCPrmovQoswc8NwtM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgHqBM1R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgHqBM1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778285979; x=1809821979;
  h=date:from:to:cc:subject:message-id;
  bh=Tmj0FFTkLIPAVG2fa6nYY2zql4qjjtdvgY0TA0+/xBc=;
  b=XgHqBM1RgZPVlLGfKCf/CE/6BKFUSHxgLec70wAT4oPrUNoHTh2q0q4N
   x7msuH9tcAs26SZODTDouJ1mpSBF5LjynWS1Ds2Pz23P8D9CPrWZr3BYc
   T9P+2aU50aCa1hU1NnEPmjuR8T53HWU6zfiifpbOubckYgnPZsA4RhMoK
   fSvKWNx+HAvPlIoEWCtfrMjsM0vxfi9kYf/jihHqqVnWr+Nhi0g0Ga8At
   rqBJjQoFRkREgQSTXpowQAmo7JT0phWLBdeH/X9TL8HMUs2k9T/9Ul3S7
   7difBBc0zsYZk4VZeMYw9jN7w1UMkvKANVySpYQ5WYcBSmMNWE4u5i3cH
   Q==;
X-CSE-ConnectionGUID: 3P9RiuetSsK6US+mxshlsg==
X-CSE-MsgGUID: bIuzDZyqTmmr/7cbvljnCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79369910"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79369910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 17:19:38 -0700
X-CSE-ConnectionGUID: hOLdUJpxSlS1iuq0YF+wbg==
X-CSE-MsgGUID: ExahxVKaTheB8ifmGK5xmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232397039"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 17:19:37 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLVPq-000000000Xt-3Hik;
	Sat, 09 May 2026 00:19:34 +0000
Date: Sat, 09 May 2026 08:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 8/13] io_uring/slot.h:30:19: error:
 cannot combine with previous 'int' declaration specifier
Message-ID: <202605090837.5tCQXf1J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   2bbc5f014e3a6c148a49af38c5f288ee510ca57b
commit: d73e59bdb078d19dd428654188e537c2fca735f3 [8/13] io_uring: add registered IO slot infrastructure
config: arm64-randconfig-001-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090837.5tCQXf1J-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090837.5tCQXf1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090837.5tCQXf1J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:80:
>> io_uring/slot.h:30:19: error: cannot combine with previous 'int' declaration specifier
   static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
                     ^
   1 error generated.
--
   In file included from io_uring/rw.c:26:
>> io_uring/slot.h:30:19: error: cannot combine with previous 'int' declaration specifier
   static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
                     ^
   io_uring/rw.c:1265:10: error: call to undeclared function 'io_slot_iopoll'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return io_slot_iopoll(req, iob, poll_flags);
                          ^
   io_uring/rw.c:1265:10: note: did you mean 'io_do_iopoll'?
   io_uring/io_uring.h:202:5: note: 'io_do_iopoll' declared here
   int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin);
       ^
   2 errors generated.


vim +/int +30 io_uring/slot.h

    29	
  > 30	static inline int int io_unregister_io_slot(struct io_ring_ctx *ctx, void __user *arg)
    31	{
    32		return -EOPNOTSUPP;
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
