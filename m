Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8887F7B
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645829970; x=1677365970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZGBjE0P0yqbpvYUmiW8+NhaoXZTRgiidLYRgI+UBUc=;
  b=b10JSSOOxZ4wUxiOgEuaA1J+FMTTuWcbmjmWoYQRwfcTnMganQIVWz7b
   rPyuOtJfqywXldwi6x+vynR4uZ0pIvEcM9H1WtRj7aY0yu6kxTYe3vZRu
   6pdd/mUFP9WIELJnFErQ+zGyt29hXzpG9dpvbYIXe6cW1Wq1/H4Uxvaip
   yAqh5RefTN2hvbTx9SBmO1xZCvGk0mfsHR6LFSS7xFRmHnZeL0EgwF0Xc
   cruBXa9Ig3e2VtT74A/WfhLK+uwM0khJ8khWp0xI8OlPa0QQ/PWtuD7Vv
   r0XA2RNXKypiWuJQfBS9MEpz40VIs2Ev5b9PC76gUzbLla4Fr/p+HX73t
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="232569625"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="232569625"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 14:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="607901989"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 14:59:26 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNjYc-0004nN-7h; Fri, 25 Feb 2022 22:59:26 +0000
Date: Sat, 26 Feb 2022 06:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [rppt:kasper 6/6] drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2623:2:
 warning: variable 'mode' is used uninitialized whenever 'for' loop exits
 because its condition is false
Message-ID: <202202260631.sb20qmrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kasper
head:   7b670b09e6e571dc47d64528131db6c9da12578d
commit: 7b670b09e6e571dc47d64528131db6c9da12578d [6/6] treewide: remove check of list iterator against head past the loop body
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220226/202202260631.sb20qmrj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=7b670b09e6e571dc47d64528131db6c9da12578d
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt kasper
        git checkout 7b670b09e6e571dc47d64528131db6c9da12578d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/ drivers/gpu/drm/vmwgfx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2623:2: warning: variable 'mode' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           list_for_each_entry(tmp2, &con->modes, head) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:639:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2630:7: note: uninitialized use occurs here
           if (!mode) {
                ^~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2623:2: note: remove the condition if it is always true
           list_for_each_entry(tmp2, &con->modes, head) {
           ^
   include/linux/list.h:639:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2588:31: note: initialize the variable 'mode' to silence this warning
           struct drm_display_mode *mode;
                                        ^
                                         = NULL
   1 warning generated.


vim +2623 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

  2576	
  2577	int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
  2578				    unsigned unit,
  2579				    u32 max_width,
  2580				    u32 max_height,
  2581				    struct drm_connector **p_con,
  2582				    struct drm_crtc **p_crtc,
  2583				    struct drm_display_mode **p_mode)
  2584	{
  2585		struct drm_connector *con = NULL;
  2586		struct drm_connector *tmp1;
  2587		struct vmw_display_unit *du;
  2588		struct drm_display_mode *mode;
  2589		struct drm_display_mode *tmp2;
  2590		int i = 0;
  2591		int ret = 0;
  2592	
  2593		mutex_lock(&dev_priv->drm.mode_config.mutex);
  2594		list_for_each_entry(tmp1, &dev_priv->drm.mode_config.connector_list,
  2595				    head) {
  2596			if (i == unit) {
  2597				con = tmp1;
  2598				break;
  2599			}
  2600	
  2601			++i;
  2602		}
  2603	
  2604		if (!con) {
  2605			DRM_ERROR("Could not find initial display unit.\n");
  2606			ret = -EINVAL;
  2607			goto out_unlock;
  2608		}
  2609	
  2610		if (list_empty(&con->modes))
  2611			(void) vmw_du_connector_fill_modes(con, max_width, max_height);
  2612	
  2613		if (list_empty(&con->modes)) {
  2614			DRM_ERROR("Could not find initial display mode.\n");
  2615			ret = -EINVAL;
  2616			goto out_unlock;
  2617		}
  2618	
  2619		du = vmw_connector_to_du(con);
  2620		*p_con = con;
  2621		*p_crtc = &du->crtc;
  2622	
> 2623		list_for_each_entry(tmp2, &con->modes, head) {
  2624			if (tmp2->type & DRM_MODE_TYPE_PREFERRED) {
  2625				mode = tmp2;
  2626				break;
  2627			}
  2628		}
  2629	
  2630		if (!mode) {
  2631			WARN_ONCE(true, "Could not find initial preferred mode.\n");
  2632			*p_mode = list_first_entry(&con->modes,
  2633						   struct drm_display_mode,
  2634						   head);
  2635		} else {
  2636			*p_mode = mode;
  2637		}
  2638	
  2639	 out_unlock:
  2640		mutex_unlock(&dev_priv->drm.mode_config.mutex);
  2641	
  2642		return ret;
  2643	}
  2644	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
