Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17573111D;
	Sat, 20 Jan 2024 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705726412; cv=none; b=bsxVPSVY1LNjfKCoAJTuQ9F/ZnJrCLBh3f4rsG5St3P/rNEzhjqYqMlwzK1a2zG5NC8uSeXJYvefjj5dcJZk3/RPQ8S9CJzAzXQ7i3/Xp9UFb6yeqw1YwuShJBPmorGaNhXC2d1s0S8e1JPjzWvDt6E2Dw1rnB47yVR/TRg6gDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705726412; c=relaxed/simple;
	bh=zX//mjTxJ/5WCGQzvVnZQlp8jq7pezVcRnEffyEPGuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avgB1L6ji8JiN2AOJZ0KgnfRVEV8sNkDp3MOfpaDpyP1V6rbsY6skmQ93I3QtC0cbpONrdxX1isWYrnwFavB5yFzd3Ib9I7uB4poBXhWLJzVIWaCYNvqnUjUXXW3mN3V2I56HyJV5fQCzRozq6EdUjpohVhIlk5yFFIyIwLaa1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJ2e3fwv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJ2e3fwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705726411; x=1737262411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zX//mjTxJ/5WCGQzvVnZQlp8jq7pezVcRnEffyEPGuo=;
  b=DJ2e3fwvC04gpg+SX3v53+GPuj610cLz5nfNq8w5Tdz6YPBKhke1zmAb
   PbkwV82M52BeIc96aFhKXguq/CdRl/xCSYsPAlcvGn5I4fejRvwxBBjyM
   RfqY98IsyzNsP21/TCJDE423aPr3F50COkHE8XFJHNoFGaUHmeUyZ5/r0
   mtbMEXTvq7SHWpGE9s/y43Yj7YVaSPjRHAbQngLwhrk50jAPlMgCFHydc
   nm/SrtqTKeG/K4f1YWbTMliYTRbN6NO0Q4qQzYAed4+P40UBUrUjExN/L
   28kz+WFCvD5fVTqgWSMKF5UOAcihG2X3ba3q7faDpnfCU2DMWqtit9SBz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="820992"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="820992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928558439"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="928558439"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 20:53:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR3MC-0004lI-2j;
	Sat, 20 Jan 2024 04:53:24 +0000
Date: Sat, 20 Jan 2024 12:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Fullway Wang <fullwaywang@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.misc 9/10] fs/romfs/storage.c:243:22: error: use of
 undeclared identifier 'buflen'
Message-ID: <202401201224.8iFVwFru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   31081ab305a184c2685e701ee1a8ca33b76bf7eb
commit: 530041d36e377a71958148b25b98ac217ff50419 [9/10] fs: romfs: Fix potential uninitialized memory leak
config: i386-buildonly-randconfig-003-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201224.8iFVwFru-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201224.8iFVwFru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201224.8iFVwFru-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/romfs/storage.c:243:22: error: use of undeclared identifier 'buflen'
     243 |         if (pos >= limit || buflen > limit - pos)
         |                             ^
   1 error generated.


vim +/buflen +243 fs/romfs/storage.c

   233	
   234	/*
   235	 * determine the length of a string in romfs
   236	 */
   237	ssize_t romfs_dev_strnlen(struct super_block *sb,
   238				  unsigned long pos, size_t maxlen)
   239	{
   240		size_t limit;
   241	
   242		limit = romfs_maxsize(sb);
 > 243		if (pos >= limit || buflen > limit - pos)
   244			return -EIO;
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
