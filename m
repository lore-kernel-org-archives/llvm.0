Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCBC198
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 00:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657845236; x=1689381236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LmHXyKnAKMH9F3nbUsgv39wMlBgdj3qLzQZyWOGkDDQ=;
  b=UFsOAEEaL1HerVj/tLyco8gCKtkJ5tWCSEps8/4fUVRU1RuyqYdESwkF
   +U7zZRJYMJjiaTfKW6SZRJLfPFmlXjeih4wobYVBHgbTpe7PSG8UL2Vna
   WbBXX7sQwEcOZ1i6qhXPfEHl/LAVsuSPUZ+mrKHkNPeovUcF54Dx1iHzI
   Epgc23Yj8ycOVTxDNHi1VNHDdtb67vCqRZ7cWnFV9utbFlAszdEhjv9PI
   gMWrKYs3RJwLgAqDfEf2Bk4OEYbiAL8v0OGmPV/sZhB3XbfOpQHMoE2tp
   JP1fykZvaXdlX4gnJ6yX0/+cMxb9g0VF9iX952i9yUUUheKtozdWSshEu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="284423737"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="284423737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 17:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="546470039"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Jul 2022 17:33:52 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC9HE-0001JL-2q;
	Fri, 15 Jul 2022 00:33:52 +0000
Date: Fri, 15 Jul 2022 08:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Bara <bbara93@gmail.com>, dmitry.torokhov@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH] Input: tsc2007 - enable GPIO chips that can sleep
Message-ID: <202207150807.PrPXLs2u-lkp@intel.com>
References: <20220713084247.3090353-1-bbara93@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713084247.3090353-1-bbara93@gmail.com>

Hi Benjamin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on hid/for-next linus/master v5.19-rc6 next-20220714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/Input-tsc2007-enable-GPIO-chips-that-can-sleep/20220713-164521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: riscv-randconfig-r003-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150807.PrPXLs2u-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/13455f523263c4e90b5cc8c587ef2be97008ff5f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Bara/Input-tsc2007-enable-GPIO-chips-that-can-sleep/20220713-164521
        git checkout 13455f523263c4e90b5cc8c587ef2be97008ff5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/amd/display/amdgpu_dm/ drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/tsc2007_core.c:112:6: warning: no previous prototype for function 'tsc2007_is_pen_down_cansleep' [-Wmissing-prototypes]
   bool tsc2007_is_pen_down_cansleep(struct tsc2007 *ts)
        ^
   drivers/input/touchscreen/tsc2007_core.c:112:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool tsc2007_is_pen_down_cansleep(struct tsc2007 *ts)
   ^
   static 
   1 warning generated.


vim +/tsc2007_is_pen_down_cansleep +112 drivers/input/touchscreen/tsc2007_core.c

   111	
 > 112	bool tsc2007_is_pen_down_cansleep(struct tsc2007 *ts)
   113	{
   114		if (!ts->get_pendown_state_cansleep)
   115			return true;
   116	
   117		return ts->get_pendown_state_cansleep(&ts->client->dev);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
