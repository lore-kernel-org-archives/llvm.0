Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620492C86
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 21:03:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3485761175;
	Mon,  1 Nov 2021 21:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635800624;
	bh=uJFyUROA+bWziU3tdwADkXglHq9/LCHNcIBh81tjPuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFVGfvgjA6ncqccTWNjgkg+GHuNNcTX2LduvoGqGAtyzi4/8EaXBGc7e8m5Tjp3S4
	 hgwMYtnOssL9T4wckjOOKHBbc51zUM2JOoKwctslLuV6vJMiI34FnR7yp5qv7ewRqX
	 Fa5nuFqGStAz1+ImBEEoi+N/v8c6KFf3QSX2KuG0v2zbQl71+yr5xDq5ID1K+S9tS6
	 Tq8fZaEG423bJWDFp2VdyUkgAKTCyYBMF7sFN2dCuza2hBXKXD7qmMoa7L87yH4XG1
	 +cOm9scngxXwTPYa2eFK7jim/ACMg11ncvDIWT9WhnKzQTJleU93o2uH1cYexAfHkV
	 o26k/0+weL7fw==
Date: Mon, 1 Nov 2021 14:03:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: llvm@lists.linux.dev, kernelci@groups.io
Subject: Re: next/master build: 230 builds: 25 failed, 205 passed, 449
 errors, 236 warnings (next-20211101)
Message-ID: <YYBWK21wi/J997sL@archlinux-ax161>
References: <61800dfa.1c69fb81.4a3c4.4034@mx.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61800dfa.1c69fb81.4a3c4.4034@mx.google.com>

Hello,

I will comment on the LLVM/clang errors.

On Mon, Nov 01, 2021 at 08:55:38AM -0700, kernelci.org bot wrote:
>     3    clang: error: linker command failed with exit code 1 (use -v to see invocation)

I believe this is fixed with

https://lore.kernel.org/r/87fsslasgz.fsf@collabora.com/

which should now be picked up for -next:

https://lore.kernel.org/r/20211101114222.GA21679@quack2.suse.cz/

>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation name
>     3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation name

This is a deficiency in LLVM 10's integrated assembler that was fixed by

https://github.com/llvm/llvm-project/commit/34d77516b826f07e964fab364b02511ba6002209

in LLVM 11, according to my reverse bisect. This error was exposed in
the kernel by changing the default value of LLVM_IAS in commit
f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1"). There
are a few different things we can explore for fixing this:

1. Bump the minimum required version of LLVM to 11.0.0.
2. Explicitly pass LLVM_IAS=0 for clang-10 in KernelCI's make command.
3. Change the default of LLVM_IAS for clang-10 in the kernel's source.

We have done number 2 in our own CI:

https://github.com/ClangBuiltLinux/continuous-integration2/commit/e4bdcdd4682b8792b04083e58bb590f369f047db

Number 3 has some merits because it would benefit all CI systems. Number
1 might be worth considering now that clang-11+ is available in most
distros:

Arch Linux: clang version 12.0.1
Debian (buster): clang version 7.0.1-8+deb10u2
Debian (bullseye): Debian clang version 11.0.1-2
Debian (sid): Debian clang version 11.1.0-4
Fedora (34): clang version 12.0.1 (Fedora 12.0.1-1.fc34)
Fedora (rawhide): clang version 13.0.0 (Fedora 13.0.0-4.fc36)
OpenSUSE (Leap 15.3): clang version 11.0.1
OpenSUSE (Tumbleweed): clang version 13.0.0
Ubuntu (18.04): clang version 6.0.0-1ubuntu2
Ubuntu (20.04): clang version 10.0.0-4ubuntu1
Ubuntu (21.10): Ubuntu clang version 13.0.0-2

Every distribution that has a clang older than 11.0.0 has one older than
10.0.1 so it already cannot build the kernel without building LLVM from
source so not much should change.

>     3    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, any one of the following would fix this:
>     3    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, any one of the following would fix this:

https://github.com/ClangBuiltLinux/linux/issues/909S

This should be fixed in the same manner as the arm64 issue above.

>     2    <instantiation>:2:2: error: unknown use of instruction mnemonic without a size suffix

https://github.com/ClangBuiltLinux/linux/issues/1079

This should be fixed in the same manner as the arm64 issue above.

>     1    drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c:635:34: error: variable 'esw' is uninitialized when used here [-Werror,-Wuninitialized]

Should be fixed in the next -next version:

https://lore.kernel.org/r/20211029205632.390403-2-saeed@kernel.org/

>     1    clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'

Fixed in LLVM 13: https://github.com/ClangBuiltLinux/linux/issues/1270

ARCH=arm does not build well with the integrated assembler until LLVM 13
so KernelCI should pass LLVM_IAS=0 to make when building arm kernels
prior to that version.

>     1    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemble to exactly 4 bytes
>     1    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
>     1    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression

LLVM 12: https://github.com/ClangBuiltLinux/linux/issues/742

Same fix as directly above.

>     1    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
>     1    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
>     1    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
>     1    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
>     1    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
>     1    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-barriers
>     1    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
>     1    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
>     1    arch/arm/mach-mvebu/coherency_ll.S:155:2: error: instruction requires: data-barriers
>     1    arch/arm/mach-mvebu/coherency_ll.S:128:2: error: instruction requires: data-barriers
>     1    arch/arm/mach-imx/suspend-imx6.S:315:2: error: instruction requires: data-barriers
>     1    :125:2: error: instruction requires: data-barriers

LLVM 13: https://github.com/ClangBuiltLinux/linux/issues/1195

Same fix as directly above.

Cheers,
Nathan
