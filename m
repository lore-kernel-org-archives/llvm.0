Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4957C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646163740; x=1677699740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jEz/DJzpwaJIm6VwC7B5azcRqmPUDVe75s6sEfdqSk=;
  b=ZsglmXqXCkNZ1aQgUSWDYxByb1dncAMGe1wVEM3YKackMiqqUeLnFC3O
   M2oOspQf5SAGS4x54QaZzOWtMbd0dlcGYFk3dPdztQW+KFQeFJTb9JD6B
   UzT3idMds0IMYjgperfkY58xZw9TN8teQc87UvRVsJ1IbK3s0gsL0lBYg
   4bsM0VMMfaOJPf6I0NucG0lVEzkf/3d7bRNfe/fbRIt9yUhRtA/SRNAhm
   FtgCn5cIMS+m3z40ShiDsed6XBBjxd+A4c9QWWk8NydZeBe7dktwO0r3w
   tSMc+vwwe45t492oWhEjofbB0vWjsKjtSbIOzkIpMx33/g5EUldYHLY4U
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="339656127"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="339656127"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 11:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="493233881"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2022 11:42:08 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP8Nr-0000wF-Cm; Tue, 01 Mar 2022 19:42:07 +0000
Date: Wed, 2 Mar 2022 03:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, perex@perex.cz,
	matthias.bgg@gmail.com, trevor.wu@mediatek.com, tzungbi@google.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: bt-sco: fix bt-sco-pcm-wb dai widget don't connect
 to the endpoint
Message-ID: <202203020332.YsOHk7De-lkp@intel.com>
References: <20220301171137.27442-1-jiaxin.yu@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301171137.27442-1-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jiaxin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiaxin-Yu/ASoC-bt-sco-fix-bt-sco-pcm-wb-dai-widget-don-t-connect-to-the-endpoint/20220302-011344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r045-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020332.YsOHk7De-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/de4d22036c32b5b4be162ace0b3ce74c193c43c0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiaxin-Yu/ASoC-bt-sco-fix-bt-sco-pcm-wb-dai-widget-don-t-connect-to-the-endpoint/20220302-011344
        git checkout de4d22036c32b5b4be162ace0b3ce74c193c43c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/bt-sco.c:26:1: error: extraneous closing brace ('}')
   };
   ^
   1 error generated.


vim +26 sound/soc/codecs/bt-sco.c

5195ca4902fe0b Mark Brown 2013-08-19  21  
5195ca4902fe0b Mark Brown 2013-08-19  22  static const struct snd_soc_dapm_route bt_sco_routes[] = {
de4d22036c32b5 Jiaxin Yu  2022-03-02  23  	{ "BT_SCO_TX", NULL, "RX" },
de4d22036c32b5 Jiaxin Yu  2022-03-02  24  	{ "TX", NULL, "BT_SCO_RX" },
de4d22036c32b5 Jiaxin Yu  2022-03-02  25  };
5195ca4902fe0b Mark Brown 2013-08-19 @26  };
5195ca4902fe0b Mark Brown 2013-08-19  27  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
