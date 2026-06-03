Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871934A76A;
	Wed,  3 Jun 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780514211; cv=none; b=Hcv3JImcaCidPT4DEpjjPw8cvA5TSD4qYXdDPcuxygWWTyqwMPEX29/B1ryWH9XwEY63LVgaP2KXkdfnQIt9r80F47XOFtw4itqnpW0Ylm/Sq+aSRFmak/WaarXsyExQWPNBvp/3HNOjtXRFs1nmd0frySHNV81wvkN57Rq9lEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780514211; c=relaxed/simple;
	bh=KhEsWPNQ6bD5/d7Tz1Dc8Szc7hsbmUVroXqhB8qW6RI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uf8HdrkgZCMYs4Pfcy/vjWuNLPGBCN7BqWaifDTWQmWR5h8rX92MZGVFx+LRxPzmPTbl0j0MbHAqrOtXLWPKkKXNTwNK4i3eaUcWwx8F4DhajweEeLR9ZqhNx74P0htmGSqM47M9WojC4OhOIJKdXd645sjDnTLNV7eZeoKJg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H92VVAyk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H92VVAyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780514209; x=1812050209;
  h=date:from:to:cc:subject:message-id;
  bh=KhEsWPNQ6bD5/d7Tz1Dc8Szc7hsbmUVroXqhB8qW6RI=;
  b=H92VVAykvh+7cUGSc3aQi0Qs0PTppRxRViU9G3G7CK12Cz7VWGojjRKa
   d3GPYDSsfph27S4/pyAXZtDQu6r9ofG6/CDlxbovKLalyf0d9VkG9P/Ho
   EpWsLsnB2sSvQiyBVcGcg/5zD+B3K0VPNL2S4PooHzagqBlVg6tITEOZT
   +fW1dWyaZqES/fkC1R8arH0FgnxZG5/IeJNaHmbAtkvMXaT5AknV+/Su7
   Z8qMwc8K/MUhltIVRVvMl6VVEjAKeuvB9E5of1YZ/1jjRD9PSbDW3TGst
   k04F3agP98F+CvoH7gclNnLASmwDAstxo9LtKv7q1S6HnXBF5r5YOQSg/
   w==;
X-CSE-ConnectionGUID: AQBa/EmTTBSdeahl49dinQ==
X-CSE-MsgGUID: 3nKqP7TDSSyjyQHreiKGHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85189788"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="85189788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 12:16:49 -0700
X-CSE-ConnectionGUID: Gu0moSAtQu2wkIvCjW0jow==
X-CSE-MsgGUID: oPVw22fNSz+IDuj6CC5HDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="237992407"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 12:16:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUr53-0000000028X-1Bre;
	Wed, 03 Jun 2026 19:16:45 +0000
Date: Wed, 03 Jun 2026 21:16:42 +0200
From: kernel test robot <lkp@intel.com>
To: Michal Camacho Romero <michal.camacho.romero@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/iommu/intel/dmar.c:681:11: warning: variable
 'txt_heap' is uninitialized when used here
Message-ID: <202606032136.5vhG7xrS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michal-Camacho-Romero/x86-tboot-Add-support-for-parsing-DTPR-table-and-disabling-TPRs/20260603-194638
head:   7185450ff8f30f609336848d64612c34f44c9b04
commit: 7185450ff8f30f609336848d64612c34f44c9b04 iommu/vt-d: Disable PMRs and skip force-IOMMU when TXT TPRs are active
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260603/202606032136.5vhG7xrS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606032136.5vhG7xrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032136.5vhG7xrS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/dmar.c:681:11: warning: variable 'txt_heap' is uninitialized when used here [-Wuninitialized]
     681 |                 iounmap(txt_heap);
         |                         ^~~~~~~~
   drivers/iommu/intel/dmar.c:639:34: note: initialize the variable 'txt_heap' to silence this warning
     639 |         void                   *txt_heap;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +/txt_heap +681 drivers/iommu/intel/dmar.c

   630	
   631	/**
   632	 * parse_dmar_table - parses the DMA reporting table
   633	 */
   634	static int __init
   635	parse_dmar_table(void)
   636	{
   637		struct acpi_table_dmar *dmar;
   638		struct acpi_table_dtpr *dtpr;
   639		void                   *txt_heap;
   640		int drhd_count = 0;
   641		int ret;
   642		struct dmar_res_callback cb = {
   643			.print_entry = true,
   644			.ignore_unhandled = true,
   645			.arg[ACPI_DMAR_TYPE_HARDWARE_UNIT] = &drhd_count,
   646			.cb[ACPI_DMAR_TYPE_HARDWARE_UNIT] = &dmar_parse_one_drhd,
   647			.cb[ACPI_DMAR_TYPE_RESERVED_MEMORY] = &dmar_parse_one_rmrr,
   648			.cb[ACPI_DMAR_TYPE_ROOT_ATS] = &dmar_parse_one_atsr,
   649			.cb[ACPI_DMAR_TYPE_HARDWARE_AFFINITY] = &dmar_parse_one_rhsa,
   650			.cb[ACPI_DMAR_TYPE_NAMESPACE] = &dmar_parse_one_andd,
   651			.cb[ACPI_DMAR_TYPE_SATC] = &dmar_parse_one_satc,
   652		};
   653	
   654		/*
   655		 * Do it again, earlier dmar_tbl mapping could be mapped with
   656		 * fixed map.
   657		 */
   658		dmar_table_detect();
   659	
   660		/*
   661		 * ACPI tables may not be DMA protected by tboot, so use DMAR copy
   662		 * SINIT saved in SinitMleData in TXT heap (which is DMA protected)
   663		 */
   664		dmar_tbl = tboot_get_dmar_table(dmar_tbl);
   665	
   666		dmar = (struct acpi_table_dmar *)dmar_tbl;
   667		if (!dmar)
   668			return -ENODEV;
   669	
   670		if (dmar->width < PAGE_SHIFT - 1) {
   671			pr_warn("Invalid DMAR haw\n");
   672			return -EINVAL;
   673		}
   674	
   675		dtpr = tboot_get_dtpr_table(&txt_heap);
   676		if (dtpr) {
   677			/* TPR is enabled
   678			 * This will also tell not to establish IOMMU PMRs
   679			 */
   680			tboot_parse_dtpr_table(dtpr);
 > 681			iounmap(txt_heap);
   682		}
   683	
   684		txt_heap = NULL;
   685		pr_info("Host address width %d\n", dmar->width + 1);
   686		ret = dmar_walk_dmar_table(dmar, &cb);
   687		if (ret == 0 && drhd_count == 0)
   688			pr_warn(FW_BUG "No DRHD structure found in DMAR table\n");
   689	
   690		return ret;
   691	}
   692	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
