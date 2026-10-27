Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100690;
	b=zILICulXmr1xONw/LHTcQz3PQag54RFBh756oSgjvk+kx80S6gS4gbHjcBKSSfq04ABm
	 HdfVofX1m0ZjEOGIdfZaNd2hlm7Jujx+WPqVBjY/uoKsSM1jFxjDZWmVEwYm7NErCmqwv
	 TJgcWjT68wQ82LpefGi76/T3bxZtIGAxdfLeG2Ata4gmO3zZ6utkvwbi0E57Xzbh2xSQd
	 CcvgPveYCzXFHY6fUTFiEduvNE0CKpiiEVcJbHr8edwDPkgNMSsu23SIEh3sj2agu/6a/
	 P7ACB/P0bKZJzz+aCwOxmWrW5sKPyn7W02dkSrP6JpzAbRriaknbnt9MSFAB1Ycr65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100690;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GQyVT+EFovlv5K0TgFKKJHnlBXNpdOtQnIori5eWwSM=;
	b=DZqMvXntQF6LnSameKURqovQ0JzO8ZlnjugBJ1Rx+ukqYXP6dMZ+RVV7sLAAAmaSCKe3
	 yYwfl28HDruXMUqWoJS7n5vK2UNHnN6B7NNOuN5nAbQH9cMymt7Z967qC8efUo32HE8E4
	 jdD7SyxNJehcOD96z/5u+rkZjtj8ninhVM6SUaPO4SjQhYz1c3sGDx9QyU6vhxukzGwd0
	 g6xQZbp3w505SOPu34klPMfa1lw0MfeTVEWcQgDyTa0rSp0YkhO93/lEwKxdgyEHhK1dd
	 4lGbvoBoTHThSqvjqAWWMpGBA+mU657B+ueOrbiErDq+Ek6CK3jN4IoXQoJ0w48TFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="bu9jG/wt";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F6606A31D;
	Tue, 27 Oct 2026 11:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bu9jG/wt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793100689; x=1824636689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KDMfKFiUm7Y3lC+nwfIordIWlQtUZP5F0MRIw/MEwjQ=;
  b=bu9jG/wtfZYT4UNfyB5Y+LL2YKZSFQ0YplgRPFLFRdUVHlj2IIYq+LOC
   eFOLUbL5wdcQuLG5wwXeZjhpjPwpt7VGJJEWESm3YXTzY/POQwgp4DJa2
   9heGd0OuQ3vkNzikCSBESiDKRRFtoy6eeKySG14zdW+doo/fOBTU2iHNB
   rxfdKklMYQPmfUYb7+G28r5U8unFBBb9VFtiei6y5rXUE76cDHnJq8P4Y
   Sjxhc0d/rqfQmDsgcQ94MvxOAxdI/Bg/2EiV5lmaQJErWXz5zCr4VIZOq
   tRYeNABu6oMNHl9r95D6+EfeYAaM0aAVYzzzyWSOrhl40Wie4g6tAxHkB
   Q==;
X-CSE-ConnectionGUID: 4B8VHH8mSPGZBm2h/G5p4w==
X-CSE-MsgGUID: sqxgTlewQRS5YiLkGj+lYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1805806"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1805806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:31:28 -0700
X-CSE-ConnectionGUID: ZCM0VRDVSZ2uHu0u4hkQeQ==
X-CSE-MsgGUID: la2fgOt2QMKPFEra0fO3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5043934"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 04:31:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLfOj-00000000XAq-3cit;
	Tue, 27 Oct 2026 11:31:21 +0000
Date: Tue, 27 Oct 2026 19:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/gem: Add some cleanup.h
Message-ID: <202610271940.hGm7dpnG-lkp@intel.com>
References: <20261026213701.22126-1-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261026213701.22126-1-robin.clark@oss.qualcomm.com>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.3 next-20261026]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-gem-Add-some-cleanup-h/20261026-143700
base:   https://gitlab.freedesktop.org/drm/kernel.git drm-next
patch link:    https://lore.kernel.org/r/20261026213701.22126-1-robin.clark%40oss.qualcomm.com
patch subject: [PATCH] drm/msm/gem: Add some cleanup.h
config: x86_64-buildonly-randconfig-1005-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271940.hGm7dpnG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271940.hGm7dpnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271940.hGm7dpnG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_drv.c:613:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     613 |         } else if (copy_to_user(metadata, buf, len)) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:621:9: note: uninitialized use occurs here
     621 |         return ret;
         |                ^~~
   drivers/gpu/drm/msm/msm_drv.c:613:9: note: remove the 'if' if its condition is always true
     613 |         } else if (copy_to_user(metadata, buf, len)) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     614 |                 ret = -EFAULT;
     615 |         } else {
         |           ~~~~~~
     616 |                 *metadata_size = len;
         |                 ~~~~~~~~~~~~~~~~~~~~~
     617 |         }
         |         ~
   drivers/gpu/drm/msm/msm_drv.c:588:9: note: initialize the variable 'ret' to silence this warning
     588 |         int ret, len;
         |                ^
         |                 = 0
   1 warning generated.


vim +613 drivers/gpu/drm/msm/msm_drv.c

9902cb999e4e91 Rob Clark        2023-11-06  581  
9902cb999e4e91 Rob Clark        2023-11-06  582  static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
9902cb999e4e91 Rob Clark        2023-11-06  583  					   __user void *metadata,
9902cb999e4e91 Rob Clark        2023-11-06  584  					   u32 *metadata_size)
9902cb999e4e91 Rob Clark        2023-11-06  585  {
9902cb999e4e91 Rob Clark        2023-11-06  586  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
9902cb999e4e91 Rob Clark        2023-11-06  587  	void *buf;
9902cb999e4e91 Rob Clark        2023-11-06  588  	int ret, len;
9902cb999e4e91 Rob Clark        2023-11-06  589  
9902cb999e4e91 Rob Clark        2023-11-06  590  	if (!metadata) {
9902cb999e4e91 Rob Clark        2023-11-06  591  		/*
9902cb999e4e91 Rob Clark        2023-11-06  592  		 * Querying the size is inherently racey, but
9902cb999e4e91 Rob Clark        2023-11-06  593  		 * EXT_external_objects expects the app to confirm
9902cb999e4e91 Rob Clark        2023-11-06  594  		 * via device and driver UUIDs that the exporter and
9902cb999e4e91 Rob Clark        2023-11-06  595  		 * importer versions match.  All we can do from the
9902cb999e4e91 Rob Clark        2023-11-06  596  		 * kernel side is check the length under obj lock
9902cb999e4e91 Rob Clark        2023-11-06  597  		 * when userspace tries to retrieve the metadata
9902cb999e4e91 Rob Clark        2023-11-06  598  		 */
9902cb999e4e91 Rob Clark        2023-11-06  599  		*metadata_size = msm_obj->metadata_size;
9902cb999e4e91 Rob Clark        2023-11-06  600  		return 0;
9902cb999e4e91 Rob Clark        2023-11-06  601  	}
9902cb999e4e91 Rob Clark        2023-11-06  602  
fec06716d04d17 Rob Clark        2026-10-26  603  	scoped_cond_guard (gem_lock_intr, return -EINTR, obj) {
fec06716d04d17 Rob Clark        2026-10-26  604  		/* Avoid copy_to_user() under gem obj lock by making a copy: */
9902cb999e4e91 Rob Clark        2023-11-06  605  		len = msm_obj->metadata_size;
9902cb999e4e91 Rob Clark        2023-11-06  606  		buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
fec06716d04d17 Rob Clark        2026-10-26  607  		if (!buf)
47cbfe2608314b Yasuaki Torimaru 2026-03-25  608  			return -ENOMEM;
47cbfe2608314b Yasuaki Torimaru 2026-03-25  609  	}
47cbfe2608314b Yasuaki Torimaru 2026-03-25  610  
9902cb999e4e91 Rob Clark        2023-11-06  611  	if (*metadata_size < len) {
9902cb999e4e91 Rob Clark        2023-11-06  612  		ret = -ETOOSMALL;
9902cb999e4e91 Rob Clark        2023-11-06 @613  	} else if (copy_to_user(metadata, buf, len)) {
9902cb999e4e91 Rob Clark        2023-11-06  614  		ret = -EFAULT;
9902cb999e4e91 Rob Clark        2023-11-06  615  	} else {
9902cb999e4e91 Rob Clark        2023-11-06  616  		*metadata_size = len;
9902cb999e4e91 Rob Clark        2023-11-06  617  	}
9902cb999e4e91 Rob Clark        2023-11-06  618  
9902cb999e4e91 Rob Clark        2023-11-06  619  	kfree(buf);
9902cb999e4e91 Rob Clark        2023-11-06  620  
47cbfe2608314b Yasuaki Torimaru 2026-03-25  621  	return ret;
9902cb999e4e91 Rob Clark        2023-11-06  622  }
9902cb999e4e91 Rob Clark        2023-11-06  623  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
