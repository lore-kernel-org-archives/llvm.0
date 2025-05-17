Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8351BE23F;
	Sat, 17 May 2025 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747472246; cv=none; b=E1P5cGuG/ARcTKEaCA213hM95OYxMeAY2GeSlAKc45h1VvuZQWLbia6tgg4CuF51fsL4HnF++kU/TncyF3u7mPvb4zVI3W0RJhP/XG8yUx2QrMCdCAt07BpvIMvy7ycdY1EQCIaXxGkoi9DoX0WPrS3uQnrggWkwGfbYjebKDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747472246; c=relaxed/simple;
	bh=wa0AvHkjwezpx8OoGdRvdZZ/3qzIMnEuZXauHsK4oX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecpht11v0pjwZbA7hIL88mcifDr9pBynCxwTwv6ZqXaCuS8hm2KRytoIzY3s/fDlcbX1ZY2qNTnUCPD0ynGWH+WYo3SiqSh6ZtPvu617aZ1eEYvm9MN36NwMw4lgRpNvIeYSIBjXVm521kRezaGm5keCUYSlKT5IBj5/2TXJ6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAXtYknx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAXtYknx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747472245; x=1779008245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wa0AvHkjwezpx8OoGdRvdZZ/3qzIMnEuZXauHsK4oX0=;
  b=oAXtYknx1wl2G/uJhMfhVyrPT7pbKVbWQrhzY+Wj7N4D8tjJg3VVaxAq
   pammjGPWVhjIAfWgFFWDHeBdx2XGiNA1AzhRExCUE037lrGElCV/etlaM
   w8wV4rsjfS0SUNsQ/ldw/79n/V1PT9zdyqwczef51WDmHZiqsqgxEVO0W
   sVsDE+VfqZ22OB6JspPI6fJNUykqNFJp6o9KoieyQkeKJOTMtxS8ch4xT
   rz1HtYRNPgy5dMfOUwLKuOCq2jkpMsTRLgA/sSecy7RChwvGvMract1vj
   7OTfwB1itgl9ndwUKe3vFd45ca/tcfgpLrd7RdPiVypEQ4Q0pFts2e8mc
   A==;
X-CSE-ConnectionGUID: 5PZ3J2TgSieNgmqnuqVURw==
X-CSE-MsgGUID: otLM69P7QHOzED6HnuhPvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49140356"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="49140356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 01:57:24 -0700
X-CSE-ConnectionGUID: DF6Ut8pDRF2sGI12i8T6mg==
X-CSE-MsgGUID: rEEAtEDYSWeWOVKmwVFEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="142896842"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 May 2025 01:57:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGDM6-000K2J-0n;
	Sat, 17 May 2025 08:57:18 +0000
Date: Sat, 17 May 2025 16:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <202505171601.i0qhMG1O-lkp@intel.com>
References: <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 96c85e428ebaeacd2c640eba075479ab92072ccd]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20250517-000257
base:   96c85e428ebaeacd2c640eba075479ab92072ccd
patch link:    https://lore.kernel.org/r/7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and sample handling
config: i386-buildonly-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171601.i0qhMG1O-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171601.i0qhMG1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171601.i0qhMG1O-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_perf.c:381:8: error: redefinition of 'panthor_perf_counter_block'
     381 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:126:8: note: previous definition is here
     126 | struct panthor_perf_counter_block {
         |        ^
>> drivers/gpu/drm/panthor/panthor_perf.c:651:15: error: redefinition of 'session_get_user_sample_size'
     651 | static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
         |               ^
   drivers/gpu/drm/panthor/panthor_perf.c:391:15: note: previous definition is here
     391 | static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
         |               ^
>> drivers/gpu/drm/panthor/panthor_perf.c:1038:19: error: incompatible pointer types passing '__u64 (*)[2]' (aka 'unsigned long long (*)[2]') to parameter of type 'u64 *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    1038 |                 bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:313:27: note: passing argument to parameter 'buf' here
     313 | void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits);
         |                           ^
   3 errors generated.


vim +/session_get_user_sample_size +651 drivers/gpu/drm/panthor/panthor_perf.c

   650	
 > 651	static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
   652	{
   653		const size_t block_size = get_annotated_block_size(info->counters_per_block);
   654		const size_t block_nr = info->cshw_blocks + info->fw_blocks +
   655			info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
   656	
   657		return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
