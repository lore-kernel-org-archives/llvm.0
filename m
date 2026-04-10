Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF9E55A;
	Fri, 10 Apr 2026 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797594; cv=none; b=tIaTi8psBRkpbS6oIYeSLIPWc1zrhMHjepitlJou5Aj4nf8T+uvUHaorAngT/7gaH76w8y+gMUKW9QGSNZKdqQD7o7fp629VVBv4QZ+giqKwWSpImYkS18lQ061cCWoqvi+yn6flL4PExws4JU0ioyG8/yFyqUC7ZfGAzafprjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797594; c=relaxed/simple;
	bh=7qALxRKi2e0uSsf8HKfczRKPBkPA5JI+TrvAxAnwOUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nrYg7snMdZdP+ELu1qIUqrAeBcCQa/j1BTlR01lz7KPt96mGXLx81aeWpxzFsc2AfI2QzXd+vajK/99DhnrcG6T0dyAK2S3N0rfzP44pwk9w5z8JHC2RVQUUWzS+MmQCBT4xLkpNz4F3vcbY8EvaFPGbBcBdrVk5qZXl8qhEaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DD/EKR2S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DD/EKR2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775797592; x=1807333592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qALxRKi2e0uSsf8HKfczRKPBkPA5JI+TrvAxAnwOUI=;
  b=DD/EKR2SKVqpKMP/r2yPgNU0BMRzzo4m/oy0GanVnoMQLv2bQ2Uusy3i
   1fnt6FVEJIQo+uO1mJtuM9WklV9eCXC9qmcv5I7jMFLgN/vCQJX71IsyE
   u71SEyDePU3Z12DXX4m4BLFViTF89IJRBbtf8z48OBIvNg+2j4W276eh6
   j0aHcCpfpaWMYxW/qpzRBfwT6DPg4kNwLm0qjr+D0/h7uFx7us4FpnZ57
   OIhbn/0luZwu1ajvC39jj9tsbFC7YwodmkzkJAe1EJUw1RJZY5CRX5gk+
   ujuIT5pxVpGR90CHq7/8NopJTWxu2TCSrsiPhj0l0MKOzkWpd7m+9Hi7o
   g==;
X-CSE-ConnectionGUID: J/rqXSdZTLiApQhbHyKNZg==
X-CSE-MsgGUID: 2C7x6NlpQumj+GNkYGAQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76704586"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="76704586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:06:32 -0700
X-CSE-ConnectionGUID: yRRaOUrhS/+3mE5EI7ULGA==
X-CSE-MsgGUID: io+qkzyKTcOJV0uMjVco9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="266955122"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2026 22:06:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB44Z-000000000U2-37Qg;
	Fri, 10 Apr 2026 05:06:27 +0000
Date: Fri, 10 Apr 2026 13:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:remap_tile_ys_64 16/30]
 drivers/gpu/drm/i915/display/intel_fb.c:1904:3: warning: variable
 'plane_size' is uninitialized when used here
Message-ID: <202604091149.n5nJiAZm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/vsyrjala/linux.git remap_tile_ys_64
head:   9a8f5dc5c6e5da24a2df0e93fda770ab217b0886
commit: 03377854bbe51bfb4501ffb15cccc6b45ac74764 [16/30] drm/i915/vma: Add alignment_pad support for rotated views
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260409/202604091149.n5nJiAZm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604091149.n5nJiAZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604091149.n5nJiAZm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_fb.c:1904:3: warning: variable 'plane_size' is uninitialized when used here [-Wuninitialized]
    1904 |                 plane_size += rot_info->plane[i].dst_stride * rot_info->plane[i].width;
         |                 ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fb.c:1902:26: note: initialize the variable 'plane_size' to silence this warning
    1902 |                 unsigned int plane_size;
         |                                        ^
         |                                         = 0
   1 warning generated.


vim +/plane_size +1904 drivers/gpu/drm/i915/display/intel_fb.c

  1895	
  1896	unsigned int intel_rotation_info_size(const struct intel_rotation_info *rot_info)
  1897	{
  1898		unsigned int size = 0;
  1899		int i;
  1900	
  1901		for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++) {
  1902			unsigned int plane_size;
  1903	
> 1904			plane_size += rot_info->plane[i].dst_stride * rot_info->plane[i].width;
  1905	
  1906			if (plane_size == 0)
  1907				continue;
  1908	
  1909			if (rot_info->plane_alignment)
  1910				size = ALIGN(size, rot_info->plane_alignment);
  1911	
  1912			size += plane_size;
  1913		}
  1914	
  1915		return size;
  1916	}
  1917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
