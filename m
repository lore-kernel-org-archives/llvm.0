Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58596364EAA;
	Fri,  9 Jan 2026 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983198; cv=none; b=r+xwNgPrwTQB0rJT7k+1GGCMf8ZP0+AkQWHcb8z2rCxonBBBm9xtyxBpxnbLcLOxy7vvXT2IpPhe1ku0+UDAOQ06qrjrwyhI1SUqrJIdIOBgHT9aozVvAZbRIo1jVKwra5gwv8cnLC2xSRMkJpMItTuPulkOCch4sq9dX8g0KgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983198; c=relaxed/simple;
	bh=pEo6WMwVFppK+RVeYmT/fpWWJzAd/wqLkyeY0SVnSWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KWr1rX4Rl0G+HshNwc4AXf4Qrs3fTfq8gJHZnip7TNi8CQIEihNV8ssV4APN0px8vs/GzACpP8J3tBlM80Y3xwbAUYQx46NdRmwZiG4XBINO9vMzWHbpHeK830jJIbhLjwdxEFsm5mH08Euw8U2U+kQdt6bAUXrOMiw8PjqZGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfySKH6r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfySKH6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767983196; x=1799519196;
  h=date:from:to:cc:subject:message-id;
  bh=pEo6WMwVFppK+RVeYmT/fpWWJzAd/wqLkyeY0SVnSWo=;
  b=EfySKH6rqz5UooyI1TEWB83RUCaBNEyMXN98xJTfOJlWztcpCDOP+kVN
   Lw9JQ+tC987fORiiYjOXXCsuoOrl7ljh0uF0/wrFgb9RWktE+QBrHxx0K
   YiW2v+YBX9Qj7J1cBfzhcxdkrRvHC83gzfr3TbCaAxcRmvQrA7ZIOHO4T
   cdrzWURLqTRViqx0X0PuzzQdvdk9nxCyj9xry4uhS+aFusSUuYyKbqfya
   IehY1pZg6Z3TEKHXVITbRfTYmHQo3mPeDrXHXP64esfIQZqlot1CUDnY7
   Ezhdg9xA4MGSHqEw4KzPPxC8aX1Sug1X3pfqeY6wFXfFpgFND5ZyTXGxe
   A==;
X-CSE-ConnectionGUID: RpjRuk89TSmERuf4WVteBg==
X-CSE-MsgGUID: k1Q6yN4pSSiMkxbfAeNKew==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80086403"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80086403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:26:36 -0800
X-CSE-ConnectionGUID: B0B9ojk/QnaTQ0ma/dVsaA==
X-CSE-MsgGUID: G0RWfjkrQYyWU1mKbltP/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="202741356"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2026 10:26:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHBv-000000007c2-3pdO;
	Fri, 09 Jan 2026 18:26:31 +0000
Date: Sat, 10 Jan 2026 02:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260109 6/17]
 ./usr/include/linux/kvm.h:17:10: error: 'stddef.h' file not found with
 <angled> include; use "quotes" instead
Message-ID: <202601100212.EIstO6bT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260109
head:   4d8c567a107d0f07e6fa7f8f7b6ce4a444c69b4d
commit: daeef1578407256a91890a91ad3ba9f144098215 [6/17] KVM: Avoid a few dozen -Wflex-array-member-not-at-end warnings
config: s390-randconfig-002-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100212.EIstO6bT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100212.EIstO6bT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100212.EIstO6bT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/kvm.h:17:10: error: 'stddef.h' file not found with <angled> include; use "quotes" instead
      17 | #include <stddef.h>             /* for offsetof */
         |          ^~~~~~~~~~
         |          "stddef.h"
>> ./usr/include/linux/kvm.h:1581:16: error: implicit declaration of function 'offsetof' [-Werror,-Wimplicit-function-declaration]
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                ^
>> ./usr/include/linux/kvm.h:1581:25: error: expected expression
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                         ^
>> ./usr/include/linux/kvm.h:1581:48: error: use of undeclared identifier 'name'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                ^~~~
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
