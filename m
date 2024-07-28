Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B73D62;
	Sun, 28 Jul 2024 04:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722142136; cv=none; b=jqIZ6ZlBt1lCY0MOE+OdsoQepWedlj47sXcYArgIvbw6+vi+1/U6W9AO2FgeBRAGre1lBBZfkKdjfl32BbRpfoJP9XLcZF0b7CBdths+BvuIXjNh1NZUkibOW5pCW/uNvF/VL7Sy9pEzZpxP5ck9l/9D7EcoWMF/H3Hx7tQW1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722142136; c=relaxed/simple;
	bh=vkNaj3JJyNEb2zE0OhedRCB9G8l/gugfivYlfLAJERA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZ5QUJHK3vPgCd0ncef/ska82+vot3cw93YBWVDi6yBSb8c8aq3QfCBusg3gPynBE/nft178LOddAALLPTeHdLtS5yU6gjTqwAtFQ0kILPaZR8f+Vm4aJ7gli5ubDBSP77ia/HuhoOxUUbBWWyrkjOHRtpWvx0AKvD/7oz+Kfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhTpuyol; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhTpuyol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722142134; x=1753678134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkNaj3JJyNEb2zE0OhedRCB9G8l/gugfivYlfLAJERA=;
  b=MhTpuyolEQrhcy/uQTflg2aGpv6n+pgS5OWFGLwHzVc+hL9IhxokY54w
   8by7o1yxF3ArEIrUaK2pwFPPQpob20/GdH6DLslF7hhhzsbOpKBzukEr1
   ridkl2eNLDLEIvrQnTpPRw2rneJP87Pwj6Mgl37VYCAyGlIDp7jhUfQFD
   inQ9hE8b1wB3BlIwVBiQWOwBx6YnVubAdpnWHHeUcQYR7WxJWoqkeiPPy
   HEx1W0j16TrQILXs4yx4lYBeGE6h6zK2TgSZTafCTs1KUhb0flqbZhVzx
   /TBQ8h5YfjG6tf9Ufm02Xd4vyx47T5WR2TO8XOQKp+vKZhmkKhZP86XQO
   A==;
X-CSE-ConnectionGUID: t4v54bI1SBeYd6B59aO/fg==
X-CSE-MsgGUID: b/3y0rSLT3OLW+sCqiQ+Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="23751562"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="23751562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 21:48:53 -0700
X-CSE-ConnectionGUID: JCloFiPCSoWgyuo5o5nH0w==
X-CSE-MsgGUID: kikLYrL6RvSgdcXYUSaMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="84597264"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2024 21:48:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXvpx-000qVy-1z;
	Sun, 28 Jul 2024 04:48:49 +0000
Date: Sun, 28 Jul 2024 12:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240726-cbc 14/14]
 usr/include/linux/ethtool.h:1645:15: error: expected parameter declarator
Message-ID: <202407281233.Rlzs3LRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240726-cbc
head:   bd10b39e2b713a2f9fe8715278e9d4bee9253e24
commit: bd10b39e2b713a2f9fe8715278e9d4bee9253e24 [14/14] ethtool: Avoid -Wflex-array-member-not-at-end warning
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240728/202407281233.Rlzs3LRF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281233.Rlzs3LRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281233.Rlzs3LRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/mdio.h:15:
   In file included from usr/include/linux/mii.h:13:
>> usr/include/linux/ethtool.h:1645:15: error: expected parameter declarator
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |               ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/__stddef_offsetof.h:16:24: note: expanded from macro 'offsetof'
      16 | #define offsetof(t, d) __builtin_offsetof(t, d)
         |                        ^
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/mdio.h:15:
   In file included from usr/include/linux/mii.h:13:
   usr/include/linux/ethtool.h:1645:15: error: expected ')'
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/__stddef_offsetof.h:16:24: note: expanded from macro 'offsetof'
      16 | #define offsetof(t, d) __builtin_offsetof(t, d)
         |                        ^
   usr/include/linux/ethtool.h:1645:14: note: to match this '('
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |              ^
   usr/include/linux/ethtool.h:1645:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         | ^
         | int
   1 warning and 2 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/ethtool.h:1645:15: error: expected parameter declarator
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |               ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/__stddef_offsetof.h:16:24: note: expanded from macro 'offsetof'
      16 | #define offsetof(t, d) __builtin_offsetof(t, d)
         |                        ^
   In file included from <built-in>:1:
   ./usr/include/linux/ethtool.h:1645:15: error: expected ')'
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/__stddef_offsetof.h:16:24: note: expanded from macro 'offsetof'
      16 | #define offsetof(t, d) __builtin_offsetof(t, d)
         |                        ^
   ./usr/include/linux/ethtool.h:1645:14: note: to match this '('
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |              ^
   ./usr/include/linux/ethtool.h:1645:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         | ^
         | int
   1 warning and 2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
