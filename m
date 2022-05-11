Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1782F56
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652302468; x=1683838468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHdMwJi+YHeRcv/QgpUJzGPMJPCs9NZDCqnYZB6mlbg=;
  b=ener1al1w0fAMxtTdnYfVfJTeQ6SWmIIKdhV+lms0wp6DVyBgubVnkjX
   Vtogvzt5kBV4KFDhtT3xUXBE3oa8c9Oa/Vx15yRwwNgu8yRWf+7kEzWP7
   UGUJVo+NTG2uaqvRd6ZdwfrdEX553KvCX8KOKMO3aOe65In9bZnnu/XtF
   SaeWgQRlzej91alo+7R9m4Fk3Q/Ex6xpdOb8gf+B7rjH+tpyxaWFUWEu4
   rljOa47cOhpxXNc7MqQnT15Ch74rLkFPbtxY/Fw21DUdJyn1h5WVOTXz3
   Yo4s8xvdhc2o3MrcaKIBOllchSWfmR5Ln4ulzyEzf1xwH7Ee9PoWsX21U
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269482170"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="269482170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 13:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="603089585"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2022 13:54:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1notLf-000JZY-Pl;
	Wed, 11 May 2022 20:54:19 +0000
Date: Thu, 12 May 2022 04:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michal Suchanek <msuchanek@suse.de>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Stultz <john.stultz@linaro.org>,
	Curtis Malainey <cujomalainey@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	YC Hung <yc.hung@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v8 2/3] ASoC: SOF: mediatek: Add ipc support for mt8195
Message-ID: <202205120445.hi3YjsKr-lkp@intel.com>
References: <20220511042718.4305-3-tinghan.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511042718.4305-3-tinghan.shen@mediatek.com>

Hi Tinghan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next linus/master v5.18-rc6 next-20220511]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tinghan-Shen/firmware-mtk-add-adsp-ipc-protocol-for-SOF/20220511-122856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-randconfig-r006-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120445.hi3YjsKr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d52363b968181a599c947b4fcd470b6ec634f735
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tinghan-Shen/firmware-mtk-add-adsp-ipc-protocol-for-SOF/20220511-122856
        git checkout d52363b968181a599c947b4fcd470b6ec634f735
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.ko] undefined!
>> ERROR: modpost: "sof_of_shutdown" [sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.ko] undefined!
>> ERROR: modpost: "sof_of_remove" [sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.ko] undefined!
>> ERROR: modpost: "sof_of_probe" [sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.ko] undefined!
>> ERROR: modpost: "mtk_adsp_ipc_send" [sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_MTK_COMMON
   Depends on SOUND && !UML && SND && SND_SOC && SND_SOC_SOF_TOPLEVEL && SND_SOC_SOF_MTK_TOPLEVEL && MTK_ADSP_IPC
   Selected by
   - SND_SOC_SOF_MT8195 && SOUND && !UML && SND && SND_SOC && SND_SOC_SOF_TOPLEVEL && SND_SOC_SOF_MTK_TOPLEVEL

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
