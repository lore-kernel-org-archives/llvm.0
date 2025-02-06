Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85CF226558;
	Thu,  6 Feb 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836653; cv=none; b=nOaVlQr9vjqM7BIR/IVczB0IWDUk0Ip0qtwh6bCukq+9FvEpV85fb59+ZDZfdFa2hflsRKN4x/yN9aDB2tqsSse1HwRVWCieXidE3mxt2GuU9BGwSLp8aONRWj4cNkFicnN7mpG+QVejllBMHSzTWTlfN9rWj7iPrBE4D93RmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836653; c=relaxed/simple;
	bh=zCjHUjcZrNNQyE/G00F8WoidXYqBgh6Qqa5j1GKT3q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKdzEhAhm0CuksHpAM6EuxkwIQ+VLmIZk023rS4lib6+eloslM8p3cF5yiZzi8kYv8YOtkBqj5U7sQaEQeohmlt/HIngPgm7oUAz1VFnTHXl0JI1xz4udTmYRrBr70I2YNmL031g/8qkxw+Jccx/YNYqyjwcrAo6i3hyLH/t6HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCfVNref; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCfVNref"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1360EC4CEE0;
	Thu,  6 Feb 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738836653;
	bh=zCjHUjcZrNNQyE/G00F8WoidXYqBgh6Qqa5j1GKT3q4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tCfVNrefN+47cl/W2ip4YiHpINwNi5H3fE8mcllZ18IcnSxGanI61ZV1tNeN3XReO
	 aRJmmQzwftIpNACJaevVoTqM2t79rtU4LOynE3BUcWmxj/KVSYzeEcgII2DYFvPWRw
	 Mk352BOabnLLesMyDX7RuBlGGkBbjfqjzgntblQcnnku82H7kJKDZMDA7UubL65uGW
	 P2O6iUNTW/qRpF15cKursZVU7YMtl2lpE4DXj88sYym1f1HXzAS+FIzjRa0vg2FJ3/
	 8FX8mKUDIuHu1RCqLgvw3oEI+b0ElbaUZUJKt3kWcODsR99XvbgYMbugYei+OMsZh2
	 GK0zCdHivGIvg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A1EA3CE0809; Thu,  6 Feb 2025 02:10:52 -0800 (PST)
Date: Thu, 6 Feb 2025 02:10:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.01.30a 71/73]
 include/linux/printk.h:319:13: error: unused function 'pr_flush'
Message-ID: <ca8a75a8-b6cd-41b6-bc9b-3a56e4452184@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502061107.63OiEuce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502061107.63OiEuce-lkp@intel.com>

On Thu, Feb 06, 2025 at 12:00:41PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.01.30a
> head:   a87cfdd8dfd5499a8b2e29a40ce4ad6ffca6eb56
> commit: 1edbc527e3d6610b4781edba8e927ebca102eaf6 [71/73] fixup! printk: Flush console log from kernel_power_off()
> config: um-randconfig-001-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061107.63OiEuce-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061107.63OiEuce-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502061107.63OiEuce-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from lib/test_bitops.c:10:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:56:
>    In file included from include/linux/preempt.h:79:
>    In file included from ./arch/um/include/generated/asm/preempt.h:1:
>    In file included from include/asm-generic/preempt.h:5:
>    In file included from include/linux/thread_info.h:13:
>    In file included from include/linux/bug.h:5:
>    In file included from ./arch/um/include/generated/asm/bug.h:1:
>    In file included from include/asm-generic/bug.h:22:
> >> include/linux/printk.h:319:13: error: unused function 'pr_flush' [-Werror,-Wunused-function]
>    static bool pr_flush(int timeout_ms, bool reset_on_progress)
>                ^
>    1 error generated.
> 
> 
> vim +/pr_flush +319 include/linux/printk.h
> 
>    318	
>  > 319	static bool pr_flush(int timeout_ms, bool reset_on_progress)

This needs an "inline", good catch, will fix, thank you!

							Thanx, Paul

>    320	{
>    321		return true;
>    322	}
>    323	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
