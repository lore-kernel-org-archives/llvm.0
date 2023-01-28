Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D52570;
	Sat, 28 Jan 2023 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674891327; x=1706427327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2IGlG08LzZjsRh15w/36FW5g5Yh+zOPUK0S/8aQnkuw=;
  b=O/jIBXMcgrmq+QldnnX17bkkgWZ8VoXMwLlvF6R1Xdo6pLDSr/RIWG8m
   n3l9RrrxitpuFxwtR7TBU5pzHAur2yoRCrPlKxm3KuN+g3H2lGrcR446M
   qhFCZa0rxSiOmIPBmzYapCaJDWkPrjuwL+WCORQDZ9JwGlLhsVj5G60e9
   Wmj4F0EdrQNhMi69UsOAUGIMe39PZ6RLEJ5afisoFspdp3JuOZqCK0qtI
   K7ugtvO9XQTKtVFl6ydx8xJMQTdZfK8ztU2Ubcabf+G98op/PBaBFMrcg
   la1ZeKbdyZrlZ4zzpykxC6p4Zn9MxuNSikgKFX+WKosYuGFdJ0a97c90n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315226502"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315226502"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 23:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="771853680"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="771853680"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2023 23:35:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLfk9-0000UT-0d;
	Sat, 28 Jan 2023 07:35:21 +0000
Date: Sat, 28 Jan 2023 15:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <mgross@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>, Mark Pearson <markpearson@lenovo.com>,
	Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Message-ID: <202301281534.9Z8xRsrX-lkp@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127203729.10205-2-hdegoede@redhat.com>

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc5]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
        git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           sd->privacy_led = led_get(sd->dev, "privacy-led");
                             ^
>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
           sd->privacy_led = led_get(sd->dev, "privacy-led");
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/led_get +1124 drivers/media/v4l2-core/v4l2-subdev.c

  1120	
  1121	int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
  1122	{
  1123	#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> 1124		sd->privacy_led = led_get(sd->dev, "privacy-led");
  1125		if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
  1126			return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led), "getting privacy LED\n");
  1127	
  1128		if (!IS_ERR_OR_NULL(sd->privacy_led)) {
  1129			mutex_lock(&sd->privacy_led->led_access);
  1130			led_sysfs_disable(sd->privacy_led);
  1131			led_trigger_remove(sd->privacy_led);
  1132			led_set_brightness(sd->privacy_led, 0);
  1133			mutex_unlock(&sd->privacy_led->led_access);
  1134		}
  1135	#endif
  1136		return 0;
  1137	}
  1138	EXPORT_SYMBOL_GPL(v4l2_subdev_get_privacy_led);
  1139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
