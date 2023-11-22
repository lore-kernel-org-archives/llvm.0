Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C44BAAE
	for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="XYRAWaNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700657686;
	bh=wuIXzags+RBlDsjUweIx70S2oQNg60ItGMTYwpyF8/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XYRAWaNyY9Csde2AbWpecLjArnLsrn0AlVA79QjjWeODirREpWX314cVo3QIskZpN
	 m51hJ686exSXsNpE9nVqalYXaeQBoAeGC2xByBScxxgOlln9d/b7gFhnRSRnlV47W0
	 dEn7nCwXtKgxtNgyXWT/SWibxwhRvXSvf/0/OIL7vZH3/weJl0f+5S/jFLnaTGoNgJ
	 SwdL1M1rDCZ/NN63LGyaiVfYsIl5Z2GyN6U3yuJiKFg7OUuVQeoHymsns06ydgG8Nt
	 XdHE5k9dS7i02GUJxltb7eBdQeqe5XWjWbvaK+XqZUbgzkRlRvKqZQGvDcq/zC3Fw2
	 kx54DpXN6r3xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sb1RT54M1z4xWV;
	Wed, 22 Nov 2023 23:54:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Nathan
 Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
In-Reply-To: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <87bkbnsa5r.fsf@kernel.org>
 <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Date: Wed, 22 Nov 2023 23:54:45 +1100
Message-ID: <87a5r6j6cq.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Tue, Nov 21, 2023 at 6:55=E2=80=AFPM Aneesh Kumar K.V
> <aneesh.kumar@kernel.org> wrote:
>>
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>>
>> > On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>> >> crtsavres.o is linked to modules. However, as explained in commit
>> >> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>> >> and always-y"), 'make modules' does not build extra-y.
>> >>
>> >> For example, the following command fails:
>> >>
>> >>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3=
_defconfig modules
>> >>     [snip]
>> >>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>> >>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fi=
le or directory
>> >>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/=
cell/spufs/spufs.ko] Error 1
>> >>   make[2]: *** [Makefile:1844: modules] Error 2
>> >>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: _=
_build_one_by_one] Error 2
>> >>   make: *** [Makefile:234: __sub-make] Error 2
>> >>
>> >
>> > Thanks. Is this the correct Fixes tag?
>> >
>> > Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>> >
>>
>> I am finding a different commit ID:
>>
>> commit baa25b571a168aff5a13bfdc973f1229e2b12b63
>> Author: Nicholas Piggin <npiggin@gmail.com>
>> Date:   Fri May 12 01:56:49 2017 +1000
>>
>>     powerpc/64: Do not link crtsavres.o in vmlinux
>>
>>     The 64-bit linker creates save/restore functions on demand with final
>>     links, so vmlinux does not require crtsavres.o.
>
> Yeah, I think the correct tag is:
>
> Fixes: baa25b571a16 ("powerpc/64: Do not link crtsavres.o in vmlinux")

Yep, I used that when applying.

cheers
