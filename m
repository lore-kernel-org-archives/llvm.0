Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31E1D1311;
	Wed, 21 Aug 2024 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724263984; cv=none; b=ZkkSBBTpc8bHzqDKjvPl+rV5/g5oHwhkZKIcsnrGF9CYHVsUW6oUxA4TQVMIjMLhIrdGNqztctPQmLQHcFVKEvB4TjkB6XAnPX4eEQ37JSCf4pA6p2TC+4aMrWvDI00OWL990PVbBJNXRVSWwb6l54QWZLXt9HlZ5DS0IqZ7+gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724263984; c=relaxed/simple;
	bh=B8xxfRukbg+wztqwmbrZVejtI03FZqZkvOpJg0NwZGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD3g/oOB7TC6SuVIPkcZ/BClHCD7AucRR9JIUDNwHMvbS/nO04kiA6+NMW9jMp9die4hDtsEhaEJABBgTDuJy43oebPEk6SBw4zJMMSEtFABBYksFA02q+PCffYboj2Kw1a5gxc3Sbe7siJ7KGw9uwrF6Bxpt8H305TtPOyL5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+I4lgst; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+I4lgst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724263983; x=1755799983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8xxfRukbg+wztqwmbrZVejtI03FZqZkvOpJg0NwZGw=;
  b=J+I4lgstFac8fBH1A86CijHiqiMCeE5IQt1qPnjcBliBOG3o9C1cZLAd
   zto1/Z3G55jfnIdk603cCR+tiRbkPoGAHFFy4Drpm70Z8e/q7YFLZP6QT
   XItxrsTqeR1nDvD5rCkNBnj7R80S1CS2fX1saONrHJoRbeAog32vpHRuD
   4EoNv3v7XDi30v05nO7egLWOm0jaTxTSRwpLZ2J8ZYK+4GH5OKetU1eXF
   PFD2DKXd1BgsomRKMZ5iZh0dKDZ0Ganne4Pvj9+hiJNpyRJ/VTpz/yQNv
   R3W1PzG0xQGV59+/ZrKPQtslisAGe9uGOK/Gq0ewscHCXvrIjeuTih4bO
   w==;
X-CSE-ConnectionGUID: +RZIVSjyTkuoBif6plCkQg==
X-CSE-MsgGUID: SVpFIuUmSBenqhEDYG0JRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33212283"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33212283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 11:07:54 -0700
X-CSE-ConnectionGUID: AWXWrQR6QMapzuU8F5uUzw==
X-CSE-MsgGUID: 2ofH7zXFSkmCWei/sW28Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="91900376"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2024 11:07:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgpkL-000BlE-2p;
	Wed, 21 Aug 2024 18:07:49 +0000
Date: Thu, 22 Aug 2024 02:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Haitao Huang <haitao.huang@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 05/16] x86/sgx: Implement basic EPC misc cgroup
 functionality
Message-ID: <202408220142.rdUm2Tm9-lkp@intel.com>
References: <20240821015404.6038-6-haitao.huang@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821015404.6038-6-haitao.huang@linux.intel.com>

Hi Haitao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Haitao-Huang/x86-sgx-Replace-boolean-parameters-with-enums/20240821-095959
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240821015404.6038-6-haitao.huang%40linux.intel.com
patch subject: [PATCH v16 05/16] x86/sgx: Implement basic EPC misc cgroup functionality
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220142.rdUm2Tm9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220142.rdUm2Tm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220142.rdUm2Tm9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/sgx/epc_cgroup.c:75: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Register capacity and ops for SGX cgroup.


vim +75 arch/x86/kernel/cpu/sgx/epc_cgroup.c

    73	
    74	/**
  > 75	 * Register capacity and ops for SGX cgroup.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
