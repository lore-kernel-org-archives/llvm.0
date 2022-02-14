Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D541C80
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644868460; x=1676404460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KpXmE+FVriVRkjct9OtLsWVf4x51oqA3agE1qAvhDEY=;
  b=lDZlaubEaNBQsF3mXJ/E/Ltg+4GITioPedE2zzfF+xVHd+584GPxbR1/
   pMBCdLkmO57QHUi8VmKe4HZgiOjqqgr8LUSLSJEI6wQeU1rc+ayDS/PRt
   uQ0j5/46dt1Mp+tMKadO7YbHQPbA7pqvvXXXEw33lMvb/QnWsnM6SRwOX
   YTDbpoPJVOGTf6Sx4vIc4oWRHIRPvNrhbBeuwQcy++iSidusD8T+yfW8I
   JHcTWGERLLojX5ka5VPyPHXGRUP8jxM1NveJ0MbM/8Zln2J2uWI6xIIA0
   QkNKnVIWOy9RXmy96aYdMR6yRifu0SnMLM+lus2XEp7jlxT5Sn8nqvqI6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230810732"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="230810732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 11:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="543875880"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2022 11:54:17 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJhQO-0008tC-VL; Mon, 14 Feb 2022 19:54:16 +0000
Date: Tue, 15 Feb 2022 03:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/5] platform/chrome: cros_kbd_led_backlight: separate
 ACPI backend
Message-ID: <202202150337.USCNWPYx-lkp@intel.com>
References: <20220214053646.3088298-3-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214053646.3088298-3-tzungbi@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tzung-Bi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on robh/for-next lee-mfd/for-mfd-next v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/platform-chrome-cros_kbd_led_backlight-add-EC-PWM-backend/20220214-133805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220215/202202150337.USCNWPYx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/aea3ce64e967f0980a22b475b6f4aa3154fff332
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tzung-Bi-Shih/platform-chrome-cros_kbd_led_backlight-add-EC-PWM-backend/20220214-133805
        git checkout aea3ce64e967f0980a22b475b6f4aa3154fff332
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/platform/chrome/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_kbd_led_backlight.c:158:36: warning: unused variable 'keyboard_led_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id keyboard_led_acpi_match[] = {
                                      ^
   1 warning generated.


vim +/keyboard_led_acpi_match +158 drivers/platform/chrome/cros_kbd_led_backlight.c

   157	
 > 158	static const struct acpi_device_id keyboard_led_acpi_match[] = {
   159		{ "GOOG0002", (kernel_ulong_t)&keyboard_led_drvdata_acpi },
   160		{ }
   161	};
   162	MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
   163	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
