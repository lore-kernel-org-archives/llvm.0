Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51AD19D8BA;
	Sun, 16 Jun 2024 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718543305; cv=none; b=XHX9JgUyJXr35c5Q48r8LgDSZaeL8v7vr1Zvzz0HjNqLN1hC8EEMLno6DOMEDaCxCU9zUlbtRHKlUicrE5LTICajMhs35qwYGvLaMHL+XAJvfAxHkNJ9P7RRmIfdrV7rnU8z/Kn4XDksP4VXMXRXxGs08nRswggoLc1ZXoJ7ipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718543305; c=relaxed/simple;
	bh=J90pPIH2zZA7mz/HC4BbMzk+6ihDFgtas/GM6TgNEfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlB5tjHInknc9BEXt+wuV6H1W5+TdUUo5P6T14tZHngwvFgOGC+ArlkthQGP7+1N6reV5p8agsQCwSvBZmTxtwpz1Xuq4muTD9+TD3tBWxO3BARB0vCSxBz8JwnVZGppSGXjiABbjn75YwAge/dB62u+TP3ysioRV/Pnq+Vm4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWzn2fyn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWzn2fyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718543304; x=1750079304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J90pPIH2zZA7mz/HC4BbMzk+6ihDFgtas/GM6TgNEfg=;
  b=HWzn2fynlbwQdMugF0cERKE72OYiGEJyzhS5VQck9aupJZ2OeLWv0Z3v
   BW1HlWMHZS+eFVkTfqTp5XPla/uTy+YXLXmZ5F+Yee0fZUN2qbYgZpiZ6
   B5lKmEV8b/bSB5Nhahq2MBayyWz9t8qmm7zYuAsywZU7Ugw54s0d8IyWG
   4dACV7lXHukh1b0WkP+rBQqcuACfyiK6n+8X1KqYttUWKpvTC8smhJdnG
   PDFYtviRKO68e2TiytLNJck/p3k6jEFfOnqrBFmWDj6RLKHFaYycxLTqA
   XUYuyk86aFpV73TQho0pHZ9yiJSx7EdrI6VoQ2WWLEHixgp3Kl2dldLW2
   Q==;
X-CSE-ConnectionGUID: BS5JadWfTr2QxlTpW1bgeg==
X-CSE-MsgGUID: E8NT51MqQjW1r3KXcvfGIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26015781"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="26015781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 06:08:19 -0700
X-CSE-ConnectionGUID: XUZA4DE2RkmnSWRFfmehtw==
X-CSE-MsgGUID: FOLDhQfuR7CMbENgXtk7dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="71733166"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2024 06:08:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIpcE-0002ni-1b;
	Sun, 16 Jun 2024 13:08:14 +0000
Date: Sun, 16 Jun 2024 21:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [qcom:clk-for-6.11 39/42] ld.lld: error: undefined symbol:
 __mdiobus_write
Message-ID: <202406162047.QkUMa2fG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.11
head:   8cab033628b12c6f55aea4170dfe565761336a95
commit: 2441b965c4c7adae0b4a7825f7acb67d44c3cd38 [39/42] clk: qcom: add clock controller driver for qca8386/qca8084
config: arm64-randconfig-004-20240616 (https://download.01.org/0day-ci/archive/20240616/202406162047.QkUMa2fG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406162047.QkUMa2fG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406162047.QkUMa2fG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __mdiobus_write
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_read) in archive vmlinux.a
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_write) in archive vmlinux.a
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_write) in archive vmlinux.a
   >>> referenced 4 more times
--
>> ld.lld: error: undefined symbol: __mdiobus_read
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_read) in archive vmlinux.a
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_read) in archive vmlinux.a
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(qca8k_regmap_update_bits) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: mdio_driver_register
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(mdio_module_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mdio_driver_unregister
   >>> referenced by nsscc-qca8k.c
   >>>               drivers/clk/qcom/nsscc-qca8k.o:(mdio_module_exit) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
