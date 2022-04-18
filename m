Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCDA7A
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650294035; x=1681830035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TmpEicF6mLIJYC1EAlp85kgc9gJy1CgAeiplxYFpnXk=;
  b=DYwZ9M/oxbGE1VdDw31kyXJpDcvgCkaf3TfGjOEEYA1DqfVOCgY8a+Om
   O7caIYheqTYBe743AYjMPGAlpG8bL4Iw9bWySZpK8tLD3ShuK3O9cgAea
   bTbj8NmY1Q8bk/rlms0OMOMKq1M/cPsthG9k2reQbpYh2nozC4d7crGAW
   WsDuTsQS7TfqQhiBCeH6XMun0H5bRnYi9cs+W8wNA1pG2YlGla+IcsiK9
   kH1NOBVEqxPe/GGuelPj48KiGvCtCi7FNe0Jpb9OFxrbxudOrdeoZuK9u
   ivX/z7P6HKGikOGPiH2uN7EwotSN1SkPKs2rR9FTRHyje4vEI07vcZcTT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263708215"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="263708215"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 08:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="509763648"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2022 08:00:31 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngSrf-0004im-18;
	Mon, 18 Apr 2022 15:00:31 +0000
Date: Mon, 18 Apr 2022 22:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202204182258.j7khWQWC-lkp@intel.com>
References: <20220405131220.1149-1-zhuning0077@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405131220.1149-1-zhuning0077@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220408-155312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r012-20220418 (https://download.01.org/0day-ci/archive/20220418/202204182258.j7khWQWC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a03666fc9b47aca9c81a796145c3d31fa718a49e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220408-155312
        git checkout a03666fc9b47aca9c81a796145c3d31fa718a49e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:734:34: warning: unused variable 'es8326_of_match' [-Wunused-const-variable]
   static const struct of_device_id es8326_of_match[] = {
                                    ^
   1 warning generated.


vim +/es8326_of_match +734 sound/soc/codecs/es8326.c

   733	
 > 734	static const struct of_device_id es8326_of_match[] = {
   735		{ .compatible = "everest, es8326", },
   736		{}
   737	};
   738	MODULE_DEVICE_TABLE(of, es8326_of_match);
   739	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
