Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4112F382;
	Thu, 13 Jun 2024 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249864; cv=none; b=TRHD0gTT5iacjXrBKFDvIuyUhS/UlKr0XV5NG9JCk1hfeJ0ij24WZAztFYy5xybel/9AXqFaA1u0SJrH7SrXSlHK1CWwckN4tLSeLdKA7IGyefOz7y2bmNQET7Q9sUOy75Haef1PQnxux36QuJYb/RqxfLfsU7HDpJqTrW8oEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249864; c=relaxed/simple;
	bh=I8z96MiLg6DdPELXoi74aAbZDZdatk2UQw3xMyehkWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XuQR+86R0vMSFd/BDOHYJ2BijidKUpPgMhMvxMr2SKAS1ubnjCTPdqVwy0uzgnmImU+oBxfoAPbRpODGqwQ76XMkJP6G+Op7JtoerASyFaSJOPVL5aT3i3ezQEIxjo+kMdhCCFCea6t9CM/7HZ+OoUS/0W8X+PHQmQG0uJNBceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOhawOv4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOhawOv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249863; x=1749785863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8z96MiLg6DdPELXoi74aAbZDZdatk2UQw3xMyehkWs=;
  b=LOhawOv4ztNEaXJRDnTWbYAbgU0TPjBJXJOm+w2OZCj99DZ2e6jmrmrb
   vAa1kA5vNJBYdhV6STMHHlmfoZF+hW3q0riLEG3UbE9iVR+WUstCyEgN3
   uc9YLV3LgKqgxDuMTk1U18xzN/4P5Jl2Hd1MAswlG/tbD9kJo0XB5na8h
   1rtFmxiFNEwzENDEZLk00cmbc97h8Jo07dEXSIplPMpBtf99KSxJ0xyfF
   BcPAVq66a9qUSlkAdxSXEdk5NQAaI2GSjxInD15zMBUiCAfEXdurS9rK2
   0oZg29uycYZeOPe0lv1bCMTDkBXMvBajsopFeCla2mpOlsDM269Ojovt2
   Q==;
X-CSE-ConnectionGUID: 4y/fpG5cQtmjKr/gGHoP+g==
X-CSE-MsgGUID: 6pvGsg3WS8q8Y5nrH7ZF/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18901583"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18901583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:37:31 -0700
X-CSE-ConnectionGUID: fZgvCaQzT2u9okH2NXveiQ==
X-CSE-MsgGUID: UH8XfKyGTrOAykcvriWU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40470098"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 20:37:30 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbHD-0002BI-0v;
	Thu, 13 Jun 2024 03:37:27 +0000
Date: Thu, 13 Jun 2024 11:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 7/7] security/keys/key.c:705:37: warning:
 format specifies type 'int' but the argument has type 'long'
Message-ID: <202406131149.L4cvaVlD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   d9163bc5bda8b6415ef960406b9bc952fa1b1b9f
commit: d9163bc5bda8b6415ef960406b9bc952fa1b1b9f [7/7] fixup
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240613/202406131149.L4cvaVlD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131149.L4cvaVlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131149.L4cvaVlD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/keys/key.c:13:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> security/keys/key.c:705:37: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     705 |                 pr_info("%s: ret=%d\n", __func__, PTR_ERR(key));
         |                                  ~~               ^~~~~~~~~~~~
         |                                  %ld
   include/linux/printk.h:537:34: note: expanded from macro 'pr_info'
     537 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +705 security/keys/key.c

   666	
   667	/*
   668	 * Find a key by its serial number.
   669	 */
   670	struct key *key_lookup(key_serial_t id)
   671	{
   672		struct rb_node *n;
   673		struct key *key;
   674	
   675		pr_info("%s: enter\n", __func__);
   676		spin_lock(&key_serial_lock);
   677	
   678		/* search the tree for the specified key */
   679		n = key_serial_tree.rb_node;
   680		while (n) {
   681			key = rb_entry(n, struct key, serial_node);
   682	
   683			if (id < key->serial)
   684				n = n->rb_left;
   685			else if (id > key->serial)
   686				n = n->rb_right;
   687			else
   688				goto found;
   689		}
   690	
   691	not_found:
   692		key = ERR_PTR(-ENOKEY);
   693		goto error;
   694	
   695	found:
   696		/* A key is allowed to be looked up only if someone still owns a
   697		 * reference to it - otherwise it's awaiting the gc.
   698		 */
   699		if (!refcount_inc_not_zero(&key->usage))
   700			goto not_found;
   701	
   702	error:
   703		spin_unlock(&key_serial_lock);
   704		if (IS_ERR(key))
 > 705			pr_info("%s: ret=%d\n", __func__, PTR_ERR(key));
   706		return key;
   707	}
   708	EXPORT_SYMBOL(key_lookup);
   709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
