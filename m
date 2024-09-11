Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530439FE5;
	Wed, 11 Sep 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041401; cv=none; b=Cg6PixYMGLE2NoM4ggKbxywTzFIOiCi+Ek0aeEw1N0XpxYFrVAPSmvPq9rozZyZEj6P5m8ocoEpFsjLXfJXOOV7G7iLU9DNk4QsVtpfoFtbYUxEaDA1glFGxlYBB4+N/RPFinwmiO8+ghvTCQ8gtPJ/C6SraEyUlN1M/DzqeR/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041401; c=relaxed/simple;
	bh=2oz0F5oJtLf3lDzl1Y6YrOQ3N3Y7UGWXkPeLGHCuq6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTEWIMZpMdzimuqC9pWnmi+m99/tCwYEjPn1GNRadhdAsq0wKM750+FCLeZsgwASNMzhddoQfhWaGyOgL6V8xdMm5vmexdMXOXSXIkjOnZSji3IJsMYnDyz0zJv0015nDTQrLOXQF1rpGcmY7grt3BqekvBY2Ssp4JTimHb0oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmVMTik/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmVMTik/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726041400; x=1757577400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2oz0F5oJtLf3lDzl1Y6YrOQ3N3Y7UGWXkPeLGHCuq6w=;
  b=YmVMTik/Qpm8C+A9LgIlH9jCO3xPu1HlpSpTo+nh58Lgol4fzhN5qEHY
   3mY2PtY99Vfm4aMAWv3Ulfok6dREcuZYL+EpEmUuZVZfKJBxAB7CIROZV
   EK3BVXth767haRfZPy5eJYhfJecj8cJ1v6N2hfSBfCBl9zlN9dcoWrOTW
   4xyTT4Gg2xKLUZFrgd9uA4/amg3Hn5VrQvN+IjmIca9mQT8gSyd8jRUS3
   yhM/lMXXDB8Py3PEYrKI8alwu+GstnLMq+strmiC/suUhPTWLOrOd7P+n
   tVT1W55Gdzyg8Jzhdyw9GWvb02F3lzNK1BcyMt9IoS5eHIDHqAeDD1BLv
   w==;
X-CSE-ConnectionGUID: zlGpWHCmS/C86Ocj3YQ9ww==
X-CSE-MsgGUID: pZqY1JOiTCauQfE9t5mBxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24701965"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24701965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 00:56:39 -0700
X-CSE-ConnectionGUID: PbmpJdHzTOyCSpAe7s7LTQ==
X-CSE-MsgGUID: UOasxn5ySSmCWZnsz4yM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="98118095"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2024 00:56:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIDL-0003Cy-2f;
	Wed, 11 Sep 2024 07:56:35 +0000
Date: Wed, 11 Sep 2024 15:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v8 10/11]
 crypto/asymmetric_keys/tpm2_key_rsa.c:636:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202409111527.uF380T7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   79e909153c0a5ac21c2c5c0d4eac9229b3408178
commit: 7d90c72ea84705971e66e2023d388c2d9958220d [10/11] keys: asymmetric: Add tpm2_key_rsa
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240911/202409111527.uF380T7Y-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111527.uF380T7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111527.uF380T7Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/tpm2_key_rsa.c:636:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     636 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:632:9: note: initialize the variable 'ret' to silence this warning
     632 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +636 crypto/asymmetric_keys/tpm2_key_rsa.c

   625	
   626	/*
   627	 * Attempt to parse a data blob for a key as a TPM private key blob.
   628	 */
   629	static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
   630	{
   631		struct tpm2_key *key;
   632		int ret;
   633	
   634		key = tpm2_key_decode(prep->data, prep->datalen);
   635		if (IS_ERR(key))
 > 636			return ret;
   637	
   638		if (key->oid != OID_TPMLoadableKey) {
   639			kfree(key);
   640			return -EBADMSG;
   641		}
   642	
   643		ret = __tpm2_key_rsa_preparse(key);
   644		if (ret < 0) {
   645			kfree(key);
   646			return ret;
   647		}
   648	
   649		prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
   650		prep->payload.data[asym_key_ids] = NULL;
   651		prep->payload.data[asym_crypto] = key;
   652		prep->payload.data[asym_auth] = NULL;
   653		prep->quotalen = 100;
   654	
   655		return 0;
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
