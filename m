Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC621A45B;
	Thu, 17 Apr 2025 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878040; cv=none; b=thmXVgPcAC/kPvEuCxHv1JDAnIPWaLSPlHswxNPQKNmcIpfq1xhNB/1tfK2QOzID9HGVJfP8PZ6RTTrYjoFRlpn+ABk2/pLUJ3TxDxKwNMP5+aRiRlknl5E3ZdzU8nw6EJLPU0rXpTDSONiV0aRLc3pcjuJLooT0ZvJIjzrIVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878040; c=relaxed/simple;
	bh=GtsiT2il6+SrG/JpxUnFXBIX9IY+nr+uif6NBUTg/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMx8qj+/rBLXYwIUMz1dW0Fr/3poCAM6rwgG35zXba2YSUaKdYVMlk3D5QEynNP1mp0kVaQXhoZJvKPhzoWbHg+07rcWvmeOgkJtnraJ+YDwpKGp+o9tJOhSJjDbHVT+uXE1TmjGsEsFbTn+DPHa0Ta6IdphO34v9woHDdPDrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsSxMkW9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsSxMkW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744878039; x=1776414039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtsiT2il6+SrG/JpxUnFXBIX9IY+nr+uif6NBUTg/2g=;
  b=MsSxMkW9MmdmNt2ZjzL9r9ns37ReKc+942NIgPObYuovmAlVdpG+b5mx
   3FrNIhq+uORRH3Zan5gLV0vg4xQ51SXNcQkD446DUVl2m9Ivvu+iBSXBo
   i4tNBbMrW0mB/1k9VtG059dejr+YIUPGlO7mNXZsPB04UKd0ktItcE+NW
   GkBMX2Z23itDGwx6EM2qwD+3JqnufzvCGI11lFy4nIyQsRkRL9q89xmr7
   bZWe2xXS81nSW+wLxCw7IHh73R3AqYrXqBszv8SHF07R5ucTSAzAu9vzJ
   wl1OLR48hns5F4G/ISeeBPJtqxY2WNK9d0DiGBu7NFQPe56lcPwQYpMeK
   w==;
X-CSE-ConnectionGUID: epJsZHevTXmM+Pt4KDGfzQ==
X-CSE-MsgGUID: 5BPnIGFvSg2PARqZT+XDog==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57838259"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57838259"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:20:37 -0700
X-CSE-ConnectionGUID: igIiCnBCSJSCg1Nq3xoiDw==
X-CSE-MsgGUID: J0d+hYiOR+ys1+3GJa7D0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130723904"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 01:20:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5KU4-000LyE-1k;
	Thu, 17 Apr 2025 08:20:32 +0000
Date: Thu, 17 Apr 2025 16:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 30/45] drivers/gpio/gpio-f7188x.c:135:2: error:
 call to '_outb' declared with 'error' attribute: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202504171627.NmrEcuUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   a5d8e0cc96eed600a347bbdcd125a9274a92e187
commit: f031312c8e1903859a3a2a58ab5a3f97ba8b0ae9 [30/45] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250417/202504171627.NmrEcuUL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171627.NmrEcuUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171627.NmrEcuUL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-f7188x.c:135:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:136:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:149:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:112:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     112 |         outb(reg++, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/gpio/gpio-f7188x.c:113:8: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     113 |         val = inb(base + 1) << 8;
         |               ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-f7188x.c:114:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     114 |         outb(reg, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:115:9: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     115 |         val |= inb(base + 1);
         |                ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-f7188x.c:104:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     104 |         outb(reg, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:105:9: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     105 |         return inb(base + 1);
         |                ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
>> drivers/gpio/gpio-f7188x.c:135:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:136:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:143:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     143 |         outb(SIO_LDSEL, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:144:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     144 |         outb(ld, base + 1);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:104:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     104 |         outb(reg, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:105:9: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     105 |         return inb(base + 1);
         |                ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-f7188x.c:149:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/gpio/gpio-f7188x.c:135:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:136:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-f7188x.c:143:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     143 |         outb(SIO_LDSEL, base);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/gpio/gpio-it87.c:85:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      85 |         outb(0x87, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:86:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      86 |         outb(0x01, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:87:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      87 |         outb(0x55, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:88:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      88 |         outb(0x55, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:121:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     121 |         outb(reg++, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/gpio/gpio-it87.c:122:8: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     122 |         val = inb(VAL) << 8;
         |               ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-it87.c:123:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     123 |         outb(reg, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:124:9: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     124 |         val |= inb(VAL);
         |                ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-it87.c:107:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     107 |         outb(reg, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:108:9: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     108 |         return inb(VAL);
         |                ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/gpio/gpio-it87.c:94:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      94 |         outb(0x02, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:95:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      95 |         outb(0x02, VAL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/gpio/gpio-it87.c:85:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      85 |         outb(0x87, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:86:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      86 |         outb(0x01, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:87:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      87 |         outb(0x55, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:88:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      88 |         outb(0x55, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:101:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     101 |         outb(LDNREG, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:102:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     102 |         outb(ldn, VAL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/gpio/gpio-it87.c:121:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     121 |         outb(reg++, REG);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +135 drivers/gpio/gpio-f7188x.c

6c17aa0138a6c5 Simon Guinot   2013-08-29  107  
6c17aa0138a6c5 Simon Guinot   2013-08-29  108  static int superio_inw(int base, int reg)
6c17aa0138a6c5 Simon Guinot   2013-08-29  109  {
6c17aa0138a6c5 Simon Guinot   2013-08-29  110  	int val;
6c17aa0138a6c5 Simon Guinot   2013-08-29  111  
6c17aa0138a6c5 Simon Guinot   2013-08-29 @112  	outb(reg++, base);
6c17aa0138a6c5 Simon Guinot   2013-08-29 @113  	val = inb(base + 1) << 8;
6c17aa0138a6c5 Simon Guinot   2013-08-29  114  	outb(reg, base);
6c17aa0138a6c5 Simon Guinot   2013-08-29  115  	val |= inb(base + 1);
6c17aa0138a6c5 Simon Guinot   2013-08-29  116  
6c17aa0138a6c5 Simon Guinot   2013-08-29  117  	return val;
6c17aa0138a6c5 Simon Guinot   2013-08-29  118  }
6c17aa0138a6c5 Simon Guinot   2013-08-29  119  
6c17aa0138a6c5 Simon Guinot   2013-08-29  120  static inline void superio_outb(int base, int reg, int val)
6c17aa0138a6c5 Simon Guinot   2013-08-29  121  {
6c17aa0138a6c5 Simon Guinot   2013-08-29  122  	outb(reg, base);
6c17aa0138a6c5 Simon Guinot   2013-08-29  123  	outb(val, base + 1);
6c17aa0138a6c5 Simon Guinot   2013-08-29  124  }
6c17aa0138a6c5 Simon Guinot   2013-08-29  125  
6c17aa0138a6c5 Simon Guinot   2013-08-29  126  static inline int superio_enter(int base)
6c17aa0138a6c5 Simon Guinot   2013-08-29  127  {
6c17aa0138a6c5 Simon Guinot   2013-08-29  128  	/* Don't step on other drivers' I/O space by accident. */
6c17aa0138a6c5 Simon Guinot   2013-08-29  129  	if (!request_muxed_region(base, 2, DRVNAME)) {
821d9e1db208c3 Henning Schild 2022-08-25  130  		pr_err("I/O address 0x%04x already in use\n", base);
6c17aa0138a6c5 Simon Guinot   2013-08-29  131  		return -EBUSY;
6c17aa0138a6c5 Simon Guinot   2013-08-29  132  	}
6c17aa0138a6c5 Simon Guinot   2013-08-29  133  
6c17aa0138a6c5 Simon Guinot   2013-08-29  134  	/* According to the datasheet the key must be send twice. */
6c17aa0138a6c5 Simon Guinot   2013-08-29 @135  	outb(SIO_UNLOCK_KEY, base);
6c17aa0138a6c5 Simon Guinot   2013-08-29  136  	outb(SIO_UNLOCK_KEY, base);
6c17aa0138a6c5 Simon Guinot   2013-08-29  137  
6c17aa0138a6c5 Simon Guinot   2013-08-29  138  	return 0;
6c17aa0138a6c5 Simon Guinot   2013-08-29  139  }
6c17aa0138a6c5 Simon Guinot   2013-08-29  140  

:::::: The code at line 135 was first introduced by commit
:::::: 6c17aa0138a6c55364936bbaa35846e09a4db53b gpio: add GPIO support for F71882FG and F71889F

:::::: TO: Simon Guinot <simon.guinot@sequanux.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
