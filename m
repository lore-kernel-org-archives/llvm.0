Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F307A
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 07:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937B1C3411E;
	Wed, 13 Jul 2022 07:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657697052;
	bh=Jfaqpz4SNBajpuUinidVA+7dT+UHlgGv8dACmnXz688=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsMHKPnDhC6PLCFiJH0tdMMg65Eoo0Pqmsj7JTTD+Cigi52kNO+0b9ykySa87dxLy
	 VYghbmZBsY2+UNI5UN86QI3hprEGy5ooh5zkFOm+4Lzex+AUVUkgX7pbZZBSnnT/nt
	 KWiT27nn6X40FfEg5D2vsjvjf9GWL6J9FF67slUY=
Date: Wed, 13 Jul 2022 09:24:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
	Ben Hutchings <bwh@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linux-stable-rc:linux-5.10.y 7109/7120]
 arch/x86/kernel/cpu/bugs.c:57:21: warning: section attribute is specified on
 redeclared variable
Message-ID: <Ys5zGYxqsZvmwCsR@kroah.com>
References: <202207130344.AUqExE4E-lkp@intel.com>
 <Ys3Xu+Vikf9WgIgz@dev-arch.thelio-3990X>
 <Ys3Ye7OR+5IpUoTv@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys3Ye7OR+5IpUoTv@dev-arch.thelio-3990X>

On Tue, Jul 12, 2022 at 01:24:27PM -0700, Nathan Chancellor wrote:
> On Tue, Jul 12, 2022 at 01:21:15PM -0700, Nathan Chancellor wrote:
> > On Wed, Jul 13, 2022 at 04:07:25AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> > > head:   ba398a0e54049bb6a1c102245ae84103f103ff2c
> > > commit: 855b78ccf1c8c952e148bdbd234cde117b098060 [7109/7120] KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
> > > config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220713/202207130344.AUqExE4E-lkp@intel.com/config)
> > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=855b78ccf1c8c952e148bdbd234cde117b098060
> > >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> > >         git fetch --no-tags linux-stable-rc linux-5.10.y
> > >         git checkout 855b78ccf1c8c952e148bdbd234cde117b098060
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> arch/x86/kernel/cpu/bugs.c:57:21: warning: section attribute is specified on redeclared variable [-Wsection]
> > >    DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
> > >                        ^
> > >    arch/x86/include/asm/nospec-branch.h:278:12: note: previous declaration is here
> > >    extern u64 x86_spec_ctrl_current;
> > >               ^
> > >    1 warning generated.
> > > 
> > > 
> > > vim +57 arch/x86/kernel/cpu/bugs.c
> > > 
> > > c40221c4c496c5 Peter Zijlstra 2022-06-14  55  
> > > c40221c4c496c5 Peter Zijlstra 2022-06-14  56  /* The current value of the SPEC_CTRL MSR with task-specific bits set */
> > > c40221c4c496c5 Peter Zijlstra 2022-06-14 @57  DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
> > > c40221c4c496c5 Peter Zijlstra 2022-06-14  58  EXPORT_SYMBOL_GPL(x86_spec_ctrl_current);
> > > c40221c4c496c5 Peter Zijlstra 2022-06-14  59  
> > > 
> > > :::::: The code at line 57 was first introduced by commit
> > > :::::: c40221c4c496c5c026ede111094a96f292875d88 x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value
> > > 
> > > :::::: TO: Peter Zijlstra <peterz@infradead.org>
> > > :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
> > > 
> > 
> > Looks like that declaration should be using DECLARE_PER_CPU?
> 
> Additionally, this appears to be an issue on mainline, our CI is
> starting to roll in with these patches (clang-13 + x86_64 allmodconfig):
> 
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/2658541992
> 
> https://builds.tuxbuild.com/2Br2Q4juY6VKxbmgzULKe5C3pGq/build.log
> 
> I am happy to send a patch if this is correct, unless someone else wants
> to.

Please do so.

thanks,

greg k-h
