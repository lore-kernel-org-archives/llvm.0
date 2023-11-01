Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09D15E82
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBDWjR+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F51C433C8;
	Wed,  1 Nov 2023 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698859330;
	bh=brHv5tko/OORSsW5TTvuP0YFzFcqW9N4Y+nKs8AXnBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBDWjR+KCY7w9fboGcsUwELTpX9Mu39kAUgNJPCsZAirjLWI+CTJbwJw2949cy5lN
	 Vc1nHuTcAt+orFA7om/iJtPfsSFOg1/Fq+wlJc90xBabPFrr+4r8Qt6v9AOCfahphG
	 5UT89/NIQoSfAmYBPJXb4M3gNeW1b8HrP3BMF/TMRxu4sFupU71FB45XkAU/fBqsfm
	 g0g/1CntnzWOLsP0tgfImuaM1bXYWnDn8MKE5P24U08YsOl0hhGl4xLhbogs80Zwdj
	 56ch00wUPPYnO5/ZCaEPuWUAiV0zknKppNt6w0R1X9SiXbXGr9UIAIxjbuDBzQxOJW
	 1+mt1NUYbbKug==
Date: Wed, 1 Nov 2023 10:22:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linaro-toolchain@lists.linaro.org,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.6-rc1-17-g1c6fdbd8f246: Failure on arm
Message-ID: <20231101172208.GA1368360@dev-arch.thelio-3990X>
References: <1310397379.52558.1698849730427@jenkins.jenkins>
 <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>

On Wed, Nov 01, 2023 at 08:54:26AM -0700, Nick Desaulniers wrote:
> On Wed, Nov 1, 2023 at 7:42 AM <ci_notify@linaro.org> wrote:
> >
> > Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> >
> > In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig after:
> 
> ok, so ARCH=arm allmodconfig on mainline...
> 
> >
> >   | commit v6.6-rc1-17-g1c6fdbd8f246
> >   | Author: Kent Overstreet <kent.overstreet@gmail.com>
> >   | Date:   Thu Mar 16 22:18:50 2017 -0800
> >   |
> >   |     bcachefs: Initial commit
> >   |
> >   |     Initially forked from drivers/md/bcache, bcachefs is a new copy-on-write
> >   |     filesystem with every feature you could possibly want.
> >   |
> >   |     Website: https://bcachefs.org
> >   |
> >   | ... 1 lines of the commit log omitted.
> >
> > Results changed to
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 23730
> > # First few build errors in logs:
> >
> > # 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> 
> ^
> $ file fs/bcachefs/alloc.c
> fs/bcachefs/alloc.c: cannot open `fs/bcachefs/alloc.c' (No such file
> or directory)
> 
> > # 00:23:17 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/alloc.o] Error 1
> > # 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:30 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/bset.o] Error 1
> 
> ^
> $ make LLVM=1 ARCH=arm allmodconfig fs/bcachefs/bset.o
>   CC [M]  fs/bcachefs/bset.o
> $
> 
> > # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is past the end of the array (that has type '__u64[0]' (aka 'unsigned long long[0]')) [-Werror,-Warray-bounds]
> > # 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
> 
> $ make LLVM=1 ARCH=arm allmodconfig fs/bcachefs/btree_cache.o
>   CC [M]  fs/bcachefs/btree_cache.o
> $
> 
> ... what's up with this report?

I cannot tell exactly from the information in this report but I suspect
ARCH=arm allmodconfig is broken in mainline for other reasons (perhaps
https://github.com/ClangBuiltLinux/linux/issues/1953?) and in trying to
uncover that breakage in an automated fashion, it hit this build
breakage and the bisect inadvertently switched to tracking down this
already fixed set of warnings. I think this particular issue is resolved
by Kent's recent array bounds fixes commit:

https://git.kernel.org/linus/5cfd69775eb5460ef78bb5034a37eb0dc52ab65d

Cheers,
Nathan

> >
> > From
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 32815
> > # linux build successful:
> > all
> > # linux boot successful:
> > boot
> >
> > The configuration of this build is:
> > CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig
> >
> > -----------------8<--------------------------8<--------------------------8<--------------------------
> > The information below can be used to reproduce a debug environment:
> >
> > Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/110/artifact/artifacts
> > Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/109/artifact/artifacts
> >
> > Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/reproduction_instructions.txt
> >
> > Full commit : https://git.linaro.org/kernel-org/linux.git/commit/?id=1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a
> >
> > Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1015
> >
> > List of configurations that regressed due to this commit :
> > * tcwg_kernel
> > ** llvm-master-arm-mainline-allmodconfig
> > *** Failure
> > *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/details.txt
> > *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconfig-build/110/
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
