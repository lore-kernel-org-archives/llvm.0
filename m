Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106A3A8CE;
	Sun,  7 Jul 2024 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720377478; cv=none; b=MgU6cffCFmNVc9KO4rdFshKSfC+89sN4SVlOUyFMlBgTxlofUpd8MCgBv4xOTDNPp/kt4h5tAPZgu5tVv4VUIDv/5zvvuC3BiecltaPyk4bsme8diyhodk8BrIQuAFsK4eawmiCtJDMD0yVKkLatPlXx7+tfTtxKKBqhp1N9aec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720377478; c=relaxed/simple;
	bh=gL+E6NT11Hk9khE3XsPQ0DCJy3G11l4s2sJ/6Svb10I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPkc8bBy0YD8PE26ZwHPuFAyKENFuoVz52lR6KervTa6BHvrVY4CxClIWIkyR6W0zL0tkiJ9/1nXWgS9UJClLf7TrN3Ugkhu/ebJaPUbOFoGSrn6YtOMouiiAFCAke7BdD9lt/vKXHYt0zKP4V6uYlCxS3NgJKlKkZo08HH2NUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXc+QxWU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXc+QxWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720377476; x=1751913476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gL+E6NT11Hk9khE3XsPQ0DCJy3G11l4s2sJ/6Svb10I=;
  b=HXc+QxWUJzT7HQ/Yn7DNFrLKg86gbHGVPZDnV1jZgHgqcYvkIN0yp1LE
   OcY83X7oHiE0qCIvO5cbR1U6bNODYvL4BvMazaFFdv8WJI1e5aC0dVvZT
   ZBU6OEUB7cwcQs4T/YOgZObyLNPHe9UHylPELajLPWllpKqJmVWrThLsQ
   g1kGfaA9H9U1MUsqCPAOGRCo41IJgnDfZ60eo/DEmXVmD6tvcAx7VPlfZ
   +H+I/ksO91aAvgJNPf3f3ciydFUbDFFwtxJsW2QKhKplodEATD26/M4Vf
   8HS6yW716IG8VfP5QCO0Hr8JLdfeE4iUWZ0LwxBwLAi6eqT9JAijlstsY
   g==;
X-CSE-ConnectionGUID: Yut+lXLsSwGMhvCd5puzkA==
X-CSE-MsgGUID: YSFYrMTLR2i1lxbr4urJAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28181275"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28181275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 11:37:55 -0700
X-CSE-ConnectionGUID: C5+U5DonS6mmX+JEz7Q7ZA==
X-CSE-MsgGUID: 0XiXXLXMSRWoaO03eh4hoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="51653701"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2024 11:37:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQWlk-000VBu-23;
	Sun, 07 Jul 2024 18:37:52 +0000
Date: Mon, 8 Jul 2024 02:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:combined_queue 4/24]
 drivers/net/ethernet/mellanox/mlxsw/item.h:221:6: warning: variable
 'be_index' is used uninitialized whenever 'if' condition is false
Message-ID: <202407080205.GiAzZkxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   ff8aee5108029aa150fba69c00891450d992c987
commit: ad44ce5de61e6ce62c21243a8dac3ec5d83bd2eb [4/24] Fixup to "mlxsw: Warn about invalid accesses to array fields" ?
config: i386-buildonly-randconfig-002-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080205.GiAzZkxA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080205.GiAzZkxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080205.GiAzZkxA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlxsw/i2c.c:15:
   In file included from drivers/net/ethernet/mellanox/mlxsw/cmd.h:7:
>> drivers/net/ethernet/mellanox/mlxsw/item.h:221:6: warning: variable 'be_index' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     221 |         if (WARN_ONCE(index > max_index,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                       "name=%s,index=%u,max_index=%u\n", item->name, index,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                       max_index))
         |                       ~~~~~~~~~~
   include/asm-generic/bug.h:152:2: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      29 |                                                                         \
         |                                                                         ~
      30 |                 if (__ONCE_LITE_IF(__ret_do_once))                      \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                         func(__VA_ARGS__);                              \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                                                                         \
         |                                                                         ~
      33 |                 unlikely(__ret_do_once);                                \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      34 |         })
         |         ~~
   drivers/net/ethernet/mellanox/mlxsw/item.h:225:11: note: uninitialized use occurs here
     225 |         offset = be_index * item->element_size >> 3;
         |                  ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/item.h:221:2: note: remove the 'if' if its condition is always true
     221 |         if (WARN_ONCE(index > max_index,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                       "name=%s,index=%u,max_index=%u\n", item->name, index,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                       max_index))
         |                       ~~~~~~~~~~~
     224 |         be_index = max_index - index;
   drivers/net/ethernet/mellanox/mlxsw/item.h:208:25: note: initialize the variable 'be_index' to silence this warning
     208 |         u16 max_index, be_index;
         |                                ^
         |                                 = 0
   1 warning generated.


vim +221 drivers/net/ethernet/mellanox/mlxsw/item.h

   203	
   204	static inline u16
   205	__mlxsw_item_bit_array_offset(const struct mlxsw_item *item,
   206				      u16 index, u8 *shift)
   207	{
   208		u16 max_index, be_index;
   209		u16 offset;		/* byte offset inside the array */
   210		u8 in_byte_index;
   211	
   212		BUG_ON(index && !item->element_size);
   213		if (item->offset % sizeof(u32) != 0 ||
   214		    BITS_PER_BYTE % item->element_size != 0) {
   215			pr_err("mlxsw: item bug (name=%s,offset=%x,element_size=%x)\n",
   216			       item->name, item->offset, item->element_size);
   217			BUG();
   218		}
   219	
   220		max_index = (item->size.bytes << 3) / item->element_size - 1;
 > 221		if (WARN_ONCE(index > max_index,
   222			      "name=%s,index=%u,max_index=%u\n", item->name, index,
   223			      max_index))
   224		be_index = max_index - index;
   225		offset = be_index * item->element_size >> 3;
   226		in_byte_index  = index % (BITS_PER_BYTE / item->element_size);
   227		*shift = in_byte_index * item->element_size;
   228	
   229		return item->offset + offset;
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
