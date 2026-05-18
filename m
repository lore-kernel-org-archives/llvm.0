Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA682853E9;
	Mon, 18 May 2026 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136310; cv=none; b=SOtvS0FH9tmKDWC4iHhXud8b33iWR8Yb1lczUtLThIoyh5Fo99lKLxhZYBicfftMxo9XFCA8HvthP2LnpyoQPbXTtWYRt7E/KI0WNA4lwWhqcp1eDbwpi5SJzxHzNyyeIME1MwpDjLXQdzbiTN/tCql53qXbnXdSXW8jWeSllpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136310; c=relaxed/simple;
	bh=DIvO4rBxkhaYNj1+q+RYLt36JnM10uB+yw3lWC5HpDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oU7BAyMjmCpylUICBdzRr5RHOJxJN2WeLju04zlpNnHIQKLX434jNgnTwGvucwV03FFXuOlTahPqdrZzXXIOxIvBdOR204YeZictbYFILhYOdawg6V8awDVZ5v5lo7Q4TqpqND/byBNcYi9U+fG21jloXfW5MJv+Y30sQv23hgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVk84O6d; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVk84O6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136309; x=1810672309;
  h=date:from:to:cc:subject:message-id;
  bh=DIvO4rBxkhaYNj1+q+RYLt36JnM10uB+yw3lWC5HpDk=;
  b=FVk84O6dBoEzIFbjKp8SCISc3WpefSB7+5PSF3A8wxv1f1pZ4FAuk6K9
   mH3bmH8OV6N4YDw+0efMQ8KYBlPzU180z17qJkAycP3iMA1k+7iXEqvXf
   RMq7hTJugSuDfnHH4C9+XBKTD0JnzziAC65dXHs1wZxRbSEaksh4tjIU2
   Wym4IV/5rbCsujZ/erVlZRCJWBcKSNuPHKJCEa/fPf7y+Hk0dANiUDwXi
   6aDwYCk3jM2Buxb2KkWimeaFxVN1kM2Tkxuap6P583H0HBXV7MX3horvN
   eQoTh4Ik61ioREGEHX7XLQGMtVJhek7yoshZFRfik/IVWPe4H84UIWzMs
   A==;
X-CSE-ConnectionGUID: BU5FsDFlSYuTpCvSOqEYKA==
X-CSE-MsgGUID: edruOQoJSIOvHi3vQcQi+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80035055"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80035055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:31:49 -0700
X-CSE-ConnectionGUID: m7Evzo/OR2qezqoPs+OJqw==
X-CSE-MsgGUID: dxVWT+zfRciP4mCJPci8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233164459"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 13:31:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4cq-000000003N8-1JVP;
	Mon, 18 May 2026 20:31:44 +0000
Date: Tue, 19 May 2026 04:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Page <sam@bynar.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: fs/fuse/fuse.o: error: objtool: fuse_emit+0x7e6: unknown CFA
 base reg -1
Message-ID: <202605190427.XnIczptZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bf5d3da79c48e1df4bab82c9680c53adeff7820
commit: 51a8de6c50bf947c8f534cd73da4c8f0a13e7bed fuse: reject oversized dirents in page cache
date:   4 weeks ago
config: x86_64-buildonly-randconfig-003-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190427.XnIczptZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190427.XnIczptZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 51a8de6c50bf ("fuse: reject oversized dirents in page cache")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190427.XnIczptZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/fuse/fuse.o: warning: objtool: fuse_emit+0x7ed: undefined stack state
>> fs/fuse/fuse.o: error: objtool: fuse_emit+0x7e6: unknown CFA base reg -1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
