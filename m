Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA52B7E3
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 05:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651038509; x=1682574509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXqeOH1dogFNIFn/QQfunhiX1942FaOED+keDWAAHeY=;
  b=cgGY37TzfhxPUb4rUBiVUFCbc2iLUx6D8xMfKtnP2xdYAnus/yN+rJwl
   3Klsx9v7UkMQYUBZxtg6jUejn12T8uc3E+UHYhI2B68hJPd5HNczNzsCN
   c+dy9BKzqlJ5iWCe7Fz15PjJNwWT7XVRsFmmEfBUUYNA3hP/vO7AcFpxw
   QJO27hZ2rZMAAC70qjjpap4UP+Z3SxFy1suKt+GcGYpq8BW5asF4fBr0V
   /GdK+XrLYnknaGcZUgsuaEOrfwLV1vnWBZiLk0OAxwiNv92W2rvQMT1l2
   R7S5ZXznKWuCTm0zsEmbZqrjXwtNN3obiOojAKjpkfyu1BxAtMhscPyrA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="352261004"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="352261004"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 22:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="539553875"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Apr 2022 22:48:26 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njaXJ-0004NS-LO;
	Wed, 27 Apr 2022 05:48:25 +0000
Date: Wed, 27 Apr 2022 13:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Yaochun Hung <yc.hung@mediatek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [linux-next:master 6086/6873] ld.lld: error: duplicate symbol:
 sof_hifixdsp_boot_sequence
Message-ID: <202204271301.UWzhiTRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   088fb7eff3496e0f61fdf68bda89b81a4d0a4434
commit: 570c14dc92d5dc6f732cb74fa691ef909d182710 [6086/6873] ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220427/202204271301.UWzhiTRP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=570c14dc92d5dc6f732cb74fa691ef909d182710
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 570c14dc92d5dc6f732cb74fa691ef909d182710
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 088fb7eff3496e0f61fdf68bda89b81a4d0a4434 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: sof_hifixdsp_boot_sequence
   >>> defined at mt8195-loader.c
   >>> soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_boot_sequence) in archive sound/built-in.a
   >>> defined at mt8186-loader.c
   >>> soc/sof/mediatek/mt8186/mt8186-loader.o:(.text+0x0) in archive sound/built-in.a
--
>> ld.lld: error: duplicate symbol: sof_hifixdsp_shutdown
   >>> defined at mt8195-loader.c
   >>> soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_shutdown) in archive sound/built-in.a
   >>> defined at mt8186-loader.c
   >>> soc/sof/mediatek/mt8186/mt8186-loader.o:(.text+0x150) in archive sound/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
