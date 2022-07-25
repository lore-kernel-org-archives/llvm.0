Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528D63B
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658746819; x=1690282819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mo9chgy0bi5uG+EZ6kmOhhKH/zG+YyE1Qh3F/VVxZYk=;
  b=KSB+Y+0gg55a1sq1yf4yamJ13i7TXqykZT3TeXfFCaS5d53Czg0hrHC2
   VMZ856/3z17ZJIuJEIq7S3T+az37Ek0H5bvvKVRsZ6rssvax/ztbrp8aG
   PkTMwp7Syr59jMV40EyvmlxNXG/fV+rSw7wAh9vxx32PXSEhg2y5XdslW
   5xN+qk1LSCnawHtoD96EZFRo547b48FQ7nUEvgdpaDANYZl5I5EE1q7qI
   qOIUaJUx+Xhdtocuf8hjQ+OedkuCy2aw0MHQdfsfG0SNBvQvApI1xz58q
   4i21fuJf30yRhcry4aJLKrClC+2QWhC7/HIpTR6v/hBUlChcUop6J0Vud
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="268063098"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="268063098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 04:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="549949151"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2022 04:00:16 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFvot-0004yf-34;
	Mon, 25 Jul 2022 11:00:15 +0000
Date: Mon, 25 Jul 2022 18:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:262:17:
 warning: taking address of packed member 'len' of class or structure 'tlv'
 may result in an unaligned pointer value
Message-ID: <202207251801.hLXIP9Rh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: 25702d9c55dc5fda2ad9ad8de115e50dc7394ef9 mt76: connac: rely on le16_add_cpu in mt76_connac_mcu_add_nested_tlv
date:   7 months ago
config: arm-buildonly-randconfig-r003-20220724 (https://download.01.org/0day-ci/archive/20220725/202207251801.hLXIP9Rh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9e88cbcc403bdf82f29259ad60ff60a8fc4434a1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=25702d9c55dc5fda2ad9ad8de115e50dc7394ef9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 25702d9c55dc5fda2ad9ad8de115e50dc7394ef9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:262:17: warning: taking address of packed member 'len' of class or structure 'tlv' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   le16_add_cpu(&sta_hdr->len, len);
                                 ^~~~~~~~~~~~
   1 warning generated.


vim +262 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c

   242	
   243	struct tlv *
   244	mt76_connac_mcu_add_nested_tlv(struct sk_buff *skb, int tag, int len,
   245				       void *sta_ntlv, void *sta_wtbl)
   246	{
   247		struct sta_ntlv_hdr *ntlv_hdr = sta_ntlv;
   248		struct tlv *sta_hdr = sta_wtbl;
   249		struct tlv *ptlv, tlv = {
   250			.tag = cpu_to_le16(tag),
   251			.len = cpu_to_le16(len),
   252		};
   253		u16 ntlv;
   254	
   255		ptlv = skb_put(skb, len);
   256		memcpy(ptlv, &tlv, sizeof(tlv));
   257	
   258		ntlv = le16_to_cpu(ntlv_hdr->tlv_num);
   259		ntlv_hdr->tlv_num = cpu_to_le16(ntlv + 1);
   260	
   261		if (sta_hdr)
 > 262			le16_add_cpu(&sta_hdr->len, len);
   263	
   264		return ptlv;
   265	}
   266	EXPORT_SYMBOL_GPL(mt76_connac_mcu_add_nested_tlv);
   267	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
