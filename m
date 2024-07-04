Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D446544C77;
	Thu,  4 Jul 2024 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720125417; cv=none; b=nTL4nXHAWitG20/92+UH/ZwnXpdatB2o8SVPuam0+z8RCTPEU5N9dhw7gQFuRwbIsbIPn1pgniB8uYbnpyXLrGHBzkPlC0wU6bHmVgwZdL3+/VPvisgHMdgL5NoXtuT1bhxif28sArOV51S45V1z6GVp4EPuUSpPYrjXDaFi2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720125417; c=relaxed/simple;
	bh=SZheplUgeuc3mMpH+adr7zOhZZipa5FdbT93WJJBlGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxESV9TcqNfblkSvGZmZBuCOEHUBC17HkRQs4e4mFf1JmMDE3rOGuOGsC3TjLJssmlHP9ztsDbGPxkIw3TE0/thv3K1Xt8vx6pyaRSrAdUIxc+/dsBw3fGr3uy80P4XrHPRl4RkcvXk5ajHAcU1lN/KcnGtSBWknzuGz9OD6rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL31kJ9X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL31kJ9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720125416; x=1751661416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZheplUgeuc3mMpH+adr7zOhZZipa5FdbT93WJJBlGo=;
  b=LL31kJ9XubBug1MRpkALQ76N58olpJHFBOycDh+kmuzcc6s2EiDCMm2f
   I/20QSeU63pKIKrERAycapPt2iWL56pF31Ewx5uAUrzIF6MY9tSD1AQiu
   in5XdK5Zp1KY+6McCA1xu8Y+N7EWY4/HB6ez0kQW6xp2/bM1F6GrZKkxC
   z41T1swsVFoc8qXIrI0mtO1XVcRrGhYgvfmCC7y9MvzNgLlB3oAEb/kyo
   FFsBS9eJ9p9PPzRHIcF2I9b+gRrmRdXgYOICS1mRMW+l2DNARBBItyZ6I
   39QQD2qSkNvnEHexGnHZaO09D4uGC8vhE1ls4vYl414ekbwHRbNTu00qu
   A==;
X-CSE-ConnectionGUID: OKVPwnw7QDWPnJUg+JbiIw==
X-CSE-MsgGUID: eYLC+qR9RlGP0/xw4BRThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17549348"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17549348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 13:36:55 -0700
X-CSE-ConnectionGUID: Y3z5vfUSTr2/D/ZsPx0a1w==
X-CSE-MsgGUID: LJQLBUwgQgKvlCh6TXsxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69896560"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 13:36:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPTCE-000RPr-1C;
	Thu, 04 Jul 2024 20:36:50 +0000
Date: Fri, 5 Jul 2024 04:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Subject: [nbd168-wireless:mt76 63/76]
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c:63:37: warning:
 expression which evaluates to zero treated as a null pointer constant of
 type 'struct mt76_wcid *'
Message-ID: <202407050405.0plneRz2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   d4e88257700387ae5702a89a2abb9ebc723c4bf2
commit: ef59fda6d20683a7baf243dd68de6b0f3285d480 [63/76] wifi: mt76: mt7925: add link handling in mt7925_txwi_free
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240705/202407050405.0plneRz2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050405.0plneRz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050405.0plneRz2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c:63:37: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct mt76_wcid *' [-Wnon-literal-null-conversion]
      63 |                 mt7925_txwi_free(dev, txwi, NULL, false, NULL);
         |                                                   ^~~~~
   1 warning generated.


vim +63 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c

c948b5da6bbec7 Deren Wu 2023-09-18  55  
c948b5da6bbec7 Deren Wu 2023-09-18  56  void mt7925_tx_token_put(struct mt792x_dev *dev)
c948b5da6bbec7 Deren Wu 2023-09-18  57  {
c948b5da6bbec7 Deren Wu 2023-09-18  58  	struct mt76_txwi_cache *txwi;
c948b5da6bbec7 Deren Wu 2023-09-18  59  	int id;
c948b5da6bbec7 Deren Wu 2023-09-18  60  
c948b5da6bbec7 Deren Wu 2023-09-18  61  	spin_lock_bh(&dev->mt76.token_lock);
c948b5da6bbec7 Deren Wu 2023-09-18  62  	idr_for_each_entry(&dev->mt76.token, txwi, id) {
c948b5da6bbec7 Deren Wu 2023-09-18 @63  		mt7925_txwi_free(dev, txwi, NULL, false, NULL);
c948b5da6bbec7 Deren Wu 2023-09-18  64  		dev->mt76.token_count--;
c948b5da6bbec7 Deren Wu 2023-09-18  65  	}
c948b5da6bbec7 Deren Wu 2023-09-18  66  	spin_unlock_bh(&dev->mt76.token_lock);
c948b5da6bbec7 Deren Wu 2023-09-18  67  	idr_destroy(&dev->mt76.token);
c948b5da6bbec7 Deren Wu 2023-09-18  68  }
c948b5da6bbec7 Deren Wu 2023-09-18  69  

:::::: The code at line 63 was first introduced by commit
:::::: c948b5da6bbec742b433138e3e3f9537a85af2e5 wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips

:::::: TO: Deren Wu <deren.wu@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
