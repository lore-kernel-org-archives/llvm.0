Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0F7E
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648188733; x=1679724733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98w6sMdP+2FfIe4ozGHLqlTOCPvrVJV1bokWt1E65vc=;
  b=Tbrx3DTfDXhUjrZ1xVoqMTnU0NWk2Y3kaWvsau5kI7ozqY7+9izbHYxU
   rMwMtwIdcVJU2pOtGl4AFr8rjagZPYomo4kWy4sK6vbGTiZuDnAx5ipYY
   Lf9OyqCqzo9OJ7aXC9RFX/ZTVbtapz+v2Ew4wZ6ZpU5fHx512/I32a/s8
   cQZHck/BRah18WWwrHNM36vH1ZeCNQa5bdCmiIHTvxUJzPaqrfpgBnCwg
   CxXA61YzrIqdxCYjEbAfTZ9c12kiJFSF/SPl+M06R6MBjb8scwaSYV4K+
   aMTUz5vTp9d66OY3oIXo7noXS4m9HG5y1RwIAYjuniqCqiYnZ5wow8XQW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321759518"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="321759518"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 23:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="544958397"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2022 23:12:11 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXdBD-000LsK-1a; Fri, 25 Mar 2022 06:12:11 +0000
Date: Fri, 25 Mar 2022 14:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [broonie-misc:for-kernelci 6/7] sound/soc/codecs/wm8731.c:394:31:
 warning: format specifies type 'int' but the argument has type 'unsigned
 long'
Message-ID: <202203251449.v2pavIsV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git for-kernelci
head:   0265b10883453897a0ddcdbc21af5031ad5b4a7e
commit: 94c6c005fd4c9113c44acb727292f0acd1434a11 [6/7] TEST - MCLK SETTING
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220325/202203251449.v2pavIsV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/commit/?id=94c6c005fd4c9113c44acb727292f0acd1434a11
        git remote add broonie-misc https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git
        git fetch --no-tags broonie-misc for-kernelci
        git checkout 94c6c005fd4c9113c44acb727292f0acd1434a11
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wm8731.c:394:31: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                           pr_crit("SET SYSCLK %d\n", clk_get_rate(wm8731->mclk));
                                               ~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                               %lu
   include/linux/printk.h:479:34: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   sound/soc/codecs/wm8731.c:751:34: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                   pr_crit("WM8731 MCLK IS %d\n", clk_get_rate(wm8731->mclk));
                                           ~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                           %lu
   include/linux/printk.h:479:34: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +394 sound/soc/codecs/wm8731.c

   380	
   381	static int wm8731_set_dai_sysclk(struct snd_soc_dai *codec_dai,
   382			int clk_id, unsigned int freq, int dir)
   383	{
   384		struct snd_soc_component *component = codec_dai->component;
   385		struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
   386		struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
   387	
   388		switch (clk_id) {
   389		case WM8731_SYSCLK_XTAL:
   390		case WM8731_SYSCLK_MCLK:
   391			if (wm8731->mclk && clk_set_rate(wm8731->mclk, freq))
   392				return -EINVAL;
   393			if (wm8731->mclk)
 > 394				pr_crit("SET SYSCLK %d\n", clk_get_rate(wm8731->mclk));
   395			wm8731->sysclk_type = clk_id;
   396			break;
   397		default:
   398			return -EINVAL;
   399		}
   400	
   401		switch (freq) {
   402		case 0:
   403			wm8731->constraints = NULL;
   404			break;
   405		case 12000000:
   406			wm8731->constraints = &wm8731_constraints_12000000;
   407			break;
   408		case 12288000:
   409		case 18432000:
   410			wm8731->constraints = &wm8731_constraints_12288000_18432000;
   411			break;
   412		case 16934400:
   413		case 11289600:
   414			wm8731->constraints = &wm8731_constraints_11289600_16934400;
   415			break;
   416		default:
   417			return -EINVAL;
   418		}
   419	
   420		wm8731->sysclk = freq;
   421	
   422		snd_soc_dapm_sync(dapm);
   423	
   424		return 0;
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
