Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758163AD;
	Tue, 27 Dec 2022 18:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308C4C433EF;
	Tue, 27 Dec 2022 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672164452;
	bh=2gIVArRSVX69B4yyMqnVV1uzH65WEas6JMyCVEdj7Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDHMWz1WEhVldtE/XYagYk2NcaYmK95Mxq3OJQ/cbweOUaehoqYjhqCLdFTHel0Je
	 AIBIEFz97BEV6KCqNqscEpoper44jUZ0mv2x8Hjl3FK9M54LTGwK1iROAbeb+OrD4P
	 hSc6ZN6RA/3ANyjAjeKALQJ8pZfU7jBTV3cQyPyG8jwpNAoDX2Af2Hy7tBeohG6NAy
	 HRhCw2MHM5UcdDUqhfl98Jrdl83A9y3R0u15aAv85EshsYg2LMdJEfZyFr79c1q7L8
	 D6OkKaN9K4sXKqj4RTNDV0mHuq81NJumc3hgtpg+nGLV9J+J7Zp3poQAU8oFjPlcPe
	 FjrQsNM2hjhMQ==
Date: Tue, 27 Dec 2022 11:07:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [peterz-queue:core/wip-u128 14/14]
 arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
Message-ID: <Y6s0Yongvkn1WoIK@dev-arch.thelio-3990X>
References: <202212272348.xvp2fQTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212272348.xvp2fQTy-lkp@intel.com>

On Tue, Dec 27, 2022 at 11:27:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/wip-u128
> head:   c05419246aa69cd3ff3f929e232ebed1b5b49c2d
> commit: c05419246aa69cd3ff3f929e232ebed1b5b49c2d [14/14] atomic: Add test cases for cmpxchg128 family
> config: arm-randconfig-r046-20221226
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project f5700e7b69048de958172fb513b336564e7f8709)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=c05419246aa69cd3ff3f929e232ebed1b5b49c2d
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue core/wip-u128
>         git checkout c05419246aa69cd3ff3f929e232ebed1b5b49c2d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash lib/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r4, r5, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r6, r7, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:254:1: error: instruction requires: !armv*m
>    "1:     ldrexd          %1, %H1, [%3]\n"
>    ^
>    <inline asm>:1:5: note: instantiated into assembly here
>            1:      ldrexd          r6, r7, [r0]
>                    ^
>    In file included from lib/atomic64_test.c:12:
>    In file included from include/linux/kernel.h:22:
>    In file included from include/linux/bitops.h:68:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
>    arch/arm/include/asm/cmpxchg.h:258:2: error: instruction requires: !armv*m
>    "       strexd          %0, %5, %H5, [%3]\n"
>     ^
>    <inline asm>:5:2: note: instantiated into assembly here
>            strexd          r1, r4, r5, [r0]
>            ^
>    16 errors generated.

GAS's error message is a little more informative as to what is going on.

/tmp/cccn02Dg.s: Assembler messages:
/tmp/cccn02Dg.s:6048: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6052: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6090: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6094: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6133: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6137: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6175: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6179: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6219: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6223: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6263: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6267: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6311: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6315: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6356: Error: selected processor does not support `ldrexd r0,r1,[r3]' in Thumb mode
/tmp/cccn02Dg.s:6360: Error: selected processor does not support `strexd r2,r6,r7,[r3]' in Thumb mode

which leads to looking at the config:

$ rg 'CPU_(V|32)|THUMB2' .config
265:CONFIG_CPU_V7M=y
268:CONFIG_CPU_32v7M=y
273:CONFIG_CPU_V7M_NUM_IRQ=90
311:CONFIG_THUMB2_KERNEL=y

CONFIG_GENERIC_ATOMIC64 is selected for CONFIG_CPU_V7M, presumably to
avoid using these instructions, based on the other CONFIGs in that
select statement in arch/arm/Kconfig? I am not sure how the test needs
to cope with that but hopefully that makes it a little more obvious what
is happening here.

Cheers,
Nathan
