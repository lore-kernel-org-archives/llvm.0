Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DC305660;
	Sun,  7 Jun 2026 04:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780805660; cv=none; b=L/fyjHwb9NbJ3EAdqq8QC5866oprve0SH4V+SS+zOl9emAg8MaVx3ZYA0+caBmREuksbaE04T4TEt2phnM302MB0QjnkbY07o5dB2rZBHp1r81fLQfe3r02zBTDb1MjMu4KDHRxf1KWj0+LORLaqI9vqNUc4eHcZTgk4ctyazMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780805660; c=relaxed/simple;
	bh=yVspvnHsYLwAzOgc8Ad4tvqqKL5zVt7JQASUTcfWvaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgwqlFtbL6Y72uCAsaMIw55Md1DPG7hyNxj8aEn/TCGuYoK12k48gkTlICWxamb8x94RdKf4VQr9l9y4rdbM6Q8290Tdk2Xek3DhKsxq5ywBefGb5Whd532NblZBrzxIgVfPJPVRv2y3auxhADivqe36xUe8kgVdJsU3aSV3wBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbtzIpgd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbtzIpgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3423D1F00893;
	Sun,  7 Jun 2026 04:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780805658;
	bh=tBLPEKXd3CbGfq2Dqa0AYdClVPri/AxU7AWFYsxmfF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbtzIpgdq0yCOEzHQ7iebllEi9oszxnVtSdQWi8fDjcMA7FPcRb1Cjnn1c54Jg2f8
	 FkWnfLe0F9WQTT+1l32sC3j1Gpy15q4LnI+JR2VxI3VMAKzRoUjyGLoF9EHs2jrm0J
	 kczY8QmSWZAYUt02UGJ24kT6DMTGeylJk1UJCJsOAvi5ihGH+qKk5zwks5LsVj5UMa
	 tMJkurDsU22v458tl7EPfKxEvPHToYvTP9LvcTPwtB0u58mye8I2Wu+hi3VDV5Xdok
	 +Id+pYy9eLagFFagBEQy1rEoTvuHcHeAzu0KjX2bFQopK4Z31QozTHk8EDHD9rMWjV
	 BDCIHIxwwAdcw==
Date: Sat, 6 Jun 2026 21:14:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: Re: [brauner-github:vfs-7.2.misc 28/28] fs/open.c:112:29: warning:
 converting the result of '<<' to a boolean always evaluates to true
Message-ID: <20260607041414.GA2161204@ax162>
References: <202606071029.DKCs8WOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606071029.DKCs8WOs-lkp@intel.com>

On Sun, Jun 07, 2026 at 10:49:04AM +0800, kernel test robot wrote:
> Hi Jori,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://github.com/brauner/linux.git vfs-7.2.misc
> head:   0da79c259ad0554b36761a7135d4f92eb7c46263
> commit: 0da79c259ad0554b36761a7135d4f92eb7c46263 [28/28] vfs: uapi: retire octal and hex numbers in favor of (1 << n) for O_ flags
> config: powerpc64-randconfig-001-20260607 (https://download.01.org/0day-ci/archive/20260607/202606071029.DKCs8WOs-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071029.DKCs8WOs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606071029.DKCs8WOs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/open.c:112:29: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
>      112 |         error = break_lease(inode, O_WRONLY);
>          |                                    ^
>    include/uapi/asm-generic/fcntl.h:20:21: note: expanded from macro 'O_WRONLY'
>       20 | #define O_WRONLY        (1 << 0)
>          |                            ^

Hmmm, this appears to be pointing out an inconsistency between the
different versions of break_lease(), depending on whether
CONFIG_FILE_LOCKING is set or not.  The CONFIG_FILE_LOCKING=n stub has a
second parameter of 'bool wait' whereas the CONFIG_FILE_LOCKING=y case
has a second parameter of 'unsigned int mode'. 4be9f3cc582a ("filelock:
rework the __break_lease API to use flags") changed this, which seems
incorrect to me.

-- 
Cheers,
Nathan
