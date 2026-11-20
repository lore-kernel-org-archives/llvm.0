Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187401;
	b=TfTW8BbkMssTbXc73aXTTJsaYw9MoCspsbKDZTSiq+xAkxWyQNg5apMwTLkB89I/1uCa
	 sRY7KIfpca4nUmWDY9jsbms13vt/b3+4BItLhH6FQLNq0NRnGWURkDdPyvyHCJ/iuKy35
	 9cZFiIhNzbJPdgyosPQuhxXudc/LqGEw/tvGz7FewKvJ12V6bGrwfHsGomYS+lhrB/uEW
	 SaTyL+7zrobEdMOexYsqqswPo4g4oHcee5G0tsPQZoA+K2eHNllfYLUtIBlmAEu88HJjT
	 mqPZhrbHkd4Bk28demByaRrjAuGIq8wcZOJaAOteOczAjr8ymoH+e5dsGreTSzwhRuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qItG4ZU+Hrj3rGaNlGnukkf+d0Lmum2ZfsInZ9VWPfU=;
	b=tk3Mxaw/yZ5yZ3USUi3tZzsIK2G3pewgFhMsNA6bSl+xysZs8d11xp9ZXHphEMqjs7IO
	 MyWlsijb68OAksNl8w/MNYmWuqdiU5pLCB2UkEj9oOXmvFIV8WSKSLZNZHjJGDA3TAnDq
	 9gffBujQ1l5PnHTK+WNG7HaBAKO243TJinSVXHhpzT4ndWFh4joIfnskNEkK5HoZUUAig
	 0kNROLbaizdp8NmKKwwNde6S94ErOQqv9zpxKQs+dydvg2n+zHk5FvwX7ftmg7YQXAg8F
	 gFBt5qTsgt3bkezJKwybtf5DbwnTAm/XvjUTZ9v2sS1xbX3sJjnXT+4y9h/2fjRUTxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNsMyqkz;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6C606A32C;
	Fri, 20 Nov 2026 15:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D6C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kNsMyqkz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187400; x=1826723400;
  h=date:from:to:cc:subject:message-id;
  bh=5Z1/mqA7hzChWd3oORddLS1MK0tbcGXsdHr8R5d/kVU=;
  b=kNsMyqkzyG3LNsRJbG2623+1ky3erLzsdOpqtr1xHL/F5dbffBPxC2z3
   tvfDoItZdYJhl+F6RvQRLDDECjbxjKy/Ix3Gk0KWCfAwm9/hpikNGutep
   OSweOIX6u3g/gvAD0krsmlkWXCxJCg0WhPUo0yiilROJ7dz9RHFHy/RqN
   1iRBS01s3MlAPveKEN7cSHfN+AOWV36B+OTapa0AhByFNd95YrVI/57Dn
   mP2c+LyyJ+eBwZkygvH5xUQb2tD/6PfDwfdbS1KCg7uOOPf0Dd5MHzk4d
   ik02EvxkBAgYDUh+NkqDMDrElE/WNr0gtATXZfASKk09UELYTr6vqOSP2
   g==;
X-CSE-ConnectionGUID: bsjOqKYARV6q8rku8AK1XA==
X-CSE-MsgGUID: kgjP8SMgSjKAwTt3h7pr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3949066"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3949066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:10:00 -0800
X-CSE-ConnectionGUID: v66FBvLwSUCPzg5NIAXcRA==
X-CSE-MsgGUID: +BBtclmCSbe7UkslZW/qtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10706479"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 07:09:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUQFQ-0000000043N-04t0;
	Fri, 20 Nov 2026 15:09:56 +0000
Date: Fri, 20 Nov 2026 16:09:25 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 3/9]
 include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
Message-ID: <20261120160251.DrwkFt3k-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: a4ba99532949b46aa13cd6d71ccf791cbd692390 [3/9] nvme-auth: switch to use 'struct key'
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261120/20261120160251.DrwkFt3k-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120160251.DrwkFt3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120160251.DrwkFt3k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
      54 | {
         | ^
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for function 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
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
    31		return ERR_PTR(-EOPNOTSUPP);
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
    44		return ERR_PTR(-EOPNOTSUPP);
    45	}
    46	static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    47			const char *hostnqn, const char *subnqn,
    48			u8 *data, size_t data_len)
    49	{
    50		return ERR_PTR(-EOPNOTSUPP);
    51	}
    52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac);
  > 54	{
    55		return ERR_PTR(-EOPNOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
