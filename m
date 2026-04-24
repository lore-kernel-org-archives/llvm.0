Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FA2BDC13;
	Fri, 24 Apr 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051167; cv=none; b=m1NnscFmCe0Mwo0KFy7KTBsm0nwHLcTkPGkz3pEpHxZWnTMRy9/JsGeHO1pNj8wtsCXDusV6UEEx+SK2LWQe8KTvXLa8IqsVpk/JW1+bIUyX6P8+PllRiBk2QgAg2KyAO4s6d4Zb05vL1eLKrV3f9/63Hdz734L5x+ZN+ygqnzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051167; c=relaxed/simple;
	bh=iLIQH2LsU9DvL/nSrF9YsVkJujic5KWz9utqCDyV5uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZ0h7KTWocah8MCpWk0zwsz7qi+8tU4tpy4bisf0Ptp08gmQCGchl7bb/MARE3gCrHVnFW4xpITF0BOcxo+dB/BuYa1X/7QUJlb73pmiTL7Rv5P+dxVEaZ4OQSmJsEgrmTJ7YAvJIAg1nrfLJSuH//GKYT1Aif3GwzhYpzIm6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWqvpMS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWqvpMS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE8DC19425;
	Fri, 24 Apr 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777051166;
	bh=iLIQH2LsU9DvL/nSrF9YsVkJujic5KWz9utqCDyV5uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWqvpMS5nBooYSvi+Y0ydGuGnL7DYXmKVJR6ns6W9dX89DW7HXe9CbJ91rHqtQB4n
	 KjL7B286XAmLY9vrWSVo2z/pCGJkJ1AyUI9gIgXL05/225q2hugz6V3tTnazC+HKQz
	 L3wqO2/tzfLXBxLiZrWGHXYgk3+zGVgX6AEIND47dZQYXB0ILahmB0U9zYdo+TgIE3
	 ad8LdWXoZDlJ/5R0xhHJzQWmGgq/xrXrDnuQeMq9tp/hzoJbAnMO5ac1p1MAcYICtc
	 bu+Ojz/Lxfmb6HpuY9k52DsrSKjBPuql5hIsqD6gRLMmj4VXG3ZiwnlChSTSLHVuBS
	 V7FYhi+odIoYw==
Date: Fri, 24 Apr 2026 10:19:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: kernel/futex/core.c:604:23: error: cannot jump from this asm
 goto statement to one of its possible targets
Message-ID: <20260424171922.GB3872959@ax162>
References: <202604160412.f6SIMtr9-lkp@intel.com>
 <20260424095335.GU3102624@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424095335.GU3102624@noisy.programming.kicks-ass.net>

On Fri, Apr 24, 2026 at 11:53:35AM +0200, Peter Zijlstra wrote:
> On Thu, Apr 16, 2026 at 04:15:04AM +0800, kernel test robot wrote:
> > Hi Thomas,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   1f5ffc672165ff851063a5fd044b727ab2517ae3
> > commit: e4e28fd6986e8cf963ec4137e6c0b95403f636ab futex: Convert to get/put_user_inline()
> > date:   5 months ago
> > config: powerpc64-randconfig-001-20260416 (https://download.01.org/0day-ci/archive/20260416/202604160412.f6SIMtr9-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> 
> IIRC we put the minimal clang on 17 due to this issue.

Yeah, I am working on that series right now, aiming for 7.2. I plan to
send it out for review when 7.1-rc1 is out and get it into -next shortly
after that.

Cheers,
Nathan
