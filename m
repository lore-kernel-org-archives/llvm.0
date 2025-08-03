Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA51373;
	Sun,  3 Aug 2025 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754257343; cv=none; b=eLSADo8iktGpAT9E5140YU5Xahu0eOlb9/1vUWXHNzPK1ptROlAsMvCwGQg/NuUDFTWbMKb240eld8XcMEs8DVlKMj+7Qj1sNSCSDPJ8IT0JC2u8UEmm/QfdmzaqZ/qJFXi1MNVkXtOYXSjcK9ol9cc5PtDs3cnUQBGxwMeEX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754257343; c=relaxed/simple;
	bh=+TbHSCSAdP8ag1eZBKZvE63e4I+IMgiH09Xk7R0wyAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVz5ersyu23gF9iLAcbMbvAPmgsOmYxajkyNjtgMZy1WvaenwYh9oEQoomXHDcJ5BN61iwdduGmsAk6vferXsB8wPPxRe/JocRPTRPROxID2uPaIKv/2zIpJy31vWEPrpZFdO7mZa9PgHYgSHO28LpttlKgpXjyzORVlrg1FACE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYtjUMIF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYtjUMIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754257342; x=1785793342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+TbHSCSAdP8ag1eZBKZvE63e4I+IMgiH09Xk7R0wyAA=;
  b=IYtjUMIF17bvu1+v84PdNtI0UdaGZbOCXQQATCP5s+wqmuJXkqDomxIv
   1UGdN+n/v5f+EuZVMhxj5WS62CaCPWkB1YIN8lTXsi5SmJQO7DxlQEt/7
   BYwInlC90j88sGTSZ6Le1DBD99NvPo+1yPZpQxMd7hJwRQao0zoZyt92x
   Vmh6hoe56A14w4fbrGp5ZPZhDBEyGLIy42bidhLvbVtefBYapwfL1+vJd
   Hqe90UBjCEK+Elk+8WGZXf63O6qQoSFrxAXU6YODt74unl0aASXyoU5pl
   HySlOJS+/hJg8mpCsUzAHOPotAhu6CxlyOGfEBr+4LYSe6NAIBr4IZfBo
   Q==;
X-CSE-ConnectionGUID: XP85db1NQmeNOJxA+/3YDg==
X-CSE-MsgGUID: 5u+gz0lRRmKmp9O0KTDaiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79069590"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79069590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:42:22 -0700
X-CSE-ConnectionGUID: vWYbkFnrScG2aSBHu3NQNQ==
X-CSE-MsgGUID: q2w1trIvQaWVAHUn6uHm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164395275"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2025 14:42:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigTC-0006eM-0v;
	Sun, 03 Aug 2025 21:42:18 +0000
Date: Mon, 4 Aug 2025 05:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 26/30] ERROR: modpost: "nfsd_handle_dir_event"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202508040511.tcvSxxhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   2f82eb2efda91bd165a7ecd28e694b2847c4a1fe
commit: 2a1bc3e8159a874a1979137f0685a62d67ddb708 [26/30] nfsd: add notification handlers for dir events
config: arm64-randconfig-004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040511.tcvSxxhS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040511.tcvSxxhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040511.tcvSxxhS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
