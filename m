Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC3259D
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 17:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0657C385A5;
	Wed,  4 May 2022 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651686529;
	bh=e8wlpzu01p00GXxLrMBw1AHGF6QBSQftauK15PaYFC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC2b/3IjDBS6efhvpKAC0TilIdXJzbZRO8OhUUqPEvXsO6EMbXH8BGOm4RjB9zep8
	 to7WYxb1RsLgb3yWZ4AS3bDWRGfWF9OukK5Daur7tSIy5sPpTI8P6j5hcu7RHxZchE
	 /VrrvbSkirO0gEba/eippVNc9QPjDhJgvMyh16eAJReI5K4iYu/ckCvo3YgUDVmGj9
	 ngktJHd1+E0jdIbzDkoDErhs5s2V9MFdg0Et6WgFPwnetSQNxFnFeysOw0LPdsJyyG
	 NDJExB7hIGD1Xv+SdVG9cnSgy59soykRsHDqUqW5SOikgt1MrdcFxfoUSFf1BwgTvQ
	 b3KcdE/bWryZA==
Date: Wed, 4 May 2022 10:48:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Leonardo Bras <leobras@redhat.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: ld.lld: error: inline assembly requires more registers than
 available at line 523
Message-ID: <YnK8f7cqMoHxSi0C@dev-arch.thelio-3990X>
References: <202205020637.JVJo3blw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205020637.JVJo3blw-lkp@intel.com>

On Mon, May 02, 2022 at 06:29:38AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
> commit: ba1f77c546966c12d86220d078e5838dcaeab348 x86/kvm: Fix compilation warning in non-x86_64 builds
> date:   2 months ago
> config: i386-randconfig-a012-20220502 (https://download.01.org/0day-ci/archive/20220502/202205020637.JVJo3blw-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba1f77c546966c12d86220d078e5838dcaeab348
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ba1f77c546966c12d86220d078e5838dcaeab348
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: inline assembly requires more registers than available at line 523
> >> ld.lld: error: inline assembly requires more registers than available at line 523
> 

I don't think this bisection result is correct; this error is visible at
v5.17-rc3, which this commit is based on. This is likely the same root
cause as https://github.com/ClangBuiltLinux/linux/issues/1589, just with
LTO. I'll reduce something down and comment there if it turns out to be
different.

Cheers,
Nathan
