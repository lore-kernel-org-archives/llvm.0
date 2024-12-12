Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451F1DB375;
	Thu, 12 Dec 2024 21:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039526; cv=none; b=NDYhEmo+5gZ8JponzZp07je8z0I8qayXfiFRuDrFp0YmQq/j9vF9c70slU8TyzDSc2r7aTh2YG8QZnl4U/LarDWr05ZOfl+9tr8Sa/PmiGlALgrT1i9H+ek+EYPawE4BCX99DNsl3xKQ3F+1H2Qi2MD0AIDu5kiQ7G1sqTitNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039526; c=relaxed/simple;
	bh=e9DmC62DGQBYREdykpzBJfhhRg8VjFjNDnxf8thgKnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WowT9vmXvboOotB7KXn3K3sYzkRpyAbT5utzjDDD4kVvTj5Td+y4jytCW4nq19hESngfCne02sqCNfkfo3wayPVLcHiI0ZeDsGMbc0LvyW2+Ljqdrg+UFDoLQ+64e05AIG75QML0XSqcKXQ3SNKTwi76FuE5p7z+X73WNuO/IdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYQ1jhkk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYQ1jhkk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734039525; x=1765575525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9DmC62DGQBYREdykpzBJfhhRg8VjFjNDnxf8thgKnM=;
  b=OYQ1jhkkaqkwNM/MNAN1kMMtm+JRnN4lJPzx6bJy17KVb/rSe6AXW3sb
   s41BOZju9w3ttmKiQSlIgYJd8p/Tm2FmT8Q+MljJm/fGn7KppI4EkDOVh
   o4+DEVbfVr2qoYRk+Y1/PPZIsrMwyJrN5sLMg5OWz12UsemxkH7ep6Rte
   be3NsmzMbxSwj20zylNED91jCObtiY3t7e7JIsIysMJUy1AxlWPzIepLQ
   l2HVWaxt3M4HOjDzh3VCSIlqcrWka6LqcdN0z/O6IHme4oOvagbjqCPN+
   bR3QGauNiTRGoRPyCa4ReAZkogGFUYeWYGZHK38Iha5j/D0ZPckr8sX8g
   Q==;
X-CSE-ConnectionGUID: eguHgTvPSTyNGgffwduuNQ==
X-CSE-MsgGUID: Ex2qXqiFSNOVkuzU/vyskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44953365"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="44953365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 13:38:44 -0800
X-CSE-ConnectionGUID: QjLruauJRySxbtoKn5n+wQ==
X-CSE-MsgGUID: jWPKtU2/SvWXx4Hm7AzVjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133726788"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2024 13:38:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLqtL-000BOX-2S;
	Thu, 12 Dec 2024 21:38:39 +0000
Date: Fri, 13 Dec 2024 05:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [rust:staging/rust-pci 7/11] rust/helpers/io.c:12:17: error: passing
 'volatile void *' to parameter of type 'void *' discards qualifiers
Message-ID: <202412130534.HFYPTOBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-pci
head:   255cfcd4635cfca2732843557eace438918e6bec
commit: 685c3110658f6b63d93efbcab74763b7e486a333 [7/11] rust: add `io::{Io, IoRaw}` base types
config: um-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130534.HFYPTOBJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130534.HFYPTOBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130534.HFYPTOBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:17:
>> rust/helpers/io.c:12:17: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return iounmap(addr);
                          ^~~~
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   static inline void iounmap(void __iomem *addr)
                                            ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:194: rust/helpers/helpers.o] Error 1 shuffle=3716242076
>> rust/helpers/io.c:12:17: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   make[3]: *** [rust/Makefile:317: rust/bindings/bindings_helpers_generated.rs] Error 101 shuffle=3716242076
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare] Error 2 shuffle=3716242076
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3716242076
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3716242076
   make: Target 'prepare' not remade because of errors.


vim +12 rust/helpers/io.c

     9	
    10	void rust_helper_iounmap(volatile void __iomem *addr)
    11	{
  > 12		return iounmap(addr);
    13	}
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
