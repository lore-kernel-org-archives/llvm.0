Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A918EAB;
	Thu, 20 Jun 2024 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718850135; cv=none; b=Ey1jA1Kpv63DMIgZlkWuZdkztJDfb4XoF65Dk5O9TBH33Y5IhhKg5R6RPA3vrN7mCxctx72JW4t3soNYQAj3aOguBsrRkXsUlpYJyWZ6KITnTQmzhU7SfFO1EOna1aL9Ns5lq4zjZE07B9ZV+2AKRml5oi8w9Yhx3SQ06RzYz0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718850135; c=relaxed/simple;
	bh=dKbEaKq1AAheLsSQ6WpmmhLpozL0m55WKntbANAb6To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bofwkCli7ADgKf16YRueP3HyydGVnMDOaC/+S96Az8pP1/VN58TI2pfddtiv7wfbSQatPqOicUcOODg2bCFsow6tbOOcYDu3fkkK/luC+ocriaVz/mDcFWdnekbhuZLW+TJJTFna195ILfGsi9kjMjP72pPbkJyfhFes/XH0Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jK+mmDZY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jK+mmDZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718850133; x=1750386133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKbEaKq1AAheLsSQ6WpmmhLpozL0m55WKntbANAb6To=;
  b=jK+mmDZY0V4t4ZRNnzXeJXaIBVqPFtCXEKt15fjYOBHu78ITx95ldyb0
   8PK12Ehk5nyZH2JWy4FP9+NW5bhwFxX2RMRUjx6QpRCmJqlDrmCV7TVLN
   3VFSLjEsBH0tFK0OTQGtNubQqCOm+/G7ogXC2cJfHxX0ZTmTdwMYOear7
   6QH8iLzgKvMu/kZmnh076TXAp/qDDX7IYy0bbJgTUfsxbKMQoSGPmnwXT
   k4Byv4N5IUS/SYUbBdgWdxY+v8JI1gKp5aVUyYgaHVX97E06axzrImJTB
   amygjQL5ZbBc48/kogo85nKXSizy8atHqKP2n136yQSJEAvnBmWpr956N
   Q==;
X-CSE-ConnectionGUID: 4bQ0difATL20207ovNOxNA==
X-CSE-MsgGUID: 4K8bUp32QqCP9w9N14/Pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16037601"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="16037601"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 19:22:10 -0700
X-CSE-ConnectionGUID: WYW8/UUrRDWF2kcTiWQZFg==
X-CSE-MsgGUID: KIssvq5RSy+5UXS564MQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42192106"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2024 19:22:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK7R8-0007Da-1w;
	Thu, 20 Jun 2024 02:22:06 +0000
Date: Thu, 20 Jun 2024 10:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next 804/888]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:371:20: error:
 unused function 'reverse_planes_order'
Message-ID: <202406201059.TfQMDQvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   1ecef5589320fd56af599b624d59c355d162ac7b
commit: 38e0c3df6dbd36e69d38f67853cdd1bb6110d05f [804/888] drm/amd/display: Move PRIMARY plane zpos higher
config: x86_64-buildonly-randconfig-001-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201059.TfQMDQvN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201059.TfQMDQvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201059.TfQMDQvN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:371:20: error: unused function 'reverse_planes_order' [-Werror,-Wunused-function]
     371 | static inline void reverse_planes_order(struct dc_surface_update *array_of_surface_update,
         |                    ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/reverse_planes_order +371 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

a85ba00538cd4b Nikola Cornij    2021-03-15  370  
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16 @371  static inline void reverse_planes_order(struct dc_surface_update *array_of_surface_update,
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  372  					int planes_count)
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  373  {
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  374  	int i, j;
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  375  
8866d62716c918 Jiapeng Chong    2023-03-09  376  	for (i = 0, j = planes_count - 1; i < j; i++, j--)
8866d62716c918 Jiapeng Chong    2023-03-09  377  		swap(array_of_surface_update[i], array_of_surface_update[j]);
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  378  }
bb46a6a9bab134 Rodrigo Siqueira 2023-02-16  379  

:::::: The code at line 371 was first introduced by commit
:::::: bb46a6a9bab134b9d15043ea8fa9d6c276e938b8 drm/amd/display: Ensure that planes are in the same order

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
