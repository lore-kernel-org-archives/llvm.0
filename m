Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345692C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641436988; x=1672972988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfBpnv+JE6JdR4c2hcYzV6wieYYwdthKsMwh0ZDgwt8=;
  b=hfXgLpzdksNK33iwC+VOxTtGN52NKbCKBxc7xNFBL+xNE35GzYdyQda5
   FV9G3eaHTo7AYnqqQ1QprmJGr8/WTGyxaQ0iThFEtPKjKotRGYf/RV8Nn
   GGlTbREYkoaqs+ol5jIh8oaiKdyYJEFMZ2Zj1ZoiJ4aAjhecKE3VBgyPT
   vn2mfgbFj4OFeFhaNHcsesyIz/X7cxhvHanjBoSCjr42Arzdt6TmHzMS7
   5QUiATOo0ZvKZwpaD8It21vKr8Z11LOdczONu53pqfoicYFO73OQCdwmx
   Jsv+0KWo7CEgOXVQtB4Nv5pcvTFzYttM++wEPiDXvxqph/PrdmSs173pd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223261084"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="223261084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 18:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="470793083"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jan 2022 18:43:03 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5Ik2-000HGN-SV; Thu, 06 Jan 2022 02:43:02 +0000
Date: Thu, 6 Jan 2022 10:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chevron Li <chevron.li@bayhubtech.com>, agross@kernel.org,
	bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	shirley.her@bayhubtech.com, fred.ai@bayhubtech.com,
	xiaoguang.yu@bayhubtech.com, shaper.liu@bayhubtech.com,
	bruce.yang@bayhubtech.com
Subject: Re: [PATCH V2 1/1] mmc:sdhci-bayhub:fix Qualcomm sd host 7180 SD
 card compatibility issue
Message-ID: <202201061011.BhumpCCg-lkp@intel.com>
References: <20220105122926.472-1-chevron.li@bayhubtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105122926.472-1-chevron.li@bayhubtech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Chevron,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chevron-Li/mmc-sdhci-bayhub-fix-Qualcomm-sd-host-7180-SD-card-compatibility-issue/20220105-203109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-randconfig-r013-20220105 (https://download.01.org/0day-ci/archive/20220106/202201061011.BhumpCCg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/26adf9f047e13b3b5a025c2a4c7eccb1db2af050
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Chevron-Li/mmc-sdhci-bayhub-fix-Qualcomm-sd-host-7180-SD-card-compatibility-issue/20220105-203109
        git checkout 26adf9f047e13b3b5a025c2a4c7eccb1db2af050
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mmc/host/ mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-bayhub.c:2265:5: warning: no previous prototype for function 'mmc_app_set_clr_card_detect' [-Wmissing-prototypes]
   int mmc_app_set_clr_card_detect(struct mmc_card *card)
       ^
   drivers/mmc/host/sdhci-bayhub.c:2265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_app_set_clr_card_detect(struct mmc_card *card)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:3291:6: warning: no previous prototype for function 'mmc_rescan_bayhub' [-Wmissing-prototypes]
   void mmc_rescan_bayhub(struct work_struct *work)
        ^
   drivers/mmc/host/sdhci-bayhub.c:3291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_rescan_bayhub(struct work_struct *work)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4232:6: warning: no previous prototype for function 'no_fail_p' [-Wmissing-prototypes]
   void no_fail_p(u8 *tuning_win, u8 *mid_val, u8 *max_pass_win, u8 *first_val)
        ^
   drivers/mmc/host/sdhci-bayhub.c:4232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void no_fail_p(u8 *tuning_win, u8 *mid_val, u8 *max_pass_win, u8 *first_val)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4254:6: warning: no previous prototype for function 'tx_selb_calculate_valid_phase_range' [-Wmissing-prototypes]
   void tx_selb_calculate_valid_phase_range(u32 val, int *start,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tx_selb_calculate_valid_phase_range(u32 val, int *start,
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4270:6: warning: no previous prototype for function 'ggc_update_default_selb_phase_tuning_cnt' [-Wmissing-prototypes]
   bool ggc_update_default_selb_phase_tuning_cnt(struct sdhci_host *host, int selb,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4270:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ggc_update_default_selb_phase_tuning_cnt(struct sdhci_host *host, int selb,
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4310:5: warning: no previous prototype for function 'sdhci_bht_sdr50_execute_tuning' [-Wmissing-prototypes]
   int sdhci_bht_sdr50_execute_tuning(struct sdhci_host *host, u32 opcode)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sdhci_bht_sdr50_execute_tuning(struct sdhci_host *host, u32 opcode)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4371:5: warning: no previous prototype for function 'get_config_sela_setting' [-Wmissing-prototypes]
   int get_config_sela_setting(struct sdhci_host *host)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_config_sela_setting(struct sdhci_host *host)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4382:5: warning: no previous prototype for function 'get_config_selb_setting' [-Wmissing-prototypes]
   int get_config_selb_setting(struct sdhci_host *host)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_config_selb_setting(struct sdhci_host *host)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4393:5: warning: no previous prototype for function 'get_all_sela_status' [-Wmissing-prototypes]
   u32 get_all_sela_status(struct sdhci_host *host, u32 target_selb)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 get_all_sela_status(struct sdhci_host *host, u32 target_selb)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4407:5: warning: no previous prototype for function 'get_pass_window_weight' [-Wmissing-prototypes]
   int get_pass_window_weight(u32 val)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_pass_window_weight(u32 val)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4419:5: warning: no previous prototype for function 'get_sela_nearby_pass_window' [-Wmissing-prototypes]
   int get_sela_nearby_pass_window(u32 sela, u32 base)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4419:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_sela_nearby_pass_window(u32 sela, u32 base)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4457:5: warning: no previous prototype for function 'get_left_one_sel' [-Wmissing-prototypes]
   int get_left_one_sel(int base)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_left_one_sel(int base)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4465:5: warning: no previous prototype for function 'get_right_one_sel' [-Wmissing-prototypes]
   int get_right_one_sel(int base)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_right_one_sel(int base)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4473:5: warning: no previous prototype for function 'get_dif' [-Wmissing-prototypes]
   int get_dif(int x, int y)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_dif(int x, int y)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4667:6: warning: no previous prototype for function 'tx_selb_inject_policy' [-Wmissing-prototypes]
   void tx_selb_inject_policy(struct sdhci_host *host, int tx_selb)
        ^
   drivers/mmc/host/sdhci-bayhub.c:4667:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tx_selb_inject_policy(struct sdhci_host *host, int tx_selb)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4686:5: warning: no previous prototype for function 'get_selb_failure_point' [-Wmissing-prototypes]
   int get_selb_failure_point(int start, u64 raw_tx_selb, int tuning_cnt)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_selb_failure_point(int start, u64 raw_tx_selb, int tuning_cnt)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4726:6: warning: no previous prototype for function 'selx_failure_point_exist' [-Wmissing-prototypes]
   bool selx_failure_point_exist(u32 val)
        ^
   drivers/mmc/host/sdhci-bayhub.c:4726:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool selx_failure_point_exist(u32 val)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4736:5: warning: no previous prototype for function '_get_best_window_phase' [-Wmissing-prototypes]
   int _get_best_window_phase(u32 vct, int *pmax_pass_win, int shif_left_flg)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4736:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int _get_best_window_phase(u32 vct, int *pmax_pass_win, int shif_left_flg)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4802:5: warning: no previous prototype for function 'get_best_window_phase' [-Wmissing-prototypes]
   int get_best_window_phase(u32 vct, int *pmax_pass_win)
       ^
   drivers/mmc/host/sdhci-bayhub.c:4802:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_best_window_phase(u32 vct, int *pmax_pass_win)
   ^
   static 
>> drivers/mmc/host/sdhci-bayhub.c:4845:6: warning: no previous prototype for function 'ggc_hw_inject_ext' [-Wmissing-prototypes]
   bool ggc_hw_inject_ext(struct sdhci_host *host, bool *card_status,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4845:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ggc_hw_inject_ext(struct sdhci_host *host, bool *card_status,
   ^
   static 
   drivers/mmc/host/sdhci-bayhub.c:4881:6: warning: no previous prototype for function '_ggc_hw_inject_may_recursive' [-Wmissing-prototypes]
   bool _ggc_hw_inject_may_recursive(struct sdhci_host *host, u32 sel200,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4881:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool _ggc_hw_inject_may_recursive(struct sdhci_host *host, u32 sel200,
   ^
   static 
   drivers/mmc/host/sdhci-bayhub.c:4914:6: warning: no previous prototype for function 'ggc_hw_inject_may_recursive' [-Wmissing-prototypes]
   bool ggc_hw_inject_may_recursive(struct sdhci_host *host, u32 sel200,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ggc_hw_inject_may_recursive(struct sdhci_host *host, u32 sel200,
   ^
   static 
   drivers/mmc/host/sdhci-bayhub.c:4920:6: warning: no previous prototype for function 'get_next_dll_voltage' [-Wmissing-prototypes]
   bool get_next_dll_voltage(int cur, int *next, u32 *dll_voltage_unlock_cnt,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4920:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool get_next_dll_voltage(int cur, int *next, u32 *dll_voltage_unlock_cnt,
   ^
   static 
   drivers/mmc/host/sdhci-bayhub.c:4963:6: warning: no previous prototype for function 'ggc_sw_calc_tuning_result' [-Wmissing-prototypes]
   bool ggc_sw_calc_tuning_result(struct sdhci_host *host, bool *card_status,
        ^
   drivers/mmc/host/sdhci-bayhub.c:4963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ggc_sw_calc_tuning_result(struct sdhci_host *host, bool *card_status,
   ^
   static 
   drivers/mmc/host/sdhci-bayhub.c:5038:6: warning: no previous prototype for function '_ggc_calc_cur_sela_tuning_result' [-Wmissing-prototypes]
   bool _ggc_calc_cur_sela_tuning_result(struct sdhci_host *host, int cur_sela, int start_selb)
        ^
   drivers/mmc/host/sdhci-bayhub.c:5038:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool _ggc_calc_cur_sela_tuning_result(struct sdhci_host *host, int cur_sela, int start_selb)
   ^
   static 
   25 warnings generated.


vim +/mmc_app_set_clr_card_detect +2265 drivers/mmc/host/sdhci-bayhub.c

  2264	
> 2265	int mmc_app_set_clr_card_detect(struct mmc_card *card)
  2266	{
  2267		struct mmc_command cmd = {};
  2268	
  2269		cmd.opcode = 42;
  2270		cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
  2271	
  2272		return mmc_wait_for_app_cmd(card->host, card, &cmd);
  2273	}
  2274	/*
  2275	 * UHS-I specific initialization procedure
  2276	 */
  2277	static int mmc_sd_init_uhs_card(struct mmc_card *card)
  2278	{
  2279		int err;
  2280		u8 *status;
  2281	
  2282		if (!(card->csd.cmdclass & CCC_SWITCH))
  2283			return 0;
  2284	
  2285		status = kmalloc(64, GFP_KERNEL);
  2286		if (!status)
  2287			return -ENOMEM;
  2288	
  2289		/* Set 4-bit bus width */
  2290		err = mmc_app_set_bus_width(card, MMC_BUS_WIDTH_4);
  2291		if (err)
  2292			goto out;
  2293	
  2294		mmc_set_bus_width(card->host, MMC_BUS_WIDTH_4);
  2295	
  2296		/*
  2297		 * Select the bus speed mode depending on host
  2298		 * and card capability.
  2299		 */
  2300		sd_update_bus_speed_mode(card);
  2301	
  2302		/* GGC chip need this command to switch mode */
  2303		mmc_app_set_clr_card_detect(card);
  2304	
  2305		/* Set the driver strength for the card */
  2306		err = sd_select_driver_type(card, status);
  2307		if (err)
  2308			goto out;
  2309	
  2310		/* Set current limit for the card */
  2311		err = sd_set_current_limit(card, status);
  2312		if (err)
  2313			goto out;
  2314	
  2315		/* Set bus speed mode of the card */
  2316		err = sd_set_bus_speed_mode(card, status);
  2317		if (err)
  2318			goto out;
  2319	
  2320		/*
  2321		 * SPI mode doesn't define CMD19 and tuning is only valid for SDR50 and
  2322		 * SDR104 mode SD-cards. Note that tuning is mandatory for SDR104.
  2323		 */
  2324		if (!mmc_host_is_spi(card->host) &&
  2325			(card->host->ios.timing == MMC_TIMING_UHS_SDR50 ||
  2326			 card->host->ios.timing == MMC_TIMING_UHS_DDR50 ||
  2327			 card->host->ios.timing == MMC_TIMING_UHS_SDR104)) {
  2328			err = mmc_execute_tuning(card);
  2329	
  2330			/*
  2331			 * As SD Specifications Part1 Physical Layer Specification
  2332			 * Version 3.01 says, CMD19 tuning is available for unlocked
  2333			 * cards in transfer state of 1.8V signaling mode. The small
  2334			 * difference between v3.00 and 3.01 spec means that CMD19
  2335			 * tuning is also available for DDR50 mode.
  2336			 */
  2337			if (err && card->host->ios.timing == MMC_TIMING_UHS_DDR50) {
  2338				pr_warn("%s: ddr50 tuning failed\n",
  2339					mmc_hostname(card->host));
  2340				err = 0;
  2341			}
  2342		}
  2343	
  2344	out:
  2345		kfree(status);
  2346	
  2347		return err;
  2348	}
  2349	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
