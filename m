Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B342A9D;
	Mon, 16 Sep 2024 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477030; cv=none; b=BulMV+7Gix93sDr1c4Y6pkRI6GJIEemTBThHiDK/KmxM/ejWLQBV/8B2D+sNokaKLj7NTgMWmyliMkmjk3RA0HR7cDdUocPIJ2C9D7mtRhbB8RLfPq4+4i7JqDJIFh3796omWdu2typ5EJhyOoFfXewfgWHKd+uc9qG9VVLZJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477030; c=relaxed/simple;
	bh=ekIfkTBH1YkKfcfFqoPdycnczXkAzZOROa7HJSmDzKM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=TwNxm7sA1tGpnU5JYnXeaxDEFqO/I14liIMiFYR0SOSH58htVA3KvlTFNeMOP7QhVtSe2yjFZlEaCU74sEdsGm0xQ6M/gp5JqKBnu1RnloyGQjnk+Bhi+CblWwDZK3zllajr7sdc7WIc/C45MFRKreQNkGFWvIw35Q7cNIIucu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnTBfkLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnTBfkLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F93C4CED0;
	Mon, 16 Sep 2024 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726477029;
	bh=ekIfkTBH1YkKfcfFqoPdycnczXkAzZOROa7HJSmDzKM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fnTBfkLxLu3qBcEtw+wbiixzC8iKnms2d7ERZXaPKqt1+zT1GIY/z9lpjK4W9KS93
	 juHSdMjcW9a8V3qLs6evE7lXRYn4QR68tCjQje78EzROzxPXo3r6K8Ryl6ZOOjT+6z
	 TOSOMkL1Q2pGHDu03e7WwazEfXNJ1rNcSNP67HZWuQ7/lPNuXJ85c6VLkpLmIzQtwe
	 I/WSCOxBK3SADE+1dJzXqEKxwGfSBPzV+JS0xcbVmKVlQpvUEF3zwvG9tyI98RO73X
	 m0ugKDBq5bppHTqOfxeNoKYLU2csbQCCG1AjSTX+x1wFYD4OEYaXZeRnyfUOF94uQr
	 c68Ssqu662iFw==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Sriram R <quic_srirrama@quicinc.com>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Jeff Johnson <jjohnson@kernel.org>,
  ath12k@lists.infradead.org,  Kalle Valo <quic_kvalo@quicinc.com>,
  Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo 38/63]
 drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable 'ret' is
 uninitialized when used here
References: <202409151853.OfodBWj3-lkp@intel.com>
Date: Mon, 16 Sep 2024 11:57:05 +0300
In-Reply-To: <202409151853.OfodBWj3-lkp@intel.com> (kernel test robot's
	message of "Sun, 15 Sep 2024 18:30:54 +0800")
Message-ID: <87ed5kdli6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
> head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
> commit: 0b9b7a1eece8952bde6e7f3c764e20a5ee11d3f7 [38/63] wifi: ath12k:
> modify link arvif creation and removal for MLO
> config: x86_64-allyesconfig
> (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151853.OfodBWj3-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable
> 'ret' is uninitialized when used here [-Wuninitialized]
>     3981 |                         if (ret)
>          |                             ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:3931:9: note: initialize the variable 'ret' to silence this warning
>     3931 |         int ret;
>          |                ^
>          |                 = 0
>    drivers/net/wireless/ath/ath12k/mac.c:4434:8: warning: variable
> 'ret' is used uninitialized whenever 'if' condition is true
> [-Wsometimes-uninitialized]
>     4434 |                         if (WARN_ON(!arvif))
>          |                             ^~~~~~~~~~~~~~~
>    include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
>      122 | #define WARN_ON(condition) ({                                           \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      123 |         int __ret_warn_on = !!(condition);                              \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      124 |         if (unlikely(__ret_warn_on))                                    \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      125 |                 __WARN();                                               \
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      126 |         unlikely(__ret_warn_on);                                        \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      127 | })
>          | ~~
>    drivers/net/wireless/ath/ath12k/mac.c:4467:9: note: uninitialized use occurs here
>     4467 |         return ret;
>          |                ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:4434:4: note: remove the 'if' if its condition is always false
>     4434 |                         if (WARN_ON(!arvif))
>          |                         ^~~~~~~~~~~~~~~~~~~~
>     4435 |                                 goto out;
>          |                                 ~~~~~~~~
>    drivers/net/wireless/ath/ath12k/mac.c:4390:9: note: initialize the variable 'ret' to silence this warning
>     4390 |         int ret;
>          |                ^
>          |                 = 0
>    drivers/net/wireless/ath/ath12k/mac.c:9114:8: warning: variable
> 'ret' is uninitialized when used here [-Wuninitialized]
>     9114 |                         if (ret) {
>          |                             ^~~
>    drivers/net/wireless/ath/ath12k/mac.c:9068:9: note: initialize the variable 'ret' to silence this warning
>     9068 |         int ret;
>          |                ^
>          |                 = 0
>    3 warnings generated.

Fixed these as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
