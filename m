Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73DF2570
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663713713; x=1695249713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9oRYIY/0P4/wRclJhpAT7JXzjpH5eB6xLUCqXF0c+o=;
  b=MQ89uiIKArUu6B6dj5LsYid7LPjPtBjerD0qImBFw9/JGDCV4mPMGj6c
   j7rPYMqJpnJ1rAi9RiTGvW6hVvvZiUQ4cBnVylhzF8EpaIiropUYULG7Z
   GO+JNzCtnFwSiWy/XRTTKFjHPfeD1aPvSfrQ1wxyiPbBK3mtkZV/jR7tv
   0t5GIZo5vx66jZHG/FTYz+lT5fRpM8bEEdT87bKAGec1iIUTKbLSQU5R0
   OXPywIVysk15aj9jYe1PgpaxsrIRlSDW/CeCPoHp4xUlTDFRkXD3R4Exd
   ZRQoZ4EnVnyVccs39WyfUxVQa1Oa6Qvdh6M8wFri5OIOwQfz3zF2YlASJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282881455"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="282881455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 15:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="761493313"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2022 15:41:50 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oalw6-000312-03;
	Tue, 20 Sep 2022 22:41:50 +0000
Date: Wed, 21 Sep 2022 06:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v1 2/2] media: uvcvideo: Use standard names for menus
Message-ID: <202209210624.LFgi79pj-lkp@intel.com>
References: <20220920-standard-menues-v1-2-839799192e9d@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-standard-menues-v1-2-839799192e9d@chromium.org>

Hi Ricardo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 521a547ced6477c54b4b0cc206000406c221b4d6]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-uvc-Get-menu-names-from-framework/20220920-221725
base:   521a547ced6477c54b4b0cc206000406c221b4d6
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220921/202209210624.LFgi79pj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6f853c5bf3837302050a20e9142196ccb12a2918
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ricardo-Ribalda/media-uvc-Get-menu-names-from-framework/20220920-221725
        git checkout 6f853c5bf3837302050a20e9142196ccb12a2918
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/usb/uvc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/usb/uvc/uvc_driver.c:2664:35: warning: unused variable 'power_line_frequency_controls_limited' [-Wunused-const-variable]
   static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
                                     ^
   1 warning generated.


vim +/power_line_frequency_controls_limited +2664 drivers/media/usb/uvc/uvc_driver.c

310fe52461e624 drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2009-12-09  2659  
c0efd232929c2c drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2008-06-30  2660  /* ------------------------------------------------------------------------
c0efd232929c2c drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2008-06-30  2661   * Driver initialization and cleanup
c0efd232929c2c drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2008-06-30  2662   */
c0efd232929c2c drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2008-06-30  2663  
382075604a688b drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2022-06-07 @2664  static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
382075604a688b drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2022-06-07  2665  	{ 1, "50 Hz" },
382075604a688b drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2022-06-07  2666  	{ 2, "60 Hz" },
382075604a688b drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2022-06-07  2667  };
382075604a688b drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2022-06-07  2668  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
