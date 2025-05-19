Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D2D286D5B;
	Mon, 19 May 2025 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670746; cv=none; b=WmmRDthLdBFRCTarZ+oqIvJerpkUit4C+1AjaU5GrFR1i4aNKKuhMZI4HmXMS8AtAJum90Z7GH8PNXd9HO4I2kgTmNdmJpavqjZg/sdeY/gygbJaLp95MlQm9Ld0FVNr+Z5ZoqhDvW5JuFPZm7q1/LeadnxBX+2k8l1X5gXjntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670746; c=relaxed/simple;
	bh=j6LrhynBriEIEOM31aj6upsDjL4WZLxrFv6SIjc7gTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGH6Tg4b9XcIAZYk1VQoO2M42mJq4fCqFp5tYrxi9MQrVaHt+YZ2GviOUKtCbvvv+tOGo40/RhtviYXwpQ3nSyxUUsdUEXkb7KLvDI4rAhkQZeaCWsRQuJsXZxNBra8JUFFzluXry60m32WBpOKI8repJSLyUzAEuu2uPny/BR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b50xp92U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b50xp92U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747670746; x=1779206746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6LrhynBriEIEOM31aj6upsDjL4WZLxrFv6SIjc7gTc=;
  b=b50xp92UvbaTmFGLuz3+ik0GN1l3SugZc0ss6knuiUxnu1HTYOR1/BR9
   OANIcgOqNoFjmzPTnBql/D4wwXo02pOV04f/wLqn98o6mqjMvlW1cj7vq
   HB3xe8kUaJ2jwgs81Gu6EartdGTHT5drsB4bpnN3ZqNh2/2ZxGAdT/HvD
   OJ7wog4NU91K+AkCcMMZ0WQb0dr3mUlgajm5dHWjrY8sDsZAMEP4/sqZq
   39v1uDQzdxg9tjTDozZDO1qq5TAB8Ue6ZEh/mCRL7SOsRS8Ln6YDjtSCz
   6Cjoy/gbP5XpooY+q3Lwv0pVssbtfIsa0c7Cb9kdJ7kWdLiDLPz1gWfjE
   w==;
X-CSE-ConnectionGUID: lM4voMGZQpi/DEoeFfUq8Q==
X-CSE-MsgGUID: LvBelSaET+e0GB/EKSe7SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49641260"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49641260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 09:05:45 -0700
X-CSE-ConnectionGUID: ui3suAEoQdmyc/xXRduu6g==
X-CSE-MsgGUID: l+3aSDPNSSyiwWab3YMI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144410141"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 09:05:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH2zl-000Leo-06;
	Mon, 19 May 2025 16:05:41 +0000
Date: Tue, 20 May 2025 00:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 7/7] fs/f2fs/file.c:41:9: warning: variable
 'end' set but not used
Message-ID: <202505192317.v8BHsr1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   e016c01f389556a6ba04208719f95895cf5a5a6c
commit: e016c01f389556a6ba04208719f95895cf5a5a6c [7/7] f2fs: fix to zero post-eof page
config: arm-randconfig-001-20250519 (https://download.01.org/0day-ci/archive/20250519/202505192317.v8BHsr1M-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192317.v8BHsr1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192317.v8BHsr1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/file.c:41:9: warning: variable 'end' set but not used [-Wunused-but-set-variable]
      41 |         loff_t end;
         |                ^
   1 warning generated.


vim +/end +41 fs/f2fs/file.c

    37	
    38	static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
    39	{
    40		loff_t old_size = i_size_read(inode);
  > 41		loff_t end;
    42	
    43		if (new_size < old_size)
    44			return;
    45	
    46		end = min(new_size, round_up(old_size, PAGE_SIZE));
    47		truncate_pagecache(inode, old_size);
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
