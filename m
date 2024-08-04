Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64245A34;
	Sun,  4 Aug 2024 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722730841; cv=none; b=Q9YAu+m6TGw/qIq5FHXHqARO6ovZQT0tLjExjcsk/C0QCr6yFD4RrGkX5De50G0/8tP8VX78YQXnGICQ3Hzw2FBft6wn/wbEZZ+2BjHhkkF1eWcH5ejxWnRhibqPyOgGFNBCSyJVPhtwAD6u7USng9Q6uGRHFIDtMs+HU8FMXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722730841; c=relaxed/simple;
	bh=kzpuoBaFLAJSQoNJN1WQ03FgQ2X2daLpqvaGqAL3XHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olEPyGf+ncSRZI9eH23p+w/j7Z0aumdlA+zErUQ1LQtBoqeQAa2vk7/mqrTNp3++1aKRffS9XZ4eLx3mCJ5eJZyK1U+aKoikA5mtwvJkXeThz+Jw/uE6hD1nzMIn4gGV2W4k8aZlVDFzKOWOnc/c32tFwhX1dj013brt23FKQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmrQ3Jbi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmrQ3Jbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722730838; x=1754266838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzpuoBaFLAJSQoNJN1WQ03FgQ2X2daLpqvaGqAL3XHQ=;
  b=GmrQ3Jbi2zR7wK2w0/BSNaVOc5B5GAHegn8nzfxuKoBY7g72LwhMUWf+
   8cSTDZ/R16p/Vr5b6JrOIABVdKMjGSJeKYZ+hYaggD6bIIi6wIEAEDfzW
   UPaWstKv/ebZgVk96d0gWqNxTFxiGdN0fvijo8P5vcULopBTPvGVxUXjN
   nzWDvAmMm6dpQtzkhT6Uz2WV1ORqBEPaVLep0Yc/dVg4MrztZvrnTk5Fh
   EVtvEtDjuzVUot/mx3wTs4Qtrh7+ykJ9nmWuA+VOktUcox/yGvzAC+1IP
   E8pooPxZbqDyU+nF8yqj4WxtlFg3SBWh0vq36XZqLe10434yC+76Nkiee
   g==;
X-CSE-ConnectionGUID: mjcHke8yQjGXDWGr8HywJA==
X-CSE-MsgGUID: JrZqSyWBScieXu0kMiN01g==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20392068"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20392068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 17:20:37 -0700
X-CSE-ConnectionGUID: wPnI9P3gR1ucjhfOOoC6tA==
X-CSE-MsgGUID: Jm8EQ4kjT9iF+UUDwN14MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="59930598"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2024 17:20:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saOzC-000126-2j;
	Sun, 04 Aug 2024 00:20:34 +0000
Date: Sun, 4 Aug 2024 08:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] Bluetooth: hci_qca: use
 devm_clk_get_optional_enabled_with_rate()
Message-ID: <202408040825.VVKPcQKv-lkp@intel.com>
References: <20240801-clk-new-helper-v1-2-81e9338b7b17@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-clk-new-helper-v1-2-81e9338b7b17@linaro.org>

Hi Bartosz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 048d8cb65cde9fe7534eb4440bcfddcf406bb49c]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/clk-provide-devm_clk_get_optional_enabled_with_rate/20240803-013509
base:   048d8cb65cde9fe7534eb4440bcfddcf406bb49c
patch link:    https://lore.kernel.org/r/20240801-clk-new-helper-v1-2-81e9338b7b17%40linaro.org
patch subject: [PATCH RFC 2/2] Bluetooth: hci_qca: use devm_clk_get_optional_enabled_with_rate()
config: i386-randconfig-013-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040825.VVKPcQKv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040825.VVKPcQKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040825.VVKPcQKv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/hci_qca.c:2429:20: error: call to undeclared function 'devm_clk_get_optional_enabled_with_rate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2429 |                 qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
         |                                  ^
   drivers/bluetooth/hci_qca.c:2429:20: note: did you mean 'devm_clk_get_optional_enabled'?
   include/linux/clk.h:1005:27: note: 'devm_clk_get_optional_enabled' declared here
    1005 | static inline struct clk *devm_clk_get_optional_enabled(struct device *dev,
         |                           ^
>> drivers/bluetooth/hci_qca.c:2429:18: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
    2429 |                 qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
         |                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2430 |                                         &serdev->dev, NULL, SUSCLK_RATE_32KHZ);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_clk_get_optional_enabled_with_rate +2429 drivers/bluetooth/hci_qca.c

  2299	
  2300	static int qca_serdev_probe(struct serdev_device *serdev)
  2301	{
  2302		struct qca_serdev *qcadev;
  2303		struct hci_dev *hdev;
  2304		const struct qca_device_data *data;
  2305		int err;
  2306		bool power_ctrl_enabled = true;
  2307	
  2308		qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
  2309		if (!qcadev)
  2310			return -ENOMEM;
  2311	
  2312		qcadev->serdev_hu.serdev = serdev;
  2313		data = device_get_match_data(&serdev->dev);
  2314		serdev_device_set_drvdata(serdev, qcadev);
  2315		device_property_read_string(&serdev->dev, "firmware-name",
  2316						 &qcadev->firmware_name);
  2317		device_property_read_u32(&serdev->dev, "max-speed",
  2318					 &qcadev->oper_speed);
  2319		if (!qcadev->oper_speed)
  2320			BT_DBG("UART will pick default operating speed");
  2321	
  2322		qcadev->bdaddr_property_broken = device_property_read_bool(&serdev->dev,
  2323				"qcom,local-bd-address-broken");
  2324	
  2325		if (data)
  2326			qcadev->btsoc_type = data->soc_type;
  2327		else
  2328			qcadev->btsoc_type = QCA_ROME;
  2329	
  2330		switch (qcadev->btsoc_type) {
  2331		case QCA_WCN3988:
  2332		case QCA_WCN3990:
  2333		case QCA_WCN3991:
  2334		case QCA_WCN3998:
  2335		case QCA_WCN6750:
  2336		case QCA_WCN6855:
  2337		case QCA_WCN7850:
  2338		case QCA_QCA6390:
  2339			qcadev->bt_power = devm_kzalloc(&serdev->dev,
  2340							sizeof(struct qca_power),
  2341							GFP_KERNEL);
  2342			if (!qcadev->bt_power)
  2343				return -ENOMEM;
  2344			break;
  2345		default:
  2346			break;
  2347		}
  2348	
  2349		switch (qcadev->btsoc_type) {
  2350		case QCA_WCN6855:
  2351		case QCA_WCN7850:
  2352			if (!device_property_present(&serdev->dev, "enable-gpios")) {
  2353				/*
  2354				 * Backward compatibility with old DT sources. If the
  2355				 * node doesn't have the 'enable-gpios' property then
  2356				 * let's use the power sequencer. Otherwise, let's
  2357				 * drive everything outselves.
  2358				 */
  2359				qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
  2360									   "bluetooth");
  2361				if (IS_ERR(qcadev->bt_power->pwrseq))
  2362					return PTR_ERR(qcadev->bt_power->pwrseq);
  2363	
  2364				break;
  2365			}
  2366			fallthrough;
  2367		case QCA_WCN3988:
  2368		case QCA_WCN3990:
  2369		case QCA_WCN3991:
  2370		case QCA_WCN3998:
  2371		case QCA_WCN6750:
  2372			qcadev->bt_power->dev = &serdev->dev;
  2373			err = qca_init_regulators(qcadev->bt_power, data->vregs,
  2374						  data->num_vregs);
  2375			if (err) {
  2376				BT_ERR("Failed to init regulators:%d", err);
  2377				return err;
  2378			}
  2379	
  2380			qcadev->bt_power->vregs_on = false;
  2381	
  2382			qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
  2383						       GPIOD_OUT_LOW);
  2384			if (IS_ERR(qcadev->bt_en) &&
  2385			    (data->soc_type == QCA_WCN6750 ||
  2386			     data->soc_type == QCA_WCN6855)) {
  2387				dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
  2388				return PTR_ERR(qcadev->bt_en);
  2389			}
  2390	
  2391			if (!qcadev->bt_en)
  2392				power_ctrl_enabled = false;
  2393	
  2394			qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
  2395						       GPIOD_IN);
  2396			if (IS_ERR(qcadev->sw_ctrl) &&
  2397			    (data->soc_type == QCA_WCN6750 ||
  2398			     data->soc_type == QCA_WCN6855 ||
  2399			     data->soc_type == QCA_WCN7850)) {
  2400				dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
  2401				return PTR_ERR(qcadev->sw_ctrl);
  2402			}
  2403	
  2404			qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
  2405			if (IS_ERR(qcadev->susclk)) {
  2406				dev_err(&serdev->dev, "failed to acquire clk\n");
  2407				return PTR_ERR(qcadev->susclk);
  2408			}
  2409			break;
  2410	
  2411		case QCA_QCA6390:
  2412			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
  2413								   "bluetooth");
  2414			if (IS_ERR(qcadev->bt_power->pwrseq))
  2415				return PTR_ERR(qcadev->bt_power->pwrseq);
  2416			break;
  2417	
  2418		default:
  2419			qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
  2420						       GPIOD_OUT_LOW);
  2421			if (IS_ERR(qcadev->bt_en)) {
  2422				dev_err(&serdev->dev, "failed to acquire enable gpio\n");
  2423				return PTR_ERR(qcadev->bt_en);
  2424			}
  2425	
  2426			if (!qcadev->bt_en)
  2427				power_ctrl_enabled = false;
  2428	
> 2429			qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
  2430						&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
  2431			if (IS_ERR(qcadev->susclk)) {
  2432				dev_warn(&serdev->dev, "failed to acquire clk\n");
  2433				return PTR_ERR(qcadev->susclk);
  2434			}
  2435		}
  2436		
  2437		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
  2438		if (err) {
  2439			BT_ERR("serdev registration failed");
  2440			return err;
  2441		}
  2442	
  2443		hdev = qcadev->serdev_hu.hdev;
  2444	
  2445		if (power_ctrl_enabled) {
  2446			set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
  2447			hdev->shutdown = qca_power_off;
  2448		}
  2449	
  2450		if (data) {
  2451			/* Wideband speech support must be set per driver since it can't
  2452			 * be queried via hci. Same with the valid le states quirk.
  2453			 */
  2454			if (data->capabilities & QCA_CAP_WIDEBAND_SPEECH)
  2455				set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
  2456					&hdev->quirks);
  2457	
  2458			if (data->capabilities & QCA_CAP_VALID_LE_STATES)
  2459				set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
  2460		}
  2461	
  2462		return 0;
  2463	}
  2464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
