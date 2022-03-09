Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53D615B8
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646806197; x=1678342197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QaTkd09eG/R5KsguqislEV+gQdMXQ6RqN5ogPYnCM/g=;
  b=jovzajS/rAZueU2kOMKV6+6d61DgqxBc2Jc5ivFgsKK3/6iaiRLD+yrK
   WhQdTbSwjTBgdR4VnHzpV1J54MC96KyKiZROYFJOLbt90/6Q7XehCxnoD
   GUCmbNtnmhE/TTh/kxwm+SGsB3jRVKsI0PJHJxifBQMtqPMAclH3AqJTn
   3zD4cSYS0eNyJ5P6+ZUIrc3HRD1s/3KLbyNAO2+6n9cb8y20nwEbnH0VJ
   eH0zo9UKeHIBDnFnIU13DCS60O+gzs/tK0ug8u9ps7xWwX6FXh32+PFAZ
   H8BRal413+OcXp/6H4qnyZdF+9qc49zwj3ecA6/ZqwcVcs/0h02UMShan
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255087875"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="255087875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 22:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="643930050"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2022 22:09:55 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRpWE-0002hz-AH; Wed, 09 Mar 2022 06:09:54 +0000
Date: Wed, 9 Mar 2022 14:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [ammarfaizi2-block:broonie/sound/for-next 13916/13921]
 sound/soc/atmel/mchp-pdmc.c:186:34: warning: address of array
 'uvalue->value.integer.value' will always evaluate to 'true'
Message-ID: <202203091430.MLY27Bif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block broonie/sound/for-next
head:   0b7daa6bd0a4cab3b0c6f266a8cb1344ce14ef19
commit: 50291652af5269813baa6024eb0e81b5f0bbb451 [13916/13921] ASoC: atmel: mchp-pdmc: add PDMC driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220309/202203091430.MLY27Bif-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/50291652af5269813baa6024eb0e81b5f0bbb451
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block broonie/sound/for-next
        git checkout 50291652af5269813baa6024eb0e81b5f0bbb451
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/atmel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/atmel/mchp-pdmc.c:186:34: warning: address of array 'uvalue->value.integer.value' will always evaluate to 'true' [-Wpointer-bool-conversion]
           bool af = uvalue->value.integer.value ? true : false;
                     ~~~~~~~~~~~~~~~~~~~~~~^~~~~ ~
   1 warning generated.


vim +186 sound/soc/atmel/mchp-pdmc.c

   180	
   181	static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
   182				    struct snd_ctl_elem_value *uvalue)
   183	{
   184		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
   185		struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
 > 186		bool af = uvalue->value.integer.value ? true : false;
   187	
   188		if (dd->audio_filter_en == af)
   189			return 0;
   190	
   191		dd->audio_filter_en = af;
   192	
   193		return 1;
   194	}
   195	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
