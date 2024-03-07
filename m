Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41E1DFC1;
	Thu,  7 Mar 2024 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709823006; cv=none; b=o8nXnVKoRgFomOF1/JwGOAPiXz3eVOBu1lWBYaKbEnfovcjwYivCziSuQ3dmN1d+yC1iKOiNNawp066iDdRTxEeYlyFQLch3hoTH5gbhWABGoDXs+GSQjLW/+bzmy/5K+iMa6JE32/dIATlcPvk3FXif/1kZnLej15bfTVqK5u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709823006; c=relaxed/simple;
	bh=1uFg9lgmSZDO3+m4zi6sLWaEhSEtqe7jeK4xCy4bEbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQEm15DZDsa3UVtCstnQnpk+v1SBwqVvP8GvCRlaZt7tvTKzNtawRBMByBx+gMjccj5BMrRtACDhcMutCtRc0QSjV5iAlI47QOwiUrvBc0ZJD1nuWaJPggm+VUbQdLbJ7SKu4xwm8RsXIqVAvEAI+PVA2nok39gfipf9kTKy4BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdUqOo/I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdUqOo/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709823004; x=1741359004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1uFg9lgmSZDO3+m4zi6sLWaEhSEtqe7jeK4xCy4bEbM=;
  b=VdUqOo/IQFrzQLkMx/ocqZuoIGkUHAEnfL9LDZNRHwGJD1i0c41BB283
   +V9t4pFoLPRmmWMoIcO2A/2yBMvJmQItfH/RK+sBy8FBooIeaYq5vBZBt
   Alf+gkTxKfC8fAbB+fvsdYi+iMYWhn3VHBBp7SWskJX+jtaN2mCdJwcGu
   sWOccXtRuurWk+BYETZDlln2TEN7oaafkpHS4eiDLfeWwJ+mRE9Pw6WS+
   D+eSK3cqz24WA0ySQB6isYOOKn+uGPV6jdI/t/Y0l7A0u7BSnX/bb/CVA
   bVLjeV3FFTmjua/SC0I6U1nLTAblrVDGxBp1MLu0pg+O/2nJMArEDLSwk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15633935"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="15633935"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 06:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10025879"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 06:50:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riF4I-0005HP-2D;
	Thu, 07 Mar 2024 14:49:58 +0000
Date: Thu, 7 Mar 2024 22:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and
 pass kernel-doc
Message-ID: <202403072259.EEC2Vf1X-lkp@intel.com>
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc7 next-20240307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-crtc-make-drm_crtc_internal-h-self-contained/20240307-023603
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula%40intel.com
patch subject: [PATCH 22/22] drm: ensure drm headers are self-contained and pass kernel-doc
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403072259.EEC2Vf1X-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403072259.EEC2Vf1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072259.EEC2Vf1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:4:
>> include/drm/ttm/ttm_pool.h:89:52: warning: declaration of 'struct seq_file' will not be visible outside of this function [-Wvisibility]
      89 | int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
         |                                                    ^
   1 warning generated.


vim +89 include/drm/ttm/ttm_pool.h

d099fc8f540add Christian König 2020-10-22  88  
d099fc8f540add Christian König 2020-10-22 @89  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
d099fc8f540add Christian König 2020-10-22  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
