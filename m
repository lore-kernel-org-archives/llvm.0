Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819501DEFD9;
	Wed,  7 May 2025 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599483; cv=none; b=K2JmfCqS5uUwUUQ2N+c0mm/HguNLCYxYSbZepUX5DdM5B8s3Sx9uzw026bm0gYYjLlNc1f3NoEWYdic5RpOeNx2LxCwi13QZ/WgqHTbXMMLPnNiT/DWHEUdl8NuHFZhxw3Eu9ETkSiROZ9zCg218Exwd7D/zG4NnSrZ6iLEWAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599483; c=relaxed/simple;
	bh=7dY1jcE36bELk8S3ljYNAdUbhynh23R77fZLXE3tTGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MviNBtFN4fhznVnJnCgu7TJZqjneleIDFVLvR7xYZsmnt6tATbQcTTLJ+bo8WOUumpmh7c+2BMW6TqcoaU65Vb694W2ZW9974eG+iDM1XCeaB8a1WhXAWFQVH3RszKTm/3g6lsmWTxNKIeRnuydiLkEaVWvgO//7xwuy0AIfTDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUbp4HZR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUbp4HZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599482; x=1778135482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dY1jcE36bELk8S3ljYNAdUbhynh23R77fZLXE3tTGQ=;
  b=mUbp4HZRJDvu2A59+ERPb1OCxUj5ydURwJ8rFEP2r1ogpeLDsIXYW+re
   fJSt/9mh6pP21Pi11/3Yq1AH4M+31njsM4t6y2lttdHYF6u8i6RnElEVw
   ReXji4ZVL2j08DqlAHjUMpykWQP2mPbRjrPrDs977JekQYWNCqJ4KxX8r
   yEPNL13Y/scfu7JV7ygHOIeD95rbNX7W+uCL/V3rFLCHKr/UCfVGwkkDs
   0tu+cTE0EmBX2rDBzw5Ynwp9/zJUfatcbS8KZa2/sNod/aTRs4u7s3y/F
   nh+Sa9B17Ya/IQix5xFwR6oeRZljMNaULTf2CHMFJUEUk1YgzgH8QYCxk
   g==;
X-CSE-ConnectionGUID: sl3haY0EQwm5bhwHHoqwGQ==
X-CSE-MsgGUID: GFKuuf0KS5qLTsmf4AXJEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70818311"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70818311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:31:17 -0700
X-CSE-ConnectionGUID: mD4hBfyiTdeZyVaT/DpmQQ==
X-CSE-MsgGUID: QI6J4F4OQIOEetRkJJrASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135744291"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 23:31:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYJC-0007CH-0t;
	Wed, 07 May 2025 06:31:10 +0000
Date: Wed, 7 May 2025 14:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 6/20] drivers/nvme/common/keyring.c:343:55:
 warning: format specifies type 'unsigned long' but the argument has type
 'size_t' (aka 'unsigned int')
Message-ID: <202505071455.a3zW7mZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: ae80ff8183abc08a2cf54506e3b67eba4d36588a [6/20] nvme-auth: switch to use 'struct key'
config: arm-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071455.a3zW7mZN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071455.a3zW7mZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071455.a3zW7mZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/keyring.c:343:55: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     343 |                 pr_debug("%s: Invalid data length %lu\n", __func__, datalen);
         |                                                   ~~~               ^~~~~~~
         |                                                   %zu
   include/linux/printk.h:637:38: note: expanded from macro 'pr_debug'
     637 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +343 drivers/nvme/common/keyring.c

da153105b999dd Hannes Reinecke 2023-03-20  292  
da153105b999dd Hannes Reinecke 2023-03-20  293  /**
da153105b999dd Hannes Reinecke 2023-03-20  294   * nvme_dhchap_psk_preparse - prepare DH-HMAC-CHAP key data
da153105b999dd Hannes Reinecke 2023-03-20  295   * @prep: preparsed payload of the key data
da153105b999dd Hannes Reinecke 2023-03-20  296   *
da153105b999dd Hannes Reinecke 2023-03-20  297   * Decode the DH-HMAC-CHAP key data passed in in @prep and
da153105b999dd Hannes Reinecke 2023-03-20  298   * store the resulting binary data. The binary data includes
da153105b999dd Hannes Reinecke 2023-03-20  299   * space for the CRC, the version, and the hmac identifier,
da153105b999dd Hannes Reinecke 2023-03-20  300   * but the data length is just the key data without the CRC.
da153105b999dd Hannes Reinecke 2023-03-20  301   * This allows the user to read the key data via the
da153105b999dd Hannes Reinecke 2023-03-20  302   * 'user_read()' function, but also to export the full
da153105b999dd Hannes Reinecke 2023-03-20  303   * key data including CRC via the 'read' callback from the key type.
da153105b999dd Hannes Reinecke 2023-03-20  304   */
da153105b999dd Hannes Reinecke 2023-03-20  305  static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
da153105b999dd Hannes Reinecke 2023-03-20  306  {
da153105b999dd Hannes Reinecke 2023-03-20  307  	struct user_key_payload *upayload;
da153105b999dd Hannes Reinecke 2023-03-20  308  	size_t datalen = prep->datalen, keylen;
da153105b999dd Hannes Reinecke 2023-03-20  309  	int ret;
da153105b999dd Hannes Reinecke 2023-03-20  310  	u32 crc;
da153105b999dd Hannes Reinecke 2023-03-20  311  	u8 version, hmac;
da153105b999dd Hannes Reinecke 2023-03-20  312  
da153105b999dd Hannes Reinecke 2023-03-20  313  	if (!prep->data) {
da153105b999dd Hannes Reinecke 2023-03-20  314  		pr_debug("%s: Empty data", __func__);
da153105b999dd Hannes Reinecke 2023-03-20  315  		prep->payload.data[0] = NULL;
da153105b999dd Hannes Reinecke 2023-03-20  316  		prep->quotalen = 0;
da153105b999dd Hannes Reinecke 2023-03-20  317  		return -EINVAL;
da153105b999dd Hannes Reinecke 2023-03-20  318  	}
da153105b999dd Hannes Reinecke 2023-03-20  319  
da153105b999dd Hannes Reinecke 2023-03-20  320  	if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s", &version, &hmac) != 2) {
da153105b999dd Hannes Reinecke 2023-03-20  321  		pr_debug("%s: invalid key data '%s'\n", __func__,
da153105b999dd Hannes Reinecke 2023-03-20  322  			 (char *)prep->data);
da153105b999dd Hannes Reinecke 2023-03-20  323  		prep->payload.data[0] = NULL;
da153105b999dd Hannes Reinecke 2023-03-20  324  		prep->quotalen = 0;
da153105b999dd Hannes Reinecke 2023-03-20  325  		return -EINVAL;
da153105b999dd Hannes Reinecke 2023-03-20  326  	}
da153105b999dd Hannes Reinecke 2023-03-20  327  
da153105b999dd Hannes Reinecke 2023-03-20  328  	/* skip header and final ':' character */
da153105b999dd Hannes Reinecke 2023-03-20  329  	datalen -= 11;
da153105b999dd Hannes Reinecke 2023-03-20  330  
da153105b999dd Hannes Reinecke 2023-03-20  331  	/* keylen is the key length, 4 bytes CRC, 1 byte version, and 1 byte HMAC identifier */
da153105b999dd Hannes Reinecke 2023-03-20  332  	switch (datalen) {
da153105b999dd Hannes Reinecke 2023-03-20  333  	case 48:
da153105b999dd Hannes Reinecke 2023-03-20  334  		keylen = 38;
da153105b999dd Hannes Reinecke 2023-03-20  335  		break;
da153105b999dd Hannes Reinecke 2023-03-20  336  	case 72:
da153105b999dd Hannes Reinecke 2023-03-20  337  		keylen = 54;
da153105b999dd Hannes Reinecke 2023-03-20  338  		break;
da153105b999dd Hannes Reinecke 2023-03-20  339  	case 92:
da153105b999dd Hannes Reinecke 2023-03-20  340  		keylen = 70;
da153105b999dd Hannes Reinecke 2023-03-20  341  		break;
da153105b999dd Hannes Reinecke 2023-03-20  342  	default:
da153105b999dd Hannes Reinecke 2023-03-20 @343  		pr_debug("%s: Invalid data length %lu\n", __func__, datalen);
da153105b999dd Hannes Reinecke 2023-03-20  344  		prep->payload.data[0] = NULL;
da153105b999dd Hannes Reinecke 2023-03-20  345  		prep->quotalen = 0;
da153105b999dd Hannes Reinecke 2023-03-20  346  		return -EINVAL;
da153105b999dd Hannes Reinecke 2023-03-20  347  	}
da153105b999dd Hannes Reinecke 2023-03-20  348  
da153105b999dd Hannes Reinecke 2023-03-20  349  	upayload = kzalloc(sizeof(*upayload) + keylen, GFP_KERNEL);
da153105b999dd Hannes Reinecke 2023-03-20  350  	if (!upayload) {
da153105b999dd Hannes Reinecke 2023-03-20  351  		prep->payload.data[0] = NULL;
da153105b999dd Hannes Reinecke 2023-03-20  352  		prep->quotalen = 0;
da153105b999dd Hannes Reinecke 2023-03-20  353  		return -ENOMEM;
da153105b999dd Hannes Reinecke 2023-03-20  354  	}
da153105b999dd Hannes Reinecke 2023-03-20  355  
da153105b999dd Hannes Reinecke 2023-03-20  356  	/* decode the data */
da153105b999dd Hannes Reinecke 2023-03-20  357  	prep->quotalen = keylen;
da153105b999dd Hannes Reinecke 2023-03-20  358  	prep->payload.data[0] = upayload;
da153105b999dd Hannes Reinecke 2023-03-20  359  	ret = base64_decode(prep->data + 10, datalen, upayload->data);
da153105b999dd Hannes Reinecke 2023-03-20  360  	if (ret < 0) {
da153105b999dd Hannes Reinecke 2023-03-20  361  		pr_debug("%s: Failed to decode key %s\n",
da153105b999dd Hannes Reinecke 2023-03-20  362  			 __func__, (char *)prep->data + 10);
da153105b999dd Hannes Reinecke 2023-03-20  363  		return ret;
da153105b999dd Hannes Reinecke 2023-03-20  364  	}
da153105b999dd Hannes Reinecke 2023-03-20  365  	ret -= 4;
da153105b999dd Hannes Reinecke 2023-03-20  366  	crc = ~crc32(~0, upayload->data, ret);
da153105b999dd Hannes Reinecke 2023-03-20  367  	if (get_unaligned_le32(upayload->data + ret) != crc) {
da153105b999dd Hannes Reinecke 2023-03-20  368  		pr_debug("%s: CRC mismatch for key\n", __func__);
da153105b999dd Hannes Reinecke 2023-03-20  369  		/* CRC mismatch */
da153105b999dd Hannes Reinecke 2023-03-20  370  		return -EKEYREJECTED;
da153105b999dd Hannes Reinecke 2023-03-20  371  	}
da153105b999dd Hannes Reinecke 2023-03-20  372  	upayload->data[ret + 4] = version;
da153105b999dd Hannes Reinecke 2023-03-20  373  	upayload->data[ret + 5] = hmac;
da153105b999dd Hannes Reinecke 2023-03-20  374  	upayload->datalen = ret;
da153105b999dd Hannes Reinecke 2023-03-20  375  	return 0;
da153105b999dd Hannes Reinecke 2023-03-20  376  }
da153105b999dd Hannes Reinecke 2023-03-20  377  

:::::: The code at line 343 was first introduced by commit
:::::: da153105b999dda340dde78bba86e7335065c9b0 nvme-keyring: add 'dhchap' key type

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Hannes Reinecke <hare@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
