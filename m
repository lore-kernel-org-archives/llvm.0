Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F93C1987;
	Fri, 10 Apr 2026 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827727; cv=none; b=lLtunfwbudN+ncSwg72A0Li0VtQE7sCJtgAiWaOtYgkL23165BWYYxn/q4SB0qdqZA19yQi4W8avveXGDdnxZHHR7CU/eSYTqss7lwkvvkk2XW2rA/9t/5NSrEMite6z1vWUbc5yaatO5/it4+lxYOa9Ne1C/xmOuZm036Yp3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827727; c=relaxed/simple;
	bh=IJ8pn+Y4Ce/sFJWWyEUO+tHkvmgSteawUrYqdh6cVgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uo1kzjks/UGod6wYxM/fQUFpk8Wl6drZ3o75xKhcynpclA9SUc8SWMfy2pdCM+oIdhc4+G/t7/Hv1p3DFdECRmBiruVrCTf/CFi6wZYNuwrY5NFqRqVnoL2gVH1CUlOZOQ0WA6qfTNcbHrvaXjB5dI9XCbaIGw5DlWcrjU5Oksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VR2rQxn/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VR2rQxn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775827726; x=1807363726;
  h=date:from:to:cc:subject:message-id;
  bh=IJ8pn+Y4Ce/sFJWWyEUO+tHkvmgSteawUrYqdh6cVgM=;
  b=VR2rQxn/G18j0AtEy9p953YjVu8p0LpYHoUY/PpR+waTpEdr6tPqTfMP
   3yINvy1Q8IsTsI12dr+kvR2xnDvjbQay+927eT/SRwsBr1IB1POrtEuIL
   cyBhEQUt9hZA3xOx3MBv1rypcifoGIE+JM5nE0wwPeL4qEYLKcVC2Qe2A
   +45l3vN+xOWqPplg+spq3zlPWTdEc7YZtFdE2itAwSCP5+cA7WxNa6Vel
   iJXlS6htePYP/3Y4AsK39baEszrnNwb1cl2WldnI9oIXdj6jPd4BSbihH
   oL1x0H7WQFap/A+4CcUO2yIN8iP4oOqqHfGJc0xFIi9B/9xdzVuNL4LVE
   w==;
X-CSE-ConnectionGUID: Yki23wXqTX+yj07E0mkugA==
X-CSE-MsgGUID: vFCOMcVzQOuPaDcJd+CGtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724184"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76724184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:28:44 -0700
X-CSE-ConnectionGUID: bhshlMYtQEKKQyGn+Y1UUw==
X-CSE-MsgGUID: rtJVnKtrT8CRXWBkWrfIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230809254"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:28:41 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBBuZ-000000003m3-1Vfi;
	Fri, 10 Apr 2026 13:28:39 +0000
Date: Fri, 10 Apr 2026 21:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 93/115] ERROR: modpost:
 "__aeabi_ldivmod" [drivers/media/i2c/imx219.ko] undefined!
Message-ID: <202604102137.3ve9nLmE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ace2f872475ed78b708d667f1b2d004b192eeeb1
commit: e7e6aacc616a0a6f74793f3a4172d14a37ee432f [93/115] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
config: arm-randconfig-004-20260408 (https://download.01.org/0day-ci/archive/20260410/202604102137.3ve9nLmE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102137.3ve9nLmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102137.3ve9nLmE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/i2c/imx219.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
