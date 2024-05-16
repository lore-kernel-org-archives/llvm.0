Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8F14F7A;
	Thu, 16 May 2024 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715837075; cv=none; b=HlZ1oIehgNcudCjQDkgVHQtyQTb9pfD0JEBmHe/w7NNp4hyTGjV9qrEs4or6EqKTNkjRHpR83+UnU3ZtRrqSEg7u6MADe+ZMv6qFP5Q7xj62MwEov6KigTsb9lZ5pZOm2cnjXLxZHDUIhEAI5vD2oBJc49OVOynzDdKYAAzxWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715837075; c=relaxed/simple;
	bh=G+xkN9euyYtKM05fueA0uuNE35ZVR/AXFeluVww8d40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8J/08IYxZsR1FzAEnygQP2MpilUs8fcsT9ACLr5M3MuUymHntSR6hcTMlqnnELliNF6u0G0uDJsj4jCLtHPMZOwf1ViqEnm0kphNYp3MQtjNU1R5vPYmnAtfY7hS+AE1AOqOVhLVvpVu46ixSy0lpxvLJnAQy3SS2L3kAbSv4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDlA+8B7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDlA+8B7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715837074; x=1747373074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+xkN9euyYtKM05fueA0uuNE35ZVR/AXFeluVww8d40=;
  b=lDlA+8B7Y59ufb/sXbKyIILrrjq51jOJ/MFsJjLvdGYxd0RQbt76D0cv
   JHztWfrSda+wGGdony/VsfBN0uzHS9yVPcrJzzWrvPwtxGSo6n9FddWf1
   SjO5y7sfhWZMpNvIP2gMYiJ6FsneAGJeYCgqH/LPvgphDmb1OF5dzQugx
   joqo47k3kTjsl9XqZOlfPXZ/zxi+HzgPO/ytk+irW2ijziZ6hjRkO/i5y
   SbO598F6yXs/OxCuq+kBrT8lnIFXW1SxorKePUXUpY8tUBgqlCekrrL88
   Ue+igJijhzGCqpEmPoYkWnlBE/L6ZmZMyXtNicOxPAVzDR2BMPYd8s56r
   g==;
X-CSE-ConnectionGUID: xRKZSbmIQbKRpsntq0Zpcw==
X-CSE-MsgGUID: PFim3gXuTROSXA7KYxtMPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12134017"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="12134017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 22:24:33 -0700
X-CSE-ConnectionGUID: 6WpYTi1+Re2EIqL/XRikBg==
X-CSE-MsgGUID: Ci3HgcsaSZmnODW9sIDH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31720131"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2024 22:24:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7TbR-000Dfj-0w;
	Thu, 16 May 2024 05:24:29 +0000
Date: Thu, 16 May 2024 13:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
Message-ID: <202405161355.B776iHbb-lkp@intel.com>
References: <20240515150213.32491-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515150213.32491-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.9 next-20240515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/crypto-rsa-pkcs1pad-export-rsa1_asn_lookup/20240515-230406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240515150213.32491-1-jarkko%40kernel.org
patch subject: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
config: i386-buildonly-randconfig-002-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161355.B776iHbb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161355.B776iHbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161355.B776iHbb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/rsa-pkcs1pad.c:108: warning: Function parameter or struct member 'name' not described in 'rsa_lookup_asn1'


vim +108 crypto/rsa-pkcs1pad.c

a49de377e051ea Tadeusz Struk   2016-03-03  100  
446115366ec712 Jarkko Sakkinen 2024-05-15  101  /**
446115366ec712 Jarkko Sakkinen 2024-05-15  102   * rsa_lookup_asn1() - Lookup the ASN.1 digest info given the hash
446115366ec712 Jarkko Sakkinen 2024-05-15  103   * name:	hash algorithm name
446115366ec712 Jarkko Sakkinen 2024-05-15  104   *
446115366ec712 Jarkko Sakkinen 2024-05-15  105   * Returns the ASN.1 digest info on success, and NULL on failure.
446115366ec712 Jarkko Sakkinen 2024-05-15  106   */
446115366ec712 Jarkko Sakkinen 2024-05-15  107  const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
a49de377e051ea Tadeusz Struk   2016-03-03 @108  {
a49de377e051ea Tadeusz Struk   2016-03-03  109  	const struct rsa_asn1_template *p;
a49de377e051ea Tadeusz Struk   2016-03-03  110  
a49de377e051ea Tadeusz Struk   2016-03-03  111  	for (p = rsa_asn1_templates; p->name; p++)
a49de377e051ea Tadeusz Struk   2016-03-03  112  		if (strcmp(name, p->name) == 0)
a49de377e051ea Tadeusz Struk   2016-03-03  113  			return p;
a49de377e051ea Tadeusz Struk   2016-03-03  114  	return NULL;
a49de377e051ea Tadeusz Struk   2016-03-03  115  }
446115366ec712 Jarkko Sakkinen 2024-05-15  116  EXPORT_SYMBOL_GPL(rsa_lookup_asn1);
a49de377e051ea Tadeusz Struk   2016-03-03  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
