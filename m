Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438332C83
	for <llvm@lists.linux.dev>; Tue, 23 Nov 2021 00:50:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C5CE60F5B;
	Tue, 23 Nov 2021 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637628617;
	bh=45juEyQkPWERTh6H5t1qHoiass56yxvwgz5yqgPgLJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJNOHUhscoaSdBDnicmBh4T0zeQU97vkXbXmXiLOwn9tRO3KgPC5lKc9aDmWWafPn
	 D/jq7XUebJq+Zs2f9gn0QSr9IAXXrXmiE814Vv7yGtM0zyPS6XpRjt9Yp5X1SYjQ8p
	 k96Z7w3fCWXDQwpIT5H3mE9ihxzBUZzBckQKdJAS5/ZQMt0S3mH6GJXN549KYNQPxE
	 fRXVvCvL28y0TewehLwDN+bNurqtzjuWk7pNoYgLB1fJJCqMPXjpfN5KJEb9SFCW3Q
	 2+F/rE9jAN8pIytvrcSbDZhXBHYqw9DSX6Aiv+1eFg09+6e7vTH9dneVUlI2fQOFv5
	 nev9pGO3/ATtA==
Date: Mon, 22 Nov 2021 18:55:28 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: arch/mips/mm/tlbex.c:2243:3: warning: unannotated fall-through
 between switch labels
Message-ID: <20211123005528.GA550759@embeddedor>
References: <202111230719.OZDUHU4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111230719.OZDUHU4z-lkp@intel.com>

On Tue, Nov 23, 2021 at 07:51:33AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   136057256686de39cc3a07c2e39ef6bc43003ff6
> commit: dee2b702bcf067d7b6b62c18bdd060ff0810a800 kconfig: Add support for -Wimplicit-fallthrough
> date:   8 days ago
> config: mips-randconfig-r016-20211116 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dee2b702bcf067d7b6b62c18bdd060ff0810a800
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout dee2b702bcf067d7b6b62c18bdd060ff0810a800
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=mips 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/mips/mm/tlbex.c:2243:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>                    case CPU_CAVIUM_OCTEON:
>                    ^
>    arch/mips/mm/tlbex.c:2243:3: note: insert 'break;' to avoid fall-through
>                    case CPU_CAVIUM_OCTEON:
>                    ^
>                    break; 

I already have a patch for this here:

https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?h=for-linus/kspp&id=cd3ed04e7fc365e4e581333c3ff69c8da6ca0e8b

Thanks
--
Gustavo
