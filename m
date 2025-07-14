Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCF18D;
	Mon, 14 Jul 2025 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752469779; cv=none; b=bS60JEZXn7yt2gHOAFcUm0PcNylVpE3jrIoO9m7jUjxwJzGu1bQI40rkschwTDvFK+W6+1aqySeZouVbCu/z8TVQaUTYStorsniGVuaeL3Uka7oNa0eM251ntSW871RJud/7Ohcd1gD5vweQe4yxybdnFftNN/Ag7phdMrg8wk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752469779; c=relaxed/simple;
	bh=psl5+NNH3QSt0iJpQKG3aRrxaJiecgERRczmcezv+Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apvzmt2eeKEaSxNP9f7qy4hUk4mleDf/jd5A08yMvH1re5IZwrWArR+xZ41h01hWvZ1Ep3sOE7EyU73XEaZpZko68y+KGbX2wEGIMIjC4revB4Ulbspqt7I4BECzuT3MjaMXDyMDQsn7fuC3osvWQTzcbCGu4glFKVG1hke1SEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVf2d80a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVf2d80a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F03C4CEED;
	Mon, 14 Jul 2025 05:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752469777;
	bh=psl5+NNH3QSt0iJpQKG3aRrxaJiecgERRczmcezv+Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVf2d80aF/q+49AhuOGyQmN6q55YPjlyxDqxXaN0jrhPQvsWitUKdA8gLInFVpL4o
	 tBLYoKbOgIBLbjUcliZJYK4iIotnmndZB36Lvg7Jnu+8UrVfDwUIs4eUrqDgx12Xpj
	 X42BdiZ0r3RA+3YdOYpgn5Lkq3+ZcVo4NaIFvp8K208jgI3Qz7D0Zpl1myMuYcpeog
	 v+E9MkL/sG3YxrH+r6tp0pQL9H1uAffUxJ3lQj1zG6ldEtmtGyPo3ctbhdF45vy6H9
	 S/pAmQVulqkHlEpLE1oqvJvXLEquBtcDCxeX/YPgLwZtv/xpEKVgP6AHe8xm97Kye+
	 jAwoD3yzgOTMA==
Date: Sun, 13 Jul 2025 22:08:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [linux-next:master 7655/9053] ERROR: modpost:
 "poly1305_blocks_neon" [lib/crypto/arm/poly1305-arm.ko] undefined!
Message-ID: <20250714050851.GA12209@sol>
References: <202507141028.RRqiNRMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507141028.RRqiNRMz-lkp@intel.com>

On Mon, Jul 14, 2025 at 10:23:40AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
> commit: 16f9e0cc99ec320a806fd2c80e2a83ed4c269ddc [7655/9053] lib/crypto: arm/poly1305: Remove unneeded empty weak function
> config: arm-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507141028.RRqiNRMz-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141028.RRqiNRMz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507141028.RRqiNRMz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "poly1305_blocks_neon" [lib/crypto/arm/poly1305-arm.ko] undefined!
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This was reported earlier here:
https://lore.kernel.org/r/20250711072404.2629868-1-arnd@kernel.org
and fixed by replacing the commit with this one:
https://lore.kernel.org/r/20250711212822.6372-1-ebiggers@kernel.org

- Eric
