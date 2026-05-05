Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF093A2549;
	Tue,  5 May 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967927; cv=none; b=jYKoGZ15OCVjKjwk4hspR7HU1/DGPmKbyYhnRcKOeWaVHgvBQI/36N9Q4sKbkHiTz6ulcBccqi2nTwM2qRG5MJobhquOz5jSc2Ku2CnHZ1MDBTS+MLoFGXEKPuZ9DcuO6A4q/1Bsta5T2TJ5ZnXEtVIzI1CrNKy9OIX5Rc2LGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967927; c=relaxed/simple;
	bh=SQ7KNAP4kHKFX30GD5Pi7+vtD7f0tBDHiF8mrrdsGRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cw2sUhAK62+65BQ7C8qo62UcmgKMMBN4cr1nG9E+/+oVvOYb1RevyEUGWkGdc4hBFzXUJdjvCqwn4as8Hfu51fgLb/HlCeF+g0LvO3O3ia1wHmekx55h5/SEvninTf9Pn06yUQOLXfSaWI/1m1fULpR1zo/6rxu4r3ZrjD36ymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXea4RjA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXea4RjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777967927; x=1809503927;
  h=date:from:to:cc:subject:message-id;
  bh=SQ7KNAP4kHKFX30GD5Pi7+vtD7f0tBDHiF8mrrdsGRU=;
  b=iXea4RjAo1pOpL2t63NJ0G1qmOk8CHkE4qT6afVWWvgRqxQfSV8WOyiF
   p+48WKKEKzQuLV0tsulrB/EtCmKFWjwsv6bGAJLcHQ2cATNq1CGEN+W4a
   OAJ85Mkrr3voAvUTW3UWJFYUFU322npffjcrLWbluqGb3LHw0ndSH84AD
   YM9toj7luLdF3++SIRjDnQd/BLJ1ODtgdLDp2P5SKdEMcz54VPtBxAJKq
   1QMPdpNFIaiVz5FF4xSOhlZuLLmI8DLHcQk4bWBQSOV4vyJMpgmAWgQqU
   sE3BkNNnZfK8SAveO0l+us9dYXh007J/PMSZB2gerVOrjhrkK+VAhM6SP
   w==;
X-CSE-ConnectionGUID: bwFsYjOdTAigXb6RnxAf6Q==
X-CSE-MsgGUID: FUIm3wqwQXKnOK7XWxycEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78692636"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78692636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:58:46 -0700
X-CSE-ConnectionGUID: a37L9cSBRRKtgVXtQEFFxQ==
X-CSE-MsgGUID: w2Z5YlWkSUKknq4oZUZbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="231372120"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2026 00:58:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAfy-000000004Mt-06X9;
	Tue, 05 May 2026 07:58:42 +0000
Date: Tue, 05 May 2026 15:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-iscsi 1/1]
 drivers/target/iscsi/iscsi_target_auth.c:112:3: warning: label followed by a
 declaration is a C23 extension
Message-ID: <202605051559.ZeZtd8t6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-iscsi
head:   d75081a34e037b17f0f59228963a1cbd46afd4bd
commit: d75081a34e037b17f0f59228963a1cbd46afd4bd [1/1] scsi: target: iscsi: Use crypto library API
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605051559.ZeZtd8t6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051559.ZeZtd8t6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051559.ZeZtd8t6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/target/iscsi/iscsi_target_auth.c:112:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     112 |                 static_assert(CHAP_MAX_DIGEST_SIZE >= MD5_DIGEST_SIZE);
         |                 ^
   include/linux/build_bug.h:79:34: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:80:41: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   drivers/target/iscsi/iscsi_target_auth.c:116:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     116 |                 static_assert(CHAP_MAX_DIGEST_SIZE >= SHA1_DIGEST_SIZE);
         |                 ^
   include/linux/build_bug.h:79:34: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:80:41: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   drivers/target/iscsi/iscsi_target_auth.c:120:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     120 |                 static_assert(CHAP_MAX_DIGEST_SIZE >= SHA256_DIGEST_SIZE);
         |                 ^
   include/linux/build_bug.h:79:34: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:80:41: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   drivers/target/iscsi/iscsi_target_auth.c:124:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     124 |                 static_assert(CHAP_MAX_DIGEST_SIZE >= SHA3_256_DIGEST_SIZE);
         |                 ^
   include/linux/build_bug.h:79:34: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:80:41: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   4 warnings generated.


vim +112 drivers/target/iscsi/iscsi_target_auth.c

   107	
   108	static void chap_digest_final(struct chap_digest_ctx *ctx, u8 *out)
   109	{
   110		switch (ctx->digest_type) {
   111		case CHAP_DIGEST_MD5:
 > 112			static_assert(CHAP_MAX_DIGEST_SIZE >= MD5_DIGEST_SIZE);
   113			md5_final(&ctx->md5, out);
   114			break;
   115		case CHAP_DIGEST_SHA1:
   116			static_assert(CHAP_MAX_DIGEST_SIZE >= SHA1_DIGEST_SIZE);
   117			sha1_final(&ctx->sha1, out);
   118			break;
   119		case CHAP_DIGEST_SHA256:
   120			static_assert(CHAP_MAX_DIGEST_SIZE >= SHA256_DIGEST_SIZE);
   121			sha256_final(&ctx->sha256, out);
   122			break;
   123		case CHAP_DIGEST_SHA3_256:
   124			static_assert(CHAP_MAX_DIGEST_SIZE >= SHA3_256_DIGEST_SIZE);
   125			sha3_final(&ctx->sha3, out);
   126			break;
   127		default:
   128			WARN_ON_ONCE(1);
   129		}
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
