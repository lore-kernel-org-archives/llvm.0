Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32B2C9D
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 11:26:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236770708"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="236770708"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 03:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="597926254"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Dec 2021 03:26:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mt6hb-000HVx-Hz; Fri, 03 Dec 2021 11:26:07 +0000
Date: Fri, 3 Dec 2021 19:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [linux-next:master 3956/5128]
 sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier
 'CODEC_PROBE_RETRIES'
Message-ID: <202112031943.Twg19fWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: 046aede2f847676f93a2ea4f48b77909c51dba40 [3956/5128] ASoC: SOF: Intel: Retry codec probing if it fails
config: i386-randconfig-r033-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031943.Twg19fWT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=046aede2f847676f93a2ea4f48b77909c51dba40
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 046aede2f847676f93a2ea4f48b77909c51dba40
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier 'CODEC_PROBE_RETRIES'
           } while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
                                            ^
   1 error generated.


vim +/CODEC_PROBE_RETRIES +132 sound/soc/sof/intel/hda-codec.c

   110	
   111	/* probe individual codec */
   112	static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
   113				   bool hda_codec_use_common_hdmi)
   114	{
   115	#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
   116		struct hdac_hda_priv *hda_priv;
   117		struct hda_codec *codec;
   118		int type = HDA_DEV_LEGACY;
   119	#endif
   120		struct hda_bus *hbus = sof_to_hbus(sdev);
   121		struct hdac_device *hdev;
   122		u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
   123			(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
   124		u32 resp = -1;
   125		int ret, retry = 0;
   126	
   127		do {
   128			mutex_lock(&hbus->core.cmd_mutex);
   129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
   130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
   131			mutex_unlock(&hbus->core.cmd_mutex);
 > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
   133	
   134		if (resp == -1)
   135			return -EIO;
   136		dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",
   137			address, resp);
   138	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
