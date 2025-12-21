Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3022153E7;
	Sun, 21 Dec 2025 05:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766294044; cv=none; b=KS7NS4HcUfu2uCtT88+4ihfVFlrT8XdMPwlJMlmEktQf9jnp9wmVx25GfW/8fzz4e4Yqo651hGQEj7sS4UZhAiO9ayMIqji8GCJkx7ZKv+jY6yShei5L43yc413Tw22hzl9+CwswmZg79D/9n+FxdPZVkPBJnOQU0hu0KLqpVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766294044; c=relaxed/simple;
	bh=BvYdONVV7GvknTkPB5K4fTIK3mFcO/5+tUyy+0KbokA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEpfzmjKMrXSOiN1bsdtsw5pkuxLBkZ4bwREqI/0/d3QIKFLIN5qCFU09MEU4HnyGvBDR09t2oevFxeExPCgkLGJ34vB5U0PZ+V18oq7nyylgzi25WBOtudD4LBpQ4dovtslJosM63VmJi+djRD64pnHWXs3dUuQ3FltY9N1Z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IS1BttTT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IS1BttTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766294042; x=1797830042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BvYdONVV7GvknTkPB5K4fTIK3mFcO/5+tUyy+0KbokA=;
  b=IS1BttTT5d6OpzVV6pKnxUcTQgZMw2bQmHmrmQ5kymntc7qyHd0q0wBS
   B5dg20Bo6R9Q/Tqzk3JSpLWkmy8nBzdQL+J/l/Enwsx6GSlKfXyLYC2fS
   AzIpV0EmewcdHm1wfA+IRtU614oqmv2yG8RmBqGQPt8FfQSPr0ESvTXrg
   G5cYso4XilmkRdR3alcX1KNTB+Y6sBMk7q9GNEOsrEphpHmi6uwh2FQ2N
   Cvt82EzYPFntKmhYuiBNfQfB1XwC3iw2YVoGjAV4kQbj6Fm7Dna/kgXXb
   Prq6GXPIGqXYDX52Ru8swxFU86JUdORSVqbQz1fSnJBE6sLrsJ0LPbyHz
   A==;
X-CSE-ConnectionGUID: GWzNLOnJQqiy9lVYax4vxg==
X-CSE-MsgGUID: x02fZGm3SkSl8mMW2hST8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68173650"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68173650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:14:01 -0800
X-CSE-ConnectionGUID: l20dcKB8RtWw/U7zUOUgiA==
X-CSE-MsgGUID: W0JV/HEsQUWJbMXNkrL0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236635398"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 21:13:58 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXBlS-000000005Kf-1vgC;
	Sun, 21 Dec 2025 05:13:54 +0000
Date: Sun, 21 Dec 2025 13:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v6 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <202512211353.VSyLcCQw-lkp@intel.com>
References: <20251215171453.2506348-6-lukas.zapolskas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215171453.2506348-6-lukas.zapolskas@arm.com>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20251219]
[cannot apply to linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20251216-012117
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215171453.2506348-6-lukas.zapolskas%40arm.com
patch subject: [PATCH v6 5/7] drm/panthor: Implement the counter sampler and sample handling
config: i386-buildonly-randconfig-002-20251221 (https://download.01.org/0day-ci/archive/20251221/202512211353.VSyLcCQw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211353.VSyLcCQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211353.VSyLcCQw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_perf.c:1045:19: error: incompatible pointer types passing '__u64 (*)[2]' (aka 'unsigned long long (*)[2]') to parameter of type 'u64 *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    1045 |                 bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:316:27: note: passing argument to parameter 'buf' here
     316 | void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits);
         |                           ^
   1 error generated.


vim +1045 drivers/gpu/drm/panthor/panthor_perf.c

   991	
   992	/**
   993	 * session_populate_sample - Write out a new sample into a previously populated slot in the user
   994	 *                           ringbuffer and update both the header of the block and the PRFCNT_EN
   995	 *                           counter to contain only the selected subset of counters for that block.
   996	 *
   997	 * @ptdev: Panthor device
   998	 * @session: Perf session
   999	 * @session_sample: Pointer aligned to the start of the data section of the sample in the targeted
  1000	 *                  slot.
  1001	 * @sampler_sample: Pointer aligned to the start of the data section of the intermediate sampler
  1002	 *                  buffer.
  1003	 *
  1004	 * When a new sample slot is targeted, it must be cleared of the data already existing there,
  1005	 * enabling a direct copy from the intermediate buffer and then zeroing out any counters
  1006	 * that are not required for the current session.
  1007	 */
  1008	static void session_populate_sample(struct panthor_device *ptdev,
  1009					    struct panthor_perf_session *session, u8 *session_sample,
  1010					    u8 *sampler_sample)
  1011	{
  1012		const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
  1013		const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
  1014		const size_t sample_size = perf_info->sample_size;
  1015		const size_t sample_header_size = perf_info->sample_header_size;
  1016		const size_t data_size = sample_size - sample_header_size;
  1017		const u32 counters = perf_info->counters_per_block;
  1018	
  1019		session_populate_sample_header(session,
  1020					       (struct drm_panthor_perf_sample_header *)session_sample,
  1021					       ptdev->perf->sampler.set_config);
  1022	
  1023		session_sample += sample_header_size;
  1024	
  1025		memcpy(session_sample, sampler_sample + sample_header_size, data_size);
  1026	
  1027		for (size_t i = 0; i < data_size; i += block_size) {
  1028			DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
  1029			struct panthor_perf_counter_block *blk = (typeof(blk))(session_sample + i);
  1030			enum drm_panthor_perf_block_type type = blk->header.block_type;
  1031			unsigned long *blk_em = session->enabled_counters->mask[type];
  1032	
  1033			bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
  1034	
  1035			bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
  1036			bitmap_clear(em_diff, 0, PANTHOR_HEADER_COUNTERS);
  1037	
  1038			blk->counters[PANTHOR_CTR_PRFCNT_EN] = compress_enable_mask(counters, blk_em);
  1039	
  1040			for (size_t ctr_idx = PANTHOR_HEADER_COUNTERS; ctr_idx < counters; ctr_idx++) {
  1041				if (test_bit(ctr_idx, em_diff))
  1042					blk->counters[ctr_idx] = 0;
  1043			}
  1044	
> 1045			bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
  1046		}
  1047	}
  1048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
