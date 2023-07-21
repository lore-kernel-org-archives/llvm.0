Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD720F2;
	Fri, 21 Jul 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689925138; x=1721461138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zY2baKm2kBAvA9di7wNr/2KPOz8sEsmCsTQyaI7Avgs=;
  b=fJO1d2BdZ+PrYzxCmtoutW810iWzV4g2Bluu4F0UDCkAjHyvlXn7KF4T
   xN/4IDmUB3YvbdKVnrPAYQklDI8gSgPFJOUbMI41ic9mC/y4RbTQ6QFVx
   tG7AJHzoYVD7YriopdvgLWcl0qFN3ARo5s3SXF0dLdQIH+HyxWiw6RsNk
   N8o+g8OK4lIqgqfg5JTdlyChRgCYqU22WYT2eMtF63eNztzYE3hQKGBEZ
   P5OF5gjK5L1ZLLYA4UZlYP2gemwMTUiWgihWWOsDrWxmiwT2s18OHLgri
   feVHeg3h/ISs+Hi9l8ARb3ll7AOTl5PFou5rDLXQ+TthTufE5n5lgV7Kh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397849593"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="397849593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 00:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701948642"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="701948642"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Jul 2023 00:38:55 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMkj0-00071Z-0o;
	Fri, 21 Jul 2023 07:38:54 +0000
Date: Fri, 21 Jul 2023 15:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-nobdev-20230720 3/7] ld.lld: warning:
 vmlinux.o: DWARF unit at offset 0x00028e3c contains invalid abbreviation 166
 at offset 0x00028e49, valid abbreviations are 1-2
Message-ID: <202307211515.nhCVelo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230720
head:   b24b8dbd9252f74cf3cb561dfb0936927968319a
commit: 771c40344fc3ae723d0b5b75fbe13ce2f1f1cc81 [3/7] filemap: use minimum order while allocating folios
config: i386-randconfig-i015-20230720 (https://download.01.org/0day-ci/archive/20230721/202307211515.nhCVelo8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211515.nhCVelo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211515.nhCVelo8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00028e3c contains invalid abbreviation 166 at offset 0x00028e49, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000447a5 contains invalid abbreviation 166 at offset 0x000447b2, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00053cf2 contains invalid abbreviation 229 at offset 0x00053cff, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00060179 contains invalid abbreviation 229 at offset 0x00060186, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00079845 contains invalid abbreviation 166 at offset 0x00079852, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00085fbd contains invalid abbreviation 166 at offset 0x00085fca, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000860f5 contains invalid abbreviation 166 at offset 0x00086102, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001e7a70 contains invalid abbreviation 166 at offset 0x001e7a7d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001e8a13 contains invalid abbreviation 166 at offset 0x001e8a20, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x001e8aa7 contains invalid abbreviation 166 at offset 0x001e8ab4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0028015c contains invalid abbreviation 166 at offset 0x00280169, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002a1fe7 contains invalid abbreviation 166 at offset 0x002a1ff4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002bcb09 contains invalid abbreviation 166 at offset 0x002bcb16, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002c02ea contains invalid abbreviation 166 at offset 0x002c02f7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002d8c7c contains invalid abbreviation 166 at offset 0x002d8c89, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002edc97 contains invalid abbreviation 166 at offset 0x002edca4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x002f9146 contains invalid abbreviation 166 at offset 0x002f9153, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0030fc83 contains invalid abbreviation 166 at offset 0x0030fc90, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00380699 contains invalid abbreviation 166 at offset 0x003806a6, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00394922 contains invalid abbreviation 166 at offset 0x0039492f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003bd08b contains invalid abbreviation 229 at offset 0x003bd098, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003be36b contains invalid abbreviation 229 at offset 0x003be378, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003e15dc contains invalid abbreviation 229 at offset 0x003e15e9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003f81c0 contains invalid abbreviation 166 at offset 0x003f81cd, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x003fd5f8 contains invalid abbreviation 166 at offset 0x003fd605, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00417871 contains invalid abbreviation 166 at offset 0x0041787e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0041a1cf contains invalid abbreviation 166 at offset 0x0041a1dc, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0041a229 contains invalid abbreviation 166 at offset 0x0041a236, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x004328f0 contains invalid abbreviation 166 at offset 0x004328fd, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x004795dd contains invalid abbreviation 166 at offset 0x004795ea, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00513629 contains invalid abbreviation 166 at offset 0x00513636, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0054ce4e contains invalid abbreviation 166 at offset 0x0054ce5b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00562017 contains invalid abbreviation 166 at offset 0x00562024, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0056bb61 contains invalid abbreviation 166 at offset 0x0056bb6e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0058a7cc contains invalid abbreviation 166 at offset 0x0058a7d9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0077cadf contains invalid abbreviation 166 at offset 0x0077caec, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0082b73d contains invalid abbreviation 166 at offset 0x0082b74a, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x008498d5 contains invalid abbreviation 166 at offset 0x008498e2, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00a64b41 contains invalid abbreviation 166 at offset 0x00a64b4e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00b0e5e2 contains invalid abbreviation 166 at offset 0x00b0e5ef, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00bf4d2d contains invalid abbreviation 166 at offset 0x00bf4d3a, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00db2151 contains invalid abbreviation 166 at offset 0x00db215e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00eeb95a contains invalid abbreviation 166 at offset 0x00eeb967, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00f84724 contains invalid abbreviation 166 at offset 0x00f84731, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x00fc8a48 contains invalid abbreviation 229 at offset 0x00fc8a55, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x011b4cfb contains invalid abbreviation 166 at offset 0x011b4d08, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01293d1b contains invalid abbreviation 166 at offset 0x01293d28, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01333259 contains invalid abbreviation 166 at offset 0x01333266, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01459aae contains invalid abbreviation 166 at offset 0x01459abb, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0176f916 contains invalid abbreviation 166 at offset 0x0176f923, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01816204 contains invalid abbreviation 166 at offset 0x01816211, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0198af54 contains invalid abbreviation 166 at offset 0x0198af61, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x019aabee contains invalid abbreviation 166 at offset 0x019aabfb, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01ca3102 contains invalid abbreviation 166 at offset 0x01ca310f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01f56381 contains invalid abbreviation 229 at offset 0x01f5638e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x01fe9d60 contains invalid abbreviation 166 at offset 0x01fe9d6d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0203ac9b contains invalid abbreviation 166 at offset 0x0203aca8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0217add0 contains invalid abbreviation 166 at offset 0x0217addd, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x021e7808 contains invalid abbreviation 229 at offset 0x021e7815, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0220b87e contains invalid abbreviation 166 at offset 0x0220b88b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x022d6b16 contains invalid abbreviation 166 at offset 0x022d6b23, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x022f85f7 contains invalid abbreviation 166 at offset 0x022f8604, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02377500 contains invalid abbreviation 166 at offset 0x0237750d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0295219b contains invalid abbreviation 166 at offset 0x029521a8, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0295253a contains invalid abbreviation 166 at offset 0x02952547, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0297dae5 contains invalid abbreviation 166 at offset 0x0297daf2, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x029a4fe1 contains invalid abbreviation 166 at offset 0x029a4fee, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02a13a11 contains invalid abbreviation 229 at offset 0x02a13a1e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02af490a contains invalid abbreviation 166 at offset 0x02af4917, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02b381c4 contains invalid abbreviation 229 at offset 0x02b381d1, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02d7200c contains invalid abbreviation 229 at offset 0x02d72019, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02dad03f contains invalid abbreviation 229 at offset 0x02dad04c, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x02dad175 contains invalid abbreviation 166 at offset 0x02dad182, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0312c3ec contains invalid abbreviation 166 at offset 0x0312c3f9, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03157548 contains invalid abbreviation 166 at offset 0x03157555, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x031ea520 contains invalid abbreviation 229 at offset 0x031ea52d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03a549dd contains invalid abbreviation 166 at offset 0x03a549ea, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03d24773 contains invalid abbreviation 166 at offset 0x03d24780, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03d24ccf contains invalid abbreviation 166 at offset 0x03d24cdc, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03d60aa6 contains invalid abbreviation 166 at offset 0x03d60ab3, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03e8591e contains invalid abbreviation 229 at offset 0x03e8592b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03e85a04 contains invalid abbreviation 229 at offset 0x03e85a11, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03e9aafe contains invalid abbreviation 229 at offset 0x03e9ab0b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03ecda49 contains invalid abbreviation 166 at offset 0x03ecda56, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03fddf10 contains invalid abbreviation 229 at offset 0x03fddf1d, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x03ffe25e contains invalid abbreviation 166 at offset 0x03ffe26b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x0409f4e7 contains invalid abbreviation 166 at offset 0x0409f4f4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x040ef6ef contains invalid abbreviation 229 at offset 0x040ef6fc, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x040ef798 contains invalid abbreviation 229 at offset 0x040ef7a5, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x040f1503 contains invalid abbreviation 166 at offset 0x040f1510, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x040fb866 contains invalid abbreviation 229 at offset 0x040fb873, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x041043f9 contains invalid abbreviation 229 at offset 0x04104406, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x04105e97 contains invalid abbreviation 166 at offset 0x04105ea4, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x04108668 contains invalid abbreviation 229 at offset 0x04108675, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x04245baa contains invalid abbreviation 166 at offset 0x04245bb7, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x04336c3e contains invalid abbreviation 166 at offset 0x04336c4b, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x04342de1 contains invalid abbreviation 166 at offset 0x04342dee, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x045a0432 contains invalid abbreviation 166 at offset 0x045a043f, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x045ba921 contains invalid abbreviation 166 at offset 0x045ba92e, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x045cf537 contains invalid abbreviation 166 at offset 0x045cf544, valid abbreviations are 1-2
   ld.lld: warning: vmlinux.o: DWARF unit at offset 0x045d0df7 contains invalid abbreviation 166 at offset 0x045d0e04, valid abbreviations are 1-2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
