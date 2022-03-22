Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B115B66A2
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647992019; x=1679528019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0h5+Be9KVGlp5EUr2LBBREV33KBgaXWkMwKFPpsWbQI=;
  b=V0RVK14R8Eplim5KDyP1QVCWRBlWO3c16fFfxlhr/oAfiQoz4P8m7AU1
   rrIyMs9uotwSdF8Atm4C1UAV1pt/Ae53SsWuFQMnB+lojxxdyb8MRZLQP
   qfsMHs/rOoAAc3Tmx6LZ9lk0O0onLAG/STb7DQLlFHQihK2cVzuWKYy5C
   BoGsh8EhVzvH12aA25j+pB/QnLL+SWODTczDR76tN/fTKjJrotkxEbfua
   t8kMl7YD9gFGNEmuxExeEwnIE8Dsr0I2XV+99tm50CitypS/dFCs92zXv
   WS2X39EQvO66KEjZ5/8aP5JtXxCW1cMCkwTDft03L8f1Qbd8ryhZhHyQ3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240139678"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="240139678"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 16:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="515577430"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2022 16:33:35 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWo0M-000JOv-Gf; Tue, 22 Mar 2022 23:33:34 +0000
Date: Wed, 23 Mar 2022 07:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, dmitry.torokhov@gmail.com,
	tiwai@suse.de, mpdesouza@suse.com, arnd@arndb.de,
	hdegoede@redhat.com, samuel@cavoj.net, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/4] input/i8042: Add debug output for quirks
Message-ID: <202203230711.7C5PXp0s-lkp@intel.com>
References: <20220322162125.59838-4-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322162125.59838-4-wse@tuxedocomputers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Werner,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on v5.17 next-20220322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Werner-Sembach/input-i8042-Move-__initconst-to-fix-code-styling-warning/20220323-012205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-buildonly-randconfig-r002-20220321 (https://download.01.org/0day-ci/archive/20220323/202203230711.7C5PXp0s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f4708fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d92be72641d5753be3aa94fe5961e2dbe2b5bdc9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Werner-Sembach/input-i8042-Move-__initconst-to-fix-code-styling-warning/20220323-012205
        git checkout d92be72641d5753be3aa94fe5961e2dbe2b5bdc9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/input/serio/i8042.c:135:
   In file included from drivers/input/serio/i8042.h:23:
>> drivers/input/serio/i8042-x86ia64io.h:1512:3: error: use of undeclared identifier 'i8042_nopnp'
                   i8042_nopnp ? " nopnp" : "");
                   ^
   1 error generated.


vim +/i8042_nopnp +1512 drivers/input/serio/i8042-x86ia64io.h

  1494	
  1495		i8042_check_quirks();
  1496	
  1497		pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
  1498			i8042_nokbd ? " nokbd" : "",
  1499			i8042_noaux ? " noaux" : "",
  1500			i8042_nomux ? " nomux" : "",
  1501			i8042_unlock ? " unlock" : "",
  1502			i8042_probe_defer ? "probe_defer" : "",
  1503			i8042_reset == I8042_RESET_DEFAULT ?
  1504				"" : i8042_reset == I8042_RESET_ALWAYS ?
  1505					" reset_always" : " reset_never",
  1506			i8042_direct ? " direct" : "",
  1507			i8042_dumbkbd ? " dumbkbd" : "",
  1508			i8042_noloop ? " noloop" : "",
  1509			i8042_notimeout ? " notimeout" : "",
  1510			i8042_kbdreset ? " kbdreset" : "",
  1511			i8042_dritek ? " dritek" : "",
> 1512			i8042_nopnp ? " nopnp" : "");
  1513	
  1514		retval = i8042_pnp_init();
  1515		if (retval)
  1516			return retval;
  1517	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
