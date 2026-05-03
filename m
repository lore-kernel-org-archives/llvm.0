Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D425228C;
	Sun,  3 May 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831889; cv=none; b=PyoKxoM3+lakP/6aYksJs5ZFoX+0/99hZQRK2eOrD+8GG6YisPr3qOENYjjuQqwu39hJjMrDJM9riURfnhkwl5WWSXmpjwkYaZXNMkBHsCed2ZZY1R9pWDA68LLaRsYDJ3mltyiv58n3a9hITOefr4kYHt8d46lE35Tcff/yPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831889; c=relaxed/simple;
	bh=4q6I9e3Av6crWZjQ2DlKiCmPBoA6w8DE0MNxb9bX9Bs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YG7/HMD5UQEjt3kdmLQGdYAZwS/V97fTcsIP+A0cOcoa6T7gCdT+MLZnBK1sNMGTyzPM50gGNr7gfmgHspSok7NvPjHE6wRQIBPVip+Bk7g3Wzk1N6OO/GOUUk4SiWZ+NLa4+OszdidwD7kNRyXKFFaJTWhr/NqQ15WqYQ/4LeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWdW+5ir; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWdW+5ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777831887; x=1809367887;
  h=date:from:to:cc:subject:message-id;
  bh=4q6I9e3Av6crWZjQ2DlKiCmPBoA6w8DE0MNxb9bX9Bs=;
  b=lWdW+5irXi9ciE1VVKtKTDMsiNn9s6pS0m+l1SRGwGlhbQFA+E0P7Z2F
   C2mnQSbXI77a6L1Z5gs747/sK/hD47r1eJ+cRp9KwQ+id04335fKatFlX
   miRQxmDZtTN21AI0lBtrkVweQiMogziqC4R7GW/ZW/zzin+hz8zMF0DL1
   r3Lm90BUjLmVNmXdugCM3X0GE/4/gez7MmiQqmM+o+8l0Hh2s1wd5IfR0
   n/j91NwfyoavYiE1uMfGoGXy8tDCAAgKsDdCRMp0hejZpIIuKcqtpu0XS
   tzbEJIs6EeYLX2lXrnmYe/u/5PQkVHRv/MmMxeKsd7ih9883zSlIoE+dN
   g==;
X-CSE-ConnectionGUID: OBZdV9fIQuGxbiId0OB/9g==
X-CSE-MsgGUID: CGhu7up0Tw+9xFJiiQRQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90084917"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="90084917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 11:11:26 -0700
X-CSE-ConnectionGUID: 5Ou1Rmr/QbuobE8hsX106w==
X-CSE-MsgGUID: HiGf7v3/Q1y+wvgNZ5PiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="273442057"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 May 2026 11:11:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJbHX-000000002qv-3jiG;
	Sun, 03 May 2026 18:11:12 +0000
Date: Mon, 04 May 2026 02:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 14/56] Warning: fs/nfsd/export.c:579
 Cannot find identifier on line:
Message-ID: <202605040126.wqshRbp4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   22ca5f8e836e43f49c9b622f60e7ee48012a81c3
commit: e294087f9d1b3fe2cf7d8522bdc58d9d0662cf7e [14/56] nfsd: add netlink upcall for the svc_export cache
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040126.wqshRbp4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040126.wqshRbp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040126.wqshRbp4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/export.c:579 Cannot find identifier on line:
    * @cd: cache_detail for the svc_export cache
   Warning: fs/nfsd/export.c:580 Cannot find identifier on line:
    * @attr: nested attribute containing svc-export fields
   Warning: fs/nfsd/export.c:581 Cannot find identifier on line:
    *
>> Warning: fs/nfsd/export.c:582 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Parses one svc-export entry from a netlink message and updates the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
