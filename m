Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46891368;
	Wed, 17 Jul 2024 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721179977; cv=none; b=UOqCt/F2qRYr2YORuYmmUnS7SQmQ77N+30Wk3gJ8WCeVuZlLuvFInV2Nrjm+/Oik8UbDVJYvQf22Eh37RygYn3IPDjpigo/cAuCkRnGGa6QYNnTEZjM/HvTWa8lTv0RG5Qzy15/vKB4dti6LuWsqaBzfSJk2lHfBCAq4utb2SH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721179977; c=relaxed/simple;
	bh=UqPB/Yyj33NeItcheM6+8RGr2p3xNDvxWadC14t9mZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLab64H1/Q0oivozwEyUjpO9UTF+j3uDBY92nQJCf3Y9XaDMCHxhtE2DLKqeqHUUc8cmLqRKivSkWa3zI4MIiC5SSd6TDiuWZ9pXvMS/31awLua9FDFdblSt91JPjaYCA5SR11Ru6c9z2jZ3Ao/FYZGSomPyfBTF8oO2+j0GZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McuWuCZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McuWuCZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D558C116B1;
	Wed, 17 Jul 2024 01:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721179976;
	bh=UqPB/Yyj33NeItcheM6+8RGr2p3xNDvxWadC14t9mZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McuWuCZfnS5+7Xy6u/N+SeAocvLwrnAQDq4kn8sYyfLlq3jEmAmMKbeiY6xbNfAn8
	 srUh7LDV1ddD+gBKYnNydGwtKfX6dzm0qWdOr59ZwYTWxKq3IHI4KJG5bLVrvSIs3Z
	 GFQ6OZETU6fZCZSpw3rF554VI4+QVcgmwxEYXXzFIwEZWpWeQp6LDpxg+pLmzJm9s6
	 d/BzZJXzVuQiVR1R/Kw0NiXcAIqiv5k5Zk34wjuoBE/TRob3wZPn+yUbrDPMNfwxuH
	 c+v9wwDl7hMAfJprQrGW21cxIc/V+djImzW+jSBlFyBJyXm89TJ6O/qZPgCWAP5npN
	 55UAFERyHG8MA==
Date: Tue, 16 Jul 2024 18:32:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [linux-next:master 12947/13217]
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1088:6: error: call to
 '__compiletime_assert_749' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <20240717013254.GA683176@thelio-3990X>
References: <202407170432.dYJQOWVz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407170432.dYJQOWVz-lkp@intel.com>

On Wed, Jul 17, 2024 at 04:11:02AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4f40be61af99a67d5580c1448acd9b74c0376389
> commit: 0cb4c0a13723ef6dd06be8f913443897a0ffccb5 [12947/13217] eth: fbnic: Implement Rx queue alloc/start/stop/free
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407170432.dYJQOWVz-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170432.dYJQOWVz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407170432.dYJQOWVz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
...
> >> drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1088:6: error: call to '__compiletime_assert_749' declared with 'error' attribute: FIELD_PREP: value too large for the field
>     1088 |             FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
>          |             ^
>    include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
>      115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
>          |                 ^
>    include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
>       68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>          |                 ^
>    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
>      498 |         __compiletime_assert(condition, msg, prefix, suffix)
>          |         ^
>    include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
>      491 |                         prefix ## suffix();                             \
>          |                         ^
>    <scratch space>:8:1: note: expanded from here
>        8 | __compiletime_assert_749
>          | ^
>    17 warnings and 1 error generated.

FWIW, this does not appear to be clang specific, it reproduces with GCC
as well:

$ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390-linux- allmodconfig drivers/net/ethernet/meta/fbnic/fbnic_txrx.o
In file included from <command-line>:
In function 'fbnic_config_drop_mode_rcq',
    inlined from 'fbnic_enable' at drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1836:4:
include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_944' declared with attribute error: FIELD_PREP: value too large for the field
  510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
  491 |                         prefix ## suffix();                             \
      |                         ^~~~~~
include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
  510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
      |                 ^~~~~~~~~~~~~~~~
include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
  115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
      |                 ^~~~~~~~~~~~~~~~
drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1773:13: note: in expansion of macro 'FIELD_PREP'
 1773 |             FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
      |             ^~~~~~~~~~
...

Cheers,
Nathan
