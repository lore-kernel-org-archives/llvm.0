Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18926AB6
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 19:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B85AC433D7;
	Fri, 16 Sep 2022 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663354854;
	bh=IkXR7IGv7I9s0DfvbzgwBDNcq9kvhj0lBv1Me9tAL7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwXEJ+ktbEt4JQLhTupfT87a3PWPwAEwiepKV6hdj85uajV48jYfmxTP5JpuuJj9l
	 S4CNBNbtezXZmHhUnzloNaRpAF+WuvWJAPoKJ6YMYmXy+LwSCJQMwcnbA4fEHTl6h4
	 RVLPc8WCGmj8rZVaL1CjaFS87Ksj8lHnQ5UprpfgJtzeqmBIL/WuGkMAmfojJvXP6B
	 ewY3tysb44uWA/AQmI8pGzo//l8l2YJrGlosWjsLiKt5byhnxZdHx7HaFdMV2KhzGh
	 fPEYFML5HvTwkomL7+fUh4qyykALM4G+3ou6UZ4zuswBtHVmzy7dzsqQ+EbIhbHH1h
	 HROHN4h47BPTw==
Date: Fri, 16 Sep 2022 12:00:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	kernel test robot <lkp@intel.com>,
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [kbuild-all] Re: [linux-next:master 6296/7172] ERROR: modpost:
 "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <YyTH5NpFvgGahlZk@dev-arch.thelio-3990X>
References: <202209150959.hEWCNjXH-lkp@intel.com>
 <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
 <97021145-ea61-197c-919e-4a3d606547cf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97021145-ea61-197c-919e-4a3d606547cf@intel.com>

On Fri, Sep 16, 2022 at 02:37:23PM +0800, Chen, Rong A wrote:
> 
> 
> On 9/15/2022 11:39 AM, Masahiro Yamada wrote:
> > On Thu, Sep 15, 2022 at 10:37 AM kernel test robot <lkp@intel.com> wrote:
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   f117c01187301a087412bd6697fcf5463cb427d8
> > > commit: 6676e2cdd7c339dc40331faccbaac1112d2c1d78 [6296/7172] kbuild: use obj-y instead extra-y for objects placed at the head
> > > config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220915/202209150959.hEWCNjXH-lkp@intel.com/config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >          chmod +x ~/bin/make.cross
> > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6676e2cdd7c339dc40331faccbaac1112d2c1d78
> > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >          git fetch --no-tags linux-next master
> > >          git checkout 6676e2cdd7c339dc40331faccbaac1112d2c1d78
> > >          # save the config file
> > >          mkdir build_dir && cp config build_dir/.config
> > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > > > ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > WARNING: modpost: suppressed 34935 unresolved symbol warnings because there were too many)
> > 
> > 
> > 
> > 
> > 
> > Sorry, I cannot reproduce this.
> > Seeing the full log might be helpful.
> 
> Hi Masahiro,
> 
> Sorry for the inconvenience, the error can be found with clang-14,
> but no error with clang-15, it shouldn't be a kernel issue.

We do still want the kernel to build with clang-14 though so this will
require some further investigation. I probably won't be able to get to
it today but I can try to double back on Monday to see what is going on
here unless Masahiro beats me to it.

Cheers,
Nathan
