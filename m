Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F00E555;
	Sat, 29 Mar 2025 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743231834; cv=none; b=JOE3FVQ0y8Z2grkgOb9TtfxbYJrP6uljavM8S6GBHzjRcP8PjETCbNlcq1mRbs5KgzKECtmor0jD2Vl4O0WnucLizjOHmSixhrDZ+e3QOGUPD7v0O32Oo16OOQJNyB7XKsHDFlakd3XaXDGMiqGi9K1jJKbL6CZwuLrGwVglDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743231834; c=relaxed/simple;
	bh=rqfJswbHQrJnw5jCcWbXV+ueFfs00M2/FmVJ995d2Pw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dC4YsVaM3pKa1jtAC1/y7iRnaGjJOVwwFlBYTweh68H5GZQQ8a9/tRniUQ92fnlzKdl38vz/RjJLiNclIZISKzyjwKqLGI3NCJv7cMd7z7hFs8WjEts16aqV4qkpB/z9sm93uxNq9CGwuUyk8kVRrmIsVgvqwBXUqBLBHnIK3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsPuZkyN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsPuZkyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743231833; x=1774767833;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rqfJswbHQrJnw5jCcWbXV+ueFfs00M2/FmVJ995d2Pw=;
  b=bsPuZkyNKjt7fje7Jr8lDaul6XQP4ff7KsDcZHDfxEYtpl0uH+/hn8eZ
   DtlpAAhQJHQ24Pt3HWPTYUaFWj7L/8UJcFJpc9Uc2zXErNx7OIR/hP4X0
   81DgUzjtPLLN2rUKZbyzPonf4R+JV7o5OsOGog6ezFzCxL/tSu8wqUk4i
   xP14mY+H3+8XWrAkz1cNscNLihlRZt0D7QHpBzlnXn6oCJ9LN3a+ObbMz
   k+ipN/ksWT6NhT6AcMUrZt/KsTz+buiT1HMm0r4fLxqtAfN0c8w0kUJN2
   1GBkiLIkNKM6yh362IFeWqF0e0BM/KX8h4fRLIDUmL+U1hEEvk+MsPl1y
   g==;
X-CSE-ConnectionGUID: TVzY+WEGRdqffREOV0aOVA==
X-CSE-MsgGUID: nOfHf7UtQd+mvuSk3Pb15g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44722186"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44722186"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 00:03:52 -0700
X-CSE-ConnectionGUID: zJcHVMzaSGyNf/RealDfyQ==
X-CSE-MsgGUID: wdOiTJpLTpi5qoN9L4Bwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="156629448"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Mar 2025 00:03:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyQEP-0007xW-0E;
	Sat, 29 Mar 2025 07:03:49 +0000
Date: Sat, 29 Mar 2025 15:03:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: call to __read_overflow marked "dontcall-error":
 detected read beyond size of object (1st parameter)
Message-ID: <202503291426.N804kLMq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d06015d936c861160803e020f68f413b5c3cd9d
commit: d70da12453ac3797e0c54884305ccc894e8c817b hardening: Enable i386 FORTIFY_SOURCE on Clang 16+
date:   3 weeks ago
config: i386-randconfig-007-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291426.N804kLMq-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291426.N804kLMq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291426.N804kLMq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
