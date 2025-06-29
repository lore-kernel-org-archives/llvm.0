Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1C230BC3;
	Sun, 29 Jun 2025 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228287; cv=none; b=tdtaMOQP7d59eKYPNk1E5we851Qcn93Vge3aE02qUywCpmsa6GwYR/XHtXiDcv2KOQ9jnVwtkePtpdgMq91NsEnwS6Yl7Js6wBfDhXl0tgCg861WN9Xx3Yj1cHYCk4bDg3Kci1f5vYRFXS0sgV+w5kNAq7PXytmo4hrHOCOZolo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228287; c=relaxed/simple;
	bh=1hXziDdIzCvlcB9eQ54GngcIOlGnGCTO6xMBy6DerHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAV9+UPAjataVVzNr8GSrSQpWwIrFMw10OdF1mLxJ+IVO9enAQrTnliNKxvSwZdSIRGTaKZshSmBsYDQZuqcu4zqGQ8K01jC9cyBY9h2dlk4AXKGwurWSpkSSN2BgM3PiJoSwi9h8GI2bglzsj31xAzBUqkh7LRKHFMQa/BdT9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbNIgCH8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbNIgCH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751228285; x=1782764285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1hXziDdIzCvlcB9eQ54GngcIOlGnGCTO6xMBy6DerHY=;
  b=YbNIgCH8oiwlKy1kX7Pep6j9iqnHDbnew5dR3a3k6RZ3qMwElAvDkEGx
   Hqxe9aIszJjfZGWYanDpHLYWFONFOgDRots5LEs4Kqb6YBqd+vAxMxafd
   F3LCoPFPXF8VR3sLKG/up7aWM2tvGfau2HTQ8SaFDqGfi3hLwC3dNnnil
   v+yIirrtAjuEZ5dYpjPa/oAM/ReEfyOZMzOwDHTDfxoLpYnWcgqMKvf5/
   gTUsvBsaJrqFFYijrhtu6RT8m7elV5CXctFKLoFY9yE5Uvu+ox00UKjWe
   Xzssqk5vLCDaPuWOMY7mRjyl0Rfl4L27cv/qfXwvF8CqbHd+9H0TZdEoA
   Q==;
X-CSE-ConnectionGUID: gyl2EJjVQgKKGgsGJHrJNg==
X-CSE-MsgGUID: SoEcf7aLS+GgCnHz5g+Wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57234482"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57234482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 13:18:04 -0700
X-CSE-ConnectionGUID: 0FRntr6oSX+nADStz4e/bQ==
X-CSE-MsgGUID: EQlTIefeQxiqwj58OfgHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="157815057"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 29 Jun 2025 13:18:01 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVyTN-0000xz-33;
	Sun, 29 Jun 2025 20:17:57 +0000
Date: Sun, 29 Jun 2025 22:17:27 +0200
From: kernel test robot <lkp@intel.com>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [linux-next:master 2967/5998] drivers/acpi/apei/einj-core.c:340:6:
 warning: variable 'p' is used uninitialized whenever 'if' condition is true
Message-ID: <202506292207.bKkEQbj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 1a35c88302a3b2827ec47f0b2d0530b543938fb3 [2967/5998] ACPI: APEI: EINJ: Fix kernel test sparse warnings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506292207.bKkEQbj9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292207.bKkEQbj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292207.bKkEQbj9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/apei/einj-core.c:340:6: warning: variable 'p' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     340 |         if (!r) {
         |             ^~
   drivers/acpi/apei/einj-core.c:438:6: note: uninitialized use occurs here
     438 |         if (p)
         |             ^
   drivers/acpi/apei/einj-core.c:340:2: note: remove the 'if' if its condition is always false
     340 |         if (!r) {
         |         ^~~~~~~~~
     341 |                 pr_err("Can not request [mem %#010llx-%#010llx] for Trigger table\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     342 |                        (unsigned long long)trigger_paddr,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     343 |                        (unsigned long long)trigger_paddr +
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     344 |                             sizeof(trigger_tab) - 1);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~
     345 |                 goto out;
         |                 ~~~~~~~~~
     346 |         }
         |         ~
   drivers/acpi/apei/einj-core.c:336:37: note: initialize the variable 'p' to silence this warning
     336 |         struct acpi_einj_trigger __iomem *p;
         |                                            ^
         |                                             = NULL
   1 warning generated.
   drivers/acpi/apei/einj-core.o: warning: objtool: __einj_error_trigger() falls through to next function einj_get_trigger_parameter_region()


vim +340 drivers/acpi/apei/einj-core.c

e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  303  
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  304  static struct acpi_generic_address *einj_get_trigger_parameter_region(
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  305  	struct acpi_einj_trigger *trigger_tab, u64 param1, u64 param2)
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  306  {
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  307  	int i;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  308  	struct acpi_whea_header *entry;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  309  
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  310  	entry = (struct acpi_whea_header *)
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  311  		((char *)trigger_tab + sizeof(struct acpi_einj_trigger));
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  312  	for (i = 0; i < trigger_tab->entry_count; i++) {
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  313  		if (entry->action == ACPI_EINJ_TRIGGER_ERROR &&
1d5d820b8fe83b drivers/acpi/apei/einj.c      Yazen Ghannam    2017-08-28  314  		entry->instruction <= ACPI_EINJ_WRITE_REGISTER_VALUE &&
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  315  		entry->register_region.space_id ==
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  316  			ACPI_ADR_SPACE_SYSTEM_MEMORY &&
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  317  		(entry->register_region.address & param2) == (param1 & param2))
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  318  			return &entry->register_region;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  319  		entry++;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  320  	}
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  321  
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  322  	return NULL;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  323  }
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  324  /* Execute instructions in trigger error action table */
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  325  static int __einj_error_trigger(u64 trigger_paddr, u32 type,
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  326  				u64 param1, u64 param2)
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  327  {
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  328  	struct acpi_einj_trigger trigger_tab;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  329  	struct apei_exec_context trigger_ctx;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  330  	struct apei_resources trigger_resources;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  331  	struct acpi_whea_header *trigger_entry;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  332  	struct resource *r;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  333  	u32 table_size;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  334  	int rc = -EIO;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  335  	struct acpi_generic_address *trigger_param_region = NULL;
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  336  	struct acpi_einj_trigger __iomem *p;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  337  
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  338  	r = request_mem_region(trigger_paddr, sizeof(trigger_tab),
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  339  			       "APEI EINJ Trigger Table");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18 @340  	if (!r) {
b2f740baa42152 drivers/acpi/apei/einj.c      Borislav Petkov  2016-05-23  341  		pr_err("Can not request [mem %#010llx-%#010llx] for Trigger table\n",
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  342  		       (unsigned long long)trigger_paddr,
46b91e379f7180 drivers/acpi/apei/einj.c      Bjorn Helgaas    2011-12-08  343  		       (unsigned long long)trigger_paddr +
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  344  			    sizeof(trigger_tab) - 1);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  345  		goto out;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  346  	}
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  347  	p = ioremap_cache(trigger_paddr, sizeof(*p));
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  348  	if (!p) {
b2f740baa42152 drivers/acpi/apei/einj.c      Borislav Petkov  2016-05-23  349  		pr_err("Failed to map trigger table!\n");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  350  		goto out_rel_header;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  351  	}
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  352  	memcpy_fromio(&trigger_tab, p, sizeof(trigger_tab));
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  353  	rc = einj_check_trigger_header(&trigger_tab);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  354  	if (rc) {
933ca4e323de77 drivers/acpi/apei/einj.c      Kefeng Wang      2019-10-18  355  		pr_warn(FW_BUG "Invalid trigger error action table.\n");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  356  		goto out_rel_header;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  357  	}
4c40aed869a200 drivers/acpi/apei/einj.c      Niklas Söderlund 2012-01-09  358  
4c40aed869a200 drivers/acpi/apei/einj.c      Niklas Söderlund 2012-01-09  359  	/* No action structures in the TRIGGER_ERROR table, nothing to do */
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  360  	if (!trigger_tab.entry_count)
4c40aed869a200 drivers/acpi/apei/einj.c      Niklas Söderlund 2012-01-09  361  		goto out_rel_header;
4c40aed869a200 drivers/acpi/apei/einj.c      Niklas Söderlund 2012-01-09  362  
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  363  	rc = -EIO;
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  364  	table_size = trigger_tab.table_size;
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  365  	r = request_mem_region(trigger_paddr + sizeof(trigger_tab),
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  366  			       table_size - sizeof(trigger_tab),
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  367  			       "APEI EINJ Trigger Table");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  368  	if (!r) {
b2f740baa42152 drivers/acpi/apei/einj.c      Borislav Petkov  2016-05-23  369  		pr_err("Can not request [mem %#010llx-%#010llx] for Trigger Table Entry\n",
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  370  		       (unsigned long long)trigger_paddr + sizeof(trigger_tab),
46b91e379f7180 drivers/acpi/apei/einj.c      Bjorn Helgaas    2011-12-08  371  		       (unsigned long long)trigger_paddr + table_size - 1);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  372  		goto out_rel_header;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  373  	}
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  374  	iounmap(p);
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  375  	p = ioremap_cache(trigger_paddr, table_size);
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  376  	if (!p) {
b2f740baa42152 drivers/acpi/apei/einj.c      Borislav Petkov  2016-05-23  377  		pr_err("Failed to map trigger table!\n");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  378  		goto out_rel_entry;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  379  	}
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  380  	memcpy_fromio(&trigger_tab, p, sizeof(trigger_tab));
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  381  	trigger_entry = (struct acpi_whea_header *)
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  382  		((char *)&trigger_tab + sizeof(struct acpi_einj_trigger));
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  383  	apei_resources_init(&trigger_resources);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  384  	apei_exec_ctx_init(&trigger_ctx, einj_ins_type,
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  385  			   ARRAY_SIZE(einj_ins_type),
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  386  			   trigger_entry, trigger_tab.entry_count);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  387  	rc = apei_exec_collect_resources(&trigger_ctx, &trigger_resources);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  388  	if (rc)
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  389  		goto out_fini;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  390  	rc = apei_resources_sub(&trigger_resources, &einj_resources);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  391  	if (rc)
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  392  		goto out_fini;
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  393  	/*
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  394  	 * Some firmware will access target address specified in
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  395  	 * param1 to trigger the error when injecting memory error.
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  396  	 * This will cause resource conflict with regular memory.  So
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  397  	 * remove it from trigger table resources.
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  398  	 */
c5a130325f13b2 drivers/acpi/apei/einj.c      Chen Gong        2013-06-06  399  	if ((param_extension || acpi5) && (type & MEM_ERROR_MASK) && param2) {
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  400  		struct apei_resources addr_resources;
37ea9693869627 drivers/acpi/apei/einj.c      Jay Lu           2022-12-06  401  
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  402  		apei_resources_init(&addr_resources);
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  403  		trigger_param_region = einj_get_trigger_parameter_region(
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  404  			&trigger_tab, param1, param2);
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  405  		if (trigger_param_region) {
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  406  			rc = apei_resources_add(&addr_resources,
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  407  				trigger_param_region->address,
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  408  				trigger_param_region->bit_width/8, true);
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  409  			if (rc)
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  410  				goto out_fini;
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  411  			rc = apei_resources_sub(&trigger_resources,
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  412  					&addr_resources);
b4e008dc53a31c drivers/acpi/apei/einj.c      Xiao, Hui        2011-12-08  413  		}
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  414  		apei_resources_fini(&addr_resources);
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  415  		if (rc)
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  416  			goto out_fini;
fdea163d8c17ba drivers/acpi/apei/einj.c      Ying Huang       2011-12-08  417  	}
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  418  	rc = apei_resources_request(&trigger_resources, "APEI EINJ Trigger");
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  419  	if (rc)
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  420  		goto out_fini;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  421  	rc = apei_exec_pre_map_gars(&trigger_ctx);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  422  	if (rc)
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  423  		goto out_release;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  424  
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  425  	rc = apei_exec_run(&trigger_ctx, ACPI_EINJ_TRIGGER_ERROR);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  426  
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  427  	apei_exec_post_unmap_gars(&trigger_ctx);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  428  out_release:
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  429  	apei_resources_release(&trigger_resources);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  430  out_fini:
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  431  	apei_resources_fini(&trigger_resources);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  432  out_rel_entry:
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  433  	release_mem_region(trigger_paddr + sizeof(trigger_tab),
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  434  			   table_size - sizeof(trigger_tab));
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  435  out_rel_header:
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  436  	release_mem_region(trigger_paddr, sizeof(trigger_tab));
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  437  out:
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  438  	if (p)
1a35c88302a3b2 drivers/acpi/apei/einj-core.c Zaid Alali       2025-06-17  439  		iounmap(p);
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  440  
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  441  	return rc;
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  442  }
e40213450b5315 drivers/acpi/apei/einj.c      Ying Huang       2010-05-18  443  

:::::: The code at line 340 was first introduced by commit
:::::: e40213450b53157967a1f83eda50e9a941c13a08 ACPI, APEI, EINJ support

:::::: TO: Huang Ying <ying.huang@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
