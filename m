Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F13595C;
	Sat, 18 Oct 2025 03:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757441; cv=none; b=nFXkCOVIYuL3cRTFW+zGpsrqB2lTdmXaURPyV31hggYX0Wt0EGxV47oSU1OJlHtlBS4wmTl9Ug0g55YeriiO/hqb1oYaQ1R+3CZBWxGwPc3qwYk5JtQ/NgR/h9r7yfRN6Fnf2vDbgemLsh/Nc/grG9XUfay/fx/cMoefyrI7OWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757441; c=relaxed/simple;
	bh=L/U7xd9gb+jHw+YgiS3x5RWCh/W7CkWcbM/hRqItctY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUzvzECqDYRmdTiqERv8056Q4sUn1hPiipwgk0St6vdN0cqu0mPTT7NS76g1i5Kd6YH4HzplxlFgYUGOiLK6kccuAp+5LC9a4NdfXUZY3YdUtdHcOOugNEqHYC29M4KYRirBBvpT4aoh1N/zUdCb4+PG5AJoFzJE9f9nyQ9Hs2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfOhby0K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfOhby0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757435; x=1792293435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/U7xd9gb+jHw+YgiS3x5RWCh/W7CkWcbM/hRqItctY=;
  b=nfOhby0K/ftXEKtZiAGG2RPjG7JKjOzrx7hS3ppiktt+ltAHrN/FdFic
   LxwWMXNPmfnhhI+p2Edd01K/MoJUR1vcydIjGZ9hRjoxI26B4nuHas2B0
   CiS4IUVns3Ub0f920pzXMFKH7n30vdrB6bb5CO7KpBJXRVh3803uCxQea
   ZGZK3xpESwcFaYrXx34retiFsivbnnG1Cuee2VRY7KvPq3aMCRMla3fuN
   +0wipvcSNZJj8c6WeM4ATaPsQwjwFFD6GjbgGuuZsfaPgtoWLXF0z5+2Q
   jCLjANQvR2hCvJZY5RDRbt9SXEVkXRaocM+y1N7H+htv1b1pdiE8/PEw6
   w==;
X-CSE-ConnectionGUID: LO+WsgSuQeeS+5GaB1i3eg==
X-CSE-MsgGUID: i0xgTMt8RUqiyi7QbNsvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63120459"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="63120459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:17:14 -0700
X-CSE-ConnectionGUID: ULYFs5NlTAuapXbaVg15KQ==
X-CSE-MsgGUID: 7YVFTZvjT/SlP5xSMtMJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="186846531"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2025 15:51:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9tI3-0007pX-1k;
	Fri, 17 Oct 2025 22:51:15 +0000
Date: Sat, 18 Oct 2025 06:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/17] crypto/jitterentropy.h:8:34: warning:
 declaration of 'struct sha3_256_ctx' will not be visible outside of this
 function
Message-ID: <202510180655.LxM4kUi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   91d7b63566e977976872603971e4a3ec4efeeb60
commit: 3a417817ad73f1bd4708285f0d3364d6b4a20c40 [6/17] crypto/jitterentropy: Use lib/crypto/sha3
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510180655.LxM4kUi3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180655.LxM4kUi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180655.LxM4kUi3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/jitterentropy-testing.c:12:
>> crypto/jitterentropy.h:8:34: warning: declaration of 'struct sha3_256_ctx' will not be visible outside of this function [-Wvisibility]
       8 | extern int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
         |                                  ^
   crypto/jitterentropy.h:11:35: warning: declaration of 'struct sha3_256_ctx' will not be visible outside of this function [-Wvisibility]
      11 | int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len);
         |                                   ^
   crypto/jitterentropy.h:15:16: warning: declaration of 'struct sha3_256_ctx' will not be visible outside of this function [-Wvisibility]
      15 |                              struct sha3_256_ctx *hash_state, struct rand_data *p_ec);
         |                                     ^
   crypto/jitterentropy.h:21:20: warning: declaration of 'struct sha3_256_ctx' will not be visible outside of this function [-Wvisibility]
      21 |                                                       struct sha3_256_ctx *hash_state);
         |                                                              ^
   4 warnings generated.


vim +8 crypto/jitterentropy.h

     2	
     3	extern void *jent_kvzalloc(unsigned int len);
     4	extern void jent_kvzfree(void *ptr, unsigned int len);
     5	extern void *jent_zalloc(unsigned int len);
     6	extern void jent_zfree(void *ptr);
     7	extern void jent_get_nstime(__u64 *out);
   > 8	extern int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
     9				  unsigned int addtl_len, __u64 hash_loop_cnt,
    10				  unsigned int stuck);
    11	int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len);
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
