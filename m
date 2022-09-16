Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB17E
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663310031; x=1694846031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CcQtu7M5Hwg3j2Hj9+QAZNEeLiOmSxNdcPQCjhrtlmw=;
  b=RS9zPKxhh5x8c5MhUWiU7GUPvLOSgFHgGC5cHXNiIxhwpJIuPisxrrnA
   qfRn7egeHL1bA3/GqdmXR1doekxX4Y/c/qwT4TW8ivVYmN+/eNpF3PoGK
   ecnYAc1mI3jAkmpoeRht5CVT7YefKU2UPc5FlgSV5NlhdT9SD2vQQLlY2
   Fu2WarzFmV/NcdKTrYVsFoIViZ7s67dz6IIXJMZKn5dFXA0AEHAyB5nTt
   H/PW/3VDENEK026QIrZ+ICNE4itFFXy5f5OJKXrFpwik4SLHGUcBlsyeZ
   0fPi+c0X3nE1u4MHMPaQNGO8wejZO9KHAwM3ng72eSB9Kc4LxgTzjWbfE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278653695"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="278653695"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 23:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="568728749"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2022 23:33:40 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ4ux-0001Vq-0z;
	Fri, 16 Sep 2022 06:33:39 +0000
Date: Fri, 16 Sep 2022 14:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	broonie@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, lgirdwood@gmail.com,
	bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 7/9] ASoC: qdsp6: audioreach: add support to enable SAL
 Module
Message-ID: <202209161405.8VjleAAg-lkp@intel.com>
References: <20220915123837.11591-8-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915123837.11591-8-srinivas.kandagatla@linaro.org>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v6.0-rc5 next-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qdsp6-audioreach-add-multi-port-SAL-and-MFC-support/20220915-204217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r021-20220915 (https://download.01.org/0day-ci/archive/20220916/202209161405.8VjleAAg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 405b19bb679e3371abd9cd02dc1484213a4ebb88)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/deea0cb75db349cdcece853a658b68f4424da861
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Kandagatla/ASoC-qdsp6-audioreach-add-multi-port-SAL-and-MFC-support/20220915-204217
        git checkout deea0cb75db349cdcece853a658b68f4424da861
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/qcom/qdsp6/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/qcom/qdsp6/audioreach.c:434:6: warning: variable 'graph_id' set but not used [-Wunused-but-set-variable]
           int graph_id;
               ^
>> sound/soc/qcom/qdsp6/audioreach.c:1050:7: warning: variable 'rc' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case MODULE_ID_SAL:
                ^~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.h:18:25: note: expanded from macro 'MODULE_ID_SAL'
   #define MODULE_ID_SAL                   0x07001010
                                           ^~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:1059:9: note: uninitialized use occurs here
           return rc;
                  ^~
   sound/soc/qcom/qdsp6/audioreach.c:1025:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   2 warnings generated.


vim +/rc +1050 sound/soc/qcom/qdsp6/audioreach.c

  1021	
  1022	int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
  1023					struct audioreach_module_config *cfg)
  1024	{
  1025		int rc;
  1026	
  1027		switch (module->module_id) {
  1028		case MODULE_ID_DATA_LOGGING:
  1029			rc = audioreach_logging_set_media_format(graph, module);
  1030			break;
  1031		case MODULE_ID_PCM_DEC:
  1032		case MODULE_ID_PCM_ENC:
  1033		case MODULE_ID_PCM_CNV:
  1034			rc = audioreach_pcm_set_media_format(graph, module, cfg);
  1035			break;
  1036		case MODULE_ID_I2S_SOURCE:
  1037		case MODULE_ID_I2S_SINK:
  1038			rc = audioreach_i2s_set_media_format(graph, module, cfg);
  1039			break;
  1040		case MODULE_ID_WR_SHARED_MEM_EP:
  1041			rc = audioreach_shmem_set_media_format(graph, module, cfg);
  1042			break;
  1043		case MODULE_ID_GAIN:
  1044			rc = audioreach_gain_set(graph, module);
  1045			break;
  1046		case MODULE_ID_CODEC_DMA_SINK:
  1047		case MODULE_ID_CODEC_DMA_SOURCE:
  1048			rc = audioreach_codec_dma_set_media_format(graph, module, cfg);
  1049			break;
> 1050		case MODULE_ID_SAL:
  1051			audioreach_sal_set_media_format(graph, module, cfg);
  1052			audioreach_sal_limiter_enable(graph, module, true);
  1053			break;
  1054	
  1055		default:
  1056			rc = 0;
  1057		}
  1058	
  1059		return rc;
  1060	}
  1061	EXPORT_SYMBOL_GPL(audioreach_set_media_format);
  1062	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
