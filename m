Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202744;
	b=dVwHTXTM+3Q5Z94JfDCa+BDzm4yPhMtH+fr7j8nDUbOhIwYCBi3uKsbYaAFPtYB/91Ay
	 Urbe9QZuo7kqgsmr5rruXt1dGsj/Kk5CrYZQl4HkXEhLr7wJHlVAma9+ZEhC5eBHb1+EF
	 HfKw+exYxZZ4RjRY9ORwoBHIo44FwMGtwdVbIDlChNw2qZi2TcFQSlVlG1ED259M4+NrG
	 EGl/tW4RQpF/F6R8/nrWrT78z885zoLuG7gPMGi9GO4iSyIqhMy4pDKS6KjshmU0vfpNU
	 tNACzouMzHdLjb73oeyYyVo9UqmO1UKKHguycZb//2sOPJn2sD2QeLpA/YfUDari55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202744;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rfT7b44eGFQl63K3Nrm5FgFOoT0OPnciJuyqBNbWLLw=;
	b=q4kqY9H3CdHkpAkHLi49lxGf05DoJzczrsCckJok8Rqq0hpjMugvBHsb9rw2YHyMZspl
	 1tnBUtZoW1gzXXkv+vHDipRxD7NTY0G3R/mnt43dpJd0Ns4DXlnCdW8mvtETkQ08FVkE/
	 rPn6II3Ful5qPdzZG6giEHYztxaC1QwtgZYzKP9XQPZ1BrECNhUAxUo8W9uSenQVU1vj0
	 8e3bUiYVp19uamhJSBVAHrPUmU+9PdMGgUqndIG/nlws9zg9VZJ4Urva+RH4TNp3kKiCc
	 EW5/ubqDsOT8lJLzcDj/wKVv/IuxMgrum1RwVkNL2JDWjyHf31ku2TvSuhI5DeQORSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIbDB3i+;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B9606A6EE;
	Fri, 20 Nov 2026 19:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246B9606A6EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIbDB3i+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795202743; x=1826738743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NEkkbgMF1325z917jEFqYfGZWDZCnvP2bGGuwDpk3UE=;
  b=FIbDB3i+icpF+IJmK5FXPcLQYuNZwESV/aqtElkXS5RO+DBuLHMPNKY8
   gqttCDOrVXVOLWKhB2eMDhYmRz88kIrGxXkJD1fxztPXSyoobmq/AE+Wq
   k8fLkzD8j5N3cozif8ZAZ59wgoEBV9FJ2qTgccfrcerI3a6iaDwDJllx1
   16rU4lhxGpL01whEPcupoJncQqWylA67BNQqa7SG1uZUw98pRB9KOcVtI
   UOsr+8AdaIzCnecXlYdx9oGRAecFp/f2W+ZzYtu/DXK0Y05VkYx7NRVg+
   /Y52UrMab7bAXqZ9AUihNtSkpGBeZ3Mj/PUTbrNBKRS1b1hirQ7yqajY8
   g==;
X-CSE-ConnectionGUID: naP80RjhTjmSUb0wY/UpMw==
X-CSE-MsgGUID: ho0snUUQQMGGXj8WhF+gxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3988475"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3988475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:25:42 -0800
X-CSE-ConnectionGUID: kpLVHNV6RAWMYeic5lm32Q==
X-CSE-MsgGUID: DeS9GAfrT4SdueBAksKt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10672305"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Nov 2026 11:25:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUEq-00000001INT-11Le;
	Fri, 20 Nov 2026 19:25:36 +0000
Date: Sat, 21 Nov 2026 03:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
Message-ID: <202611210318.EedT1DJk-lkp@intel.com>
References: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>

Hi Hannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261120-121400
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee%40kernel.org
patch subject: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261121/202611210318.EedT1DJk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210318.EedT1DJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611210318.EedT1DJk-lkp@intel.com/

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
