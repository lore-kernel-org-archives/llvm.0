Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D31A5B8A;
	Sat, 23 May 2026 00:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779497528; cv=none; b=mWdo+PBWdfrGuFhqlrv2oe5ViAPLP7lomifk+2GiFVcLYeBrxABlO4Rqgq0n6SZR0gdEy7Homgl7Hw8elxOXqjPAFz0QMLiyyRC3wAC3psxU6A0OJ4xRLpV628oNq48myHJwPoJlub4jZz7eQPSFlrGq/2WzkIN1/JNfXRswNuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779497528; c=relaxed/simple;
	bh=mMKbUXhotAiM3JrCASgbl0bizLNw3atB0q/nyPLZlDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsM2bXcsHfl/VKpp2mT+UYPhStHlg9aQRtN2XCXen9gPXZUD1GpW7CkOJa5M8wAFjy6/6DGXZIgLgiWnOLJ5Xbf/bhBcUq8DqU7B4UO7HMGxbC4QTvXf3O9v7R0cFjVUiV8eddsGtVb5s4VkqzVxQ8bQ49kHbriSqB+bfDthsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxwrsbcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxwrsbcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60841F000E9;
	Sat, 23 May 2026 00:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779497527;
	bh=xQt/ftYZ853rYkzRLauQOTMPaYs6t+GxooPkj8b75dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxwrsbcZ520irmjUu+CI20HzPNzHRuVpVP+Pb5K1jBd6UqKmHTbIlzYm2fQPYivHt
	 akkgpi82bWIj8Ol0lRXpA3L/Ru6PcYNwz6L0AWbutyRJoFHnX1iRbkVporWBRzzAU+
	 9rIJTwhxBoiZrsrYlw2fYOwnADF5en8CRtUd+waTRhcvOlAkBikzFiALsfPa2yXZpS
	 5lgCLdDCPl4rr+8CISNyGR3yix6K915h8oqOinp43hF2mEiBo750lwLWfa08OetVWE
	 hvd9FkuDpgryNs23iORvwBT7CEoZJ3+mk7a/24jVbMhR2nwVb5RCJTEWp0Rqj1exw0
	 pI9buf6B486Ew==
Date: Fri, 22 May 2026 17:52:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5302/7547] fs/open.c:152:1: error: unknown
 warning group '-Wattribute-alias', ignored
Message-ID: <20260523005204.GA520407@ax162>
References: <202605220247.dQAHslyv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605220247.dQAHslyv-lkp@intel.com>

On Fri, May 22, 2026 at 02:18:49AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   550604d6c9b9efc8d068aff94dc301694a7afdee
> commit: bc5ffe737f56ee2734597069ed71f48830549483 [5302/7547] Disable -Wattribute-alias for clang-23 and newer
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605220247.dQAHslyv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> fs/open.c:152:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
>      152 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
>          | ^
>    include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
>      226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
>          |                                    ^
>    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
>      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^
>    include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
>      250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
>          |         ^
>    note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
>      135 | #define __diag_clang_23(s)      __diag(s)
>          |                                 ^
>    include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
>      132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
>          |                                 ^
>    <scratch space>:223:27: note: expanded from here
>      223 |  clang diagnostic ignored "-Wattribute-alias"
>          |                           ^

Please update your clang-23, this will be avoided with a newer version
from main that has the change that adds -Wattribute-alias.

-- 
Cheers,
Nathan
