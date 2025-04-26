Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32646747F;
	Sat, 26 Apr 2025 23:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745710371; cv=none; b=MmvYFF+8ru+3f6gF7f1e+J0/hTag7iO2Lf93rwSZlM2IuIQhoYTQT5FDtQx5CootvPZFqS2OyF5sXDtLvvlPbrcKO5wGh1/DHO3e4LFhQx1tWTfF78l0cK8jy910NAVpLlMPfQ7GuyqApjIvkrDYMNAHErb8I2bK07J7WRCjcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745710371; c=relaxed/simple;
	bh=k8ZVkr6CliA3+udI94SAURtacqxZgPrsY3DirrGRsGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQzqh/vf1e6smj6S38camxLHmtY1aPeIGnzR2bXnNd1DBq+YhNPvWDCVAmcbnbq+NAG51yroSszpBf6HY+dTJka6VBYwM1gH1xK+btmllpvKu8ujGaKUqC5wkI30H50KtvPYmTNz5RZlp7WglWviZjBNLTvDsXzhculz17Tfn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biKnX8UT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biKnX8UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745710370; x=1777246370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k8ZVkr6CliA3+udI94SAURtacqxZgPrsY3DirrGRsGI=;
  b=biKnX8UTxO+bPfdsBCfECpZ7eCqXhacT90KA/yeHBTXijjgQK7KE0gIT
   QvvKPZJvUbJEM5hVG/a1B5bi3KajcGgEfQZRcuYQpJoyo4X3u6Rt6nK+l
   IJe8BB7W2/KGXz2HuGFJfWuszhMvjP6myN/KmN4X06Uz30sUXclN4her9
   5D4iDGZJ5RBIccjsuCEgxFg8Vlrui8G23kzQrE3pPo8MR3EQ05Xj1efn0
   UVW4MW9JC7iDUVPnIBTImG6iRLcxTZXdogLzARzc6yhYssSpqCysWUSPu
   dcqo3GPqGf3q2DIfkVLlGZYmyrK5PkrKzwX32A6epKxnP2PNoefwvc16Z
   w==;
X-CSE-ConnectionGUID: yjVUJYOPSCmkqY5kRj+d4Q==
X-CSE-MsgGUID: LhqJa1QkRhOrpDRo6UJ7eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47218202"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="47218202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 16:32:49 -0700
X-CSE-ConnectionGUID: 7b2e/8ktQriMBZ7IJxsM8w==
X-CSE-MsgGUID: +wziMIuVRjGVxw3dGq+kVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="132927021"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Apr 2025 16:32:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8p0n-00061l-0P;
	Sat, 26 Apr 2025 23:32:45 +0000
Date: Sun, 27 Apr 2025 07:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] audit accesses to unassigned PCI config regions
Message-ID: <202504270713.ZepwWC7B-lkp@intel.com>
References: <20250426212253.40473-3-chath@bu.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426212253.40473-3-chath@bu.edu>

Hi Chathura,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f1a3944c860b0615d0513110d8cf62bb94adbb41]

url:    https://github.com/intel-lab-lkp/linux/commits/Chathura-Rajapaksha/block-accesses-to-unassigned-PCI-config-regions/20250427-052942
base:   f1a3944c860b0615d0513110d8cf62bb94adbb41
patch link:    https://lore.kernel.org/r/20250426212253.40473-3-chath%40bu.edu
patch subject: [RFC PATCH 2/2] audit accesses to unassigned PCI config regions
config: arm-randconfig-003-20250427 (https://download.01.org/0day-ci/archive/20250427/202504270713.ZepwWC7B-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270713.ZepwWC7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270713.ZepwWC7B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_config.c:2011:32: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    2008 |                          "device=%04x:%02x:%02x.%d access=%s offset=0x%llx size=%ld blocked=%u\n",
         |                                                                                 ~~~
         |                                                                                 %zu
    2009 |                          pci_domain_nr(pdev->bus), pdev->bus->number,
    2010 |                          PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
    2011 |                          vfio_audit_str[op], *ppos, count, blocked);
         |                                                     ^~~~~
   1 warning generated.


vim +2011 drivers/vfio/pci/vfio_pci_config.c

  1994	
  1995	static void vfio_audit_access(const struct pci_dev *pdev,
  1996				      size_t count, loff_t *ppos, bool blocked, unsigned int op)
  1997	{
  1998		struct audit_buffer *ab;
  1999	
  2000		if (WARN_ON_ONCE(op >= VFIO_AUDIT_MAX))
  2001			return;
  2002		if (audit_enabled == AUDIT_OFF)
  2003			return;
  2004		ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_VFIO);
  2005		if (unlikely(!ab))
  2006			return;
  2007		audit_log_format(ab,
  2008				 "device=%04x:%02x:%02x.%d access=%s offset=0x%llx size=%ld blocked=%u\n",
  2009				 pci_domain_nr(pdev->bus), pdev->bus->number,
  2010				 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> 2011				 vfio_audit_str[op], *ppos, count, blocked);
  2012		audit_log_end(ab);
  2013	}
  2014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
