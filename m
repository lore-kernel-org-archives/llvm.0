Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7052115A842;
	Mon,  9 Dec 2024 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720989; cv=none; b=ozpI98ubQmlI2sv75z+OMfZq8dUkhTK/2tgmYavtEeyote73LuEPX4n+G3kyXWeqPK24D7i7kI7KL6YmBSS7RMMDyB4etpOZrROhYIG6Y/oX8fy7khpQjTIpLNyCEbV2cRwDwTvAeFirwyhwZQux36x92uSFW7Qv6fWAWVV46nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720989; c=relaxed/simple;
	bh=qarSG/Xlsa2PChZEa3NjRcGB+cNCc51vkdcp8HxhR8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6DG0wZHPRd1w5KltjvY8TxwVKi0Dr+ZP4eor5D9TPAg175fdNG8civKJQE6CUMZ4kP+AgCiIDlT35uJlYAmxpvbrPyI9R1PnzZTXzTA1smiNogCGskELBkLZla0VXdZmiBQ9XCXbzk1BddDc87GaV1dJKQtFmXp4AEW9QGCvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnbzrlCu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnbzrlCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720987; x=1765256987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qarSG/Xlsa2PChZEa3NjRcGB+cNCc51vkdcp8HxhR8U=;
  b=PnbzrlCuw6L/pzLrH/vHem7o61D2xn6aq+TNhX4qPfh1E9TMZiEGYi5r
   SEWVnSadxx2co12BXBor19SEj3erJv0du9478DrHafoHK3VxKF1x7CBOQ
   S75On2z7Dx6rjsGTJH5rMBOkYoCgomOsfTpfKzQjrmOgBpHOVQyeG/Tnl
   Z9Z3o8JhxYKdN94mOTu/jwEONLTBDOlgwoXyM3v7+At77jqqCXspOnrW+
   XpR0v7N1VZFmbkaAx5L0xkzb4atvjEpfplnnFWP16r7/dBkmn/NlqGedT
   XbjFmiY8kVwqr4xN5p/Q05dRPHXZe5+3wQQX3JU8zWL64aLz/9xdp3aUp
   w==;
X-CSE-ConnectionGUID: gRRAz0MmTLuhxZXHkf2WKg==
X-CSE-MsgGUID: 61IZTWJeTpy5weQnWFXUSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37683983"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37683983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: CAC8SyyPToKePDqcyIl4Zw==
X-CSE-MsgGUID: qCK9x+ZSRguKvk7mjtsWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125806855"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yC-0Z;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Roger L. Beckermeyer III" <beckerlee3@gmail.com>,
	linux-btrfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Roger L. Beckermeyer III" <beckerlee3@gmail.com>
Subject: Re: [PATCH] btrfs: edits tree_insert() to use rb helpers
Message-ID: <202412091004.4vQ7P5Kl-lkp@intel.com>
References: <5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3@gmail.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.13-rc2 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-L-Beckermeyer-III/btrfs-edits-tree_insert-to-use-rb-helpers/20241209-064230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3%40gmail.com
patch subject: [PATCH] btrfs: edits tree_insert() to use rb helpers
config: i386-buildonly-randconfig-003-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091004.4vQ7P5Kl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091004.4vQ7P5Kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091004.4vQ7P5Kl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/delayed-ref.c:10:
   In file included from fs/btrfs/ctree.h:10:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/btrfs/delayed-ref.c:342:10: error: call to undeclared function 'rb_find_add_cached'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     342 |         exist = rb_find_add_cached(node, root, comp_refs_node);
         |                 ^
>> fs/btrfs/delayed-ref.c:342:8: error: incompatible integer to pointer conversion assigning to 'struct rb_node *' from 'int' [-Wint-conversion]
     342 |         exist = rb_find_add_cached(node, root, comp_refs_node);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/rb_find_add_cached +342 fs/btrfs/delayed-ref.c

   334	
   335	static struct btrfs_delayed_ref_node* tree_insert(struct rb_root_cached *root,
   336			struct btrfs_delayed_ref_node *ins)
   337	{
   338		struct rb_node *node = &ins->ref_node;
   339		struct rb_node *exist;
   340		struct btrfs_delayed_ref_node *entry;
   341	
 > 342		exist = rb_find_add_cached(node, root, comp_refs_node);
   343		if (exist != NULL) {
   344			entry = rb_entry(exist, struct btrfs_delayed_ref_node, ref_node);
   345			return entry;
   346		}
   347		return NULL;
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
