Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40BD53B7;
	Wed,  9 Aug 2023 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691576911; x=1723112911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeOT0cS6QMPvAXxUJ9nK2LD91TvI/FtdDjHmYUtB1Zg=;
  b=B/PuVx6sy7C1RuBb450x5WG7WiF2KG/JARixwXYjb//O4bOLj6CCy5vp
   wi8KYYyCsxpnAgaAtP38qiBcOChRu/xdurzs+ZKzwgVrIHFT8xeR9bzN4
   iwBTvgmquLFiaP7nyyoOxacO/FKUMADMC99Jb22Ou8mUqYH6o/5S8TcZA
   YNkeaANZik4ClI9JVClebF6es1oaSVKHyXhPBSPO1IM5neMyeye0N+/ex
   I+eT4e01EzWsUpe36suRoOWVTlv+S8JWTSW0zCZ7fnnmyUwvIxRt8XreX
   1+GBOfGtOmufcvVev7GBBQ+b6ac4IRh1XrGxl+KH0QRKYOrO/vWnDqLkR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373867950"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="373867950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 03:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875188410"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2023 03:28:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTgQW-00060Y-1K;
	Wed, 09 Aug 2023 10:28:28 +0000
Date: Wed, 9 Aug 2023 18:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 4727/8441]
 drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202308091728.NEJhgUPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 5145531be5fbad0e914d1dc1cbd392d7b756abaa [4727/8441] backlight: lp855x: Catch errors when changing brightness
config: x86_64-buildonly-randconfig-r002-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091728.NEJhgUPP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091728.NEJhgUPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091728.NEJhgUPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (lp->mode == REGISTER_BASED)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/lp855x_bl.c:256:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/video/backlight/lp855x_bl.c:252:7: note: remove the 'if' if its condition is always true
           else if (lp->mode == REGISTER_BASED)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/video/backlight/lp855x_bl.c:244:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +252 drivers/video/backlight/lp855x_bl.c

8cc9764c9c7d01 Kim, Milo    2012-12-17  239  
7be865ab8634d4 Kim, Milo    2012-03-23  240  static int lp855x_bl_update_status(struct backlight_device *bl)
7be865ab8634d4 Kim, Milo    2012-03-23  241  {
7be865ab8634d4 Kim, Milo    2012-03-23  242  	struct lp855x *lp = bl_get_data(bl);
61c1c6147f69d8 Sean Paul    2015-05-11  243  	int brightness = bl->props.brightness;
5145531be5fbad Artur Weber  2023-07-14  244  	int ret;
7be865ab8634d4 Kim, Milo    2012-03-23  245  
9f0a511f4a227c Shingo Nakao 2013-07-02  246  	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
61c1c6147f69d8 Sean Paul    2015-05-11  247  		brightness = 0;
7be865ab8634d4 Kim, Milo    2012-03-23  248  
61c1c6147f69d8 Sean Paul    2015-05-11  249  	if (lp->mode == PWM_BASED)
5145531be5fbad Artur Weber  2023-07-14  250  		ret = lp855x_pwm_ctrl(lp, brightness,
5145531be5fbad Artur Weber  2023-07-14  251  				      bl->props.max_brightness);
61c1c6147f69d8 Sean Paul    2015-05-11 @252  	else if (lp->mode == REGISTER_BASED)
5145531be5fbad Artur Weber  2023-07-14  253  		ret = lp855x_write_byte(lp, lp->cfg->reg_brightness,
5145531be5fbad Artur Weber  2023-07-14  254  					(u8)brightness);
7be865ab8634d4 Kim, Milo    2012-03-23  255  
5145531be5fbad Artur Weber  2023-07-14  256  	return ret;
7be865ab8634d4 Kim, Milo    2012-03-23  257  }
7be865ab8634d4 Kim, Milo    2012-03-23  258  

:::::: The code at line 252 was first introduced by commit
:::::: 61c1c6147f69d8dea31fd133d2ec0b1594c9a3eb backlight: lp855x: Don't clear level on suspend/blank

:::::: TO: Sean Paul <seanpaul@chromium.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
