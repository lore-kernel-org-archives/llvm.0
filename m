Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E16EACD;
	Sat,  4 Jan 2025 01:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735952566; cv=none; b=ILXhgz9ua88li/Sj5TB2cVesT0pZj0U+D+uS3Z9AbriVDbrS5qTzKafvbabHhmaNPEJhp8PrYWEvQd29fkaPQJRSb4d0L6OY/5R4IuKX0DjDxX1dv4tX+72IFtB7p7wKJDY1z7Ix7yO5LBA6IZ8rrqjjXsJ4kmkLu1OG96X27G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735952566; c=relaxed/simple;
	bh=Hnh8GuCNyfD+Dw+Yv/9qx5bQCxpD86/U6R7J7En508I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PY+Gleh9UN/2m4ayC7nGoj8EljVpDqCXI9FoysYMkJnj2oAmeh/ndHab87IvdJqzgb5/W6qr7eyPgqkFVttaZ2qybm3/dCDOSdApxqoL6q3PNcF5v8T1JQii40pIAzwi+hbO2Z7Z1cMUhGcZ1EHO468sYuUwCNPM84k/DMlmMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krlNpRKN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krlNpRKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735952565; x=1767488565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hnh8GuCNyfD+Dw+Yv/9qx5bQCxpD86/U6R7J7En508I=;
  b=krlNpRKN+5SpqILA/CiZ9PNVsOfIF/OxuUf/d7j3vBdo4UaRE1kNntu9
   wrjjczgGmCscoNGjqNXBTOnxWiLZ66RVKls8nj5YGOyJE3Y650FM68gN4
   oykRpNjqh86uPPkEk8/8ydJ0LQC7rjnyiIXCBU8LJiboUZ0LNlgeERrnK
   gn3BB9w0FG6PYD+Ds9+ZrlirC+5GCMfclvR0Ry9GKUJCuf0BaCILD0NTy
   WKdhyutedCx1VzyQ6WpZbxwedZQPEFj1xKs0A3WTXP7AgQHWIngdRqs4c
   G5OayDH7my8Fj8ijdZTkv+7tknxOn6mimbyOGSEGCv7BcNjUO6IakUP6L
   g==;
X-CSE-ConnectionGUID: bgswQxw1RWeT7IyexhfiOw==
X-CSE-MsgGUID: 6uxtvdHPQ8GopKfdAGvLTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39880311"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="39880311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 17:02:44 -0800
X-CSE-ConnectionGUID: QtrSHolvTAupv85kSBX4nQ==
X-CSE-MsgGUID: gwDjd/5CSUy9VR+gkS8XAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106547411"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 17:02:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTsYl-000AUz-20;
	Sat, 04 Jan 2025 01:02:35 +0000
Date: Sat, 4 Jan 2025 09:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: ld.lld: error: unknown argument '-dp'
Message-ID: <202501040821.p93bghd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: dd3a7ee91e0ce0b03d22e974a79e8247cc99959b hardening: Adjust dependencies in selection of MODVERSIONS
date:   3 months ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250104/202501040821.p93bghd8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040821.p93bghd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040821.p93bghd8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown argument '-dp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
