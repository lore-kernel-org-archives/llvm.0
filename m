Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC54421;
	Tue, 11 Jul 2023 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689054350; x=1720590350;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GNlllmWVJbCC0VgnSpBZ1sJsGCQ4D5tfW9vnTCIOmis=;
  b=Gk4LHyOCYgVvI3px9K6Yo8OKpm7ixJZd7z/Sd4S6CarYfm8K/plhDXxJ
   s0LU7ralXrEkOCUd1Ki0vhADnwRgjy9oGvOMJQzFqzJtqQF0DEXM0YHVO
   W/9NMKAWbe2V5GCtaFUZhg0C1xHoqhwBpGVtRzVHsomc/j5qzd/P4Oa5g
   WTirqjhCEuS9uCPYSKA929LJA+NN0iCaDEw4Eqhbbcj2EbCbysOrkME6d
   tPxJChSnUGB5nzsDhBbGr09nvh/LOqAMtnzgkphQV7b45gpO8OWmH41q3
   M2cYoXhK069E66hvZvOEeGwbZtqXHWLGB9QlcqS3vW7VvbIKObdVVAXlK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430617589"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="430617589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750597419"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750597419"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 22:45:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6By-0004Mb-1U;
	Tue, 11 Jul 2023 05:45:42 +0000
Date: Tue, 11 Jul 2023 13:45:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:152: undefined reference to
 `process_fw_data'
Message-ID: <202307111316.NIjew9Im-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   0e48757b20c9e813e7c330d76e0a6f895f0660d4
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/27] esp_wifi: add shmem transport
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230711/202307111316.NIjew9Im-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111316.NIjew9Im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111316.NIjew9Im-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp_shmem.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp_shmem.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/espressif/esp_shmem.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/wireless/espressif/esp_shmem.c:384:13: warning: cast to 'void *' from smaller integer type 'u32' (aka 'unsigned int') [-Wint-to-void-pointer-cast]
     384 |         hw->hw_q = (void *)readl(p);
         |                    ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp_shmem.c:474:34: warning: unused variable 'esp_wifi_shmem_match' [-Wunused-const-variable]
     474 | static const struct of_device_id esp_wifi_shmem_match[] = {
         |                                  ^
   14 warnings generated.
--
   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `process_event_esp_bootup':
>> drivers/net/wireless/espressif/esp_shmem.c:152: undefined reference to `process_fw_data'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:159: undefined reference to `process_test_capabilities'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:153: undefined reference to `esp_remove_card'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:212: undefined reference to `cfg80211_scan_done'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:216: undefined reference to `cfg80211_disconnected'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:221: undefined reference to `esp_remove_card'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:226: undefined reference to `esp_add_card'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:230: undefined reference to `process_capabilities'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:231: undefined reference to `print_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_probe':
>> drivers/net/wireless/espressif/esp_shmem.c:381: undefined reference to `devm_of_iomap'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:385: undefined reference to `devm_iounmap'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:444: undefined reference to `esp_wifi_init'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_remove':
>> drivers/net/wireless/espressif/esp_shmem.c:467: undefined reference to `esp_wifi_deinit'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_handle_rx':
>> drivers/net/wireless/espressif/esp_shmem.c:290: undefined reference to `esp_alloc_skb'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_thread_handler':
>> drivers/net/wireless/espressif/esp_shmem.c:364: undefined reference to `esp_process_new_packet_intr'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:316: undefined reference to `esp_tx_resume'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `write_packet':
>> drivers/net/wireless/espressif/esp_shmem.c:88: undefined reference to `esp_tx_pause'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:103: undefined reference to `esp_tx_pause'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +152 drivers/net/wireless/espressif/esp_shmem.c

    56	
    57	static int write_packet(struct esp_adapter *adapter, struct sk_buff *skb)
    58	{
    59		u32 max_pkt_size = SHMEM_BUF_SIZE - sizeof(struct esp_payload_header);
    60		struct esp_wifi_shmem *hw = container_of(adapter, struct esp_wifi_shmem, adapter);
    61		struct esp_skb_cb *cb = NULL;
    62		struct esp_wifi_shmem_queue *q = hw->hw_q + ESP_SHMEM_WRITE_HW_Q;
    63		void **data = (void *)hw->hw_q + q->offset;
    64		u32 r, w;
    65	
    66		if (!adapter || !skb || !skb->data || !skb->len) {
    67			pr_err("Invalid args\n");
    68			if (skb)
    69				dev_kfree_skb(skb);
    70			return -EINVAL;
    71		}
    72	
    73		if (skb->len > max_pkt_size) {
    74			pr_err("Drop pkt of len[%u] > max spi transport len[%u]\n",
    75			       skb->len, max_pkt_size);
    76			dev_kfree_skb(skb);
    77			return -EPERM;
    78		}
    79	
    80		r = READ_ONCE(q->read);
    81		w = READ_ONCE(q->write);
    82		rmb();
    83		pr_debug("%s: q->read = %d, q->write = %d\n", __func__, r, w);
    84		if (w - r == q->mask) {
    85			pr_debug("%s: write queue full\n", __func__);
    86			cb = (struct esp_skb_cb *)skb->cb;
    87			if (cb && cb->priv)
  > 88				esp_tx_pause(cb->priv);
    89			dev_kfree_skb(skb);
    90			return -EBUSY;
    91		}
    92	
    93		WRITE_ONCE(data[w & q->mask], skb->data);
    94		wmb();
    95		++w;
    96		WRITE_ONCE(q->write, w);
    97		wmb();
    98		writel(1, hw->regs + ESP_SHMEM_IRQ_TO_WIFI_REG);
    99	
   100		if (w - r == q->mask) {
   101			cb = (struct esp_skb_cb *)skb->cb;
   102			if (cb && cb->priv)
 > 103				esp_tx_pause(cb->priv);
   104		}
   105		skb_queue_tail(&hw->tx_q, skb);
   106	
   107		return 0;
   108	}
   109	
   110	static const struct esp_if_ops if_ops = {
   111		.read		= read_packet,
   112		.write		= write_packet,
   113	};
   114	
   115	void process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
   116	{
   117		struct esp_wifi_shmem *hw = container_of(adapter, struct esp_wifi_shmem, adapter);
   118		/* Bootup event will be received whenever ESP is booted.
   119		 * It is termed 'First bootup' when this event is received
   120		 * the first time module loaded. It is termed 'Second & onward bootup' when
   121		 * there is ESP reset (reason may be manual reset of ESP or any crash at ESP)
   122		 */
   123		u8 len_left = len, tag_len;
   124		u8 *pos;
   125		uint8_t iface_idx = 0;
   126		enum chipset_type_e hardware_type = ESP_FIRMWARE_CHIP_UNRECOGNIZED;
   127	
   128		if (!adapter)
   129			return;
   130	
   131		if (!evt_buf)
   132			return;
   133	
   134		/* Second & onward bootup, cleanup and re-init the driver */
   135		if (hw->esp_reset_after_module_load)
   136			set_bit(ESP_CLEANUP_IN_PROGRESS, &adapter->state_flags);
   137	
   138		pos = evt_buf;
   139	
   140		while (len_left) {
   141	
   142			tag_len = *(pos + 1);
   143	
   144			pr_debug("EVENT: %d\n", *pos);
   145	
   146			if (*pos == ESP_BOOTUP_CAPABILITY) {
   147				adapter->capabilities = *(pos + 2);
   148			} else if (*pos == ESP_BOOTUP_FW_DATA) {
   149				if (tag_len != sizeof(struct fw_data))
   150					pr_info("Length not matching to firmware data size\n");
   151				else
 > 152					if (process_fw_data((struct fw_data *)(pos + 2))) {
 > 153						esp_remove_card(adapter);
   154						return;
   155					}
   156			} else if (*pos == ESP_BOOTUP_FIRMWARE_CHIP_ID) {
   157				hardware_type = *(pos+2);
   158			} else if (*pos == ESP_BOOTUP_TEST_RAW_TP) {
 > 159				process_test_capabilities(*(pos + 2));
   160			} else {
   161				pr_warn("Unsupported tag in event\n");
   162			}
   163	
   164			pos += (tag_len+2);
   165			len_left -= (tag_len+2);
   166		}
   167	
   168		if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
   169		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
   170		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
   171		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {
   172			pr_info("ESP chipset not recognized, ignoring [%d]\n", hardware_type);
   173			hardware_type = ESP_FIRMWARE_CHIP_UNRECOGNIZED;
   174		} else {
   175			pr_info("ESP chipset detected [%s]\n",
   176				hardware_type == ESP_FIRMWARE_CHIP_ESP32 ? "esp32" :
   177				hardware_type == ESP_FIRMWARE_CHIP_ESP32S2 ? "esp32-s2" :
   178				hardware_type == ESP_FIRMWARE_CHIP_ESP32C3 ? "esp32-c3" :
   179				hardware_type == ESP_FIRMWARE_CHIP_ESP32S3 ? "esp32-s3" :
   180				"unknown");
   181		}
   182	
   183		if (hw->esp_reset_after_module_load) {
   184	
   185			/* Second & onward bootup:
   186			 *
   187			 * SPI is software and not a hardware based module.
   188			 * When bootup event is received, we should discard all prior commands,
   189			 * old messages pending at network and re-initialize everything.
   190			 *
   191			 * Such handling is not required
   192			 * 1. for SDIO
   193			 *   as Removal of SDIO triggers complete Deinit and on SDIO insertion/
   194			 *   detection, i.e., after probing, initialization is triggered
   195			 *
   196			 * 2. On first bootup (if counterpart of this else)
   197			 *   First bootup event is received immediately after module insertion.
   198			 *   As all network or cmds are init and clean for the first time,
   199			 *   there is no need to re-init them
   200			 */
   201	
   202			skb_queue_purge(&hw->tx_q);
   203	
   204			for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
   205	
   206				struct esp_wifi_device *priv = adapter->priv[iface_idx];
   207	
   208				if (!priv)
   209					continue;
   210	
   211				if (priv->scan_in_progress)
 > 212					ESP_MARK_SCAN_DONE(priv, true);
   213	
   214				if (priv->ndev &&
   215				    wireless_dev_current_bss_exists(&priv->wdev)) {
 > 216					CFG80211_DISCONNECTED(priv->ndev,
   217							      0, NULL, 0, false, GFP_KERNEL);
   218				}
   219			}
   220	
   221			esp_remove_card(adapter);
   222	
   223			skb_queue_head_init(&hw->tx_q);
   224		}
   225	
 > 226		if (esp_add_card(adapter)) {
   227			pr_err("network iterface init failed\n");
   228		}
   229	
 > 230		process_capabilities(adapter);
 > 231		print_capabilities(adapter->capabilities);
   232	
   233	
   234		hw->esp_reset_after_module_load = true;
   235	}
   236	
   237	static int process_rx_buf(struct esp_wifi_shmem *hw, struct sk_buff *skb)
   238	{
   239		struct esp_payload_header *header;
   240		u16 len = 0;
   241		u16 offset = 0;
   242	
   243		if (!skb)
   244			return -EINVAL;
   245	
   246		header = (struct esp_payload_header *) skb->data;
   247	
   248		if (header->if_type >= ESP_MAX_IF) {
   249			pr_err("%s: bad if_type %d\n", __func__, header->if_type);
   250			return -EINVAL;
   251		}
   252	
   253		offset = le16_to_cpu(header->offset);
   254	
   255		/* Validate received SKB. Check len and offset fields */
   256		if (offset != sizeof(struct esp_payload_header)) {
   257			pr_err("%s: bad offfset %d\n", __func__, offset);
   258			return -EINVAL;
   259		}
   260	
   261		len = le16_to_cpu(header->len);
   262		if (!len) {
   263			pr_err("%s: bad len %d\n", __func__, len);
   264			return -EINVAL;
   265		}
   266	
   267		len += sizeof(struct esp_payload_header);
   268	
   269		if (len > SHMEM_BUF_SIZE) {
   270			pr_err("%s: bad len %d\n", __func__, len);
   271			return -EINVAL;
   272		}
   273	
   274		/* Trim SKB to actual size */
   275		skb_trim(skb, len);
   276	
   277		/* enqueue skb for read_packet to pick it */
   278		if (header->if_type == ESP_INTERNAL_IF)
   279			skb_queue_tail(&hw->rx_q[PRIO_Q_HIGH], skb);
   280		else if (header->if_type == ESP_HCI_IF)
   281			skb_queue_tail(&hw->rx_q[PRIO_Q_MID], skb);
   282		else
   283			skb_queue_tail(&hw->rx_q[PRIO_Q_LOW], skb);
   284	
   285		return 0;
   286	}
   287	
   288	static bool esp_wifi_shmem_handle_rx(struct esp_wifi_shmem *hw, void *p)
   289	{
 > 290		struct sk_buff *rx_skb = esp_alloc_skb(SHMEM_BUF_SIZE);
   291		u8 *rx_buf = skb_put(rx_skb, SHMEM_BUF_SIZE);
   292		int ret;
   293	
   294		memcpy(rx_buf, p, SHMEM_BUF_SIZE);
   295	
   296		ret = process_rx_buf(hw, rx_skb);
   297		if (ret)
   298			dev_kfree_skb(rx_skb);
   299		return ret == 0;
   300	}
   301	
   302	static void esp_wifi_shmem_handle_tx(struct esp_wifi_shmem *hw, u32 n)
   303	{
   304		struct sk_buff *skb;
   305		bool resumed = false;
   306		u32 i;
   307	
   308		for (i = 0; i < n; ++i) {
   309			skb = skb_dequeue(&hw->tx_q);
   310			if (WARN_ON(!skb))
   311				break;
   312			if (!resumed && skb) {
   313				struct esp_skb_cb *cb = (struct esp_skb_cb *)skb->cb;
   314	
   315				if (cb->priv) {
 > 316					esp_tx_resume(cb->priv);
   317					resumed = true;
   318				}
   319			}
   320			dev_kfree_skb(skb);
   321		}
   322		hw->tx_done += n;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
