Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90491917C9;
	Tue, 30 Jul 2024 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722379326; cv=none; b=ggCdURZQAfxc8tAeACKrGj74t00EwJ9PI8M9rdMbodTknIkoVLuyLwu6sRGebSL6Vkh5dw3r6zXfu+2y5XmRy3Wu/VGkR9u3U5NW4yB92caycQS+aq/OXoEibUCF/OpOXnC+yB13tm+Zi1+6ZE/99zYcG51aEFIYnDBvM3C3Rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722379326; c=relaxed/simple;
	bh=8sTIBm/WvjY4ZpypVHSc4+OuObYfnuYfN034KBcckBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bp2drXyJfSxGweDrwBWCH5YTSgVvXB7jQjsutLMMQs2l1FyWW8I7pGEfIE0QEtsDi9IKLO3hNVsiMb6GMYCudoc7EOLy5PWI7L7NaOU5928k+9FtoK/6//QJJ9GUfxFW6p6tNX4GBobo8lB6GOYnCKzaVknpI5H+P+nyFQ2HwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDMoFE5s; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDMoFE5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722379325; x=1753915325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sTIBm/WvjY4ZpypVHSc4+OuObYfnuYfN034KBcckBE=;
  b=SDMoFE5s6b/uMb4u9FVXos8KblcPm2nQIDAnZ+qiPlK0/ZppL9WjSxkS
   FfjzguTW+8nTAFRfNQO+UCuCw+03omWlimZvAz7Qb9AxSNaiaJS63xf39
   lYRCVXFDaYUsq7modN+c24tgOdr7QCKBpHXSiyKfH77oa1PYpoxWTXRCM
   G21VWSRmAJE4rKV46rdQndztEku6wsFU2KNIwyc4P+jheQT5iZHxFswKX
   FyuBwGYJp0BzAm87ZnJX/7hklhH+Ag8EaInmj8fHyO8CwrcvJo4f5u8bQ
   utvyVN/UKtoseeZoZwyo9GSdsmmcG4SElMPbqN0bX+I3Bnxnh8fKrRmdU
   Q==;
X-CSE-ConnectionGUID: xaXymIMbQLaXIU4LKvrLrg==
X-CSE-MsgGUID: H/zD7YbXSYWMHpMMNNavAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24097319"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="24097319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 15:42:04 -0700
X-CSE-ConnectionGUID: ASnX7ysAT7OMYWvnOZOx1g==
X-CSE-MsgGUID: XsZlu1tfSxOQtaAfxIs3wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58618873"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jul 2024 15:42:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYvXc-000tRm-2E;
	Tue, 30 Jul 2024 22:42:00 +0000
Date: Wed, 31 Jul 2024 06:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Witold Sadowski <wsadowski@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1008/1677] drivers/spi/spi-cadence-xspi.c:529:12:
 error: call to undeclared function 'readq'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202407310634.bYvT0Myc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd19ac2f903276b820f5d0d89de0c896c27036ed
commit: 75128e2a14a9f443e8debdd30445f5934b5a7c83 [1008/1677] spi: cadence: Add Marvell SDMA operations
config: i386-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310634.bYvT0Myc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310634.bYvT0Myc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310634.bYvT0Myc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-cadence-xspi.c:529:12: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     529 |                         u64 b = readq(addr);
         |                                 ^
   drivers/spi/spi-cadence-xspi.c:538:13: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     538 |                 tmp_buf = readq(addr);
         |                           ^
>> drivers/spi/spi-cadence-xspi.c:555:4: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     555 |                         writeq(*buffer++, addr);
         |                         ^
   drivers/spi/spi-cadence-xspi.c:563:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     563 |                 writeq(tmp_buf, addr);
         |                 ^
   4 errors generated.


vim +/readq +529 drivers/spi/spi-cadence-xspi.c

   518	
   519	static void m_ioreadq(void __iomem  *addr, void *buf, int len)
   520	{
   521		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   522			u64 full_ops = len / 8;
   523			u64 *buffer = buf;
   524	
   525			len -= full_ops * 8;
   526			buf += full_ops * 8;
   527	
   528			do {
 > 529				u64 b = readq(addr);
   530				*buffer++ = b;
   531			} while (--full_ops);
   532		}
   533	
   534	
   535		while (len) {
   536			u64 tmp_buf;
   537	
   538			tmp_buf = readq(addr);
   539			memcpy(buf, &tmp_buf, min(len, 8));
   540			len = len > 8 ? len - 8 : 0;
   541			buf += 8;
   542		}
   543	}
   544	
   545	static void m_iowriteq(void __iomem *addr, const void *buf, int len)
   546	{
   547		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   548			u64 full_ops = len / 8;
   549			const u64 *buffer = buf;
   550	
   551			len -= full_ops * 8;
   552			buf += full_ops * 8;
   553	
   554			do {
 > 555				writeq(*buffer++, addr);
   556			} while (--full_ops);
   557		}
   558	
   559		while (len) {
   560			u64 tmp_buf;
   561	
   562			memcpy(&tmp_buf, buf, min(len, 8));
   563			writeq(tmp_buf, addr);
   564			len = len > 8 ? len - 8 : 0;
   565			buf += 8;
   566		}
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
