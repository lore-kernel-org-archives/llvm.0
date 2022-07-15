Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5B4C7A
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 20:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A72C341C0;
	Fri, 15 Jul 2022 20:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657915805;
	bh=HJoPFEFLh4BbRDqJRXWZVqcGp9gCtdCVTUp8CpfJo00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9jtgz8TBxYvw4iLTMWuVKyJqUZQlf1rMd3lHZeDy9NOj7+AjOr0DQBgGiLocunWW
	 T1wdkDyQrlbYzIM28qPdLQn3yBt2YHC+/XVOstYOgBF4oUtiliRLinfsNZOUP+60nM
	 yYCtzrLVDM8yxKWNS7ldpXaLXzplYV1JQkumDFQC0CfWv16eZXeNcB9wVopjaCnswv
	 tRFRZuWmoGbGLOO2TYemv38NF3+VupdTxCmnbj1h7Av9QLIosoXDcW7q9GUJ6KWG3m
	 5ea5qBAGcVw6nWX6Er71OXbwY3h7k/TtlyhudFqUkFe2NA26bu1/H4WvopUnZWtWuV
	 zWc3+xRZG1vyQ==
Date: Fri, 15 Jul 2022 13:10:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: <instantiation>:3:3: error: invalid instruction mnemonic
 'annotate_unret_safe'
Message-ID: <YtHJm0Uiv4c7ihTf@dev-arch.thelio-3990X>
References: <202207160308.NAwtZPxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207160308.NAwtZPxG-lkp@intel.com>

On Sat, Jul 16, 2022 at 03:22:46AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
> commit: 9bb2ec608a209018080ca262f771e6a9ff203b6f objtool: Update Retpoline validation
> date:   3 weeks ago
> config: i386-randconfig-a011-20220704 (https://download.01.org/0day-ci/archive/20220716/202207160308.NAwtZPxG-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bb2ec608a209018080ca262f771e6a9ff203b6f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 9bb2ec608a209018080ca262f771e6a9ff203b6f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> <instantiation>:3:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:11:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:19:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:27:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:35:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:43:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:51:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:59:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:67:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:75:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:83:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:91:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:99:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:107:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:115:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:123:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)
>     ^
>    <instantiation>:131:3: error: invalid instruction mnemonic 'annotate_unret_safe'
>      ANNOTATE_UNRET_SAFE
>      ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kernel/../../x86/xen/xen-head.S:26:2: note: while in macro instantiation
>     .rept ((1 << 12) / 32)

Looks like https://git.kernel.org/tip/3131ef39fb03bbde237d0b8260445898f3dfda5b
should take care of this (not clang specific, GCC errors too with the
same configuration).

Cheers,
Nathan
