Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836977581B;
	Wed, 10 Jul 2024 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594761; cv=none; b=tLmuwiXYtRqi6WWGdPg+ydktfhH9gc+BSnSx3bb363u/DbOrpiGFccdDIo6XJgpGTTsj1MvgS4+/8h1lhP45SvEexhguDWHqK6ALiZqa0btkEQVByRzESj53Iq6WNQQYhtGh2H7we474S5OnbuuJGeX7HzZdX0FMQgR3OYXD69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594761; c=relaxed/simple;
	bh=MAF7KC3+Rl3ITzP08+iqG9iChbXInxU/1Fto7iRcafs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oa4dCUfddNGksaNeuzYop2u8XCIw+whiQo4r/NW79/QWem8F6BUlWtll5DkLzHsIVcqHlfzL564HCxY8gjeaY8pWct8cbOKP2vG4+Qg0294zRNc81+gyHw9IZQvF0F9apgwfpTRsiyzT+h+zNS6jRzFuVPXvvRMe4Kpgu2lkcVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5ylyV9u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5ylyV9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720594760; x=1752130760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAF7KC3+Rl3ITzP08+iqG9iChbXInxU/1Fto7iRcafs=;
  b=R5ylyV9uce2rKqt2HUHRjNfHT3eT73ez1dwrO+o3tHSYTisu8CVDHl2U
   /6JASv6Hbn2PeHy6qYnttT5c6VtU0MqR8iJ5rZy0jyp8usgSRJul6KsvU
   gDWG+t7g6sQBDV6t4xzkOir+uDu2hS3gVaVRCYGnZgQeUyj+Y8rHSJDD3
   SufKlAILIrxM3WvnwlJYwZca3zoh4JS7jDCj6Foy5/CXGDAK7th2t+9XU
   t2V70Rx6ZIC9arYu4CLb5P8grK4mSb7HJL2uDqSb15I73SFn2j2F7SHaQ
   D/ItDH7qFqsIIlt2f1hkUETP6U17NzsaWyaYwYyE/xuEDpQyh+V9jJhs3
   w==;
X-CSE-ConnectionGUID: RiA4IlnQQfKfBRL45DuaOA==
X-CSE-MsgGUID: EDpvJ7xNQNaJpgRc2yMbsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17728972"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="17728972"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 23:59:19 -0700
X-CSE-ConnectionGUID: 4ZX9tpkSSG6xnSn5SfAjWg==
X-CSE-MsgGUID: Mh+SlZjSSWeiPSbixABVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="71339763"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2024 23:59:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRRIJ-000XZW-0k;
	Wed, 10 Jul 2024 06:59:15 +0000
Date: Wed, 10 Jul 2024 14:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Witold Sadowski <wsadowski@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20240709_wsadowski_marvell_hw_overlay_support_for_cadence_xspi
 26/31] drivers/spi/spi-cadence-xspi.c:524:3: error: call to undeclared
 function 'ioread64_rep'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202407101433.lFhFlVSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v10_20240709_wsadowski_marvell_hw_overlay_support_for_cadence_xspi
head:   47ff0a76b311d8af971463bce5674fd63cb0326c
commit: 29fd3b19e696106581e25df32c7a8040561f60ea [26/31] spi: cadence: Add Marvell SDMA operations
config: x86_64-buildonly-randconfig-003-20240710 (https://download.01.org/0day-ci/archive/20240710/202407101433.lFhFlVSJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101433.lFhFlVSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407101433.lFhFlVSJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-cadence-xspi.c:524:3: error: call to undeclared function 'ioread64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     524 |                 ioread64_rep(addr, buf, full_ops);
         |                 ^
>> drivers/spi/spi-cadence-xspi.c:544:3: error: call to undeclared function 'iowrite64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     544 |                 iowrite64_rep(addr, buf, full_ops);
         |                 ^
   2 errors generated.


vim +/ioread64_rep +524 drivers/spi/spi-cadence-xspi.c

   518	
   519	static void m_ioreadq(void __iomem  *addr, void *buf, int len)
   520	{
   521		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   522			u64 full_ops = len / 8;
   523	
 > 524			ioread64_rep(addr, buf, full_ops);
   525			len -= full_ops * 8;
   526			buf += full_ops * 8;
   527		}
   528	
   529		while (len) {
   530			u64 tmp_buf;
   531	
   532			tmp_buf = readq(addr);
   533			memcpy(buf, &tmp_buf, min(len, 8));
   534			len = len > 8 ? len - 8 : 0;
   535			buf += 8;
   536		}
   537	}
   538	
   539	static void m_iowriteq(void __iomem *addr, const void *buf, int len)
   540	{
   541		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   542			u64 full_ops = len / 8;
   543	
 > 544			iowrite64_rep(addr, buf, full_ops);
   545			len -= full_ops * 8;
   546			buf += full_ops * 8;
   547		}
   548	
   549		while (len) {
   550			u64 tmp_buf;
   551	
   552			memcpy(&tmp_buf, buf, min(len, 8));
   553			writeq(tmp_buf, addr);
   554			len = len > 8 ? len - 8 : 0;
   555			buf += 8;
   556		}
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
