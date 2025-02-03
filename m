Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E668220E01D;
	Mon,  3 Feb 2025 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613659; cv=none; b=jtoCphhI6hMcIbQ8VUwexAWqSNL2jafDN2+dxTLF7gpfON+U6nVjzgxL/vrS8rR33F1/fLkSyy5XqKj7abEvw3PZTx2XTIr4BHsZG6GJJbqoe+GnS5uwfFP+Qf4naFMWJVkoFHW1A5i+GgwQwZaH8YuZ7+k2lZp1vNXqhLobp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613659; c=relaxed/simple;
	bh=EJCXQIyiaTKydbVPZ/ipLA5cfh3a6PnuZWopm15Y2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDz90Edr/qe11h44wUxhDAyPCZ9iXJszFdFbKc5u7nIx+zH2yztR6ktgA+45h1QEpDnwiWmTxepkUz80XELNEOACBBmCN4frZtxlDQMMux3/yTcc2tZDuN0aw5Ng2XdxEpr34PsiPgzMwRcLqGrhUfcwaYCdjXI9vI6dNuusftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGZhgGrq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGZhgGrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738613658; x=1770149658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJCXQIyiaTKydbVPZ/ipLA5cfh3a6PnuZWopm15Y2QU=;
  b=OGZhgGrqxnsSw36+ebqfrl3LDP9TweGl3S244J4iY9qFVbIEoxGZTedP
   B+9aCfVOx35EJjvxtcgG+Wuvzide2t+wZ8Ko/o1bb8ev1Mu+W9AAyY1nY
   qY0aT6xhsfO6UkxpMN1NvMjMs8LO/A+FQdx9Qds5ipZJTA4h0g9SNnPxH
   Zfx2GnrmY1TJA1OIWKk+hGIXN2lKCaXvjn3dIka6yAM5wKFE7AcFbAiGe
   ZZseR3fSlokXb5334x6lEo0luU61Nah1Vz5dqQu/n2lt1bfLtLLRdW5Cy
   VEAIaoDmcHdeZPsmL2fqyYkaggZh8WeveYBTum0LzZa/l2lbxmmvu3gKw
   Q==;
X-CSE-ConnectionGUID: HfoSNDwfRyaP7SaQ7eO1FQ==
X-CSE-MsgGUID: +6IvWDAmSeqE6RyexlRN5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56658301"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="56658301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:14:17 -0800
X-CSE-ConnectionGUID: zPtIT4jTTTywYpxhTQpAMw==
X-CSE-MsgGUID: t2jtWgKJSaaQ/f0p9pcjPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115409781"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 12:14:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2ph-000rRJ-2f;
	Mon, 03 Feb 2025 20:14:13 +0000
Date: Tue, 4 Feb 2025 04:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 27/53]
 drivers/net/wireless/espressif/esp32-ng/main.c:215:6: warning: no previous
 prototype for function 'init_bt'
Message-ID: <202502040401.kVZa32S2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 196560c41851794f16051c1c878ebdee9f765998 [27/53] drivers/net/wireless/espressif/esp32-ng: update
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502040401.kVZa32S2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040401.kVZa32S2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040401.kVZa32S2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/espressif/esp32-ng/main.c:70:12: warning: variable 'c' set but not used [-Wunused-but-set-variable]
      70 |         static u8 c;
         |                   ^
>> drivers/net/wireless/espressif/esp32-ng/main.c:215:6: warning: no previous prototype for function 'init_bt' [-Wmissing-prototypes]
     215 | void init_bt(struct esp_adapter *adapter)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/main.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | void init_bt(struct esp_adapter *adapter)
         | ^
         | static 
>> drivers/net/wireless/espressif/esp32-ng/main.c:273:5: warning: no previous prototype for function 'process_event_esp_bootup' [-Wmissing-prototypes]
     273 | int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
         |     ^
   drivers/net/wireless/espressif/esp32-ng/main.c:273:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     273 | int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
         | ^
         | static 
>> drivers/net/wireless/espressif/esp32-ng/main.c:565:5: warning: no previous prototype for function 'esp_stop_network_ifaces' [-Wmissing-prototypes]
     565 | int esp_stop_network_ifaces(struct esp_adapter *adapter)
         |     ^
   drivers/net/wireless/espressif/esp32-ng/main.c:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | int esp_stop_network_ifaces(struct esp_adapter *adapter)
         | ^
         | static 
   4 warnings generated.
--
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:418:22: warning: no previous prototype for function 'prepare_command_request' [-Wmissing-prototypes]
     418 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         |                      ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:418:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     418 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         | ^
         | static 
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:885:23: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     885 |         struct cfg80211_bss *bss;
         |                              ^
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:412:3: warning: call to '__warn_flushing_systemwide_wq' declared with 'warning' attribute: Please avoid flushing system-wide workqueues. [-Wattribute-warning]
     412 |                 flush_scheduled_work();
         |                 ^
   include/linux/workqueue.h:765:2: note: expanded from macro 'flush_scheduled_work'
     765 |         __warn_flushing_systemwide_wq();                                \
         |         ^
   3 warnings generated.


vim +/init_bt +215 drivers/net/wireless/espressif/esp32-ng/main.c

   214	
 > 215	void init_bt(struct esp_adapter *adapter)
   216	{
   217	
   218		if ((adapter->capabilities & ESP_BT_SPI_SUPPORT) ||
   219			(adapter->capabilities & ESP_BT_SDIO_SUPPORT)) {
   220			msleep(200);
   221			esp_info("ESP Bluetooth init\n");
   222			esp_init_bt(adapter);
   223		}
   224	}
   225	
   226	static int check_esp_version(struct fw_version *ver)
   227	{
   228		esp_info("ESP Firmware version: %u.%u.%u\n",
   229				ver->major1, ver->major2, ver->minor);
   230		if (!ver->major1) {
   231			esp_err("Incompatible ESP firmware release detected, Please use correct ESP-Hosted branch/compatible release\n");
   232			return -1;
   233		}
   234		return 0;
   235	}
   236	
   237	static void print_reset_reason(uint32_t reason)
   238	{
   239		switch (reason)
   240		{
   241			case 1: esp_info("POWERON_RESET\n"); break;          /**<1, Vbat power on reset*/
   242			case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/
   243			case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/
   244			case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/
   245			case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/
   246			case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/
   247			case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/
   248			case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/
   249			case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/
   250			case 11: esp_info("TGWDT_CPU_RESET\n"); break;       /**<11, Time Group reset CPU*/
   251			case 12: esp_info("SW_CPU_RESET\n"); break;          /**<12, Software reset CPU*/
   252			case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/
   253			case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/
   254			case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/
   255			case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/
   256			default: esp_info("Unknown[%u]\n", reason); break;
   257		}
   258	}
   259	
   260	static int process_fw_data(struct fw_data *fw_p, int tag_len)
   261	{
   262		if (tag_len != sizeof(struct fw_data)) {
   263			esp_err("Length not matching to firmware data size\n");
   264			return -1;
   265		}
   266	
   267		esp_info("ESP chipset's last reset cause:\n");
   268		print_reset_reason(le32_to_cpu(fw_p->last_reset_reason));
   269	
   270		return check_esp_version(&fw_p->version);
   271	}
   272	
 > 273	int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
   274	{
   275		int len_left = len, tag_len, ret = 0;
   276		u8 *pos;
   277	
   278		if (!adapter || !evt_buf)
   279			return -1;
   280	
   281		if (len_left >= 64) {
   282			esp_info("ESP init event len looks unexpected: %u (>=64)\n", len_left);
   283			esp_info("You probably facing timing mismatch at transport layer\n");
   284		}
   285	
   286		clear_bit(ESP_INIT_DONE, &adapter->state_flags);
   287		/* Deinit module if already initialized */
   288		esp_deinit_module(adapter);
   289	
   290		pos = evt_buf;
   291	
   292		while (len_left > 0) {
   293			tag_len = *(pos + 1);
   294	
   295			esp_info("Bootup Event tag: %d\n", *pos);
   296	
   297			switch (*pos) {
   298			case ESP_BOOTUP_CAPABILITY:
   299				adapter->capabilities = *(pos + 2);
   300				break;
   301			case ESP_BOOTUP_FIRMWARE_CHIP_ID:
   302				ret = esp_validate_chipset(adapter, *(pos + 2));
   303				break;
   304			case ESP_BOOTUP_FW_DATA:
   305				ret = process_fw_data((struct fw_data *)(pos + 2), tag_len);
   306				break;
   307			case ESP_BOOTUP_SPI_CLK_MHZ:
   308				ret = esp_adjust_spi_clock(adapter, *(pos + 2));
   309				break;
   310			default:
   311				esp_warn("Unsupported tag=%x in bootup event\n", *pos);
   312			}
   313	
   314			if (ret < 0) {
   315				esp_err("failed to process tag=%x in bootup event\n", *pos);
   316				return -1;
   317			}
   318			pos += (tag_len + 2);
   319			len_left -= (tag_len + 2);
   320		}
   321	
   322		if (esp_add_card(adapter)) {
   323			esp_err("network iterface init failed\n");
   324			return -1;
   325		}
   326		init_bt(adapter);
   327	
   328		if (raw_tp_mode !=0) {
   329	#if TEST_RAW_TP
   330			process_test_capabilities(raw_tp_mode);
   331			esp_init_raw_tp(adapter);
   332	#else
   333			esp_err("RAW TP mode selected but not enabled\n");
   334			return -1;
   335	#endif
   336		}
   337		set_bit(ESP_INIT_DONE, &adapter->state_flags);
   338		print_capabilities(adapter->capabilities);
   339	
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
