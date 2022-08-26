Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9E5384
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 23:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661556345; x=1693092345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ybnVqotmHYbskoWeW7Vf5ai0y0aLeXGFeQIl1fl+BJw=;
  b=c/FhBrxJvLPfSbroX6A1EugNij10ZjRLQc1DLIdBDit2nnWZOEkMQSXn
   kcd3RANsCWoWavmjaJgQoyBR8hBUwBwePZI/iGuBkqS6jbt7sI9iAw2s7
   zIkoTQQYP/QIpmyMLRe19Zi2dyJ+amMEq1l1Oy6tAtnpelJeyDGgkWOrF
   ap94W1yQcdYdpznkil/G+zFD6S6F/oKjGZfy3TdUBtfV9Tg2bH6BAhZCK
   CC2Tx9D+wuPgQIE/FQP5pc77mv9GwLwcUY9LUHQZ8WSSHQliCl8u892Gm
   p+Dic7YMW4HmkUxib3Mnr/pMIKofrHijGmi6gkDWMK0YVY3F7Xy07Z4PF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="356328758"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; 
   d="scan'208";a="356328758"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 16:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; 
   d="scan'208";a="679027402"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2022 16:25:23 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRihX-0000ds-07;
	Fri, 26 Aug 2022 23:25:23 +0000
Date: Sat, 27 Aug 2022 07:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH] wifi: use struct_group to copy addresses
Message-ID: <202208270709.yaMdVwqX-lkp@intel.com>
References: <20220826222007.7acf78f1ecee.I7c75a7d3599f120c720a5d6ec170fd90ec0dfd51@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826222007.7acf78f1ecee.I7c75a7d3599f120c720a5d6ec170fd90ec0dfd51@changeid>

Hi Johannes,

I love your patch! Yet something to improve:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.0-rc2 next-20220826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-use-struct_group-to-copy-addresses/20220827-042146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: riscv-randconfig-r042-20220827 (https://download.01.org/0day-ci/archive/20220827/202208270709.yaMdVwqX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/b170af98c24ca49976213745cd2ded205febf09d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Berg/wifi-use-struct_group-to-copy-addresses/20220827-042146
        git checkout b170af98c24ca49976213745cd2ded205febf09d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/wireless/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/wireless/lib80211_crypt_ccmp.c:139:18: error: passing 'const struct (unnamed struct at include/linux/ieee80211.h:313:2)' to parameter of incompatible type 'const void *'
           memcpy(aad + 2, hdr->addrs, 3 * ETH_ALEN);
                           ^~~~~~~~~~
   arch/riscv/include/asm/string.h:16:52: note: passing argument to parameter here
   extern asmlinkage void *memcpy(void *, const void *, size_t);
                                                      ^
   1 error generated.


vim +139 net/wireless/lib80211_crypt_ccmp.c

    93	
    94	static int ccmp_init_iv_and_aad(const struct ieee80211_hdr *hdr,
    95					const u8 *pn, u8 *iv, u8 *aad)
    96	{
    97		u8 *pos, qc = 0;
    98		size_t aad_len;
    99		int a4_included, qc_included;
   100	
   101		a4_included = ieee80211_has_a4(hdr->frame_control);
   102		qc_included = ieee80211_is_data_qos(hdr->frame_control);
   103	
   104		aad_len = 22;
   105		if (a4_included)
   106			aad_len += 6;
   107		if (qc_included) {
   108			pos = (u8 *) & hdr->addr4;
   109			if (a4_included)
   110				pos += 6;
   111			qc = *pos & 0x0f;
   112			aad_len += 2;
   113		}
   114	
   115		/* In CCM, the initial vectors (IV) used for CTR mode encryption and CBC
   116		 * mode authentication are not allowed to collide, yet both are derived
   117		 * from the same vector. We only set L := 1 here to indicate that the
   118		 * data size can be represented in (L+1) bytes. The CCM layer will take
   119		 * care of storing the data length in the top (L+1) bytes and setting
   120		 * and clearing the other bits as is required to derive the two IVs.
   121		 */
   122		iv[0] = 0x1;
   123	
   124		/* Nonce: QC | A2 | PN */
   125		iv[1] = qc;
   126		memcpy(iv + 2, hdr->addr2, ETH_ALEN);
   127		memcpy(iv + 8, pn, CCMP_PN_LEN);
   128	
   129		/* AAD:
   130		 * FC with bits 4..6 and 11..13 masked to zero; 14 is always one
   131		 * A1 | A2 | A3
   132		 * SC with bits 4..15 (seq#) masked to zero
   133		 * A4 (if present)
   134		 * QC (if present)
   135		 */
   136		pos = (u8 *) hdr;
   137		aad[0] = pos[0] & 0x8f;
   138		aad[1] = pos[1] & 0xc7;
 > 139		memcpy(aad + 2, hdr->addrs, 3 * ETH_ALEN);
   140		pos = (u8 *) & hdr->seq_ctrl;
   141		aad[20] = pos[0] & 0x0f;
   142		aad[21] = 0;		/* all bits masked */
   143		memset(aad + 22, 0, 8);
   144		if (a4_included)
   145			memcpy(aad + 22, hdr->addr4, ETH_ALEN);
   146		if (qc_included) {
   147			aad[a4_included ? 28 : 22] = qc;
   148			/* rest of QC masked */
   149		}
   150		return aad_len;
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
