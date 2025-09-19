Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B025229C;
	Fri, 19 Sep 2025 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758315004; cv=none; b=i1dRycyRa6ZvVLtt1dt9DuM2H+490RNBm05ov6lwofDfVQeiU+W0bYYuOVImCHo1FEG7JCuziRcIFmFWcQtVESMXHRTsnmHoIMsVTK9vdU5zsFq2gOMn+i3EoWIQy9yinY1KWGA+ot3GGxPbq+AL8KIfhK+o3Kru6B2YeGRFYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758315004; c=relaxed/simple;
	bh=zzJw7pmJ5r1oZArS8Z65VrSfN5iLTKr3vdLMSM15J2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXFUuaLi8f7XgBS9f7IM1et8lkGw3Jj/3Qr6JwSRv598505zrAbqAKz5qMaRBrqtm3IjkImT1BoR++Nujw/hv6zXeDuKeYN/WrrhDjeVgK6fh0WN/f57nsv/zH294LmpM7skcB4hsa0GKuqL9LQctVbDcqWF1wLvwGg0VgEwtIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRT3IyGW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRT3IyGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D444BC4CEF0;
	Fri, 19 Sep 2025 20:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315004;
	bh=zzJw7pmJ5r1oZArS8Z65VrSfN5iLTKr3vdLMSM15J2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRT3IyGWsE9ofB2VCtvgrwGfR3+507HoEzvgpKQTkkfYAm8UbgxdIwWgmYefO9KvY
	 1Rn4NVbnzjDUttCqz0ebmAb0pf1k7dwI2bSDVSyIYz/ts2VqCmIASMAbGT+JzMo1yz
	 9N1mn4caUDLDTVdw4nMPW7CgrkB67tfYZaSHcLhIEbDjqYNtHLkuJSmI8a4yXXxZJP
	 VrMhLBo+NJyYDBAQL+2ePbP9wIbDHKvtWpw6Dnwvci6xGAaXq4gpDx9zEtsX3W8CJv
	 9cNKOE/eEvipAFkF7XbRxr1ZwUISPlZw5vUdUgmL+hPSpCgZ8Ta5nFLHn/OJjE7e66
	 vVYWudTba9jDg==
Date: Fri, 19 Sep 2025 13:50:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 10394/11136] arch/riscv/Kconfig:67: syntax
 error
Message-ID: <20250919205001.GA3249395@ax162>
References: <202509200414.Q0j4r2Pc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509200414.Q0j4r2Pc-lkp@intel.com>

On Sat, Sep 20, 2025 at 04:29:50AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   846bd2225ec3cfa8be046655e02b9457ed41973e
> commit: df4c83704cac9531e91cd161dd8a2b0857b8bb2d [10394/11136] Merge 6.17-rc6 into kbuild-next
> config: riscv-randconfig-002-20250920 (attached as .config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200414.Q0j4r2Pc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509200414.Q0j4r2Pc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/riscv/Kconfig:67: syntax error
>    arch/riscv/Kconfig:67: invalid statement

That's embarrassing :/

Fixed in kbuild-next now, thanks for the report!

https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/commit/arch/riscv/Kconfig?id=95ee3364b29313a7587b7d1e42a9d043aaf7e592

Cheers,
Nathan
