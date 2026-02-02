Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFB1F181F;
	Mon,  2 Feb 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017313; cv=none; b=YgMKxOx/AItn260QTgj0gWRuQ4sMCIQp0Xr3yP7DVqooBUSaCSM8auolP5JPL6QkD8pO1qOcF0h/jFpz9+h1FUcBXYjK1Zk8piQkVsQT9ZiXF6KbKwOCah/16uIhP4qvVpnPMvL7YuBNag7BZnOTB9QDdtEqtINUbgyVBzpjqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017313; c=relaxed/simple;
	bh=7FEnK1iK9U0/vpOYDhLxXdciYUREFoOV4afc2hde7cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rIYhttFCLCsyp6XIc/OJe69fmwro+BDNwSmB/MpCL7/zPGmKxrOhfWwLuqFJRpSzbMnHmo6VAFgrfy1NaODOnht0Kvm5QQb1/lp/K6JIwpz8m4k6R/7oKmrAikZq/77nFVaiZhLirs136mrQooNVK2EO8QWY4eRKvUZzrTZg74o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PR2D+/Bq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PR2D+/Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770017311; x=1801553311;
  h=date:from:to:cc:subject:message-id;
  bh=7FEnK1iK9U0/vpOYDhLxXdciYUREFoOV4afc2hde7cs=;
  b=PR2D+/Bqmd0RmYk16n14a1KC9CWL8YXBUtqou8WiRetJAg0uvS0B9WPd
   zhcF3/0G7ZdkxSl+7gvTr01E/VPSq5JR2gAdNeOf9x4vob0TSteSbtcS4
   owgdtErirUxK6pXi8q8zz+ufiVJIqs0qHyZabGAkM4rRySLsGlywfK9vK
   9//07W525CL4ghl8y5GI+NZycF4DD+eIn3sZmkD6glEQN/Wb+qh0JY+XA
   mKtSvHhl0/PLSdwNSV2G6YCK0cwvu7scaxl/V3zYk1Ts6B+2/2CXgpmHT
   r18ogF2GsCbqrnsDnAyfqc8bUgg9xE/MnUTyIg9eHNZqEjwVEw36q0PAQ
   A==;
X-CSE-ConnectionGUID: NNnDKKtJTTWFWakaVyC/vw==
X-CSE-MsgGUID: rhvO27UiSwS0KCyw1segyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70188697"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="70188697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 23:28:30 -0800
X-CSE-ConnectionGUID: dFGrqmzYRq66CXplJaSe6A==
X-CSE-MsgGUID: a5qLonY2RxiInSvUD743Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="209624351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Feb 2026 23:28:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmoME-00000000fJk-1FUN;
	Mon, 02 Feb 2026 07:28:26 +0000
Date: Mon, 02 Feb 2026 15:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 10/29]
 security/apparmor/policy_unpack.c:548:13: warning: format specifies type
 'long' but the argument has type 'int'
Message-ID: <202602021510.JPzX5zKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: 3d28e2397af7a89ac3de33c686ed404cda59b5d5 [10/29] apparmor: add support loading per permission tagging
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260202/202602021510.JPzX5zKb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021510.JPzX5zKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021510.JPzX5zKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/policy_unpack.c:477:7: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     476 |                                          "starting with null save=%lu size %d c=%d",
         |                                                                   ~~~
         |                                                                   %d
     477 |                                          str - save, size, c);
         |                                          ^~~~~~~~~~
   security/apparmor/include/lib.h:45:48: note: expanded from macro 'AA_DEBUG'
      45 |                         pr_warn_ratelimited("%s: " fmt, __func__, ##args); \
         |                                                    ~~~              ^~~~
   include/linux/printk.h:722:49: note: expanded from macro 'pr_warn_ratelimited'
     722 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:706:17: note: expanded from macro 'printk_ratelimited'
     706 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> security/apparmor/policy_unpack.c:548:13: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     547 |                                 AA_DEBUG(DEBUG_UNPACK, "process_strs %d i %d pos %ld",
         |                                                                                  ~~~
         |                                                                                  %d
     548 |                                          c, i, e->pos - saved_pos);
         |                                                ^~~~~~~~~~~~~~~~~~
   security/apparmor/include/lib.h:45:48: note: expanded from macro 'AA_DEBUG'
      45 |                         pr_warn_ratelimited("%s: " fmt, __func__, ##args); \
         |                                                    ~~~              ^~~~
   include/linux/printk.h:722:49: note: expanded from macro 'pr_warn_ratelimited'
     722 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:706:17: note: expanded from macro 'printk_ratelimited'
     706 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +548 security/apparmor/policy_unpack.c

   501	
   502	/**
   503	 * unpack_strs_table - unpack a profile transition table
   504	 * @e: serialized data extent information  (NOT NULL)
   505	 * @name: name of table (MAY BE NULL)
   506	 * @multi: allow multiple strings on a single entry
   507	 * @strs: str table to unpack to (NOT NULL)
   508	 *
   509	 * Returns: 0 if table successfully unpacked or not present, else error
   510	 */
   511	static int unpack_strs_table(struct aa_ext *e, const char *name, bool multi,
   512				      struct aa_str_table *strs)
   513	{
   514		void *saved_pos = e->pos;
   515		struct aa_str_table_ent *table = NULL;
   516		int error = -EPROTO;
   517	
   518		/* exec table is optional */
   519		if (aa_unpack_nameX(e, AA_STRUCT, name)) {
   520			u16 size;
   521			int i;
   522	
   523			if (!aa_unpack_array(e, NULL, &size))
   524				/*
   525				 * Note: index into trans table array is a max
   526				 * of 2^24, but unpack array can only unpack
   527				 * an array of 2^16 in size atm so no need
   528				 * for size check here
   529				 */
   530				goto fail;
   531			table = kcalloc(size, sizeof(struct aa_str_table_ent),
   532					GFP_KERNEL);
   533			if (!table) {
   534				error = -ENOMEM;
   535				goto fail;
   536			}
   537			strs->table = table;
   538			strs->size = size;
   539			for (i = 0; i < size; i++) {
   540				char *str;
   541				int c, size2 = aa_unpack_strdup(e, &str, NULL);
   542				/* aa_unpack_strdup verifies that the last character is
   543				 * null termination byte.
   544				 */
   545				c = process_strs_entry(str, size2, multi);
   546				if (c <= 0) {
   547					AA_DEBUG(DEBUG_UNPACK, "process_strs %d i %d pos %ld",
 > 548						 c, i, e->pos - saved_pos);
   549					goto fail;
   550				}
   551				if (!multi && c > 1) {
   552					AA_DEBUG(DEBUG_UNPACK, "!multi && c > 1");
   553					/* fail - all other cases with embedded \0 */
   554					goto fail;
   555				}
   556				table[i].strs = str;
   557				table[i].count = c;
   558				table[i].size = size2;
   559			}
   560			if (!aa_unpack_nameX(e, AA_ARRAYEND, NULL))
   561				goto fail;
   562			if (!aa_unpack_nameX(e, AA_STRUCTEND, NULL))
   563				goto fail;
   564		}
   565		return 0;
   566	
   567	fail:
   568		aa_destroy_str_table(strs);
   569		e->pos = saved_pos;
   570		return error;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
