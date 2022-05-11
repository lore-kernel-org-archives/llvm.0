Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022D15B9
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652253096; x=1683789096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hCbILg6504++8sbEhSq0a0Ia/B+gib2F1hZo1TDdJA=;
  b=AfEU3hTnkY8+mQ5TV7x8FVoMn73iVcmwukF5DjNIsrDdllq1upUnRXJV
   vXYSsaruGg2IfK3H46UexusF8OQIRtCHvpgU2sy6wDEyAN8LunBI3shkA
   4QHLYKShdVVc+jNKJlThBFJsL1FUS3oUcwOLutSxRWVJ3nmclmIMlQMH+
   9rvHpGyE495wHcFKfdPcdjuRT2G3gghDIqyMZQW51qTJMjdRfca8ruySw
   fYYQHPRoLqF88VBFNxU9FB91CWJf1LrDGJGjARL6d9kArsRc9UdLBAkZn
   7aKrSghbmfVE9eDSzmjLMtobfXcodpM9bKu+VKXMkadC5jMeXE0E/GQ7C
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249510332"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="249510332"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 00:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="895228457"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2022 00:11:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nogVP-000Ipd-Qj;
	Wed, 11 May 2022 07:11:31 +0000
Date: Wed, 11 May 2022 15:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 3/3] drm/virtio: use the fence for every plane update
Message-ID: <202205111533.LaZm5cYP-lkp@intel.com>
References: <20220511000623.12938-3-dongwon.kim@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511000623.12938-3-dongwon.kim@intel.com>

Hi Dongwon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc6 next-20220510]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongwon-Kim/drm-virtio-release-ops-for-virtgpu-fence-release/20220511-081226
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220511/202205111533.LaZm5cYP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5c7787de5069b504754aea17bf8137faae26fe66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dongwon-Kim/drm-virtio-release-ops-for-virtgpu-fence-release/20220511-081226
        git checkout 5c7787de5069b504754aea17bf8137faae26fe66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/virtio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/virtio/virtgpu_plane.c:147:6: warning: variable 'objs' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (fence) {
               ^~~~~
   drivers/gpu/drm/virtio/virtgpu_plane.c:158:26: note: uninitialized use occurs here
                                         width, height, objs, fence);
                                                        ^~~~
   drivers/gpu/drm/virtio/virtgpu_plane.c:147:2: note: remove the 'if' if its condition is always true
           if (fence) {
           ^~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_plane.c:140:38: note: initialize the variable 'objs' to silence this warning
           struct virtio_gpu_object_array *objs;
                                               ^
                                                = NULL
   1 warning generated.


vim +147 drivers/gpu/drm/virtio/virtgpu_plane.c

544c521d4ab8f2a Gerd Hoffmann   2019-10-23  131  
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  132  static void virtio_gpu_resource_flush(struct drm_plane *plane,
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  133  				      uint32_t x, uint32_t y,
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  134  				      uint32_t width, uint32_t height)
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  135  {
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  136  	struct drm_device *dev = plane->dev;
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  137  	struct virtio_gpu_device *vgdev = dev->dev_private;
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  138  	struct virtio_gpu_framebuffer *vgfb;
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  139  	struct virtio_gpu_object *bo;
47558b189c1d340 Dongwon Kim     2022-05-10  140  	struct virtio_gpu_object_array *objs;
47558b189c1d340 Dongwon Kim     2022-05-10  141  	struct virtio_gpu_fence *fence;
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  142  
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  143  	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  144  	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
5c7787de5069b50 Dongwon Kim     2022-05-10  145  	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
47558b189c1d340 Dongwon Kim     2022-05-10  146  
47558b189c1d340 Dongwon Kim     2022-05-10 @147  	if (fence) {
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  148  		objs = virtio_gpu_array_alloc(1);
47558b189c1d340 Dongwon Kim     2022-05-10  149  		if (!objs) {
47558b189c1d340 Dongwon Kim     2022-05-10  150  			kfree(fence);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  151  			return;
47558b189c1d340 Dongwon Kim     2022-05-10  152  		}
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  153  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  154  		virtio_gpu_array_lock_resv(objs);
47558b189c1d340 Dongwon Kim     2022-05-10  155  	}
47558b189c1d340 Dongwon Kim     2022-05-10  156  
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  157  	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
47558b189c1d340 Dongwon Kim     2022-05-10  158  				      width, height, objs, fence);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  159  	virtio_gpu_notify(vgdev);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  160  
47558b189c1d340 Dongwon Kim     2022-05-10  161  	if (fence) {
47558b189c1d340 Dongwon Kim     2022-05-10  162  		dma_fence_wait_timeout(&fence->f, true,
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  163  				       msecs_to_jiffies(50));
47558b189c1d340 Dongwon Kim     2022-05-10  164  		dma_fence_put(&fence->f);
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  165  	}
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  166  }
5c68ab9276aae47 Vivek Kasireddy 2021-06-10  167  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
