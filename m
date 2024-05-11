Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9CC2ED;
	Sat, 11 May 2024 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715466930; cv=none; b=uTsmD09U+CSbm42f3Xh0210qXPoPTa7UwdF1VXfwNDbN93ddBFgP/LkbSoyyEOjDIJG2d3Y8KoL2LP/8xPMgOZa+tDk//Vg2ZY9zH2cpIhfuAaOjJfVpedr567RlCWoTmYTTMwny+W3mYjAIz223fLwYVot+NHfmWv8JtDY7zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715466930; c=relaxed/simple;
	bh=wCRVHn6ZXsmU3vnhp6uqc7pSUJdMHHFz4oyw73DoXwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH5CiQNzX/jqFu6DGmkClBtWT6DDDTYI+3E4Ft4d6QlylN+c2oWwHOE8hrCaMl8IKPYxHcdWV/FdXvNTBl+tX9WotiU5iQ7qvwC1gzGqD2i2YDRcRt4J91ghSqSRc9Th40qgVuRXWoKgbP536kwwEbkP1GZEN5pzoDiSOG65Fuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf6BlYtW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf6BlYtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715466927; x=1747002927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wCRVHn6ZXsmU3vnhp6uqc7pSUJdMHHFz4oyw73DoXwE=;
  b=Nf6BlYtWtVPgKSxbmHdIZrfQ93Gnq1p8VKYAsJnxbhq92vaDBWNKdnuO
   xE3mRKcfiofXgZmLjcXoDXXpmOyoUfs3Wu1FqFKaTSz2NDpecEY9Np9P9
   q6VNsyiNVnUziik18jCEHGMPZJj8cO7eqi335DmBKYxZ30rr9stX1MGdo
   J9iVi1ldPYh0DDmYsol8rlTpOiP1pNDfM7WeyrZALuyY42Dg4ZxLu/RVA
   bMpxEZgUwErWJNK/gjBtHzGZ++/+wBZPJGsFcA2mK52vpgQ/pVhFUrWb9
   DMBRSnzKXtDttG4ZGV3NININ4qxt2YhkLXP05JNMXjyZ9oNnq35EjFaM0
   Q==;
X-CSE-ConnectionGUID: nfUTcBK3SxmgqKG87sm/2g==
X-CSE-MsgGUID: kLk37+lRQZ++n9xxa7CmyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="22012814"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="22012814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 15:35:26 -0700
X-CSE-ConnectionGUID: 7DqBfjxlSDmo07xPepjYWw==
X-CSE-MsgGUID: crcGKgTzTLaTIzT40XZW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30367049"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2024 15:35:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5vJM-0007u7-1H;
	Sat, 11 May 2024 22:35:24 +0000
Date: Sun, 12 May 2024 06:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 6/7] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <202405120622.EamQ5vz3-lkp@intel.com>
References: <20240510100730.18805-7-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510100730.18805-7-ilpo.jarvinen@linux.intel.com>

Hi Ilpo,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilpo-J-rvinen/PCI-Don-t-expose-pcie_read_tlp_log-outside-of-PCI-subsystem/20240510-181053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240510100730.18805-7-ilpo.jarvinen%40linux.intel.com
patch subject: [PATCH v4 6/7] PCI: Add TLP Prefix reading into pcie_read_tlp_log()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240512/202405120622.EamQ5vz3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120622.EamQ5vz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120622.EamQ5vz3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/tlp.c:34:12: error: no member named 'dpc_rp_log_size' in 'struct pci_dev'
      34 |         if (pdev->dpc_rp_log_size >= 5)
         |             ~~~~  ^
   drivers/pci/pcie/tlp.c:35:16: error: no member named 'dpc_rp_log_size' in 'struct pci_dev'
      35 |                 return pdev->dpc_rp_log_size - 1;
         |                        ~~~~  ^
   drivers/pci/pcie/tlp.c:37:15: error: no member named 'dpc_rp_log_size' in 'struct pci_dev'
      37 |         return pdev->dpc_rp_log_size;
         |                ~~~~  ^
   3 errors generated.


vim +34 drivers/pci/pcie/tlp.c

    24	
    25	/**
    26	 * dpc_tlp_log_len - Calculates DPC RP PIO TLP Header/Prefix Log length
    27	 * @dev: PCIe device
    28	 *
    29	 * Return: TLP Header/Prefix Log length
    30	 */
    31	unsigned int dpc_tlp_log_len(struct pci_dev *pdev)
    32	{
    33		/* Remove ImpSpec Log register from the count */
  > 34		if (pdev->dpc_rp_log_size >= 5)
    35			return pdev->dpc_rp_log_size - 1;
    36	
    37		return pdev->dpc_rp_log_size;
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
