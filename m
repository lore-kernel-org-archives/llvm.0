Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F429CB4D;
	Sun, 23 Nov 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763908902; cv=none; b=sfwmLBvV4UD0rpXSAfMS+qUuaAc+KS9Dw2J3Y3b1Zf91g7oB00P3oQOOIaCwUaOrqizvnj+xjeoxhN6yYL2IKvZpVMdJEsYpyRvzv4Nt6KKNBqfJC+SxMpk+8GFCKdN+bxkxIosbfPsOxbX+vYLMoE17+tQo+GB9WNJwMh4y/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763908902; c=relaxed/simple;
	bh=cjtamlHrgBFSGU8VVw4BwB4lSpExyX71gRaDeHdMr7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJz6WRjbFVKOplo3EcFjLmXVt6kofr0VHKpRkCLlykBc2f7UoRdJUbK9vdnK83fAP0Zr/rGyF6SkgUEniWVwIEh4+HF/cLgjNUo+l4rQ6OofuqFA+Yj8rL8s40uxblDrrZIWMoObpThr8f4g3sddAgUdRPpZMV2LLITtHmThCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K71aN2t2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K71aN2t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763908901; x=1795444901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjtamlHrgBFSGU8VVw4BwB4lSpExyX71gRaDeHdMr7Y=;
  b=K71aN2t2/vqWVX2qofK6PABBGSxpLzJppKjqZOaI4gax/1u4SX4YG58p
   xvvTOFEvLBnM3xpnH2p9sRszCYd0mC+2K4OpsRlcpqDfE6+cKAe1wHpz1
   NhuozAX7IpSOxKKch23JoPUk0D7T5HIwK6h4KbtHuK+Yr9FMHl3l0Zejy
   ENR/ZiFp4REu3dtDMfEiDrlB0nmK3PgGHo5pw2ONJQlBjhJzsICM4xaLj
   jXetiy6QneA9T3BuAtBD+HKtDiSPlBuvysRQ0/peO8yfPpi+9z+I6he1A
   3qRKL6BvtMSg8TuRxZ31ezEUISLyE8aEgozqNbOUfmJL8bOhBDq1DhS3H
   Q==;
X-CSE-ConnectionGUID: R7hr/1U4QP2SKVvu95aSDQ==
X-CSE-MsgGUID: A3a9mz+XQNCp1SuDXT6O/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65819218"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="65819218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 06:41:40 -0800
X-CSE-ConnectionGUID: XZU5uejhS0yHe17ZN7m3BA==
X-CSE-MsgGUID: sn0hYTfcT+ajJyqdtwm28g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="196273968"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Nov 2025 06:41:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vNBHU-0008Jn-1N;
	Sun, 23 Nov 2025 14:41:36 +0000
Date: Sun, 23 Nov 2025 22:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 7/9]
 include/crypto/poly1305.h:62:19: error: use of undeclared identifier
 'at_least'
Message-ID: <202511232202.VHb5ebGB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: fb3cc420c064f330263417ab3ceeb27095d918c6 [7/9] lib/crypto: poly1305: Add at_least decoration to fixed-size array params
config: hexagon-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511232202.VHb5ebGB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232202.VHb5ebGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511232202.VHb5ebGB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/poly1305.c:10:
   In file included from include/crypto/internal/poly1305.h:9:
>> include/crypto/poly1305.h:62:19: error: use of undeclared identifier 'at_least'
      62 |                    const u8 key[at_least POLY1305_KEY_SIZE]);
         |                                 ^
   1 error generated.


vim +/at_least +62 include/crypto/poly1305.h

    60	
    61	void poly1305_init(struct poly1305_desc_ctx *desc,
  > 62			   const u8 key[at_least POLY1305_KEY_SIZE]);
    63	void poly1305_update(struct poly1305_desc_ctx *desc,
    64			     const u8 *src, unsigned int nbytes);
    65	void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
