Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62148168
	for <llvm@lists.linux.dev>; Sat,  4 Sep 2021 00:18:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C70B46054F;
	Sat,  4 Sep 2021 00:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630714731;
	bh=3QCu67oxVqfrgwyEUB1xN1/a7CUPygjYjsm0j++q4nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvOhh6j933zAESyyWPBvIa92Ca0euab+27RoUQ2WnKF0U56GQn1FpkU7qzkbLWBD/
	 rSVV7S7r+NLIuJG9GBTitF7/4fFpmuj2Mz8jfURxRhArZe4uUd4Pu/5Ewj35WlNrdp
	 kVjWOT24AEJEmIguFcprtggp5wSlRsuxUncPA/whMHoSeYmvvFxXvTjYLgeX9+6pVh
	 aWrkgCa3hsj7uN98dho6QVaAUsQBWXEavSJPICI+anJevL2ZxzsbhPHdMZ44Hx3M02
	 lNk/N9o1i54LteUNFmytZUkPrXBfxqxwLucLNLeCjZks32rUhwWcI1SIIEuoLEToo0
	 HLDERhYDckl+Q==
Date: Fri, 3 Sep 2021 17:18:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: CKI Project <cki-project@redhat.com>
Cc: llvm@lists.linux.dev
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 kernel 5.14.0 (mainline.kernel.org-clang, f1583cb1)
Message-ID: <YTK7aNSIjU3KmjH8@Ryzen-9-3900X.localdomain>
References: <cki.7AA94C9FD7.OQ1DPNIFYL@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cki.7AA94C9FD7.OQ1DPNIFYL@redhat.com>

On Sat, Sep 04, 2021 at 12:10:14AM -0000, CKI Project wrote:
> 
> Hello,
> 
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>             Commit: f1583cb1be35 - Merge tag 'linux-kselftest-next-5.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: FAILED
>  Selftests compile: FAILED
> 
> All kernel binaries, config files, and logs are available for download here:
> 
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?prefix=datawarehouse-public/2021/09/03/365103273
> 
> We attempted to compile the kernel for multiple architectures, but the compile
> failed on one or more architectures:
> 
>            ppc64le: FAILED (see build-ppc64le.log.xz attachment)
>              s390x: FAILED (see build-s390x.log.xz attachment)
> 
> We hope that these logs can help you find the problem quickly. For the full
> detail on our testing procedures, please scroll to the bottom of this message.
> 
> Please reply to this email if you have any questions about the tests that we
> ran or if you have any suggestions on how to make future tests more effective.
> 
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
> ______________________________________________________________________________
> 
> Compile testing
> ---------------
> 
> We compiled the kernel for 4 architectures:
> 
>     aarch64:
>       make options: make LLVM=1 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     ppc64le:
>       make options: make CC=clang -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     s390x:
>       make options: make CC=clang -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     x86_64:
>       make options: make LLVM=1 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
> 
> We built the following selftests:
> 
>   x86_64:
>       net: OK
>       bpf: fail
>       install and packaging: OK
> 
> You can find the full log (build-selftests.log) in the artifact storage above.
> 

ppc64le: https://github.com/ClangBuiltLinux/linux/issues/672

00:00:11 clang-13: error: unsupported argument '-mpower4' to option 'Wa,'
00:00:11 clang-13: error: unsupported argument '-many' to option 'Wa,'

s390: https://github.com/ClangBuiltLinux/linux/issues/1356

00:00:20 In file included from kernel/locking/lockdep.c:31:
00:00:20 In file included from ./include/linux/sched.h:14:
00:00:20 In file included from ./include/linux/pid.h:6:
00:00:20 In file included from ./include/linux/wait.h:9:
00:00:20 In file included from ./include/linux/spinlock.h:94:
00:00:20 ./arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
00:00:20                 ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
00:00:20                 ^
00:00:20 ./arch/s390/include/asm/alternative.h:111:2: note: expanded from macro 'ALTERNATIVE'
00:00:20         ALTINSTR_REPLACEMENT(altinstr, 1)                               \
00:00:20         ^
00:00:20 ./arch/s390/include/asm/alternative.h:106:2: note: expanded from macro 'ALTINSTR_REPLACEMENT'
00:00:20         INSTR_LEN_SANITY_CHECK(altinstr_len(num))
00:00:20         ^
00:00:20 ./arch/s390/include/asm/alternative.h:62:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
00:00:20         ".if " len " > 254\n"                                           \
00:00:20          ^
00:00:20 <inline asm>:5:5: note: instantiated into assembly here
00:00:20 .if 6651b-6641b > 254
00:00:20     ^

This is caused by the implicit switch to the integrated assembler in commit
f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1"). Please add
'LLVM_IAS=0' to the 'CC=clang' commands above and the build should be back to
passing like before.

Cheers,
Nathan
