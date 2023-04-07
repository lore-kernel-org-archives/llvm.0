Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BF5EBC;
	Fri,  7 Apr 2023 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680841109; x=1712377109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GIHjzAPg982+LywILSJjcA6riK6gR/WWQJGurfTO+dA=;
  b=hvB7+L8ezB++Vz1XSXK00z6iHZlVsLQqdRKJfpBsmTaenRwD+DM8HVxe
   cahcF+SnXGA/2UbvFL65AvreNH6jCHqJuVhBfEv73R+7FL4JbVvlyOs54
   iMQNnI9HhalQWTXiS6pCJ9d40W/JylFOxW0y7UBRGeIiIDn3mTJGMlVAv
   jkirjfRiNed+OzGAJz/Ybiss4ZSdLYKqbFHJKnWbjLvKPNNaGkR1A+SZQ
   M9fALgS+pWVDhcsvuoNEwZQZ1khfeuvL93N0ioJaLpsWGiV1JmrYLe+0v
   28Ggn7Oo/07NtGydy4t2flJ/w7gwHeJCVI2Ku68h1J4TIcCkk67w9V+LF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341674626"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="341674626"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 21:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719946054"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="719946054"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 21:18:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkdYQ-000S7G-1l;
	Fri, 07 Apr 2023 04:18:26 +0000
Date: Fri, 7 Apr 2023 12:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] drm: Add fdinfo memory stats
Message-ID: <202304071241.sHlGa8UH-lkp@intel.com>
References: <20230406215917.1475704-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406215917.1475704-2-robdclark@gmail.com>

Hi Rob,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-Add-fdinfo-memory-stats/20230407-060118
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406215917.1475704-2-robdclark%40gmail.com
patch subject: [RFC 1/2] drm: Add fdinfo memory stats
config: i386-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230407/202304071241.sHlGa8UH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eebbb3ec0a196240e1084554563ac4ae7e85dbb3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/drm-Add-fdinfo-memory-stats/20230407-060118
        git checkout eebbb3ec0a196240e1084554563ac4ae7e85dbb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071241.sHlGa8UH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:883:39: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
                               ~~~              ^~
                               %zu
   1 warning generated.


vim +883 drivers/gpu/drm/drm_file.c

   871	
   872	static void print_size(struct drm_printer *p, const char *stat, size_t sz)
   873	{
   874		const char *units[] = {"B", "KiB", "MiB", "GiB"};
   875		unsigned u;
   876	
   877		for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
   878			if (sz < SZ_1K)
   879				break;
   880			sz /= SZ_1K;
   881		}
   882	
 > 883		drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
   884	}
   885	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
