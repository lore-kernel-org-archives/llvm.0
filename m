Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB97E
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 15:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205BBC385A9;
	Fri, 20 May 2022 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653061723;
	bh=ZTrf2F7DqovwXMWBGlwmXJU7DUWLIXbUx9hGSDuWATg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhZcwLpY1WzOlDsJceEt8h6i8VpXdoETHwk0ocdywuPOgzb5DxwWFAp7adMImC3SX
	 Q+g5Xo16OC+cuq1MNxQZgn13m+Jz9X4yXenR9eUFbnIl/nrK3WdeSG0Jz5M8iVbky+
	 AAATZO4yvy6+ohc5W/PEqjVlLINv/10hH5obolMlN9MyZ6vrVlyjYDoRcxMOhvSROo
	 w3qLp9FY/HBRY2mZC0eK18vxzOZ3Y1j2ym1gORKAcAQJchf6NNa6Q5hiXoZpSsVE7f
	 kYj6HbDaHsfx8TK/1j7QCb+LBB1V5wZK9gdBGHLttEFMbrNip3e3EuqoRv6pOr4O6U
	 T6rKQc6bFPE1A==
Date: Fri, 20 May 2022 08:48:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12308/12886] arch/x86/kvm/hyperv.c:1983:22:
 warning: shift count >= width of type
Message-ID: <Yoe4WQCV9903aQRP@dev-arch.thelio-3990X>
References: <202205201624.A4IhDdYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205201624.A4IhDdYX-lkp@intel.com>

Hi Yury,

On Fri, May 20, 2022 at 04:24:32PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
> commit: 81db71a60292e9a40ae8f6ef137b17f2aaa15a52 [12308/12886] KVM: x86: hyper-v: replace bitmap_weight() with hweight64()
> config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220520/202205201624.A4IhDdYX-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=81db71a60292e9a40ae8f6ef137b17f2aaa15a52
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 81db71a60292e9a40ae8f6ef137b17f2aaa15a52
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/kvm/hyperv.c:1983:22: warning: shift count >= width of type [-Wshift-count-overflow]
>                    if (hc->var_cnt != hweight64(valid_bank_mask))
>                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
>    #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
>                                                    ^~~~~~~~~~~~~~~~~~~~
>    include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
>    #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
>                                                                               ^  ~~
>    include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
>    #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
>                                                    ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
>             ((!!((w) & (1ULL << 0))) +     \
>                   ^
>    include/linux/compiler.h:56:47: note: expanded from macro 'if'
>    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>                                                  ^~~~
>    include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
>    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>                                                       ^~~~

I think this is the proper fix, as valid_bank_mask is only assigned u64
values. Could you fold it into that patch to clear this warning up?

Cheers,
Nathan

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index b652b856df2b..e2e95a6fccfd 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -1914,7 +1914,7 @@ static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
 	struct hv_send_ipi_ex send_ipi_ex;
 	struct hv_send_ipi send_ipi;
 	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
-	unsigned long valid_bank_mask;
+	u64 valid_bank_mask;
 	u64 sparse_banks[KVM_HV_MAX_SPARSE_VCPU_SET_BITS];
 	u32 vector;
 	bool all_cpus;
