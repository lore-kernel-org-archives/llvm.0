Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A06154A1;
	Thu, 17 Aug 2023 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285947; x=1723821947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dv1rWAggk6QsneHzEIlpHOBsevb6HNOlpyXK3ZrSojM=;
  b=D+vNYeKQgg5qIQqvxVuYZpAGCG/ScllaIfDDZyt8ASfjmItxaL1R1grj
   csWhwAdmYEFvLW0+jFVdEYHSYMKQpHyFS0aRv6GB90QaQ3/JVo0tGv8qG
   nzBLneI7YDIzwwb12fH/v30Hr35XzSrqJmspy3bc6mscPIjcwxDOyl4FN
   P0bDWwgPM98vXkp1yJ5UOzxmwXcrMCa5o+tyhvT5Y/VMRa4+CdXq8GMx2
   w+TdpoiTDLUe5zlS/DYYjgdKA0Kw5EG3/lD60s0Ctz88SowEVd/MQ+bRE
   4HJX9Kn1xUA3qKfe9w7ZENjzQ8zXZJP7gqPY0zMAaHPST8IqBl96wgvL2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372832647"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="372832647"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728175525"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728175525"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 08:25:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWesD-0001Gs-0v;
	Thu, 17 Aug 2023 15:25:21 +0000
Date: Thu, 17 Aug 2023 23:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
	bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	lee@kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
	Balamanikandan.Gunasundar@microchip.com,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
	Durai Manickam KR <durai.manickamkr@microchip.com>,
	Hari.PrasathGE@microchip.com
Subject: Re: [PATCH v3 5/8] drm: atmel_hlcdc: Add support for XLCDC in atmel
 LCD driver
Message-ID: <202308172303.AgUIhGKY-lkp@intel.com>
References: <20230817091250.225512-6-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817091250.225512-6-manikandan.m@microchip.com>

Hi Manikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikandan-Muralidharan/mfd-atmel-hlcdc-Add-compatible-for-sam9x75-XLCD-controller/20230817-172003
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230817091250.225512-6-manikandan.m%40microchip.com
patch subject: [PATCH v3 5/8] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD driver
config: arm-randconfig-r046-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172303.AgUIhGKY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172303.AgUIhGKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172303.AgUIhGKY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1013:6: warning: no previous prototype for function 'hlcdc_irq_dbg' [-Wmissing-prototypes]
    1013 | void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         |      ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1013 | void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         | ^
         | static 
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1029:6: warning: no previous prototype for function 'xlcdc_irq_dbg' [-Wmissing-prototypes]
    1029 | void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         |      ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         | ^
         | static 
   2 warnings generated.


vim +/hlcdc_irq_dbg +1013 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c

  1012	
> 1013	void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
  1014			   const struct atmel_hlcdc_layer_desc *desc)
  1015	{
  1016		u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
  1017	
  1018		/*
  1019		 * There's not much we can do in case of overrun except informing
  1020		 * the user. However, we are in interrupt context here, hence the
  1021		 * use of dev_dbg().
  1022		 */
  1023		if (isr &
  1024		    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
  1025		     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
  1026			pr_warn("%s: overrun on plane %s\n", __func__, desc->name);
  1027	}
  1028	
> 1029	void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
  1030			   const struct atmel_hlcdc_layer_desc *desc)
  1031	{
  1032		u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
  1033	
  1034		/*
  1035		 * There's not much we can do in case of overrun except informing
  1036		 * the user. However, we are in interrupt context here, hence the
  1037		 * use of dev_dbg().
  1038		 */
  1039		if (isr &
  1040		    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
  1041		     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
  1042			pr_warn("%s: overrun on plane %s\n", __func__, desc->name);
  1043	}
  1044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
