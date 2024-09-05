Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499F191F87;
	Thu,  5 Sep 2024 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725568416; cv=none; b=jd499MI8GowJCp77iZOD7uVeh0xEWm6Czgn+XOf3uwDY5xLg0hJAHDaRo7BJ/9BDISgV3ekTgoz3TbPvyjY5+AQPW0E5+m4CwN3Pzmi5sB1mcwre54sDSt46WGYesL45f9AVDczA9bX2a9huFRpQfBMe1oStTJUrZXVBdfyMhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725568416; c=relaxed/simple;
	bh=oPxyOXpw3GEQel1HyXIg6NDzova7xW4MgCY+cKcoeCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNnfgvpRX42irRBtl09le4W4SqOYQue+4kaaJT+NlB/i7F9fn5TdmwZSx7j95bnbqRW5eiJ8eMe0rIVqmWOWp7hTG/1zHv6O2O3C3cMbnDmPEAzt99j6ya1jbdlOXwhbCcp65Auc/ALfyW4z2QfyqAIrJFaP7mtYfdPTb5XzIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIHXgSc0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIHXgSc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725568414; x=1757104414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPxyOXpw3GEQel1HyXIg6NDzova7xW4MgCY+cKcoeCw=;
  b=lIHXgSc0EUNasAqCTmMCZJYO94+qk6mR/ZqGzvzaynJ9kySep1EQMnBg
   i5IwDtOT/a0QMkVpjwuyLX5PO1QJfgFVQ+2ZejWN/9ZO4rIm3kTPXDAw7
   89i2P63K3bUaoXWAlR+JiPmLFJrkDz7TkgdeYM2wvR+AfO17QVzse6fiN
   LPzxUK+SDBXlzZo64DWjyaO5J7jmVDQMmU94a0PS3QnvrmPIp1FV0/ASs
   QU1SI5+bmdFvVLF9npGC0CgfkuWGO7ydwnX0QyZfI03/JfGncAT8jhqBG
   FTyhoIwFto99k9O9+OjCO7cIzxskSQxEM9+scBvXBuaCGRKoKGR+giFrO
   w==;
X-CSE-ConnectionGUID: Pxfn5ldIR/q3nxC2AZ+ocQ==
X-CSE-MsgGUID: 8MvLmWl+SGOG9qYoT6r1vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41818562"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="41818562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 13:32:49 -0700
X-CSE-ConnectionGUID: zysvY9kIRiuT4T08Rj4paw==
X-CSE-MsgGUID: 7JjoXXsVTtm0+abu7Yp2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="96468487"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2024 13:32:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smJ9p-000AI9-2i;
	Thu, 05 Sep 2024 20:32:45 +0000
Date: Fri, 6 Sep 2024 04:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 27/53]
 drivers/net/wireless/espressif/esp32-ng/main.c:215:6: warning: no previous
 prototype for function 'init_bt'
Message-ID: <202409060427.AkL8MsgU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 266b9314e2c544f31a1adf5785e368c8b86e212b [27/53] drivers/net/wireless/espressif/esp32-ng: update
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240906/202409060427.AkL8MsgU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060427.AkL8MsgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060427.AkL8MsgU-lkp@intel.com/

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
   include/linux/workqueue.h:724:2: note: expanded from macro 'flush_scheduled_work'
     724 |         __warn_flushing_systemwide_wq();                                \
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
