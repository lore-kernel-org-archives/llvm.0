Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93323C6
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660033615; x=1691569615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ITEsOba8k7DFgGz1qirua169vBalTSUHIog7mLDnQ3I=;
  b=dGP0ntPz/YnZ0xSG9FRAwLPVBAHBWzlP8MRl/kwBTZSXY5amjX+m/Z0m
   /hx/f8lU8V1ETGSARQbodD5ViL0ogTJRixajHgQM8dIO2NWCHfSECY/Nf
   dR6tkzhE2cqQlUejlKOXQBNvLDUfpbSPLGQwTvcfYmqrnEPeW0mScM/RK
   gc1VgQf8wAOcu0U2s5eG+nxubsEgrXkFkRFMJuwfnFNNpyFsEwj51brNj
   7B1yvU/jH8KcHRKEM6w/wIN3p5abE1TfNdGdRaQ8doX7QcJsqxoaYRcgr
   c+cRBGwk42Rm+h5On5Fl4fu7h+D8NoapV0rhzLQVXfULa/MCthrqAVaeY
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="377075710"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="377075710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 01:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="637633147"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 01:26:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLKZY-000Mr7-09;
	Tue, 09 Aug 2022 08:26:44 +0000
Date: Tue, 9 Aug 2022 16:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Flax <flatmax@flatmax.com>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org,
	Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <202208091637.XWbySJt5-lkp@intel.com>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808214028.2502801-1-flatmax@flatmax.com>

Hi Matt,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next linus/master v5.19 next-20220809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091637.XWbySJt5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7a9219a8431d7740c0958e53078820cbfef4f3f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
        git checkout 7a9219a8431d7740c0958e53078820cbfef4f3f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: src4xxx_remove
   >>> referenced by src4xxx-i2c.c:25 (sound/soc/codecs/src4xxx-i2c.c:25)
   >>>               soc/codecs/src4xxx-i2c.o:(src4xxx_i2c_remove) in archive sound/built-in.a
   >>> referenced by src4xxx-i2c.c:25 (sound/soc/codecs/src4xxx-i2c.c:25)
   >>>               soc/codecs/src4xxx-i2c.o:(src4xxx_i2c_remove) in archive sound/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
