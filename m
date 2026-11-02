Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650058;
	b=kTPNpU2bTWND8Tois+e1Ghynymk9HIX+HmADbxF7zWA35yhqsxEUiB8H/WlMY7fFgpJy
	 HZMr85kqKdUzjp/4bG/vj3Mr1j3mQbake9gHZPx5/N37WCeGPnpIKYrJxDJcL96yBcF3T
	 z41RFF4vREFtFVMQSAUdxNinJFbfTkRaejmW09y2zn7Im5f0bWWujO9F+ikLsIxjyGu9e
	 WrEx0+LfRm0QcEI8C7zNoqBdnfu9kWYNLQsoYbDpsmnGpm9OYYijIg4zRe/J2wk0gWDfT
	 STRoNK7UdwI2OjlrEUZWvTj6z6JD7QGG5Crcc38Xw6bu9+cQKH97HEz8I00pHzJkHdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Bx7tsTHOjeYtqkeO8upPwBontZvzYlAzqswaLQaTdjw=;
	b=KFTVD0jH4kd4nNwrzoixiKihaZvn5VcLddS5iw6VhiPxmwRmSo/nP4nCAENyoGwzXqXK
	 gFpDY6TnDHhsGjZkF3ujMFTTth0M1a6A2Zydq1UyIHVuksGiQr/SfQV/fi05VfRiANeJi
	 dga8c0cCZt1Tq0ymECz67zqrJ5VbNTX/8DrZQ+hxxt+TExL5ugKYmviwglznPWxVfE3zS
	 fBBsqzMP5B0o5KYiGViDh0ZPRro9XLCl+Geg00cMFjegH9ILIDx/GIs3QuCSxX6pCLFfz
	 HdPYJVJYuvgx78HkvY3Sp1JJBpXzgVs1oMsbOzEZqYQApsAHO4xdD9a84RlLkoML4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrVbzjjp;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F023606A326;
	Mon,  2 Nov 2026 20:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F023606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrVbzjjp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793650058; x=1825186058;
  h=date:from:to:cc:subject:message-id;
  bh=YNTuNst4Y3YfpmT+sbu5F9FRBiE5J6SL76U5MPL2I94=;
  b=GrVbzjjpXfGOo9IrDAGnMZ6MYVkvElJW6DcEC6Rks8CgxADRnq50RiFJ
   8CdNMmyiVyXW0xYYs4ldy46dPthtjGRjDZOZ3Ru0w+wrt3yqhfCCT6NOe
   xSbgVLufjbCIb6yxzwpazlpnrm+HztPTHcU5dS7VP7oUypbZwr87DKf1x
   Es3vThiRpIV7IpJFgoUIp4wBF4tsFqppDMyC7F1EEdS4rJAiy+YN1jvCJ
   JzKKV41A+kGJDS7TEvXJlUY7Dyvz+qTMDjzdZEvNlB4uGdVaVBmY//jP5
   tHsqGPwg/66OJk9uEQb9DH+Rgxybkmun+S1mVAKpDXX7hhT39FQdtWR+d
   Q==;
X-CSE-ConnectionGUID: AdNp5tpCTIShUJnaDdLxPw==
X-CSE-MsgGUID: emYZaDbTSca3CPwORMQxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2388176"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2388176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:07:37 -0800
X-CSE-ConnectionGUID: LDBZrR+IQQO9+FF1emu1Qg==
X-CSE-MsgGUID: 3He5U1Y+S7u2e6uJ/V16nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6370949"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2026 12:07:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNyJZ-00000000hls-0o5p;
	Mon, 02 Nov 2026 20:07:33 +0000
Date: Tue, 03 Nov 2026 04:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/large_folio_v7+ 16/22] fs/f2fs/f2fs.h:2303:3:
 error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202611030337.dami3tsw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/large_folio_v7+
head:   5b72086892ee05798082621df69a27afeff2b233
commit: 70ebe88955b4db7e829c8a27938bcce16c5a2686 [16/22] diff: fix patch 1
config: arm64-randconfig-1003-20261102 (https://download.01.org/0day-ci/archive/20261103/202611030337.dami3tsw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030337.dami3tsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030337.dami3tsw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:29:
>> fs/f2fs/f2fs.h:2303:3: error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2303 |                 f2fs_bug_on(F2FS_F_SB(folio), 1);
         |                 ^
   fs/f2fs/f2fs.h:38:4: note: expanded from macro 'f2fs_bug_on'
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^
   1 error generated.


vim +/set_sbi_flag +2303 fs/f2fs/f2fs.h

  2290	
  2291	static inline bool f2fs_folio_has_ffs(const struct folio *folio)
  2292	{
  2293		unsigned long private = (unsigned long)folio->private;
  2294	
  2295		if (!folio_test_large(folio) || !private)
  2296			return false;
  2297	
  2298		/*
  2299		 * A large folio should always carry f2fs_folio_state rather than
  2300		 * non-pointer private flags at its folio->private.
  2301		 */
  2302		if (unlikely(test_bit(PAGE_PRIVATE_NOT_POINTER, &private))) {
> 2303			f2fs_bug_on(F2FS_F_SB(folio), 1);
  2304			return false;
  2305		}
  2306		return true;
  2307	}
  2308	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
