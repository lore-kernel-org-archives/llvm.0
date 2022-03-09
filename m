Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E45104
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646850265; x=1678386265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nb2k3DJ2sjUn++CWwkUeUgChHZFdkntbRCx6xp/JsJA=;
  b=BiMAcojiTvW6l2mCDZ1lZBOHy97xmowqkbHYr6AHUXkxElGAx4vTakUW
   mxfGWHyKKo9UcsgVOcx9pow/UcE8e6cluVwcjUfbyLOlK/0l9zR/Lgost
   3Db2jDMA8S/uCxY5JL4mDdjHgQwaLkMwtfuJaTvcRvN2Ak6Cm0dNVb7Q2
   5bnHjNqsZfV5UvwlaGQ1r1Q0o3fFDmSFC9gG4aFu4I5/toGsJQKN2yKru
   48l1vY7DtH/VpBWxWJaW0uOIM7azbqLjNNl21BA0l2+jg0/6LZcMnk6Wa
   vCCBtoMlHmoQD5yh6DDk2M/QjAA3nQmsyIxOt1ccmG6i03dboYA7fKy4u
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="253887412"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; 
   d="scan'208";a="253887412"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 10:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; 
   d="scan'208";a="815073576"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2022 10:24:22 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nS0z0-0003go-4i; Wed, 09 Mar 2022 18:24:22 +0000
Date: Thu, 10 Mar 2022 02:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Krishna Jha <quic_kkishorj@quicinc.com>
Subject: Re: [PATCH V0 1/1] ASoC: msm: fix integer overflow for long duration
 offload playback
Message-ID: <202203100248.RVGW6JZh-lkp@intel.com>
References: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Raghu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on vkoul-dmaengine/next broonie-sound/for-next v5.17-rc7 next-20220309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Raghu-Bankapur/ASoC-msm-fix-integer-overflow-for-long-duration-compress-offload-playback/20220309-222520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220310/202203100248.RVGW6JZh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9020c5c2e38ba210a8d822d20e32bed85a4ffcab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Raghu-Bankapur/ASoC-msm-fix-integer-overflow-for-long-duration-compress-offload-playback/20220309-222520
        git checkout 9020c5c2e38ba210a8d822d20e32bed85a4ffcab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/intel/atom/sst/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/intel/atom/sst/sst_drv_interface.c:370:11: warning: format specifies type 'int' but the argument has type '__u64' (aka 'unsigned long long') [-Wformat]
                   str_id, tstamp->copied_total, tstamp->pcm_frames);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   1 warning generated.


vim +370 sound/soc/intel/atom/sst/sst_drv_interface.c

7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  343  
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  344  static int sst_cdev_tstamp(struct device *dev, unsigned int str_id,
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  345  		struct snd_compr_tstamp *tstamp)
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  346  {
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  347  	struct snd_sst_tstamp fw_tstamp = {0,};
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  348  	struct stream_info *stream;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  349  	struct intel_sst_drv *ctx = dev_get_drvdata(dev);
ce1cfe295abaa7 sound/soc/intel/atom/sst/sst_drv_interface.c Pierre-Louis Bossart 2018-07-24  350  	void __iomem *addr;
ce1cfe295abaa7 sound/soc/intel/atom/sst/sst_drv_interface.c Pierre-Louis Bossart 2018-07-24  351  
ce1cfe295abaa7 sound/soc/intel/atom/sst/sst_drv_interface.c Pierre-Louis Bossart 2018-07-24  352  	addr = (void __iomem *)(ctx->mailbox + ctx->tstamp) +
ce1cfe295abaa7 sound/soc/intel/atom/sst/sst_drv_interface.c Pierre-Louis Bossart 2018-07-24  353  		(str_id * sizeof(fw_tstamp));
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  354  
ce1cfe295abaa7 sound/soc/intel/atom/sst/sst_drv_interface.c Pierre-Louis Bossart 2018-07-24  355  	memcpy_fromio(&fw_tstamp, addr, sizeof(fw_tstamp));
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  356  
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  357  	stream = get_stream_info(ctx, str_id);
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  358  	if (!stream)
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  359  		return -EINVAL;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  360  	dev_dbg(dev, "rb_counter %llu in bytes\n", fw_tstamp.ring_buffer_counter);
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  361  
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  362  	tstamp->copied_total = fw_tstamp.ring_buffer_counter;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  363  	tstamp->pcm_frames = fw_tstamp.frames_decoded;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  364  	tstamp->pcm_io_frames = div_u64(fw_tstamp.hardware_counter,
75afbd052b3675 sound/soc/intel/atom/sst/sst_drv_interface.c Dan Carpenter        2015-04-09  365  			(u64)stream->num_ch * SST_GET_BYTES_PER_SAMPLE(24));
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  366  	tstamp->sampling_rate = fw_tstamp.sampling_frequency;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  367  
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  368  	dev_dbg(dev, "PCM  = %u\n", tstamp->pcm_io_frames);
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  369  	dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %d\n",
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30 @370  		str_id, tstamp->copied_total, tstamp->pcm_frames);
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  371  	dev_dbg(dev, "rendered %d\n", tstamp->pcm_io_frames);
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  372  
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  373  	return 0;
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  374  }
7adab122a57c5a sound/soc/intel/sst/sst_drv_interface.c      Vinod Koul           2014-10-30  375  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
