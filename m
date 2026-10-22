Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691621;
	b=sxKrXyjIvBpRcsVMxZ0QCcJPgmBSIJ0NhNRLGvfBBa/KqF0YQCOFxcFCNYYUl2PS0UzN
	 4zyM8i2X6OHoARv7cn3lT8GNv9vQXjFwukUGt30WqcKSRASh51bVnNLQ0qwGxwkfmOC4a
	 z2TI2zf41JWMCmajb11PQhitIMozHdzmQOS/18Yl6zNv5dL4Xy6D5mY3VHW3uvznXz09W
	 tIGPQBjXoU10py12CWe60KruwTymsuXQEnneGgpEwVO9zOGFPd/rKZ4MZHueGSnZrcA4p
	 yigX2XxQt0+Cv51UDKs433Kaog50yGzfiRWXL84xdroeIDI9OBg5YP9gZ++gDE8bBWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XP0M2KaMioYqA5dJCaYTBdfHHygeTxjSuTQ8QvR6Jf8=;
	b=MEdH8Giz5oF3PouRstYryWfo827xRRb9LYjPNpYXrgURtDFY5uYmtd3sxsXis6WXRSTq
	 o4sBtWjnFUNmfVp37BFcGoCZbk/DeUFej/IXngn+3GUgJaZ6/gZxqvOH9bnnNZZ8gVjKJ
	 yYT3fxyU7gQ4uVIY9ql+3AoBjixp+JqLXlsFAbjEgvy/Q/5rTQeSKCmuOppWDknlrJl6t
	 To9lWzxJpC98aYtR1FFXetv2gXpqqZeTbU6unE6I/mF7VTXjxqnmtYx+ZEKbf7iHORzrR
	 QhnCbmGpMyONXRzDOh+M6Dq7uQpE6/tvNsgIzs2z9SADQy1msCMBQusRgfIaepQQ+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwL0ht9I;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1389606A319;
	Thu, 22 Oct 2026 17:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1389606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwL0ht9I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792691620; x=1824227620;
  h=date:from:to:cc:subject:message-id;
  bh=H9JtBqWPtXjmQLB00D7eGbaITgwmSYPo0kJHiaVYrpo=;
  b=JwL0ht9IwMyv2blObmvld/+044XlVAGDB41IF9Hrp+Z33YIIAjs4WbQ1
   V8DICif5G1mu1m18ajWGtjz0x5u/3ppir/pRE1+M4KHQ0rp0UbEiFyzHw
   +MG7E1xNFHxrtaB6dOyV4o4ZRfSwhGw6x4jIewetFo2LVdBd0CDFRgSee
   HH7sSvZ34YsQ+AoYNKbPA3QIOXFmNx9ZkgscXXp6WVGpGkuLK0O/K6IJY
   jPOAuS4/q0xPC0x37eA8f8scDVDgO7q+ZJIXXndRueFLuJdkri5sOHzGy
   hK/X879drUAjHyrEq0ELgugfTSwtGbkseEGYxiPcJ1PAYW99o9ROU72eX
   g==;
X-CSE-ConnectionGUID: 6NHV+oHoTy+rd8XPUXI+Hw==
X-CSE-MsgGUID: YybM9qAjR4C8fDlaOi2qdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1451154"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1451154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 10:53:39 -0700
X-CSE-ConnectionGUID: AsbQY0ylSWKnPsGfy8tsGg==
X-CSE-MsgGUID: 9bZI/1HOSa2SP1H8M1sqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3510596"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Oct 2026 10:53:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJwyt-00000000RRK-3Scg;
	Thu, 22 Oct 2026 17:53:35 +0000
Date: Fri, 23 Oct 2026 01:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 9451/9453]
 sound/soc/sof/amd/acp7x.c:180:31: error: incompatible function pointer types
 assigning to 'int (*)(struct snd_sof_dev *, const char *)' from 'int (struct
 snd_sof_dev *)'
Message-ID: <202610230100.bfM1Xdut-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   fc5eeea8dbdc973a5994c5ab91fc9daade2673e3
commit: ec69dd1e9c24d7b84073055d0fd87c436919a6b0 [9451/9453] Merge branch 'sound/upstream-20261015' into merge/sound-upstream-20261015
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610230100.bfM1Xdut-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230100.bfM1Xdut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230100.bfM1Xdut-lkp@intel.com/

Note: the thesofproject/topic/sof-dev HEAD fc5eeea8dbdc973a5994c5ab91fc9daade2673e3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/soc/sof/amd/acp7x.c:180:31: error: incompatible function pointer types assigning to 'int (*)(struct snd_sof_dev *, const char *)' from 'int (struct snd_sof_dev *)' [-Wincompatible-function-pointer-types]
     180 |                 sof_acp7x_ops.load_firmware = acp7x_load_firmware_carveout;
         |                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +180 sound/soc/sof/amd/acp7x.c

0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  147  
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  148  int sof_acp7x_ops_init(struct snd_sof_dev *sdev)
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  149  {
7a81f54a0483ed Vijendar Mukunda 2026-07-01  150  	struct acpi_device *adev = ACPI_COMPANION(&to_pci_dev(sdev->dev)->dev);
7a81f54a0483ed Vijendar Mukunda 2026-07-01  151  	const union acpi_object *obj;
7af6ac41cd470b Vijendar Mukunda 2026-07-01  152  	int acp_sof_signed_firmware_image = 0;
7a81f54a0483ed Vijendar Mukunda 2026-07-01  153  	int acp_sof_post_fw_run_delay = 0;
7a81f54a0483ed Vijendar Mukunda 2026-07-01  154  
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  155  	/* common defaults */
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  156  	memcpy(&sof_acp7x_ops, &sof_acp_common_ops, sizeof(struct snd_sof_dsp_ops));
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  157  
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  158  	sof_acp7x_ops.drv = acp7x_sof_dai;
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  159  	sof_acp7x_ops.num_drv = ARRAY_SIZE(acp7x_sof_dai);
78d99c2c5eee0f Vijendar Mukunda 2026-07-01  160  	sof_acp7x_ops.probe = amd_sof_acp7x_probe;
78d99c2c5eee0f Vijendar Mukunda 2026-07-01  161  	sof_acp7x_ops.remove = amd_sof_acp7x_remove;
0ec5afad9d31c4 Vijendar Mukunda 2026-07-01  162  
7a81f54a0483ed Vijendar Mukunda 2026-07-01  163  	if (adev) {
7af6ac41cd470b Vijendar Mukunda 2026-07-01  164  		if (!acpi_dev_get_property(adev, "acp-sof-signed-firmware-image",
7af6ac41cd470b Vijendar Mukunda 2026-07-01  165  					   ACPI_TYPE_INTEGER, &obj))
7af6ac41cd470b Vijendar Mukunda 2026-07-01  166  			acp_sof_signed_firmware_image = obj->integer.value;
7af6ac41cd470b Vijendar Mukunda 2026-07-01  167  
7a81f54a0483ed Vijendar Mukunda 2026-07-01  168  		if (!acpi_dev_get_property(adev, "acp-sof-post_fw_run_delay",
7a81f54a0483ed Vijendar Mukunda 2026-07-01  169  					   ACPI_TYPE_INTEGER, &obj))
7a81f54a0483ed Vijendar Mukunda 2026-07-01  170  			acp_sof_post_fw_run_delay = obj->integer.value;
7a81f54a0483ed Vijendar Mukunda 2026-07-01  171  	}
7a81f54a0483ed Vijendar Mukunda 2026-07-01  172  
cec3598305a6df Vijendar Mukunda 2026-10-13  173  	if (acp_sof_signed_firmware_image) {
cec3598305a6df Vijendar Mukunda 2026-10-13  174  		/*
cec3598305a6df Vijendar Mukunda 2026-10-13  175  		 * This driver handles only ACP7.B/7.F which both use the ASP
cec3598305a6df Vijendar Mukunda 2026-10-13  176  		 * carveout firmware load path. Assign unconditionally rather
cec3598305a6df Vijendar Mukunda 2026-10-13  177  		 * than rechecking the revision so the correct loader is always
cec3598305a6df Vijendar Mukunda 2026-10-13  178  		 * selected when signed firmware is enabled.
cec3598305a6df Vijendar Mukunda 2026-10-13  179  		 */
cec3598305a6df Vijendar Mukunda 2026-10-13 @180  		sof_acp7x_ops.load_firmware = acp7x_load_firmware_carveout;

:::::: The code at line 180 was first introduced by commit
:::::: cec3598305a6df306fc4eb0c49a72e0f9949c06f ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
