Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DCA3D6495;
	Wed, 21 Jan 2026 23:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037205; cv=none; b=ip3WHeAdGx6Drt6gOxuGpNpUgckB+O4DIc6JlKTK6Pxl0Xz7BscApRQt4wRuoJY49PnBk9rsbzguTr8dGuG2pBuUMRDDIn+FzUgFu1R6yxY8AANLevFVnFPzY4MRXwQ8zukUmTw0jfjzIgzlbkFkBIxrzLPWJ0+9xNGL49KONZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037205; c=relaxed/simple;
	bh=/Gk8YE/RpZeYyK+0Zp3bB4piIJP7T4NK9Q4ye9Im8Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByfFA5PdnjKjWHBwA78FY6AaR/3DE7Jevui8gCVuLnYvmoJYtAufbyOB4Gez7vGr4gLQUB204Jad0xbzZqTFeFXRmqPSW7NEuIeCa9m/OvmpGr/Bf6/UlyLvz1U891+yDxEokV8hHTE2X8ZiU4rAMXhCOpqUm37hZS1JHP25RgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMZbWtEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMZbWtEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AF2C4CEF1;
	Wed, 21 Jan 2026 23:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769037204;
	bh=/Gk8YE/RpZeYyK+0Zp3bB4piIJP7T4NK9Q4ye9Im8Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMZbWtEz0HMRQjV0/JOhK6ctFcqFdD1JF9EGgZ7F2V+/ZRhnAhvWdUemm+G+bz42d
	 fu5SaNuuRMJmJidMuuoFechGdJCYTZEhU+5ns503VQ3ffad1JLMVDhTbPq4PgUVMdl
	 PmrkMhZhjiZPyz4GBq7w14dXbuVhxN7Mz7VQMtslB7BJdHIbdkClI1t6DLTdSN4oyz
	 BnkBogj81pLS/uVyRZwzpf6WTtnTKK2jsoGtpLjvSY3CQn1ZqTQvlAAzf0x0jN4zXD
	 qIs74eshcl8bbaAansZ1JkvrAV3U6xTGRcrPuFSOutANEKex+hhQ5X3XxDa9/E0eJG
	 xG/SuO/rygAYg==
Date: Wed, 21 Jan 2026 16:13:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <20260121231321.GB2625738@ax162>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162110.K1eWGORM-lkp@intel.com>
 <aW-_eIjcRp7VM0bt@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-_eIjcRp7VM0bt@redhat.com>

On Tue, Jan 20, 2026 at 12:46:32PM -0500, Brian Masney wrote:
> On Fri, Jan 16, 2026 at 09:20:36PM +0800, kernel test robot wrote:
> > Hi Brian,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
> > base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> > patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
> > patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> > config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601162110.K1eWGORM-lkp@intel.com/
> 
> None of the errors in this report appear to be due to the changes that
> I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
> architectures instead of just MIPS.

Well, it is just the fact that this code is now compiled on all
architectures via CONFIG_COMPILE_TEST, right? asm/traps.h is an
architecture specific header, which might not work when used outside of
arch/${SRCARCH}. In this case, x86's traps.h is used for arch/um but
arch/um has never used this header before because all generic uses are
gated on specific architectures like in this case.

Is this header needed when compile testing or could it be gated on
CONFIG_MIPS?

Cheers,
Nathan
