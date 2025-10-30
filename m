Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F5257852;
	Thu, 30 Oct 2025 06:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806926; cv=none; b=ss4v0rXrS+fBUsGmHotVdP+C5dadHAx/gBE1Tq1Fm1YwM6dIemdPfxpYSTm1rLRdFIOLqy41dMkNNcS2ViVzfA6sJEwq82kaG0La23cgpJHzE3UYASPuaGyd5cG2S1LH7F1FWQ6DGAsv2mxp0cMYBPniZY/weIw/ohAg7jaIisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806926; c=relaxed/simple;
	bh=6+FWAZHMjWLzRTYo8URd7c/QV7J3npcO26Rwku9QgAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqNEEiJlnkP0bAHbjtydV2iHRDdNjPRITgaEqi099NxanxroMDlP7vE1AhSis7G1UkBtMnAitz8kFDTbihaX9SvRSj62hpbfY1y5K1YthHokHHbuhBb7Dq5P/kxTqX5YJDEkEFuQK7DfSo6LFAeWkvcJiM83zaHVbpcZ5XLS9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1G4AbxD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1G4AbxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761806926; x=1793342926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+FWAZHMjWLzRTYo8URd7c/QV7J3npcO26Rwku9QgAY=;
  b=Y1G4AbxDy0udM0r1RGkEX1FlSY1ru8oStv3UpVoBPydoUk5qE0RV+Tjh
   pvDQrTIqb71ra879kKwDUwuTG17XTCF8Y+4wtFUqVU1PM9TS9iDeXnhNP
   3UeT2QoZndPfPntpf6IQIoSEM1p1uoQj7k9YzDWof0HMHOrbd8uCTkzch
   7NwmTCqphD7dPit0YrF6Uy7IPYrqMu6vZ/n2ztJElCwEwjkqHuI7lpNeM
   sBnvR+z4//3ue4NFd5RWdhRhdeUc1aHEnWXOAZ3Of1PjYeYGYRnIxFNpF
   irbhd5mXLEr6RppDvY5RNO5bl3e6oSNPcf6coF/wxxKiJzdC8anQvRMuy
   g==;
X-CSE-ConnectionGUID: T0P2aujwSGSbmF69UIpr3Q==
X-CSE-MsgGUID: 2CsFMiVARFqKYanr6uh5AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63976664"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63976664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:48:45 -0700
X-CSE-ConnectionGUID: AcqUe4XwQ1eFkv+zM1OJUQ==
X-CSE-MsgGUID: k0LdKx9cSmika+xlFV6RVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185065852"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2025 23:48:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEMSf-000LYg-11;
	Thu, 30 Oct 2025 06:48:41 +0000
Date: Thu, 30 Oct 2025 14:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:clist-proto 2/2] samples/rust/rust_clist_c.c:13:19: warning:
 no previous prototype for function 'clist_sample_create'
Message-ID: <202510301409.UEGHSHOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git clist-proto
head:   84ed07eee17164cb7fbeceb33321d1432f1ece15
commit: 84ed07eee17164cb7fbeceb33321d1432f1ece15 [2/2] clist proto
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251030/202510301409.UEGHSHOi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301409.UEGHSHOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301409.UEGHSHOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/rust/rust_clist_c.c:13:19: warning: no previous prototype for function 'clist_sample_create' [-Wmissing-prototypes]
      13 | struct list_head *clist_sample_create(int count)
         |                   ^
   samples/rust/rust_clist_c.c:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      13 | struct list_head *clist_sample_create(int count)
         | ^
         | static 
>> samples/rust/rust_clist_c.c:41:6: warning: no previous prototype for function 'clist_sample_free' [-Wmissing-prototypes]
      41 | void clist_sample_free(struct list_head *head)
         |      ^
   samples/rust/rust_clist_c.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void clist_sample_free(struct list_head *head)
         | ^
         | static 
   2 warnings generated.
--
>> warning: unused imports: `error::Result` and `prelude::*`
   --> rust/kernel/clist.rs:54:23
   |
   54 | use crate::{bindings, error::Result, prelude::*};
   |                       ^^^^^^^^^^^^^  ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default


vim +/clist_sample_create +13 samples/rust/rust_clist_c.c

    11	
    12	/* Create a list_head and populate it with items */
  > 13	struct list_head *clist_sample_create(int count)
    14	{
    15		struct list_head *head;
    16		int i;
    17	
    18		head = kmalloc(sizeof(*head), GFP_KERNEL);
    19		if (!head)
    20			return NULL;
    21	
    22		INIT_LIST_HEAD(head);
    23	
    24		/* Populate with items */
    25		for (i = 0; i < count; i++) {
    26			struct sample_item_c *item = kmalloc(sizeof(*item), GFP_KERNEL);
    27			if (!item) {
    28				pr_warn("clist_sample: Failed to allocate item %d of %d\n", i+1, count);
    29				continue;
    30			}
    31	
    32			item->value = i * 10;
    33			INIT_LIST_HEAD(&item->link);
    34			list_add_tail(&item->link, head);
    35		}
    36	
    37		return head;
    38	}
    39	
    40	/* Free the list_head and all items */
  > 41	void clist_sample_free(struct list_head *head)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
