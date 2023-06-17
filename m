Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B302A57;
	Sat, 17 Jun 2023 04:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686975139; x=1718511139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U918sCaPPb+MTR0x8723+JOjGErECr7gkmOTXNP+lD8=;
  b=FDfUfSL9ihylHAFbEPAyqzXhfyySVK+P+sys5BVvBo5fmlmcTDrLy/Su
   eq/XFTNRPePv6EkYZnmbOfoMX/aqK3vUD78MDXZ0yRXCBnbm6Xjd13j1Q
   l7GEkd3KkJKYKFLp/1831WXOaHrYgLhPPo0kiampUwyMHdheo3G0pX8SE
   lEYwcUSOD0WqcIeuMkZouMxNJIMh7uoe37740I80QPBAzLL3R+Eik1wcd
   za2xvEFlolGZAuF4SJ77QGokL/TilOXWijn4XyWmcmcnKoXfy2FkLUXbx
   gjdTRNqeHIPvfmJjSMh8rQCOxaObeI7Zj2gms/eMm58twwXqNPbc7CgNj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="349069420"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="349069420"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 21:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="713095471"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="713095471"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2023 21:12:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qANIL-0002Fa-1x;
	Sat, 17 Jun 2023 04:12:13 +0000
Date: Sat, 17 Jun 2023 12:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-tip/x86/tdx/v7 4/15] ld.lld: warning:
 vmlinux.o: DWARF unit at offset 0x0002bfbf contains invalid abbreviation 169
 at offset 0x0002bfcc, valid abbreviations are 1-2
Message-ID: <202306171239.Ejkl3rVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-tip/x86/tdx/v7
head:   8b6ccc53857db9fe8e915646c5ffc220f5750ddc
commit: 40528e7b482a0dcdb8a8b888640ba3e73a4b0ff6 [4/15] x86/hyperv: Support hypercalls for TDX guests
config: i386-buildonly-randconfig-r004-20230616 (https://download.01.org/0day-ci/archive/20230617/202306171239.Ejkl3rVr-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171239.Ejkl3rVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171239.Ejkl3rVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0002bfbf contains invalid abbreviation 169 at offset 0x0002bfcc, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0002c107 contains invalid abbreviation 169 at offset 0x0002c114, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0002c195 contains invalid abbreviation 169 at offset 0x0002c1a2, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0002c1db contains invalid abbreviation 169 at offset 0x0002c1e8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000402fe contains invalid abbreviation 169 at offset 0x0004030b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0004d2ea contains invalid abbreviation 169 at offset 0x0004d2f7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0004d314 contains invalid abbreviation 169 at offset 0x0004d321, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0004d33e contains invalid abbreviation 169 at offset 0x0004d34b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0004d492 contains invalid abbreviation 169 at offset 0x0004d49f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006c05a contains invalid abbreviation 150 at offset 0x0006c067, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006c242 contains invalid abbreviation 150 at offset 0x0006c24f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006c299 contains invalid abbreviation 150 at offset 0x0006c2a6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006c2d3 contains invalid abbreviation 150 at offset 0x0006c2e0, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006c361 contains invalid abbreviation 150 at offset 0x0006c36e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0006cb30 contains invalid abbreviation 46 at offset 0x0006cb3c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0007b082 contains invalid abbreviation 133 at offset 0x0007b08f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0007b0cb contains invalid abbreviation 133 at offset 0x0007b0d8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0007b17f contains invalid abbreviation 133 at offset 0x0007b18c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000889d4 contains invalid abbreviation 133 at offset 0x000889e1, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00088a2b contains invalid abbreviation 133 at offset 0x00088a38, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000893db contains invalid abbreviation 51 at offset 0x000893e7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000b0273 contains invalid abbreviation 122 at offset 0x000b027f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000bd2f4 contains invalid abbreviation 122 at offset 0x000bd300, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000c972f contains invalid abbreviation 25 at offset 0x000c973b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000e27df contains invalid abbreviation 158 at offset 0x000e27ec, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000fa44f contains invalid abbreviation 158 at offset 0x000fa45c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000fa4ad contains invalid abbreviation 158 at offset 0x000fa4ba, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000fa56c contains invalid abbreviation 158 at offset 0x000fa579, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000fa59a contains invalid abbreviation 158 at offset 0x000fa5a7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0011bcf2 contains invalid abbreviation 134 at offset 0x0011bcff, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00141450 contains invalid abbreviation 109 at offset 0x0014145c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0015f4fc contains invalid abbreviation 138 at offset 0x0015f509, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0015f592 contains invalid abbreviation 138 at offset 0x0015f59f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0015f5d9 contains invalid abbreviation 138 at offset 0x0015f5e6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00186602 contains invalid abbreviation 131 at offset 0x0018660f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001866bb contains invalid abbreviation 131 at offset 0x001866c8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001b4471 contains invalid abbreviation 154 at offset 0x001b447e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001b44b9 contains invalid abbreviation 154 at offset 0x001b44c6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001b44e3 contains invalid abbreviation 154 at offset 0x001b44f0, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001cc0ac contains invalid abbreviation 154 at offset 0x001cc0b9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001d7580 contains invalid abbreviation 154 at offset 0x001d758d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001e62f4 contains invalid abbreviation 122 at offset 0x001e6300, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001e6cde contains invalid abbreviation 122 at offset 0x001e6cea, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00212584 contains invalid abbreviation 144 at offset 0x00212591, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0022a23e contains invalid abbreviation 144 at offset 0x0022a24b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0022a26c contains invalid abbreviation 144 at offset 0x0022a279, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00237e94 contains invalid abbreviation 117 at offset 0x00237ea0, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00260528 contains invalid abbreviation 134 at offset 0x00260535, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0026057a contains invalid abbreviation 134 at offset 0x00260587, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0026d6b6 contains invalid abbreviation 134 at offset 0x0026d6c3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0027d784 contains invalid abbreviation 130 at offset 0x0027d791, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002953f7 contains invalid abbreviation 130 at offset 0x00295404, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002b5103 contains invalid abbreviation 138 at offset 0x002b5110, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002dbbb7 contains invalid abbreviation 118 at offset 0x002dbbc3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003042bf contains invalid abbreviation 150 at offset 0x003042cc, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003042fb contains invalid abbreviation 150 at offset 0x00304308, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0030434f contains invalid abbreviation 150 at offset 0x0030435c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003043e9 contains invalid abbreviation 150 at offset 0x003043f6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0031642b contains invalid abbreviation 126 at offset 0x00316437, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003181a9 contains invalid abbreviation 76 at offset 0x003181b5, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00319cee contains invalid abbreviation 72 at offset 0x00319cfa, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0031a9df contains invalid abbreviation 56 at offset 0x0031a9eb, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0031aa1d contains invalid abbreviation 56 at offset 0x0031aa29, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00329ce4 contains invalid abbreviation 111 at offset 0x00329cf0, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003456ae contains invalid abbreviation 120 at offset 0x003456ba, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0035675c contains invalid abbreviation 77 at offset 0x00356768, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0036c6d8 contains invalid abbreviation 142 at offset 0x0036c6e5, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0037e72d contains invalid abbreviation 50 at offset 0x0037e739, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0038c197 contains invalid abbreviation 111 at offset 0x0038c1a3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003966dc contains invalid abbreviation 140 at offset 0x003966e9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00396721 contains invalid abbreviation 140 at offset 0x0039672e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003a5f04 contains invalid abbreviation 144 at offset 0x003a5f11, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003ad43b contains invalid abbreviation 144 at offset 0x003ad448, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003ad4a5 contains invalid abbreviation 144 at offset 0x003ad4b2, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bc86b contains invalid abbreviation 128 at offset 0x003bc878, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bf87d contains invalid abbreviation 105 at offset 0x003bf889, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bf90c contains invalid abbreviation 105 at offset 0x003bf918, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bf93f contains invalid abbreviation 105 at offset 0x003bf94b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bf974 contains invalid abbreviation 105 at offset 0x003bf980, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bf99c contains invalid abbreviation 105 at offset 0x003bf9a8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bfa17 contains invalid abbreviation 105 at offset 0x003bfa23, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bfa58 contains invalid abbreviation 105 at offset 0x003bfa64, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bfa8b contains invalid abbreviation 105 at offset 0x003bfa97, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003d00a8 contains invalid abbreviation 112 at offset 0x003d00b4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003d00dd contains invalid abbreviation 112 at offset 0x003d00e9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003d6657 contains invalid abbreviation 112 at offset 0x003d6663, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003e37e2 contains invalid abbreviation 94 at offset 0x003e37ee, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003e9689 contains invalid abbreviation 94 at offset 0x003e9695, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003e9a2c contains invalid abbreviation 94 at offset 0x003e9a38, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003fac99 contains invalid abbreviation 100 at offset 0x003faca5, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00411949 contains invalid abbreviation 106 at offset 0x00411955, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0041c266 contains invalid abbreviation 90 at offset 0x0041c272, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0041c2a7 contains invalid abbreviation 90 at offset 0x0041c2b3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0041c39d contains invalid abbreviation 90 at offset 0x0041c3a9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x004268ac contains invalid abbreviation 82 at offset 0x004268b8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x004268ed contains invalid abbreviation 82 at offset 0x004268f9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00434bbb contains invalid abbreviation 110 at offset 0x00434bc7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0043bcba contains invalid abbreviation 110 at offset 0x0043bcc6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00454dbc contains invalid abbreviation 149 at offset 0x00454dc9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00454e96 contains invalid abbreviation 149 at offset 0x00454ea3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x004550eb contains invalid abbreviation 149 at offset 0x004550f8, valid abbreviations are 1-2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
