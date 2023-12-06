Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC02F5F;
	Wed,  6 Dec 2023 03:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuCvoYWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701832042; x=1733368042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4yjD5zXBHcZuygKvRGsa3TVqD9STWTsc9r+WByXe2M=;
  b=WuCvoYWvbdrp9XfZlKSK2boT6LNmRIJjPtwMK/TB4SkH1r0kLINLako+
   TxiYyOJilB52Qc01UXBQlx+OVKIlmCoYwladpbBY7rhx5f1y07Nt8Aqqf
   dkyDzhJOzoDmi5VYhRPjtiZLqFXEu9I1GEK3cup8+ZmSdg80/jpYDVLUN
   Z0ivNLy1VmS79ro24SFlGZ+bVjcLVGIO8yTnUKLEmr+3kn29C+7XtyW3k
   xnvhSwgx+byPkxpeqRkx+LjCJHDPlNlv3FkpQnJJI0JP9pqchBAKVPEOZ
   fHpLf0dAZhdJkEMXMXTUQrmJuZ28i/TFkx9gOGmYeMco2a7+2QbcCb6IU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373457858"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="373457858"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:07:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837170334"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="837170334"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 19:07:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiFq-000A8g-1z;
	Wed, 06 Dec 2023 03:07:18 +0000
Date: Wed, 6 Dec 2023 11:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/7] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <202312061141.SrudvARf-lkp@intel.com>
References: <20231205140810.22368-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205140810.22368-3-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bec3db03911bd85da29c1c8ee556162153002c9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Add-which-field-to-struct-v4l2_subdev_frame_interval/20231205-220946
base:   bec3db03911bd85da29c1c8ee556162153002c9a
patch link:    https://lore.kernel.org/r/20231205140810.22368-3-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 3/7] media: v4l2-subdev: Store frame interval in subdev state
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20231206/202312061141.SrudvARf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061141.SrudvARf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061141.SrudvARf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-subdev.c:21:
   In file included from include/linux/videodev2.h:61:
   include/uapi/linux/videodev2.h:1809:2: warning: field  within 'struct v4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous at include/uapi/linux/videodev2.h:1809:2)' and is usually due to 'struct v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1809 |         union {
         |         ^
>> drivers/media/v4l2-core/v4l2-subdev.c:1655:1: warning: no previous prototype for function '__v4l2_subdev_state_get_interval' [-Wmissing-prototypes]
    1655 | __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
         | ^
   drivers/media/v4l2-core/v4l2-subdev.c:1654:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1654 | struct v4l2_fract *
         | ^
         | static 
   2 warnings generated.


vim +/__v4l2_subdev_state_get_interval +1655 drivers/media/v4l2-core/v4l2-subdev.c

  1653	
  1654	struct v4l2_fract *
> 1655	__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
  1656					 unsigned int pad, u32 stream)
  1657	{
  1658		struct v4l2_subdev_stream_configs *stream_configs;
  1659		unsigned int i;
  1660	
  1661		if (WARN_ON(!state))
  1662			return NULL;
  1663	
  1664		lockdep_assert_held(state->lock);
  1665	
  1666		if (state->pads) {
  1667			if (stream)
  1668				return NULL;
  1669	
  1670			if (pad >= state->sd->entity.num_pads)
  1671				return NULL;
  1672	
  1673			return &state->pads[pad].interval;
  1674		}
  1675	
  1676		lockdep_assert_held(state->lock);
  1677	
  1678		stream_configs = &state->stream_configs;
  1679	
  1680		for (i = 0; i < stream_configs->num_configs; ++i) {
  1681			if (stream_configs->configs[i].pad == pad &&
  1682			    stream_configs->configs[i].stream == stream)
  1683				return &stream_configs->configs[i].interval;
  1684		}
  1685	
  1686		return NULL;
  1687	}
  1688	EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
  1689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
