Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025A68
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 01:35:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="259059490"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="259059490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 17:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="474961393"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2021 17:35:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mphBx-00047J-M7; Wed, 24 Nov 2021 01:35:21 +0000
Date: Wed, 24 Nov 2021 09:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 02/11] ASoC: cs35l41: Convert tables to shared source code
Message-ID: <202111240948.k3QkxADv-lkp@intel.com>
References: <20211123163149.1530535-3-tanureal@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123163149.1530535-3-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lucas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20211123]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next rafael-pm/linux-next linus/master v5.16-rc2 v5.16-rc1 v5.15 v5.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-Tanure/Add-support-for-Legion-7-16ACHg6-laptop/20211124-003454
base:    aacdecce8147c20b01f865b4e214bb8dbe8c4af1
config: i386-randconfig-a016-20211123 (https://download.01.org/0day-ci/archive/20211124/202111240948.k3QkxADv-lkp@intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0f636884a0db8bbfcdce788023de0013a4e17593
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-Tanure/Add-support-for-Legion-7-16ACHg6-laptop/20211124-003454
        git checkout 0f636884a0db8bbfcdce788023de0013a4e17593
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs35l41-lib.c:52:6: warning: no previous prototype for function 'cs35l41_readable_reg' [-Wmissing-prototypes]
   bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
        ^
   sound/soc/codecs/cs35l41-lib.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
   ^
   static 
>> sound/soc/codecs/cs35l41-lib.c:336:6: warning: no previous prototype for function 'cs35l41_precious_reg' [-Wmissing-prototypes]
   bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
        ^
   sound/soc/codecs/cs35l41-lib.c:336:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
   ^
   static 
>> sound/soc/codecs/cs35l41-lib.c:349:6: warning: no previous prototype for function 'cs35l41_volatile_reg' [-Wmissing-prototypes]
   bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
        ^
   sound/soc/codecs/cs35l41-lib.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
   ^
   static 
   3 warnings generated.


vim +/cs35l41_readable_reg +52 sound/soc/codecs/cs35l41-lib.c

6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   51  
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  @52  bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   53  {
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   54  	switch (reg) {
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   55  	case CS35L41_DEVID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   56  	case CS35L41_REVID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   57  	case CS35L41_FABID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   58  	case CS35L41_RELID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   59  	case CS35L41_OTPID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   60  	case CS35L41_TEST_KEY_CTL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   61  	case CS35L41_USER_KEY_CTL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   62  	case CS35L41_OTP_CTRL0:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   63  	case CS35L41_OTP_CTRL3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   64  	case CS35L41_OTP_CTRL4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   65  	case CS35L41_OTP_CTRL5:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   66  	case CS35L41_OTP_CTRL6:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   67  	case CS35L41_OTP_CTRL7:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   68  	case CS35L41_OTP_CTRL8:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   69  	case CS35L41_PWR_CTRL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   70  	case CS35L41_PWR_CTRL2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   71  	case CS35L41_PWR_CTRL3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   72  	case CS35L41_CTRL_OVRRIDE:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   73  	case CS35L41_AMP_OUT_MUTE:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   74  	case CS35L41_PROTECT_REL_ERR_IGN:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   75  	case CS35L41_GPIO_PAD_CONTROL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   76  	case CS35L41_JTAG_CONTROL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   77  	case CS35L41_PLL_CLK_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   78  	case CS35L41_DSP_CLK_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   79  	case CS35L41_GLOBAL_CLK_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   80  	case CS35L41_DATA_FS_SEL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   81  	case CS35L41_MDSYNC_EN:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   82  	case CS35L41_MDSYNC_TX_ID:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   83  	case CS35L41_MDSYNC_PWR_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   84  	case CS35L41_MDSYNC_DATA_TX:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   85  	case CS35L41_MDSYNC_TX_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   86  	case CS35L41_MDSYNC_DATA_RX:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   87  	case CS35L41_MDSYNC_RX_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   88  	case CS35L41_MDSYNC_ERR_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   89  	case CS35L41_MDSYNC_SYNC_PTE2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   90  	case CS35L41_MDSYNC_SYNC_PTE3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   91  	case CS35L41_MDSYNC_SYNC_MSM_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   92  	case CS35L41_BSTCVRT_VCTRL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   93  	case CS35L41_BSTCVRT_VCTRL2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   94  	case CS35L41_BSTCVRT_PEAK_CUR:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   95  	case CS35L41_BSTCVRT_SFT_RAMP:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   96  	case CS35L41_BSTCVRT_COEFF:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   97  	case CS35L41_BSTCVRT_SLOPE_LBST:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   98  	case CS35L41_BSTCVRT_SW_FREQ:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07   99  	case CS35L41_BSTCVRT_DCM_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  100  	case CS35L41_BSTCVRT_DCM_MODE_FORCE:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  101  	case CS35L41_BSTCVRT_OVERVOLT_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  102  	case CS35L41_VI_VOL_POL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  103  	case CS35L41_DTEMP_WARN_THLD:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  104  	case CS35L41_DTEMP_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  105  	case CS35L41_DTEMP_EN:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  106  	case CS35L41_VPVBST_FS_SEL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  107  	case CS35L41_SP_ENABLES:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  108  	case CS35L41_SP_RATE_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  109  	case CS35L41_SP_FORMAT:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  110  	case CS35L41_SP_HIZ_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  111  	case CS35L41_SP_FRAME_TX_SLOT:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  112  	case CS35L41_SP_FRAME_RX_SLOT:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  113  	case CS35L41_SP_TX_WL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  114  	case CS35L41_SP_RX_WL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  115  	case CS35L41_DAC_PCM1_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  116  	case CS35L41_ASP_TX1_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  117  	case CS35L41_ASP_TX2_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  118  	case CS35L41_ASP_TX3_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  119  	case CS35L41_ASP_TX4_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  120  	case CS35L41_DSP1_RX1_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  121  	case CS35L41_DSP1_RX2_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  122  	case CS35L41_DSP1_RX3_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  123  	case CS35L41_DSP1_RX4_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  124  	case CS35L41_DSP1_RX5_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  125  	case CS35L41_DSP1_RX6_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  126  	case CS35L41_DSP1_RX7_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  127  	case CS35L41_DSP1_RX8_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  128  	case CS35L41_NGATE1_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  129  	case CS35L41_NGATE2_SRC:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  130  	case CS35L41_AMP_DIG_VOL_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  131  	case CS35L41_VPBR_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  132  	case CS35L41_VBBR_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  133  	case CS35L41_VPBR_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  134  	case CS35L41_VBBR_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  135  	case CS35L41_OVERTEMP_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  136  	case CS35L41_AMP_ERR_VOL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  137  	case CS35L41_VOL_STATUS_TO_DSP:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  138  	case CS35L41_CLASSH_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  139  	case CS35L41_WKFET_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  140  	case CS35L41_NG_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  141  	case CS35L41_AMP_GAIN_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  142  	case CS35L41_DAC_MSM_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  143  	case CS35L41_IRQ1_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  144  	case CS35L41_IRQ1_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  145  	case CS35L41_IRQ1_STATUS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  146  	case CS35L41_IRQ1_STATUS2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  147  	case CS35L41_IRQ1_STATUS3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  148  	case CS35L41_IRQ1_STATUS4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  149  	case CS35L41_IRQ1_RAW_STATUS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  150  	case CS35L41_IRQ1_RAW_STATUS2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  151  	case CS35L41_IRQ1_RAW_STATUS3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  152  	case CS35L41_IRQ1_RAW_STATUS4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  153  	case CS35L41_IRQ1_MASK1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  154  	case CS35L41_IRQ1_MASK2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  155  	case CS35L41_IRQ1_MASK3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  156  	case CS35L41_IRQ1_MASK4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  157  	case CS35L41_IRQ1_FRC1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  158  	case CS35L41_IRQ1_FRC2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  159  	case CS35L41_IRQ1_FRC3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  160  	case CS35L41_IRQ1_FRC4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  161  	case CS35L41_IRQ1_EDGE1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  162  	case CS35L41_IRQ1_EDGE4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  163  	case CS35L41_IRQ1_POL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  164  	case CS35L41_IRQ1_POL2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  165  	case CS35L41_IRQ1_POL3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  166  	case CS35L41_IRQ1_POL4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  167  	case CS35L41_IRQ1_DB3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  168  	case CS35L41_IRQ2_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  169  	case CS35L41_IRQ2_STATUS:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  170  	case CS35L41_IRQ2_STATUS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  171  	case CS35L41_IRQ2_STATUS2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  172  	case CS35L41_IRQ2_STATUS3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  173  	case CS35L41_IRQ2_STATUS4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  174  	case CS35L41_IRQ2_RAW_STATUS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  175  	case CS35L41_IRQ2_RAW_STATUS2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  176  	case CS35L41_IRQ2_RAW_STATUS3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  177  	case CS35L41_IRQ2_RAW_STATUS4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  178  	case CS35L41_IRQ2_MASK1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  179  	case CS35L41_IRQ2_MASK2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  180  	case CS35L41_IRQ2_MASK3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  181  	case CS35L41_IRQ2_MASK4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  182  	case CS35L41_IRQ2_FRC1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  183  	case CS35L41_IRQ2_FRC2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  184  	case CS35L41_IRQ2_FRC3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  185  	case CS35L41_IRQ2_FRC4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  186  	case CS35L41_IRQ2_EDGE1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  187  	case CS35L41_IRQ2_EDGE4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  188  	case CS35L41_IRQ2_POL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  189  	case CS35L41_IRQ2_POL2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  190  	case CS35L41_IRQ2_POL3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  191  	case CS35L41_IRQ2_POL4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  192  	case CS35L41_IRQ2_DB3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  193  	case CS35L41_GPIO_STATUS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  194  	case CS35L41_GPIO1_CTRL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  195  	case CS35L41_GPIO2_CTRL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  196  	case CS35L41_MIXER_NGATE_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  197  	case CS35L41_MIXER_NGATE_CH1_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  198  	case CS35L41_MIXER_NGATE_CH2_CFG:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  199  	case CS35L41_DSP_MBOX_1 ... CS35L41_DSP_VIRT2_MBOX_8:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  200  	case CS35L41_CLOCK_DETECT_1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  201  	case CS35L41_DIE_STS1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  202  	case CS35L41_DIE_STS2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  203  	case CS35L41_TEMP_CAL1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  204  	case CS35L41_TEMP_CAL2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  205  	case CS35L41_DSP1_TIMESTAMP_COUNT:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  206  	case CS35L41_DSP1_SYS_ID:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  207  	case CS35L41_DSP1_SYS_VERSION:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  208  	case CS35L41_DSP1_SYS_CORE_ID:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  209  	case CS35L41_DSP1_SYS_AHB_ADDR:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  210  	case CS35L41_DSP1_SYS_XSRAM_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  211  	case CS35L41_DSP1_SYS_YSRAM_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  212  	case CS35L41_DSP1_SYS_PSRAM_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  213  	case CS35L41_DSP1_SYS_PM_BOOT_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  214  	case CS35L41_DSP1_SYS_FEATURES:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  215  	case CS35L41_DSP1_SYS_FIR_FILTERS:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  216  	case CS35L41_DSP1_SYS_LMS_FILTERS:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  217  	case CS35L41_DSP1_SYS_XM_BANK_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  218  	case CS35L41_DSP1_SYS_YM_BANK_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  219  	case CS35L41_DSP1_SYS_PM_BANK_SIZE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  220  	case CS35L41_DSP1_RX1_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  221  	case CS35L41_DSP1_RX2_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  222  	case CS35L41_DSP1_RX3_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  223  	case CS35L41_DSP1_RX4_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  224  	case CS35L41_DSP1_RX5_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  225  	case CS35L41_DSP1_RX6_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  226  	case CS35L41_DSP1_RX7_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  227  	case CS35L41_DSP1_RX8_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  228  	case CS35L41_DSP1_TX1_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  229  	case CS35L41_DSP1_TX2_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  230  	case CS35L41_DSP1_TX3_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  231  	case CS35L41_DSP1_TX4_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  232  	case CS35L41_DSP1_TX5_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  233  	case CS35L41_DSP1_TX6_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  234  	case CS35L41_DSP1_TX7_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  235  	case CS35L41_DSP1_TX8_RATE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  236  	case CS35L41_DSP1_SCRATCH1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  237  	case CS35L41_DSP1_SCRATCH2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  238  	case CS35L41_DSP1_SCRATCH3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  239  	case CS35L41_DSP1_SCRATCH4:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  240  	case CS35L41_DSP1_CCM_CORE_CTRL:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  241  	case CS35L41_DSP1_CCM_CLK_OVERRIDE:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  242  	case CS35L41_DSP1_XM_MSTR_EN:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  243  	case CS35L41_DSP1_XM_CORE_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  244  	case CS35L41_DSP1_XM_AHB_PACK_PL_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  245  	case CS35L41_DSP1_XM_AHB_UP_PL_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  246  	case CS35L41_DSP1_XM_ACCEL_PL0_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  247  	case CS35L41_DSP1_XM_NPL0_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  248  	case CS35L41_DSP1_YM_MSTR_EN:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  249  	case CS35L41_DSP1_YM_CORE_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  250  	case CS35L41_DSP1_YM_AHB_PACK_PL_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  251  	case CS35L41_DSP1_YM_AHB_UP_PL_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  252  	case CS35L41_DSP1_YM_ACCEL_PL0_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  253  	case CS35L41_DSP1_YM_NPL0_PRI:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  254  	case CS35L41_DSP1_MPU_XM_ACCESS0:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  255  	case CS35L41_DSP1_MPU_YM_ACCESS0:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  256  	case CS35L41_DSP1_MPU_WNDW_ACCESS0:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  257  	case CS35L41_DSP1_MPU_XREG_ACCESS0:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  258  	case CS35L41_DSP1_MPU_YREG_ACCESS0:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  259  	case CS35L41_DSP1_MPU_XM_ACCESS1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  260  	case CS35L41_DSP1_MPU_YM_ACCESS1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  261  	case CS35L41_DSP1_MPU_WNDW_ACCESS1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  262  	case CS35L41_DSP1_MPU_XREG_ACCESS1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  263  	case CS35L41_DSP1_MPU_YREG_ACCESS1:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  264  	case CS35L41_DSP1_MPU_XM_ACCESS2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  265  	case CS35L41_DSP1_MPU_YM_ACCESS2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  266  	case CS35L41_DSP1_MPU_WNDW_ACCESS2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  267  	case CS35L41_DSP1_MPU_XREG_ACCESS2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  268  	case CS35L41_DSP1_MPU_YREG_ACCESS2:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  269  	case CS35L41_DSP1_MPU_XM_ACCESS3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  270  	case CS35L41_DSP1_MPU_YM_ACCESS3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  271  	case CS35L41_DSP1_MPU_WNDW_ACCESS3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  272  	case CS35L41_DSP1_MPU_XREG_ACCESS3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  273  	case CS35L41_DSP1_MPU_YREG_ACCESS3:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  274  	case CS35L41_DSP1_MPU_XM_VIO_ADDR:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  275  	case CS35L41_DSP1_MPU_XM_VIO_STATUS:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  276  	case CS35L41_DSP1_MPU_YM_VIO_ADDR:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  277  	case CS35L41_DSP1_MPU_YM_VIO_STATUS:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  278  	case CS35L41_DSP1_MPU_PM_VIO_ADDR:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  279  	case CS35L41_DSP1_MPU_PM_VIO_STATUS:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  280  	case CS35L41_DSP1_MPU_LOCK_CONFIG:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  281  	case CS35L41_DSP1_MPU_WDT_RST_CTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  282  	case CS35L41_OTP_TRIM_1:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  283  	case CS35L41_OTP_TRIM_2:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  284  	case CS35L41_OTP_TRIM_3:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  285  	case CS35L41_OTP_TRIM_4:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  286  	case CS35L41_OTP_TRIM_5:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  287  	case CS35L41_OTP_TRIM_6:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  288  	case CS35L41_OTP_TRIM_7:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  289  	case CS35L41_OTP_TRIM_8:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  290  	case CS35L41_OTP_TRIM_9:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  291  	case CS35L41_OTP_TRIM_10:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  292  	case CS35L41_OTP_TRIM_11:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  293  	case CS35L41_OTP_TRIM_12:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  294  	case CS35L41_OTP_TRIM_13:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  295  	case CS35L41_OTP_TRIM_14:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  296  	case CS35L41_OTP_TRIM_15:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  297  	case CS35L41_OTP_TRIM_16:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  298  	case CS35L41_OTP_TRIM_17:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  299  	case CS35L41_OTP_TRIM_18:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  300  	case CS35L41_OTP_TRIM_19:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  301  	case CS35L41_OTP_TRIM_20:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  302  	case CS35L41_OTP_TRIM_21:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  303  	case CS35L41_OTP_TRIM_22:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  304  	case CS35L41_OTP_TRIM_23:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  305  	case CS35L41_OTP_TRIM_24:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  306  	case CS35L41_OTP_TRIM_25:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  307  	case CS35L41_OTP_TRIM_26:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  308  	case CS35L41_OTP_TRIM_27:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  309  	case CS35L41_OTP_TRIM_28:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  310  	case CS35L41_OTP_TRIM_29:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  311  	case CS35L41_OTP_TRIM_30:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  312  	case CS35L41_OTP_TRIM_31:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  313  	case CS35L41_OTP_TRIM_32:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  314  	case CS35L41_OTP_TRIM_33:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  315  	case CS35L41_OTP_TRIM_34:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  316  	case CS35L41_OTP_TRIM_35:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  317  	case CS35L41_OTP_TRIM_36:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  318  	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  319  	case CS35L41_DSP1_XMEM_PACK_0 ... CS35L41_DSP1_XMEM_PACK_3068:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  320  	case CS35L41_DSP1_XMEM_UNPACK32_0 ... CS35L41_DSP1_XMEM_UNPACK32_2046:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  321  	case CS35L41_DSP1_XMEM_UNPACK24_0 ... CS35L41_DSP1_XMEM_UNPACK24_4093:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  322  	case CS35L41_DSP1_YMEM_PACK_0 ... CS35L41_DSP1_YMEM_PACK_1532:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  323  	case CS35L41_DSP1_YMEM_UNPACK32_0 ... CS35L41_DSP1_YMEM_UNPACK32_1022:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  324  	case CS35L41_DSP1_YMEM_UNPACK24_0 ... CS35L41_DSP1_YMEM_UNPACK24_2045:
bae9e13fc55cbc sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-10-29  325  	case CS35L41_DSP1_PMEM_0 ... CS35L41_DSP1_PMEM_5114:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  326  	/*test regs*/
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  327  	case CS35L41_PLL_OVR:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  328  	case CS35L41_BST_TEST_DUTY:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  329  	case CS35L41_DIGPWM_IOCTRL:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  330  		return true;
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  331  	default:
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  332  		return false;
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  333  	}
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  334  }
6450ef55905688 sound/soc/codecs/cs35l41-tables.c David Rhodes 2021-09-07  335  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
