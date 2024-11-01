Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F2829CA;
	Fri,  1 Nov 2024 05:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730438294; cv=none; b=HhPpsyhlUOEXyZ+6Q/tyzK0YAXcY07x5GErrgssvbzLz7NSsId10AbJO/tpcQMYyPZXinHNm3DxmhZGqF8qbFNcscwEQmojoH6/5kfPUl3F17j+yiMFf1a2bcZXq5MHTCfHDCPOVUhPBYVgRFK2vwLq6P3JeYMaWawPy5628M1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730438294; c=relaxed/simple;
	bh=RQA+ZNexGcrhPRn77SkPHwN8hTOt4LsQt3KUN1PJvpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3fDO3pdY867OFNeyb1WpoC5kRi8q9EWD8TWWPsFqfHqoaUpggKmJfe6y8gGJcBpKcfOyNRALTtJGdjTJxD/sB1O0hY+K8khsKSxMe/UBrhQYJak3gk14J49MAykmu7PuRnm3GFdzpaDo/TWVIlJeNYmH/lrNkFNB29WhKwfr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky5HnFz1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky5HnFz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730438291; x=1761974291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RQA+ZNexGcrhPRn77SkPHwN8hTOt4LsQt3KUN1PJvpY=;
  b=ky5HnFz1zFutCWgkdh6P+IJNY8K6q6iuL97T07dN0rTcj70+ZSIWo3DS
   0VNJmwoiYWF8VA/vRABMIy9dJy4T7OOxEzWsAarkKSBangWZNvN+qOnDJ
   uazZlu7kMzhKm0YeIjahdEE4clK6VcintzMv3U8wdhinx/KRp6kxc+dZR
   JOdeROM5pt51w64RAdjdYSXHtvPp5hIUVEyu1h9WC/R/IBGyMZOMG+ect
   6u966RB1IHc87T43PVEqiryqEl9Z0pzIql9DRxDrn6J+9snQmjVRaFn4d
   /1m8xrNedZprAUlECDCMqtPna0m5GvuwGQ3+GQ+OJEj3G+mqdlk87edQE
   g==;
X-CSE-ConnectionGUID: oTV4kmxyQPqlI/cR6qGK3g==
X-CSE-MsgGUID: s6btmnNKT+ahnQOlNtT9JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47664501"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47664501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:18:10 -0700
X-CSE-ConnectionGUID: UAuUVEa1RKar3n/jPYulbw==
X-CSE-MsgGUID: dgIMuI/gSt2t1N5VLX6eJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="87403233"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 22:18:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6k2w-000hAf-0n;
	Fri, 01 Nov 2024 05:18:06 +0000
Date: Fri, 1 Nov 2024 13:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/10] sysfs: drop callback bin_attribute::llseek
Message-ID: <202411011352.bJ3MT1ra-lkp@intel.com>
References: <20241031-sysfs-const-bin_attr-v1-7-2281afa7f055@weissschuh.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-sysfs-const-bin_attr-v1-7-2281afa7f055@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e42b1a9a2557aa94fee47f078633677198386a52]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/sysfs-explicitly-pass-size-to-sysfs_add_bin_file_mode_ns/20241031-104710
base:   e42b1a9a2557aa94fee47f078633677198386a52
patch link:    https://lore.kernel.org/r/20241031-sysfs-const-bin_attr-v1-7-2281afa7f055%40weissschuh.net
patch subject: [PATCH RFC 07/10] sysfs: drop callback bin_attribute::llseek
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241101/202411011352.bJ3MT1ra-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011352.bJ3MT1ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011352.bJ3MT1ra-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-sysfs.c:18:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-sysfs.c:1202:13: error: no member named 'llseek' in 'struct bin_attribute'
    1202 |                 res_attr->llseek = pci_llseek_resource;
         |                 ~~~~~~~~  ^
   4 warnings and 1 error generated.


vim +1202 drivers/pci/pci-sysfs.c

45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1165  
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1166  static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1167  {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1168  	/* allocate attribute structure, piggyback attribute name */
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1169  	int name_len = write_combine ? 13 : 10;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1170  	struct bin_attribute *res_attr;
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1171  	char *res_attr_name;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1172  	int retval;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1173  
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1174  	res_attr = kzalloc(sizeof(*res_attr) + name_len, GFP_ATOMIC);
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1175  	if (!res_attr)
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1176  		return -ENOMEM;
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1177  
bd5174dfb6f171 Bjorn Helgaas                 2016-03-10  1178  	res_attr_name = (char *)(res_attr + 1);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1179  
a07e4156a2ee63 Eric W. Biederman             2010-02-11  1180  	sysfs_bin_attr_init(res_attr);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1181  	if (write_combine) {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1182  		sprintf(res_attr_name, "resource%d_wc", num);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1183  		res_attr->mmap = pci_mmap_resource_wc;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1184  	} else {
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1185  		sprintf(res_attr_name, "resource%d", num);
8633328be24267 Alex Williamson               2010-07-19  1186  		if (pci_resource_flags(pdev, num) & IORESOURCE_IO) {
8633328be24267 Alex Williamson               2010-07-19  1187  			res_attr->read = pci_read_resource_io;
8633328be24267 Alex Williamson               2010-07-19  1188  			res_attr->write = pci_write_resource_io;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1189  			if (arch_can_pci_mmap_io())
e854d8b2a82ef7 David Woodhouse               2017-04-12  1190  				res_attr->mmap = pci_mmap_resource_uc;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1191  		} else {
e854d8b2a82ef7 David Woodhouse               2017-04-12  1192  			res_attr->mmap = pci_mmap_resource_uc;
e854d8b2a82ef7 David Woodhouse               2017-04-12  1193  		}
8633328be24267 Alex Williamson               2010-07-19  1194  	}
24de09c16f974d Valentine Sinitsyn            2023-09-25  1195  	if (res_attr->mmap) {
f06aff924f9758 Krzysztof Wilczyński          2021-07-29  1196  		res_attr->f_mapping = iomem_get_mapping;
24de09c16f974d Valentine Sinitsyn            2023-09-25  1197  		/*
24de09c16f974d Valentine Sinitsyn            2023-09-25  1198  		 * generic_file_llseek() consults f_mapping->host to determine
24de09c16f974d Valentine Sinitsyn            2023-09-25  1199  		 * the file size. As iomem_inode knows nothing about the
24de09c16f974d Valentine Sinitsyn            2023-09-25  1200  		 * attribute, it's not going to work, so override it as well.
24de09c16f974d Valentine Sinitsyn            2023-09-25  1201  		 */
24de09c16f974d Valentine Sinitsyn            2023-09-25 @1202  		res_attr->llseek = pci_llseek_resource;
24de09c16f974d Valentine Sinitsyn            2023-09-25  1203  	}
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1204  	res_attr->attr.name = res_attr_name;
e2154044dd4168 Kelsey Skunberg               2019-08-13  1205  	res_attr->attr.mode = 0600;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1206  	res_attr->size = pci_resource_len(pdev, num);
dca40b186b757c David Woodhouse               2017-04-12  1207  	res_attr->private = (void *)(unsigned long)num;
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1208  	retval = sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
aa382ffa705bea Sascha Hauer                  2022-11-08  1209  	if (retval) {
b562ec8f74e4ed Bjorn Helgaas                 2016-03-10  1210  		kfree(res_attr);
45aec1ae72fc59 venkatesh.pallipadi@intel.com 2008-03-18  1211  		return retval;
b19441af185559 Greg Kroah-Hartman            2006-08-28  1212  	}
b19441af185559 Greg Kroah-Hartman            2006-08-28  1213  
aa382ffa705bea Sascha Hauer                  2022-11-08  1214  	if (write_combine)
aa382ffa705bea Sascha Hauer                  2022-11-08  1215  		pdev->res_attr_wc[num] = res_attr;
aa382ffa705bea Sascha Hauer                  2022-11-08  1216  	else
aa382ffa705bea Sascha Hauer                  2022-11-08  1217  		pdev->res_attr[num] = res_attr;
aa382ffa705bea Sascha Hauer                  2022-11-08  1218  
aa382ffa705bea Sascha Hauer                  2022-11-08  1219  	return 0;
aa382ffa705bea Sascha Hauer                  2022-11-08  1220  }
aa382ffa705bea Sascha Hauer                  2022-11-08  1221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
