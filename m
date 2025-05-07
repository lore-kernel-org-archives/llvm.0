Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C51E5B7B;
	Wed,  7 May 2025 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596691; cv=none; b=lfx/aASk/WI9h1ZhI7eQ1RWsdz2IEGp6eUotG1nYcZb1NaRoKjJsmsqmyFlnwZwyAgWJUNX0WC+NnOYWiNwvHnSPVS2t/KbJUtmN8v7+5K/SuLiW5UIvi73TeXG1U3KKp7sZxEqVCkzbO3qTKSJByuenqnHosxEW7fVlfJBQVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596691; c=relaxed/simple;
	bh=xOSFbkgaghhWoQ4vpe7gF0SuKl6fVEDyC9LQ5mQOCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WksRjRZDQU+8+UpGxMfOjQoDeyo3IVKnCUHkmOdvJyAG9SE4A9V9ASZB48okintHNjA6yN5KfZAARwIUxn0BNxIcN0+tgJKE5YcX23HYe1cEaNh7ATw28nXmhSA7PpzBSYGZz1fypCdMP3ijAkvyycqnGClbetaTWSsRKUNVe4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4s+LeDU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4s+LeDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596689; x=1778132689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOSFbkgaghhWoQ4vpe7gF0SuKl6fVEDyC9LQ5mQOCpI=;
  b=Z4s+LeDUELvmrwkVa0dLsjVZttfY1I5TYAMn0Rlr7X83F43cNdG/WFJh
   JESSBpSHKYeyJzG31nKm/jWwsWenJHLUi9zR0hlLzwTkxdDkh6h64Lps/
   1PriPdJurrUQSSa/g1/oDqHxosiA6tD6PQmH5klHQvOdiTTGAQDgh4UTW
   xn8b3OVexHhEj8HVL7oAagqMHjG8Ds7IgAW8+qdNfcL1zghsVyRG4L4Wx
   s2dn+FzLQaxTD5G8vlIZdjgp593NV27uIEFNMB/3jIOu8kaAlD/TGrqq1
   WJq7hqbd8o0w1v8zf0N7FSsoGhEbDAqdFGtprCnE/+Yjl+vnUSMDu4OKb
   Q==;
X-CSE-ConnectionGUID: btYiYjZuQ0S132EBw9MT5w==
X-CSE-MsgGUID: KR7oVst3Ri+i0ODb5vIZ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35932861"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35932861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: xzAd3EIjRy6fOQW2h7Uf4w==
X-CSE-MsgGUID: RCoupQ9jRYy2SNNh+eyM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140959192"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-00076I-1y;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 5/20] include/linux/nvme-keyring.h:54:1:
 error: expected identifier or '('
Message-ID: <202505071306.w6UWAH0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: da153105b999dda340dde78bba86e7335065c9b0 [5/20] nvme-keyring: add 'dhchap' key type
config: s390-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071306.w6UWAH0R-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071306.w6UWAH0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071306.w6UWAH0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
      54 | {
         | ^
   include/linux/nvme-keyring.h:57:4: warning: no previous prototype for function 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^
   include/linux/nvme-keyring.h:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         | ^
         | static 
   1 warning and 1 error generated.


vim +54 include/linux/nvme-keyring.h

    26	
    27	#else
    28	static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
    29			u8 *data, size_t data_len, const char *digest)
    30	{
    31		return ERR_PTR(-ENOTSUPP);
    32	}
    33	static inline key_serial_t nvme_tls_psk_default(struct key *keyring,
    34			const char *hostnqn, const char *subnqn)
    35	{
    36		return 0;
    37	}
    38	static inline key_serial_t nvme_keyring_id(void)
    39	{
    40		return 0;
    41	}
    42	static inline struct key *nvme_tls_key_lookup(key_serial_t key_id)
    43	{
    44		return ERR_PTR(-ENOTSUPP);
    45	}
    46	static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    47			const char *hostnqn, const char *subnqn,
    48			u8 *data, size_t data_len)
    49	{
    50		return ERR_PTR(-ENOTSUPP);
    51	}
    52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac);
  > 54	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
