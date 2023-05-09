Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248637C;
	Tue,  9 May 2023 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683596941; x=1715132941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FKeGHqCiKAFHJK5QI85sPQAI/QxNp5IkFv1H0CKa30=;
  b=WwfE0fmffKhBLYGEMMy6Sg2HBX8UKdsbDPdftow1UECL5ylST9FSd9dP
   txbPIKSmQqNazxF3620KbKdWo2R3un5G/s45D2ZYG81LndxKgIGMXfouL
   eGH5oJ/U0x6Nrbhrs+cpS2NskdGFCFcMrk4tckebfdbvyatOYT0FIQBze
   H1eabZDy7G3r8ClERw7qGgz+LPnQ5LypZJTpdsXQda23ZaaDGF6uUGcaS
   83k7cmPEG3r3Nf0QusyyFTeBU+4h8mcFOj21qaNE9PAYq5DKjiHDs5TBm
   12i7QmXJnGmKqT9cDY+H+Lbkl8Nf18wWtstl/Oa6r/TtQjfBt3VoADqfh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330149734"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330149734"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 18:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698714256"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698714256"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 18:48:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwCTA-0001Zz-2B;
	Tue, 09 May 2023 01:48:48 +0000
Date: Tue, 9 May 2023 09:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm: Fix submit error-path leaks
Message-ID: <202305090953.EA36hnYI-lkp@intel.com>
References: <20230501181327.1618596-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501181327.1618596-1-robdclark@gmail.com>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Fix-submit-error-path-leaks/20230502-021521
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230501181327.1618596-1-robdclark%40gmail.com
patch subject: [PATCH v2] drm/msm: Fix submit error-path leaks
config: arm-randconfig-r002-20230507 (https://download.01.org/0day-ci/archive/20230509/202305090953.EA36hnYI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/895a58ff05de3cebb081d61f8e001864f4ef41c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/drm-msm-Fix-submit-error-path-leaks/20230502-021521
        git checkout 895a58ff05de3cebb081d61f8e001864f4ef41c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090953.EA36hnYI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gem_submit.c:770:7: warning: variable 'submit' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (out_fence_fd < 0) {
                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem_submit.c:971:6: note: uninitialized use occurs here
           if (submit) {
               ^~~~~~
   drivers/gpu/drm/msm/msm_gem_submit.c:770:3: note: remove the 'if' if its condition is always false
                   if (out_fence_fd < 0) {
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem_submit.c:725:31: note: initialize the variable 'submit' to silence this warning
           struct msm_gem_submit *submit;
                                        ^
                                         = NULL
   1 warning generated.


vim +770 drivers/gpu/drm/msm/msm_gem_submit.c

ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  718  
7198e6b03155f6 Rob Clark         2013-07-19  719  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
7198e6b03155f6 Rob Clark         2013-07-19  720  		struct drm_file *file)
7198e6b03155f6 Rob Clark         2013-07-19  721  {
7198e6b03155f6 Rob Clark         2013-07-19  722  	struct msm_drm_private *priv = dev->dev_private;
7198e6b03155f6 Rob Clark         2013-07-19  723  	struct drm_msm_gem_submit *args = data;
7198e6b03155f6 Rob Clark         2013-07-19  724  	struct msm_file_private *ctx = file->driver_priv;
ccc40d42bd59ac Aashish Sharma    2022-10-11  725  	struct msm_gem_submit *submit;
c01a958eca6e7f Rob Clark         2016-02-03  726  	struct msm_gpu *gpu = priv->gpu;
f7de15450e906e Jordan Crouse     2017-10-20  727  	struct msm_gpu_submitqueue *queue;
f97decac5f4c2d Jordan Crouse     2017-10-20  728  	struct msm_ringbuffer *ring;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  729  	struct msm_submit_post_dep *post_deps = NULL;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  730  	struct drm_syncobj **syncobjs_to_reset = NULL;
4cd0945901a6dd Rob Clark         2016-06-16  731  	int out_fence_fd = -1;
92ec0767710797 Daniel Vetter     2019-11-20  732  	bool has_ww_ticket = false;
7198e6b03155f6 Rob Clark         2013-07-19  733  	unsigned i;
fc1dd04c3841c4 Rob Clark         2022-08-02  734  	int ret;
375f9a63a66bae Rob Clark         2021-07-27  735  
c01a958eca6e7f Rob Clark         2016-02-03  736  	if (!gpu)
c01a958eca6e7f Rob Clark         2016-02-03  737  		return -ENXIO;
c01a958eca6e7f Rob Clark         2016-02-03  738  
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  739  	if (args->pad)
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  740  		return -EINVAL;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  741  
4a257ca694015f Rob Clark         2022-05-02  742  	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
4a257ca694015f Rob Clark         2022-05-02  743  		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
4a257ca694015f Rob Clark         2022-05-02  744  		return -EPERM;
4a257ca694015f Rob Clark         2022-05-02  745  	}
4a257ca694015f Rob Clark         2022-05-02  746  
7198e6b03155f6 Rob Clark         2013-07-19  747  	/* for now, we just have 3d pipe.. eventually this would need to
7198e6b03155f6 Rob Clark         2013-07-19  748  	 * be more clever to dispatch to appropriate gpu module:
7198e6b03155f6 Rob Clark         2013-07-19  749  	 */
d9c181e22a0599 Rob Clark         2016-04-23  750  	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
d9c181e22a0599 Rob Clark         2016-04-23  751  		return -EINVAL;
d9c181e22a0599 Rob Clark         2016-04-23  752  
d9c181e22a0599 Rob Clark         2016-04-23  753  	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
7198e6b03155f6 Rob Clark         2013-07-19  754  		return -EINVAL;
7198e6b03155f6 Rob Clark         2013-07-19  755  
6a8bd08d0465b2 Rob Clark         2017-12-13  756  	if (args->flags & MSM_SUBMIT_SUDO) {
6a8bd08d0465b2 Rob Clark         2017-12-13  757  		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
6a8bd08d0465b2 Rob Clark         2017-12-13  758  		    !capable(CAP_SYS_RAWIO))
6a8bd08d0465b2 Rob Clark         2017-12-13  759  			return -EINVAL;
6a8bd08d0465b2 Rob Clark         2017-12-13  760  	}
6a8bd08d0465b2 Rob Clark         2017-12-13  761  
f7de15450e906e Jordan Crouse     2017-10-20  762  	queue = msm_submitqueue_get(ctx, args->queueid);
f7de15450e906e Jordan Crouse     2017-10-20  763  	if (!queue)
f7de15450e906e Jordan Crouse     2017-10-20  764  		return -ENOENT;
f7de15450e906e Jordan Crouse     2017-10-20  765  
fc40e5e10c3bcc Rob Clark         2021-07-27  766  	ring = gpu->rb[queue->ring_nr];
f97decac5f4c2d Jordan Crouse     2017-10-20  767  
1d8a5ca436ee4a Rob Clark         2021-07-27  768  	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
1d8a5ca436ee4a Rob Clark         2021-07-27  769  		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
1d8a5ca436ee4a Rob Clark         2021-07-27 @770  		if (out_fence_fd < 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
