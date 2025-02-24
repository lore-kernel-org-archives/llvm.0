Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44B14A4E9;
	Mon, 24 Feb 2025 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740438840; cv=none; b=AJ+Nm3AvDzAJoZIQFSvQrEziK5sWMigcvy9q3Kvjz0IVxXqlovPYylU6/RDEE9i6plRe1aDFtBF8Dwif3GKlWCEi/U63LdAIzSgVlrQaOFrL2FCzSUeNGF8MpWH3JdLVHtJggKM8XhU85loNvUhCALNd0GW+bD+Hn1i/QgEv67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740438840; c=relaxed/simple;
	bh=XC1eAy9Yb2VU8zcEgquLdTFY08Z7FCSMCgGYyUQZwLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJ5Da+PuO9UJVvq9P5EupUb1Z+l3yv6SFAqfwKRZXAQJi38Ou1JAr5EfmczBzr3/MRCyOjWTf4CWODD5+EC3+VWdMGk04cbJET0UQUyHq0r3oJl2Cn/gQwxbgSmtZkgq+a7EwtqRR9De51xIwcnq+Mn3cZf3BgcjAX6qeSyh8bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnnwAHVu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnnwAHVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740438838; x=1771974838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XC1eAy9Yb2VU8zcEgquLdTFY08Z7FCSMCgGYyUQZwLM=;
  b=dnnwAHVuJNJlayPsCi0IN9SgnQEeNi5nDtksmjBK+FTj8XVAT1vGv+Qs
   HaZPD/PYLnC9C5C+bK8DGt6iZHdgdloqMWAVAdUps1gaL3XuDVXn1XOwB
   3ZhR9BIDyCyFMl36pkRXLThnBMkd7wrvtvAyH7YensjCl+lpRg5AEJDLK
   /E8U4GxA1WTv50fSkdvgoniYwGFUgv4Lgx3uihP2KA+oAIWgbWeX1Gcss
   xUw/rZ8YDGxsfP2IwBVrUwfYMyU2ucGn3EpvaMsWlKgx6Y0+5x00S3piU
   QeV9UjUJxwLvMTfGU7ldCqthHEAeCYLBX0F46D9u05mVeQQtV0pexHMfN
   w==;
X-CSE-ConnectionGUID: KljyzX7OTB6djEKkhbzTTQ==
X-CSE-MsgGUID: J9K1PEw3ShStoNZ5bSZQPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58634879"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="58634879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 15:13:57 -0800
X-CSE-ConnectionGUID: uTktRhHoT1WrKKx42YlFIg==
X-CSE-MsgGUID: 8dvt/3UEQvurmotJZ0SUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="121298494"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2025 15:13:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmhe5-0009Qx-1L;
	Mon, 24 Feb 2025 23:13:53 +0000
Date: Tue, 25 Feb 2025 07:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/6] PCI/ACPI: Implement PCI FW _DSM method
Message-ID: <202502250636.OtsWH8Fp-lkp@intel.com>
References: <20250224164849.3746751-2-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-2-anshuman.gupta@intel.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.14-rc4 next-20250224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/PCI-ACPI-Implement-PCI-FW-_DSM-method/20250225-005537
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250224164849.3746751-2-anshuman.gupta%40intel.com
patch subject: [RFC 1/6] PCI/ACPI: Implement PCI FW _DSM method
config: arm64-randconfig-003-20250225 (https://download.01.org/0day-ci/archive/20250225/202502250636.OtsWH8Fp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250636.OtsWH8Fp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250636.OtsWH8Fp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/pci-xgene.c:19:
>> include/linux/pci-acpi.h:143:5: warning: no previous prototype for function 'pci_acpi_request_d3cold_aux_power' [-Wmissing-prototypes]
   int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
       ^
   include/linux/pci-acpi.h:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
   ^
   static 
>> include/linux/pci-acpi.h:148:5: warning: no previous prototype for function 'pci_acpi_add_perst_assertion_delay' [-Wmissing-prototypes]
   int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
       ^
   include/linux/pci-acpi.h:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
   ^
   static 
   2 warnings generated.


vim +/pci_acpi_request_d3cold_aux_power +143 include/linux/pci-acpi.h

   139	
   140	#else	/* CONFIG_ACPI */
   141	static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
   142	static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
 > 143	int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
   144	{
   145		return -EOPNOTSUPP;
   146	}
   147	
 > 148	int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
   149	{
   150		return -EOPNOTSUPP;
   151	}
   152	#endif	/* CONFIG_ACPI */
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
