Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF61362
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 05:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660370112; x=1691906112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mcaJsy08CpY057SMdro1ouSDAex5co0+y2dDmJqVZw=;
  b=JslvVJtdkf2kJcBgXiZaj+xHpN6ZmyS3E4Zh4neXIcvkQLW6lZTcfIfV
   YhZOUSl8XJ6aQMoJ9pNTCBDLNCsY5RV5lO9UgF0VWZB/Ht5kvjB0DveJ0
   z613/QmDfJClFM4eoMJIOz+SHzEDiHDuJv2QeNggngLiPIWNbFnRFabIQ
   wFZ94zli/49TvF3iI7rEITBm4ykF0hI6BE9J/byGRTtQhQ6LcgaAzbwHK
   h656sFLipbkTa21TR4KGB9aGhED1O2GgjWeh3BhttrATW8nxxRFPSY475
   Ygd3wQhysJcEcSYTZdLlS5mGjJK0rqwhbngU4Cmbi3+mVUbVFr/c4fVz3
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291730081"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="291730081"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 22:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="933951574"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Aug 2022 22:55:10 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMk73-0001Mx-1V;
	Sat, 13 Aug 2022 05:55:09 +0000
Date: Sat, 13 Aug 2022 13:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/7] wifi: rtw88: add the update channel flow to
 support setting by parameters
Message-ID: <202208131336.sIxFnpKS-lkp@intel.com>
References: <20220809084107.38137-4-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809084107.38137-4-pkshih@realtek.com>

Hi Ping-Ke,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ping-Ke-Shih/wifi-rtw88-add-proper-mutex-lock-to-safely-access-channel/20220809-164550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: i386-randconfig-a012-20220808 (https://download.01.org/0day-ci/archive/20220813/202208131336.sIxFnpKS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3843bb3c07b213146fba1ec4f02a694498228d84
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ping-Ke-Shih/wifi-rtw88-add-proper-mutex-lock-to-safely-access-channel/20220809-164550
        git checkout 3843bb3c07b213146fba1ec4f02a694498228d84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/realtek/rtw88/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtw88/main.c:731:2: warning: variable 'primary_channel_idx' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/net/wireless/realtek/rtw88/main.c:754:39: note: uninitialized use occurs here
           hal->current_primary_channel_index = primary_channel_idx;
                                                ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.c:687:24: note: initialize the variable 'primary_channel_idx' to silence this warning
           u8 primary_channel_idx;
                                 ^
                                  = '\0'
   1 warning generated.


vim +/primary_channel_idx +731 drivers/net/wireless/realtek/rtw88/main.c

   677	
   678	void rtw_update_channel(struct rtw_dev *rtwdev, u8 center_channel,
   679				u8 primary_channel, enum rtw_supported_band band,
   680				enum rtw_bandwidth bandwidth)
   681	{
   682		enum nl80211_band nl_band = rtw_hw_to_nl80211_band(band);
   683		struct rtw_hal *hal = &rtwdev->hal;
   684		u8 *cch_by_bw = hal->cch_by_bw;
   685		u32 center_freq, primary_freq;
   686		enum rtw_sar_bands sar_band;
   687		u8 primary_channel_idx;
   688	
   689		center_freq = ieee80211_channel_to_frequency(center_channel, nl_band);
   690		primary_freq = ieee80211_channel_to_frequency(primary_channel, nl_band);
   691	
   692		/* assign the center channel used while 20M bw is selected */
   693		cch_by_bw[RTW_CHANNEL_WIDTH_20] = primary_channel;
   694	
   695		/* assign the center channel used while current bw is selected */
   696		cch_by_bw[bandwidth] = center_channel;
   697	
   698		switch (bandwidth) {
   699		case RTW_CHANNEL_WIDTH_20:
   700			primary_channel_idx = RTW_SC_DONT_CARE;
   701			break;
   702		case RTW_CHANNEL_WIDTH_40:
   703			if (primary_freq > center_freq)
   704				primary_channel_idx = RTW_SC_20_UPPER;
   705			else
   706				primary_channel_idx = RTW_SC_20_LOWER;
   707			break;
   708		case RTW_CHANNEL_WIDTH_80:
   709			if (primary_freq > center_freq) {
   710				if (primary_freq - center_freq == 10)
   711					primary_channel_idx = RTW_SC_20_UPPER;
   712				else
   713					primary_channel_idx = RTW_SC_20_UPMOST;
   714	
   715				/* assign the center channel used
   716				 * while 40M bw is selected
   717				 */
   718				cch_by_bw[RTW_CHANNEL_WIDTH_40] = center_channel + 4;
   719			} else {
   720				if (center_freq - primary_freq == 10)
   721					primary_channel_idx = RTW_SC_20_LOWER;
   722				else
   723					primary_channel_idx = RTW_SC_20_LOWEST;
   724	
   725				/* assign the center channel used
   726				 * while 40M bw is selected
   727				 */
   728				cch_by_bw[RTW_CHANNEL_WIDTH_40] = center_channel - 4;
   729			}
   730			break;
 > 731		default:
   732			break;
   733		}
   734	
   735		switch (center_channel) {
   736		case 1 ... 14:
   737			sar_band = RTW_SAR_BAND_0;
   738			break;
   739		case 36 ... 64:
   740			sar_band = RTW_SAR_BAND_1;
   741			break;
   742		case 100 ... 144:
   743			sar_band = RTW_SAR_BAND_3;
   744			break;
   745		case 149 ... 177:
   746			sar_band = RTW_SAR_BAND_4;
   747			break;
   748		default:
   749			WARN(1, "unknown ch(%u) to SAR band\n", center_channel);
   750			sar_band = RTW_SAR_BAND_0;
   751			break;
   752		}
   753	
   754		hal->current_primary_channel_index = primary_channel_idx;
   755		hal->current_band_width = bandwidth;
   756		hal->primary_channel = primary_channel;
   757		hal->current_channel = center_channel;
   758		hal->current_band_type = band;
   759		hal->sar_band = sar_band;
   760	}
   761	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
