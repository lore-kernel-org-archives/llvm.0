Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3763D6A
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645127292; x=1676663292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46Ao89wMcgm6jN7Eq+CdMeAAf93pn4JVEULNHnEFEMY=;
  b=SFb9AHQ/uLvBX1UaS+Rd4shzZWpPwUs6zsal3t+B3xVJirEr4wqs1ZAR
   GQS38Bls3RZsqcoTxMl0GCwFRhpHvTRb0GvRL+krlyd5tio0F75Dq3cFr
   EX0fC/HN4dnWXO8eEaw5ZyR+DSZkCxcqVKfgLfdj73RlqYvVEzr+3a+Wf
   kLr7/uHldXdkwSYMCaThMaLxmHXog3sv1Y/eT/Pg09m7++ARpPV6ZcNLf
   jMn+YTf4EYXY/sPZIolWcK0pe1Xfw9niBy/ueOUQdiScY39ragE0jhFiv
   oLUHeZ8GqKneVhNGxciyzJ6ikRmUW95PB545SDYcwy3vwujRoc2BKIVS8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="234491591"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="234491591"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 11:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="774877289"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 11:48:07 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKmkz-0000Xa-E7; Thu, 17 Feb 2022 19:48:01 +0000
Date: Fri, 18 Feb 2022 03:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
	bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
	perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
	rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, swboyd@chromium.org,
	judyhsiao@chromium.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: Add power domains support in digital macro
 codecs
Message-ID: <202202180153.WSEbQejW-lkp@intel.com>
References: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645108786-25990-1-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Srinivasa,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20220217]
[cannot apply to v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/ASoC-codecs-Add-power-domains-support-in-digital-macro-codecs/20220217-224032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r045-20220217 (https://download.01.org/0day-ci/archive/20220218/202202180153.WSEbQejW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/ASoC-codecs-Add-power-domains-support-in-digital-macro-codecs/20220217-224032
        git checkout a1e8b5e6a2baa8ce5b2373bfbdfce5a771132448
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: lpass_macro_pds_init
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
   >>> referenced by lpass-tx-macro.c
   >>> soc/codecs/lpass-tx-macro.o:(tx_macro_probe) in archive sound/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: lpass_macro_pds_exit
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_remove) in archive sound/built-in.a
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_remove) in archive sound/built-in.a
   >>> referenced by lpass-tx-macro.c
   >>> soc/codecs/lpass-tx-macro.o:(tx_macro_remove) in archive sound/built-in.a
   >>> referenced 1 more times

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
