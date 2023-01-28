Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8D3C0B;
	Sat, 28 Jan 2023 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674900691; x=1706436691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQXTqqo0KdDTfmzzZvVs+t3mYNxq/PJALwewAE+8Cms=;
  b=dfy3O9ZnzabzmF4ZctymmAbLPkcXyUWA6h4RRA5bcS+rV4i/66DS/vEf
   BmwK+ZOYlTlkVx3Styz8sR+3z0Y/450hwqX+E8BN4svZpmn6TpBVMaDRw
   t3u72PmOeZTvNEwDYWAzW+XX3s6LDjNgo3yqbUZ1YAptlwXOLBohkwo4e
   NosRjM7Mo4mYf7sO+rxNFx3DEW14lt++DAG6xNkYDUTCBdCW3+Oogv6YB
   XZcqPXSJ3XZx+FHsdUnBRG54pckvO1f9UTu7pR7/oqT2Pj36sv5dZUxMB
   L621xdW6ibpKFd1B67yPvUwRlJ3IdTbpik5P/0gRW2rRvZ7vCT32KkmCA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315234185"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315234185"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 02:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="771876082"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="771876082"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 02:11:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLiBB-0000Zn-1M;
	Sat, 28 Jan 2023 10:11:25 +0000
Date: Sat, 28 Jan 2023 18:10:42 +0800
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
Subject: Re: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
Message-ID: <202301281800.sm8woBKh-lkp@intel.com>
References: <20230127203729.10205-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127203729.10205-4-hdegoede@redhat.com>

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc5 next-20230127]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
patch link:    https://lore.kernel.org/r/20230127203729.10205-4-hdegoede%40redhat.com
patch subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
config: x86_64-randconfig-a012-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281800.sm8woBKh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
        git checkout d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/intel/int3472/discrete.c:17:
>> drivers/platform/x86/intel/int3472/common.h:107:26: error: field has incomplete type 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                                          ^
   drivers/platform/x86/intel/int3472/common.h:107:10: note: forward declaration of 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                          ^
   1 error generated.
--
   In file included from drivers/platform/x86/intel/int3472/led.c:7:
>> drivers/platform/x86/intel/int3472/common.h:107:26: error: field has incomplete type 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                                          ^
   drivers/platform/x86/intel/int3472/common.h:107:10: note: forward declaration of 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                          ^
>> drivers/platform/x86/intel/int3472/led.c:57:2: error: implicit declaration of function 'led_add_lookup' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           led_add_lookup(&int3472->pled.lookup);
           ^
>> drivers/platform/x86/intel/int3472/led.c:71:2: error: implicit declaration of function 'led_remove_lookup' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           led_remove_lookup(&int3472->pled.lookup);
           ^
   3 errors generated.


vim +107 drivers/platform/x86/intel/int3472/common.h

    80	
    81	struct int3472_discrete_device {
    82		struct acpi_device *adev;
    83		struct device *dev;
    84		struct acpi_device *sensor;
    85		const char *sensor_name;
    86	
    87		const struct int3472_sensor_config *sensor_config;
    88	
    89		struct int3472_gpio_regulator {
    90			char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
    91			char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
    92			struct gpio_desc *gpio;
    93			struct regulator_dev *rdev;
    94			struct regulator_desc rdesc;
    95		} regulator;
    96	
    97		struct int3472_gpio_clock {
    98			struct clk *clk;
    99			struct clk_hw clk_hw;
   100			struct clk_lookup *cl;
   101			struct gpio_desc *ena_gpio;
   102			u32 frequency;
   103		} clock;
   104	
   105		struct int3472_pled {
   106			struct led_classdev classdev;
 > 107			struct led_lookup_data lookup;
   108			char name[INT3472_LED_MAX_NAME_LEN];
   109			struct gpio_desc *gpio;
   110		} pled;
   111	
   112		unsigned int ngpios; /* how many GPIOs have we seen */
   113		unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
   114		struct gpiod_lookup_table gpios;
   115	};
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
