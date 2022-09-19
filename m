Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C2746D
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 21:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3591C433C1;
	Mon, 19 Sep 2022 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663624017;
	bh=zx/YQCTRM3ClJ79dYVZWfK5KQco7Ksm+9SI+gPA3WRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvxc7FCRya4tiSxFOLPR4Kit6Zr5L26ZC40oTvuqutnJOihpaLg+TXNhx4wUDAxdS
	 LQjWN9pJM7HT5hdIPRgfHrQdhugFbuS2E2Lxy/M4Sn7c8wGLn/hNWmU0UM0N8kbC5i
	 PaON6vUVG+aefe9KQevG/ceZ9as9H3y/I4iatLaVMKeHSXjWHigDOEo+rmaQrMlcer
	 8NYg366HF64GD3nspGcLmLONYDRYzAxWGAZvwm+NhuhSKQR9+VIYLz2juKGHReAfTJ
	 RHdxohxgiLneA4J8tKy3Lwnrwg3+kzo4l2ol6mSNtA97PTYH49R/GmVdpLQ5bcTm2I
	 FZyhrrtoLNwzQ==
Date: Mon, 19 Sep 2022 14:46:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Chen, Rong A" <rong.a.chen@intel.com>,
	kernel test robot <lkp@intel.com>,
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [kbuild-all] Re: [linux-next:master 6296/7172] ERROR: modpost:
 "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X>
References: <202209150959.hEWCNjXH-lkp@intel.com>
 <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
 <97021145-ea61-197c-919e-4a3d606547cf@intel.com>
 <YyTH5NpFvgGahlZk@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyTH5NpFvgGahlZk@dev-arch.thelio-3990X>

On Fri, Sep 16, 2022 at 12:00:52PM -0700, Nathan Chancellor wrote:
> On Fri, Sep 16, 2022 at 02:37:23PM +0800, Chen, Rong A wrote:
> > 
> > 
> > On 9/15/2022 11:39 AM, Masahiro Yamada wrote:
> > > On Thu, Sep 15, 2022 at 10:37 AM kernel test robot <lkp@intel.com> wrote:
> > > > 
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   f117c01187301a087412bd6697fcf5463cb427d8
> > > > commit: 6676e2cdd7c339dc40331faccbaac1112d2c1d78 [6296/7172] kbuild: use obj-y instead extra-y for objects placed at the head
> > > > config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220915/202209150959.hEWCNjXH-lkp@intel.com/config)
> > > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > > reproduce (this is a W=1 build):
> > > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >          chmod +x ~/bin/make.cross
> > > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6676e2cdd7c339dc40331faccbaac1112d2c1d78
> > > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > >          git fetch --no-tags linux-next master
> > > >          git checkout 6676e2cdd7c339dc40331faccbaac1112d2c1d78
> > > >          # save the config file
> > > >          mkdir build_dir && cp config build_dir/.config
> > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> > > > 
> > > > If you fix the issue, kindly add following tag where applicable
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > 
> > > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > > 
> > > > > > ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > > > ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
> > > > WARNING: modpost: suppressed 34935 unresolved symbol warnings because there were too many)
> > > 
> > > 
> > > 
> > > 
> > > 
> > > Sorry, I cannot reproduce this.
> > > Seeing the full log might be helpful.
> > 
> > Hi Masahiro,
> > 
> > Sorry for the inconvenience, the error can be found with clang-14,
> > but no error with clang-15, it shouldn't be a kernel issue.
> 
> We do still want the kernel to build with clang-14 though so this will
> require some further investigation. I probably won't be able to get to
> it today but I can try to double back on Monday to see what is going on
> here unless Masahiro beats me to it.

My reverse bisect tells me that LLVM commit d17c54d17de2 ("[llvm-ar]
Prevent automatic conversion from thin to full archive") in LLVM 15
resolves this problem. It appears that prior to that change, 'llvm-ar m'
without 'T' will change the archive type to full.

The following diff resolves this problem for me with no additional
failures on LLVM 14 and 16. Masahiro, is this an acceptable change to
squash in to 6676e2cdd7c339d?

Cheers,
Nathan

diff --git a/Makefile b/Makefile
index ebd48fc956a3..f3c0ac66cf98 100644
--- a/Makefile
+++ b/Makefile
@@ -1236,7 +1236,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
+	$(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
 
 targets += vmlinux.a
 vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
