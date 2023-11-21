Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103D83C091
	for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhD+0S4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7622C433C9;
	Tue, 21 Nov 2023 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700560541;
	bh=whZKNHlZ95uq0WovW7uV1N9xwhHgL6PQohmnfid0AWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mhD+0S4vsURq+ycERbdOKbNJeq/9OUo8bkbe1D5VplTzH+MK4N3u1Z1NSSEdOcaRe
	 HrpHSY48+BT6K4A29XWUtMFUA3xzhJzbaXQpq5+pntililQaEe1NyYUzat3dwdenjA
	 RdBerLk6UxRMshZcUMxVaXBraKRnLRiA32I+mSUcBp2UaoSltK67Q3qcWSBtoBy7/Q
	 a8e8XXZsVKcKdwHrMgGpSYGToQ5gJzTuSovqOMqoOM8aKDs+WD5KKm4jYmCWkBCUVV
	 5pNxwRYWo1UgsJ1yO8zYF8Rax0Ogq78AwXezck25mwyLJZuaWIOgzVqddkKbQZ/eNn
	 DWkAuv+q9Yyug==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
In-Reply-To: <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
Date: Tue, 21 Nov 2023 15:25:28 +0530
Message-ID: <87bkbnsa5r.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>> crtsavres.o is linked to modules. However, as explained in commit
>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>> and always-y"), 'make modules' does not build extra-y.
>>
>> For example, the following command fails:
>>
>>   $ make ARCH=powerpc LLVM=1 KBUILD_MODPOST_WARN=1 mrproper ps3_defconfig modules
>>     [snip]
>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>>   make[2]: *** [Makefile:1844: modules] Error 2
>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __build_one_by_one] Error 2
>>   make: *** [Makefile:234: __sub-make] Error 2
>>
>
> Thanks. Is this the correct Fixes tag?
>
> Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>

I am finding a different commit ID:

commit baa25b571a168aff5a13bfdc973f1229e2b12b63
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Fri May 12 01:56:49 2017 +1000

    powerpc/64: Do not link crtsavres.o in vmlinux
     
    The 64-bit linker creates save/restore functions on demand with final
    links, so vmlinux does not require crtsavres.o.
     

-aneesh
