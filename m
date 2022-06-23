Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ECD1876
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655980115; x=1687516115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4Sthml+RSuNKlvKET6YO+99XMQfhzqF+k13wbP3e7s=;
  b=Zx0E+ygUe+m6yYI0gTciRcnfwZraqm0N5OdZ0b+qv3po3/AgFeGv9Ghv
   PVED8P5tm0YvdnxE0KqMZ6ce+b/0olbl4q6sAB1PKGBssB9iTIt2Vi4Ht
   4VPvim7jmH0via7ENMekF32+VUduxJXwE8YQu823mZ3pmvmZPVFq98tqL
   7RsjFidhh/QI8d5XXDqS2++FIuRGs1lsi2bbnmUzDenZyP4U0p1fxbWiT
   t204qIsINJtmV0R/qLtjarkKeIMz7Dr82/Rz3iRVzCNGiY9ClNXJ5WJZh
   xjNVSN29MenW6Z2kzky2btS+KKilHdsiCYzr2dzQLdN8fp0mRn9yG83rT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280729849"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="280729849"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 03:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="538841498"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jun 2022 03:28:32 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4K4e-000188-21;
	Thu, 23 Jun 2022 10:28:32 +0000
Date: Thu, 23 Jun 2022 18:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morimoto:sound-2022-06-23-v1 5/6] sound/soc/soc-compress.c:576:6:
 error: call to undeclared function 'snd_soc_dai_stream_valid'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202206231806.XlcMiKyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-2022-06-23-v1
head:   89b1076b7f62654c8d386b8dd2faf8b315f2ac46
commit: 654b6b4d8e15ff4617278a6609e9dda51dda8169 [5/6] hoge
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220623/202206231806.XlcMiKyL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/654b6b4d8e15ff4617278a6609e9dda51dda8169
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-2022-06-23-v1
        git checkout 654b6b4d8e15ff4617278a6609e9dda51dda8169
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/soc-compress.c:576:6: error: call to undeclared function 'snd_soc_dai_stream_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
               ^
   sound/soc/soc-compress.c:576:6: note: did you mean 'snd_soc_dai_stream_active'?
   include/sound/soc-dai.h:600:1: note: 'snd_soc_dai_stream_active' declared here
   snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
   ^
   1 error generated.


vim +/snd_soc_dai_stream_valid +576 sound/soc/soc-compress.c

2a99ef0fdb35a0 Liam Girdwood     2014-01-17  535  
6f0c42269f000b Jie Yang          2015-10-13  536  /**
6f0c42269f000b Jie Yang          2015-10-13  537   * snd_soc_new_compress - create a new compress.
6f0c42269f000b Jie Yang          2015-10-13  538   *
6f0c42269f000b Jie Yang          2015-10-13  539   * @rtd: The runtime for which we will create compress
6f0c42269f000b Jie Yang          2015-10-13  540   * @num: the device index number (zero based - shared with normal PCMs)
6f0c42269f000b Jie Yang          2015-10-13  541   *
6f0c42269f000b Jie Yang          2015-10-13  542   * Return: 0 for success, else error.
6f0c42269f000b Jie Yang          2015-10-13  543   */
6f0c42269f000b Jie Yang          2015-10-13  544  int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
1245b7005de02d Namarta Kohli     2012-08-16  545  {
9e7e3738ab0e90 Kuninori Morimoto 2017-10-11  546  	struct snd_soc_component *component;
c2233a266178f8 Kuninori Morimoto 2020-03-30  547  	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
c2233a266178f8 Kuninori Morimoto 2020-03-30  548  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
1245b7005de02d Namarta Kohli     2012-08-16  549  	struct snd_compr *compr;
2a99ef0fdb35a0 Liam Girdwood     2014-01-17  550  	struct snd_pcm *be_pcm;
1245b7005de02d Namarta Kohli     2012-08-16  551  	char new_name[64];
1245b7005de02d Namarta Kohli     2012-08-16  552  	int ret = 0, direction = 0;
a1068045883ed4 Vinod Koul        2016-01-07  553  	int playback = 0, capture = 0;
613fb50059cf19 Kuninori Morimoto 2020-01-10  554  	int i;
1245b7005de02d Namarta Kohli     2012-08-16  555  
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  556  	/*
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  557  	 * make sure these are same value,
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  558  	 * and then use these as equally
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  559  	 */
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  560  	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_PLAYBACK != (int)SND_COMPRESS_PLAYBACK);
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  561  	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_CAPTURE  != (int)SND_COMPRESS_CAPTURE);
7428d8c8bd7936 Kuninori Morimoto 2020-10-30  562  
6e1276a5e613d2 Bard Liao         2020-02-25  563  	if (rtd->num_cpus > 1 ||
6e1276a5e613d2 Bard Liao         2020-02-25  564  	    rtd->num_codecs > 1) {
141dfc9e3751f5 Charles Keepax    2018-01-26  565  		dev_err(rtd->card->dev,
6e1276a5e613d2 Bard Liao         2020-02-25  566  			"Compress ASoC: Multi CPU/Codec not supported\n");
8151d5e60232d3 Benoit Cousson    2014-07-08  567  		return -EINVAL;
8151d5e60232d3 Benoit Cousson    2014-07-08  568  	}
8151d5e60232d3 Benoit Cousson    2014-07-08  569  
ccb4214f7f2a8b Jiasheng Jiang    2022-03-10  570  	if (!codec_dai) {
ccb4214f7f2a8b Jiasheng Jiang    2022-03-10  571  		dev_err(rtd->card->dev, "Missing codec\n");
ccb4214f7f2a8b Jiasheng Jiang    2022-03-10  572  		return -EINVAL;
ccb4214f7f2a8b Jiasheng Jiang    2022-03-10  573  	}
ccb4214f7f2a8b Jiasheng Jiang    2022-03-10  574  
1245b7005de02d Namarta Kohli     2012-08-16  575  	/* check client and interface hw capabilities */
467fece8fbc677 Kuninori Morimoto 2019-07-22 @576  	if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&

:::::: The code at line 576 was first introduced by commit
:::::: 467fece8fbc6774a3a3bd0981e1a342fb5022706 ASoC: soc-dai: move snd_soc_dai_stream_valid() to soc-dai.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
