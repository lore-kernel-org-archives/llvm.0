Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB784FCE;
	Fri, 19 Apr 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547298; cv=none; b=LozMnLkwus/7a59E76DMMqsX3mLI5Nk/cO3u1HCMn1j48qVQgQFxrCzQxOiso8b/RVaCJ50NTjdJJHHX7huMdHhWyRF4tpBPi9WoI894ehLEn7IIledAkk5st8QnPII29jy4DUD3K31c63S/I6JwRaYbeVF0ZPfyk+bIFCCRFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547298; c=relaxed/simple;
	bh=K/WcS0sIVwmm8eOY3xJGuQIRvwltHr+29qsLGxDEmZM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwJzGj4UZNbMF1qm2pEqU1VBz9o9mlPfbhre/sG+8Ygkb+i/bjsT8bOGvtSg2vxF1yGzamixGZL/qSBaHEjvVSIuAbDvTQvCgfuVfdpnEvuvTw8LkuTfh8BuNS/+epsvpxJF2MNex5rPr6SqIyTkyajUK6LDLLqdwzdlEbPGypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7M5oD2t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7M5oD2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713547297; x=1745083297;
  h=date:from:cc:subject:message-id:mime-version;
  bh=K/WcS0sIVwmm8eOY3xJGuQIRvwltHr+29qsLGxDEmZM=;
  b=j7M5oD2tily2knA2GIHwypZhIJ9BYiDBFKnjeupFizbgwjiWp8ALze5+
   3/m61x/h8vlL1jTj0JE87eB3HS76Ta00iVqf1gjzyp7JGqsV1rTWnAoQL
   218lFc7NTbmGhb6QnJZ3/h0YAbrlZaxezd9GG5m1nqTETrq+1HnjD3sv0
   Zf6vVoH7MlEQJMHuWRqLCS08Foy9wNyiV8TjK9Le8MIi4Es8s9Yd8owB9
   /qsbg11rmTJDncmafMaMv7q7Z0KBmnL8ROkhEbhnJnxbrN+e4Zv8vb3zx
   FuVaixJZXMCS0UerwOzqdtt6huCeNJSVlxlXINLdQGpMXKSuDRa92O8AD
   Q==;
X-CSE-ConnectionGUID: IWXsC0LxQM+Syt+a+vOyeg==
X-CSE-MsgGUID: 0icq4lXUQuW0B9dhnTZfzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26675887"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="26675887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 10:21:36 -0700
X-CSE-ConnectionGUID: GCiqD8/KSB2nesfhLc+mgA==
X-CSE-MsgGUID: obgfAmMqQn+H0EHgSOGGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="27849019"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Apr 2024 10:21:35 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxrvY-000ALo-2e;
	Fri, 19 Apr 2024 17:21:32 +0000
Date: Sat, 20 Apr 2024 01:21:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jfern:sched/dlserver.update_h_nr 9790/30000] clang: error:
 unsupported option '-mhard-float' for target 'x86_64-linux-gnu'
Message-ID: <202404200101.G1qe0YI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Guenter Roeck <linux@roeck-us.net>
CC: Drew Davenport <ddavenport@chromium.org>
CC: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.update_h_nr
head:   4e843586ff1b3b77e5244d0128facac6330490a4
commit: 1e40ce02c2fbc0ac783bc9c38e5e678e2fe56f51 [9790/30000] BACKPORT/UPSTREAM: drm/amd/display: Enable building new display engine with KCOV enabled
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404200101.G1qe0YI3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200101.G1qe0YI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200101.G1qe0YI3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unsupported option '-mhard-float' for target 'x86_64-linux-gnu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
