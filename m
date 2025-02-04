Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63B2066D8;
	Tue,  4 Feb 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659685; cv=none; b=UDdWSl33irNTdFiBIeVfnM2L0rTrLpuYuo5WAk5zkPRhg6g52IS96E8b8tffJGb7YEqnSXUbPyulaQPH4znE3XTgl7WUNCcQR5Tk0O4nnJtXYO60+JdH0eCzNZPldhxxbt1Is1Wm2SG6JkgLIcigFuC7pALF5XrFwwrbCppDVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659685; c=relaxed/simple;
	bh=i0dlpxmbcgFdHipu0k3EaFA5pWYT71tJMBksIEtmV8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REYg6PMQsPbvyh3aWatVStDeA2V3WBpYC9ez9qmwFyRyJsp9wFkHOXrTyEV7OBgfKkdzoiZOWUlk9xk9XX7k0qqx1LemkJRUiAu6dr8R2WAzxBHH0UYG7Qjm0krS7XB00xcWinjYQvuyIye+baCJiaXfHviOvav7d/Iy7WGMj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGP5Hops; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGP5Hops"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AEBC4CEDF;
	Tue,  4 Feb 2025 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738659684;
	bh=i0dlpxmbcgFdHipu0k3EaFA5pWYT71tJMBksIEtmV8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGP5HopsMy4lNYRZNDmJwCaQFL8/cUEcySg1qWNrpU+EzOGTwWEfpeBnGbVj0gacG
	 X5M+FBo5UMVdcIaLC5uKWZp/pWAqJDaGcu4ZQPWJrzZV7X4ys4e/qyzFWo6HlcDGOf
	 fUEU9GCv7Txgw+GqGCWvqBNu3g7rZz1pBCflEg1fztmZ4A2lF+RXzGPcfjkg/ndkDu
	 GLFNA661hFieG0VCmtn2oyaxUO7/Y8Z/HChwNOtkIZLBwRNLEngK2GQZaug7VRpMfb
	 4ccBsl+XJ8slY+EtQqpThmVRitm+UB9KhX22lGRVlYT2P00TwGUXNszae5J6UAYBvu
	 8keY4w7UZ1Tfw==
Date: Tue, 4 Feb 2025 11:01:19 +0200
From: Leon Romanovsky <leon@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Konstantin Taranov <kotaranov@microsoft.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	Long Li <longli@microsoft.com>
Subject: Re: [leon-rdma:rdma-next 9/75]
 drivers/infiniband/hw/mana/qp.c:549:73: warning: variable 'err' is
 uninitialized when used here
Message-ID: <20250204090119.GG74886@unreal>
References: <202502041114.n6Yv6u7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502041114.n6Yv6u7p-lkp@intel.com>

On Tue, Feb 04, 2025 at 11:27:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
> head:   10565c5cadcb629f7780d24dd351878de9f46db5
> commit: bf3f6576bbbd511bbf30244ef82b3e48b7ae0331 [9/75] RDMA/mana_ib: UD/GSI QP creation for kernel
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502041114.n6Yv6u7p-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041114.n6Yv6u7p-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.n6Yv6u7p-lkp@intel.com/


Thanks, fixed it locally.
