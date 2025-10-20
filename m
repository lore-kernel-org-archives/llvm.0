Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADC236451;
	Mon, 20 Oct 2025 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928387; cv=none; b=AEUGrHGM05B5/PNB9As6r4SzNGrDHbbjXmrTNd0c3GjA9/7QPS1To3ZdAU9TKYyGOSFqxmfUbb09CVFANN4RDaaJwbr3YxnntMNSchkzEHMqvtOFAfSPVnxRaJijPSE+lzkBIZ1bfGUFAnaqVQIXWz0bqxC67ntoJws97f5shuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928387; c=relaxed/simple;
	bh=9JKn7Cqe+1523d2cMImSaBRuGBeb/Jc8yE5X6UCxrZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTR2No3HvrUyB3W1o0RKZxz30h3FK+VUWC5Rf1anv/ukmzggffe2/TnDc3yBYFnFIKBF0igoOtL99zNZcr0oODRronHN3HwBTOFquTZP+NXPm0jXNw8iE5dWqRdyCLe5XnWIdurstYJjp6JhInilfZKXSSTl53Ow2lty+SwVGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdFyj1Zi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdFyj1Zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760928386; x=1792464386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JKn7Cqe+1523d2cMImSaBRuGBeb/Jc8yE5X6UCxrZE=;
  b=hdFyj1ZizpvO1JjE635AtvLbvS+w0tmn6CpPV+b7bOHJMsxk5vSk8YMa
   5MKnH310xpbmT7VAkycJJz8G0uJqm3lembYcboqSGLtHwI0f2unwxB+U4
   mYzLjLKiUJX/aWB68KgVCPOIdWLIWsGii2DVQWCKthicbTj+CUFnTYa44
   YlGvMmpKlk23RWtHMHeE3RAQxxH7lCnPcWotx07SzhJdM8TySSvxMoEO9
   JJ4MAYsP2FGI8FqWi5f0XUmXWe3t69ALbqL8pqAlX722oKanQehKjl7qP
   7r/OJyUmMmKFo8DN1zzbWiDf5ynvUqoMTm1SAVl5R/ibxTihJy5i0iB11
   Q==;
X-CSE-ConnectionGUID: FFM0t8FIS8KRW8bDjuOg6g==
X-CSE-MsgGUID: J9uNrvw7TR63ZBlRimMgCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73336992"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="73336992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 19:46:25 -0700
X-CSE-ConnectionGUID: B6Cpdg0LQSayYfHINQgggg==
X-CSE-MsgGUID: okeleChFRfaqqSYyUHulrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="213840430"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2025 19:46:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAfuZ-0009RB-08;
	Mon, 20 Oct 2025 02:46:19 +0000
Date: Mon, 20 Oct 2025 10:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 17/17] crypto: sha3 - Reimplement using library API
Message-ID: <202510201051.tQ2TXM25-lkp@intel.com>
References: <20251020005038.661542-18-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020005038.661542-18-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 123fa1574bccee87da735d13e89c931e88288b40]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/s390-sha3-Rename-conflicting-functions/20251020-085933
base:   123fa1574bccee87da735d13e89c931e88288b40
patch link:    https://lore.kernel.org/r/20251020005038.661542-18-ebiggers%40kernel.org
patch subject: [PATCH 17/17] crypto: sha3 - Reimplement using library API
config: s390-randconfig-002-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201051.tQ2TXM25-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201051.tQ2TXM25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201051.tQ2TXM25-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __sha3_update
   >>> referenced by sha3.h:172 (include/crypto/sha3.h:172)
   >>>               crypto/sha3.o:(crypto_sha3_update) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __sha3_squeeze
   >>> referenced by sha3.h:188 (include/crypto/sha3.h:188)
   >>>               crypto/sha3.o:(crypto_sha3_final) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sha3_224
   >>> referenced by sha3.c:59 (crypto/sha3.c:59)
   >>>               crypto/sha3.o:(crypto_sha3_224_digest) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sha3_256
   >>> referenced by sha3.c:66 (crypto/sha3.c:66)
   >>>               crypto/sha3.o:(crypto_sha3_256_digest) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sha3_384
   >>> referenced by sha3.c:73 (crypto/sha3.c:73)
   >>>               crypto/sha3.o:(crypto_sha3_384_digest) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sha3_512
   >>> referenced by sha3.c:80 (crypto/sha3.c:80)
   >>>               crypto/sha3.o:(crypto_sha3_512_digest) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
