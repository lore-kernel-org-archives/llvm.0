Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE261B87FB;
	Fri, 28 Feb 2025 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740772416; cv=none; b=h7SX03x1K2ZeXp/uclScdO+2P3cgnU4IcdPfelt9lNT6P1YsDwJTLClzfCEC8MrbMSxxMv0PrTUxoy0c/eqo83xbeUYRX6Bqdoq5og+bv7pRa7CFDYa9wMobwUy59ajbaMpu1Iha10UWWBQXKtsrfG1Bl8GNAaOxSTfIjCGjPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740772416; c=relaxed/simple;
	bh=+DUIYa6vjWv891kFYdjtFoGrbTSVkf2hjfgT5N5bSiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/KIZc1gkPL/OX+iKgweVdmke9PdKzAP1FQxLM+GICwbGjupDM2E1f9+Wyg4XlJy+778CxwrsumAw0OvRdTFq02SLk8/yIOVwWz3WrKnhzYDQDwqfuqyUNZMHSkgcMY/SEXk+SNhI4rFwEZ57MlaCNVMXPiGd6+qBIyKcTbUnHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqCO/CxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqCO/CxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5530FC4CED6;
	Fri, 28 Feb 2025 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740772415;
	bh=+DUIYa6vjWv891kFYdjtFoGrbTSVkf2hjfgT5N5bSiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqCO/CxQqEUOoWh3LrFbVGKXPRa1vCIlYYVAitQG0nt+M5BChKXhGFJKn9L17ub2M
	 KUy9FzY57d0t9VgZ7V5Bt94n6LAWWCFkhUcvhV+TenaVwRdFsJCZ6K/4B26o+xJXs4
	 OdX/yyPaFie6gT5sv14UUcr+3Hjlt5CKJknFlVXAVO14azTcz9zJkcqwXrc5SVURmk
	 l2jOvyYCyGhNYFm4CcAB4Qohyehimwkq63UZ8+AEjc4et8sI3JGOhJjuts5aZOjERy
	 9Do+eaI0AvP0VhoB7/Jhlg7u/aD2/DgpL3nMvCmMTHL6yKVCHdxy0ITFAs8IiFPSlw
	 0i6zc9wkrcsaw==
Date: Fri, 28 Feb 2025 11:53:32 -0800
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 2690/5524] lib/tests/bitfield_kunit.c:119:13:
 warning: implicit conversion from 'unsigned long long' to 'unsigned int'
 changes value from 9223372036854775808 to 0
Message-ID: <202502281152.2FFB28E@keescook>
References: <202502281153.TG2XK5SI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502281153.TG2XK5SI-lkp@intel.com>

On Fri, Feb 28, 2025 at 11:54:32AM +0800, kernel test robot wrote:
> Hi Kees,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> commit: 0ef71a1dc3a5355f229e2869e97de94e8e7ec7d0 [2690/5524] Merge branch 'for-next/hardening' into for-next/kspp
> config: powerpc-randconfig-003-20250228 (https://download.01.org/0day-ci/archive/20250228/202502281153.TG2XK5SI-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281153.TG2XK5SI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502281153.TG2XK5SI-lkp@intel.com/

This uncovered a circular header dependency, and should now be fixed
with:
https://lore.kernel.org/lkml/20250228195019.work.296-kees@kernel.org/

Thanks for the report!

-Kees

-- 
Kees Cook
