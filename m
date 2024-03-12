Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083058107;
	Tue, 12 Mar 2024 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710233789; cv=none; b=SsXQMGxzpyTcKfuWMOWpdGlykpspcq6W7CF4LXz9S4w623LILi00I0300XMvbrL3d+/icvKbvdrL75ZhYxxhdY4l/zP6FA15qeTmEqyoYwT61JuGMTNy/ToH8LerJzTwTHHbOY3oRGXISoQeubl4y9/O7OkwpztpQw1gZ/ZWj6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710233789; c=relaxed/simple;
	bh=uUfnJKUChpMK7U16CGM+fFEjNuEju2903Q/gbmpxBHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvEm6EswYbtJ5dBzWxyKnC0B6kZfuELq3Ce8iSdBT/LbERbQeBGqG7ic6RgSkXvTlDb5PR9Ybz2GVFOGxsEjRaHY73mOmECiWeTZktMXH7Ezv2iKhAa/gK7lz41gBFn7fG9c5M1xon4ZhpaTUk+Jxg2w8JFU9OmBRUvT8X6ugAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHfJ5uKW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHfJ5uKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710233788; x=1741769788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uUfnJKUChpMK7U16CGM+fFEjNuEju2903Q/gbmpxBHg=;
  b=YHfJ5uKW8kr8qBJUkjUqOT23Wj9J2b15wR9pl3WpA8E1EsJUHvv0mSmv
   xncBS2k5CpaVPmHMToh7qZGjZKbQ2GIuwpm+C8QdHDDBK2rGnciQVT8i4
   n0IQXXKybcPgAOR4P1uaArMJUlhWJglztHpmpIbHJB/CqvuOdU6UnigfT
   EllrLQyjpKFHr063DdWN9QkCppSr0cMM0eu5R4473GfzlfJoDR+kzwLiS
   0NEk7CxColHX22ocEFk54qPve10VvJIsOQRZOLtXhPqhpqrb3sp3EtLP/
   TgBZLn2vnakmUFeeagb2xVpUeCHN+DAWTX+TGp1+pM4nfaTPXRBhvUctZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15490820"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15490820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 01:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11567286"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2024 01:56:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjxvr-0009zU-1V;
	Tue, 12 Mar 2024 08:56:23 +0000
Date: Tue, 12 Mar 2024 16:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/8] certs: Introduce ability to link to a system key
Message-ID: <202403121646.uVo3fDVV-lkp@intel.com>
References: <20240311161111.3268190-2-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311161111.3268190-2-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on edc6670233a333ccfd1ec0548f068bd121d209c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240312-002925
base:   edc6670233a333ccfd1ec0548f068bd121d209c8
patch link:    https://lore.kernel.org/r/20240311161111.3268190-2-eric.snowberg%40oracle.com
patch subject: [PATCH RFC 1/8] certs: Introduce ability to link to a system key
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240312/202403121646.uVo3fDVV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121646.uVo3fDVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121646.uVo3fDVV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> certs/system_keyring.c:447:29: error: use of undeclared identifier 'platform_trusted_keys'; did you mean 'set_platform_trusted_keys'?
           tkey = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);
                                      ^~~~~~~~~~~~~~~~~~~~~
                                      set_platform_trusted_keys
   include/keys/system_keyring.h:133:20: note: 'set_platform_trusted_keys' declared here
   static inline void set_platform_trusted_keys(struct key *keyring)
                      ^
   1 error generated.


vim +447 certs/system_keyring.c

   429	
   430	/**
   431	 * system_key_link - Link to a system key
   432	 * @keyring: The keyring to link into
   433	 * @id: The asymmetric key id to look for in the system keyring
   434	 */
   435	int system_key_link(struct key *keyring, struct asymmetric_key_id *id)
   436	{
   437		struct key *tkey;
   438	
   439	#ifdef CONFIG_SECONDARY_TRUSTED_KEYRING
   440		tkey = find_asymmetric_key(secondary_trusted_keys, id, NULL, NULL, false);
   441	#else
   442		tkey = find_asymmetric_key(builtin_trusted_keys, id, NULL, NULL, false);
   443	#endif
   444		if (!IS_ERR(tkey))
   445			goto found;
   446	
 > 447		tkey = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
