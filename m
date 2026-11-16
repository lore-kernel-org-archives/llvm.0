Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870357;
	b=c/JN/+egB/ch1YuObsH9T4DjS0AkS0dC6jjoVLIOLZlYeLM1c+T+LpfDvJDRXUoUDmrq
	 4pDVsD5HETv71V6OfpSlhZ28kGLOJz0+lUQ3C/HH6PZUuk2EqjxLo3SFRcTuH2ZkW10Ex
	 YYYpZqip8TsaJtuBDrEYm0VCAYet/UbD3qtjo3SErqR8xhzziXElvjj9iE733+pwwtZ6I
	 digCbVFsgvjn4+oYT6pfT+G1FJpGPi75VJKN8O+lJD+Ohb5OQpJ1rUpRWeGZiLIBNmuS1
	 DkrafTbbmy2SMMl9WsShcKW7PuNBrzDszoJtWlCkXjfgrlH0WcPPjGu5Dh0mkK8E1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=v70xg3MePw1WT/rOwZRR83ryL3zUGhDPNSfpeolVv4E=;
	b=bvGnTFp2ZQGI1CdLGW16LQKFggp6bGv4W1NxgPMKckm2dQT79sYtK0iLOAOED6jXlxd6
	 xUlsbz3DcLMUENNckKEGz7VI/GnpLyTNTeIeN+I9hcOhXBKZtUc6QW3i06y6OzufWdmmn
	 Li2mVFqliHCKpSgdo+HGVf5UF9djL6sxWM6iomR+PcJQZwekQB6HVBOI9p+5aHdgps8ra
	 wzS36oHYOmwrbiErW+GsqUuU8hU4chEbMxJ0MN9jmbDSVJ2jvJl5N1V1fdDJIQe6gzc7w
	 CI1owcjggPLFRVcKquHlKf2VEL2appW21faJb5EEzBOIfharfR3ZvvSpJwgnbZAeHVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QG59by4f;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2DB606A323;
	Mon, 16 Nov 2026 23:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QG59by4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794870357; x=1826406357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kcQFXxnGkJ9oNAgHJPO9N2b/lV43VH+GcFEhMBJGoUI=;
  b=QG59by4fU9ZZRbwF3tZ+qnwPKFZIoVJdsuuANFhmhIiN4XHvMaY+ZfEL
   sw9Svk2940qDS+iSFVQgCXfEc51vFaDEnla1Jdwr+1xCLrpP+WnJGY5Hy
   kcCbENfH/otUQlFwGtO4aGdOd8XM6j/Gagj7BNoDP5tThTNTZsQF/kMnP
   iusFsq+3MJORHCNcXR9rYwGUvNUMiu8DVSEm6EOYsnn1Rx/kKgVu3oPbj
   VnGnXFWtzO1httI+7HXESV9Gs8UZtuA5XQO7eoeWJ9Hju5jB59xDfNsJi
   JRFSCaJg8I9aCqhrjAZCAgQDHBaBXAOKU+OoOxyHIJ7m1kS1ztzQvtTdL
   g==;
X-CSE-ConnectionGUID: t0txgg/aQa6h2d6Y0bX7gw==
X-CSE-MsgGUID: fmS+vI/JS7SriNM4KKm6qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3702944"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3702944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:05:55 -0800
X-CSE-ConnectionGUID: JOk2BLxRQkyDqAWtagEa9w==
X-CSE-MsgGUID: VefEQxsBRLOpbzW0P4yJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9843600"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 15:05:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT5lk-000000019aF-3rOx;
	Mon, 16 Nov 2026 23:05:48 +0000
Date: Tue, 17 Nov 2026 07:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 14/19] drm/amd/display: Restrict the dc directory root to
 DC-internal builds
Message-ID: <202611170620.2eTup2uR-lkp@intel.com>
References: <20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2@redhat.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on a6836fcbb5b22968019256025321d655b78bc49c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie-via-B4-Relay/drm-amd-display-Drop-the-dead-vmid-module/20261112-114336
base:   a6836fcbb5b22968019256025321d655b78bc49c
patch link:    https://lore.kernel.org/r/20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2%40redhat.com
patch subject: [PATCH 14/19] drm/amd/display: Restrict the dc directory root to DC-internal builds
config: x86_64-randconfig-1001-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170620.2eTup2uR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170620.2eTup2uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170620.2eTup2uR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v12.c:25:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.h:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:51:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:57:
>> drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26:10: fatal error: 'dm_services_types.h' file not found
      26 | #include "dm_services_types.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +26 drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h

a2dd023a7788ba6 Eric Huang 2017-03-06  25  
20582319bce482e Rex Zhu    2018-06-20 @26  #include "dm_services_types.h"
20582319bce482e Rex Zhu    2018-06-20  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
