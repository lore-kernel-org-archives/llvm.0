Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248723507B;
	Tue, 23 Jun 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227826; cv=none; b=YBN2AvvHDdY6+8zSDtMU0kTgpJZl1BTiDZhPXTrzL+fNgXXa4/RI9CWuvNpThIx+0vDeJh6DXXvZW0SZyuisKa6+4oebn2oHuiT6nTuuGWgALk4wv4CVPZHs5nzga//ViD8KlCTkVQgl2yVrFfQ9NXC6bmA53d73zNsNyVlf2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227826; c=relaxed/simple;
	bh=SwoA2VnGoTeYBh/oI0BZbWlLPzh5X0vEKDts/rP0ebg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=naHMuvpMOF5X0KI3IoyD7OEAAJUZDwHKQV4DqROT/TgtcMWACwrWyZPpMspFbFG09i9ocgpOYW1+pwpf0hOIaGd1lbBoWi7warxbtybr2GZkbVd0qQ5NCA0jtK44TvU3u0d5p4kLVWrYTc6tebWYe6WSOQnPtv4Dgut1sUXQ1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz3T8dBv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz3T8dBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782227825; x=1813763825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwoA2VnGoTeYBh/oI0BZbWlLPzh5X0vEKDts/rP0ebg=;
  b=cz3T8dBvxuee54Y4MMCUs8QiyN5wRQ4BY9X5yxmMymS97NnsIpv+lyle
   7TX/GiF8ET9J2jlA/ffU0YO6gZXzOuzjbPpjIkcJn1qFeuhPG1vvi5LIy
   n2lvsbM/HJmXWN5lYITO8yeHPk7Mm4aMoBmGdTvOx3dth0KCnjRrr+VSX
   e7Iuto899ofqhecZE7yF/k+jhX3uINUrLoI2GGqaHOT7EnMo68qL5/OOK
   OPl+MKb4ule4MdPBE9AOEBM6Y5raPdJNZ6juMp+DpSzvlBTb79omjxjIm
   MZVj97S6EGMqFmZYgaDDReatvNpYHY0qzNUa7pL+D/TAAsRYLBvqcMnBp
   g==;
X-CSE-ConnectionGUID: n2ziPJevRPab1o8VgFv9BA==
X-CSE-MsgGUID: opyMqjPiQxSLK9Wh9CvTvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82081470"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82081470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 08:17:04 -0700
X-CSE-ConnectionGUID: 5mTdZON/SoCtNny7npEaCQ==
X-CSE-MsgGUID: uRZgNEUbT+KBPgyAxHOgyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245177078"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 08:17:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc2rt-000000002dN-1gpj;
	Tue, 23 Jun 2026 15:16:55 +0000
Date: Tue, 23 Jun 2026 23:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
Message-ID: <202606232356.gwHMAJAW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Mikhail,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: 14682de8ad377bf13ea66e47c26dcfea0b19a21d [14191/14955] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
config: x86_64-randconfig-006 (https://download.01.org/0day-ci/archive/20260623/202606232356.gwHMAJAW-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232356.gwHMAJAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232356.gwHMAJAW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
