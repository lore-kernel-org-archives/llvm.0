Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81841E32A4;
	Mon, 21 Oct 2024 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502353; cv=none; b=MpcgiNrbBQlVmu0xjtvOnps8BVzfX0S+imNBBCgxGO40txpusC8Ex9fMH9mZgjcNIFcb1NooWPqX9ETU7+jPntfwhhhysIkLCxnhzU2ZmSCwF7kkG2vysONE2TaEjcXbQmN5srBnRYz8DKcaaUgxsTCyQvtQLsYyt85peUtIcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502353; c=relaxed/simple;
	bh=vNDN8gUw8S53uvPpcqM2mLKvxrikqJdFqSueTv4F7uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKuw7J3MkxOwo3X4K33Qq1coTHo86HLR4xWejOMKcOuR9TQ3Pm8yBF0PLhLQrqn+AaQo3sXRptAdyUfSdD9QuAh5Mam+kad7L1A3ZPT/CdFzDAIBsSH4rxBqgMS1tJy9mKKGvZyEFpq2h9gEM3Ad8QZpE+TEj+6oP7ULUIHE6kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4565CC4CEC3;
	Mon, 21 Oct 2024 09:19:11 +0000 (UTC)
Date: Mon, 21 Oct 2024 10:19:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [arm64:for-next/core 11/42] ld.lld: error: HYP init code too big
Message-ID: <ZxYcjEXxMLy7mERJ@arm.com>
References: <202410211052.8GubCgxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410211052.8GubCgxd-lkp@intel.com>

On Mon, Oct 21, 2024 at 10:48:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> head:   b8be9b42e20c26ceff1335f7a0eee5bac99206ea
> commit: ff5181d8a2a82c982276a7e035896185c390e856 [11/42] arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410211052.8GubCgxd-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211052.8GubCgxd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410211052.8GubCgxd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: HYP init code too big
> >> ld.lld: error: HYP init code too big
> >> ld.lld: error: HYP init code too big
> >> ld.lld: error: HYP init code too big
> >> ld.lld: error: HYP init code too big
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for MODVERSIONS
>    Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>    Selected by [y]:
>    - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

Thanks. We are aware of this and there's a commit on top of the arm64
for-kernelci branch.

-- 
Catalin
