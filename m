Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B11293B5A;
	Fri, 18 Jul 2025 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827443; cv=none; b=HQ2Qz6v9zM7Cl88uQDFB4F+Bj3kVxAjuXNI32FKI+kqt1JAeZs4XvgcJLGsiQdUW/0z7CD9z65aJZ3mTJOj8rYcJYcdRVIHBQFwwXDC4T9T3HWSjEObiEtXwJwHZQB2hlKOu5cjNXouQ66TTJ7ZRe+XlBhO5IB1ACTVCqS3M3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827443; c=relaxed/simple;
	bh=5AAo4PTJqo76udcjXaHsecVy/WPGhMFo7BCeiGCUY2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVnzKA3a3J5BnQZbaUmG3350YM4Fe3/lg4n/gPZ+53iS1YeJM/VnSa/Xy+sd7RPz1qsgt7MxkRURXJCWKwmynWnaVyEAGikX13D7Cmcdk/IQlQcoNvHkXZYKG846VymYQ47fABUut36SnBHmnW4+WGlO6s9gQy0bEHxovUdLZOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1iVPOZ/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1iVPOZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752827441; x=1784363441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AAo4PTJqo76udcjXaHsecVy/WPGhMFo7BCeiGCUY2U=;
  b=W1iVPOZ/PpzrPnS73IQdXuM6SATOtknQ9pmxo9s5ObvQ0XUn6zziNUzX
   1uwEkLhFcOZuU6w/IN2PV6GEi6K7tiZJSzBa2QRIN3ETL90z7huW9KHOm
   cJ6nYulaDhppVFUe23n5PS7CP/QNO/O19GyHiEJ2aSHvfO7MkDnOft4G8
   nXnJIsN+s6CkHm/HNnQ2Jg3ZZW2MraKuGMY8EYu2AnTBY2nLLZ/bNrYf9
   dGOPlJSZ+X2e8PFNy1uoS8HzfQT39JSJCyIYmDAmBqnBXr5vutwzHv2KO
   docZXbfIt3OWs5Cb7MdrQqMrAFUvlWWnaXmXO2oU5rRYzhVCcr3bVNPX7
   w==;
X-CSE-ConnectionGUID: ZyJmXxbKSvCYh3H3y/h9qw==
X-CSE-MsgGUID: n7U1iakPSduy66KsWMEeDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66566020"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="66566020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:30:39 -0700
X-CSE-ConnectionGUID: m9ZKUREwT6OBIrUGoi0aAA==
X-CSE-MsgGUID: Nak4a+SbSfCEB0daBTcHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158573130"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 01:30:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgUG-000ERb-15;
	Fri, 18 Jul 2025 08:30:36 +0000
Date: Fri, 18 Jul 2025 16:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
Message-ID: <202507181611.gGP3jkaq-lkp@intel.com>
References: <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-mc-Add-per-file-handle-data-support/20250717-190546
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-6-81ac18979c03%40ideasonboard.com
patch subject: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181611.gGP3jkaq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181611.gGP3jkaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181611.gGP3jkaq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ioctl.c:2180:13: error: no member named 'entity' in 'struct video_device'
    2180 |         if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
         |              ~~~~  ^
   drivers/media/v4l2-core/v4l2-ioctl.c:2180:34: error: no member named 'entity' in 'struct video_device'
    2180 |         if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
         |                                   ~~~~  ^
   drivers/media/v4l2-core/v4l2-ioctl.c:2181:13: error: no member named 'entity' in 'struct video_device'
    2181 |             !vdev->entity.ops->destroy_context)
         |              ~~~~  ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:2184:17: error: call to undeclared function 'media_device_context_get_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2184 |         mdev_context = media_device_context_get_from_fd(c->context_fd);
         |                        ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:2184:15: error: incompatible integer to pointer conversion assigning to 'struct media_device_context *' from 'int' [-Wint-conversion]
    2184 |         mdev_context = media_device_context_get_from_fd(c->context_fd);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:2189:14: error: no member named 'entity' in 'struct video_device'
    2189 |         ret = vdev->entity.ops->alloc_context(&vdev->entity,
         |               ~~~~  ^
   drivers/media/v4l2-core/v4l2-ioctl.c:2189:47: error: no member named 'entity' in 'struct video_device'
    2189 |         ret = vdev->entity.ops->alloc_context(&vdev->entity,
         |                                                ~~~~  ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:2199:8: error: call to undeclared function 'media_device_bind_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2199 |         ret = media_device_bind_context(mdev_context,
         |               ^
   drivers/media/v4l2-core/v4l2-ioctl.c:2199:8: note: did you mean 'media_entity_init_context'?
   include/media/media-entity.h:1540:6: note: 'media_entity_init_context' declared here
    1540 | void media_entity_init_context(struct media_entity *entity,
         |      ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:2205:2: error: call to undeclared function 'media_device_context_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2205 |         media_device_context_put(mdev_context);
         |         ^
   drivers/media/v4l2-core/v4l2-ioctl.c:2205:2: note: did you mean 'media_entity_context_put'?
   include/media/media-entity.h:1528:6: note: 'media_entity_context_put' declared here
    1528 | void media_entity_context_put(struct media_entity_context *ctx);
         |      ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:2210:2: error: call to undeclared function 'video_device_context_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2210 |         video_device_context_put(vfh->context);
         |         ^
   10 errors generated.
--
>> drivers/media/v4l2-core/v4l2-fh.c:96:3: error: call to undeclared function 'video_device_context_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      96 |                 video_device_context_put(fh->context);
         |                 ^
   1 error generated.


vim +2180 drivers/media/v4l2-core/v4l2-ioctl.c

  2161	
  2162	static int v4l_bind_context(const struct v4l2_ioctl_ops *ops,
  2163				    struct file *file, void *fh, void *arg)
  2164	{
  2165		struct video_device *vdev = video_devdata(file);
  2166		struct media_device_context *mdev_context;
  2167		struct v4l2_fh *vfh =
  2168			test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags) ? fh : NULL;
  2169		struct v4l2_context *c = arg;
  2170		int ret;
  2171	
  2172		/*
  2173		 * TODO: do not __set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls)
  2174		 * if V4L2_FL_USES_V4L2_FH isn't set or the driver does not implement
  2175		 * alloc_context and destroy_context.
  2176		 */
  2177		if (!vfh)
  2178			return -ENOTTY;
  2179	
> 2180		if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
  2181		    !vdev->entity.ops->destroy_context)
  2182			return -ENOTTY;
  2183	
> 2184		mdev_context = media_device_context_get_from_fd(c->context_fd);
  2185		if (!mdev_context)
  2186			return -EINVAL;
  2187	
  2188		/* Let the driver allocate the per-file handle context. */
  2189		ret = vdev->entity.ops->alloc_context(&vdev->entity,
  2190						      (struct media_entity_context **)
  2191						      &vfh->context);
  2192		if (ret)
  2193			goto err_put_mdev_context;
  2194	
  2195		/*
  2196		 * Bind the newly created video device context to the media device
  2197		 * context identified by the file descriptor.
  2198		 */
> 2199		ret = media_device_bind_context(mdev_context,
  2200						(struct media_entity_context *)
  2201						vfh->context);
  2202		if (ret)
  2203			goto err_put_context;
  2204	
> 2205		media_device_context_put(mdev_context);
  2206	
  2207		return 0;
  2208	
  2209	err_put_context:
> 2210		video_device_context_put(vfh->context);
  2211	err_put_mdev_context:
  2212		media_device_context_put(mdev_context);
  2213	
  2214		return ret;
  2215	}
  2216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
