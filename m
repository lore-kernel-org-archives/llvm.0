Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1D173
	for <llvm@lists.linux.dev>; Sun, 26 Dec 2021 22:02:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLk4Skhz4xdB;
	Mon, 27 Dec 2021 08:53:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, Alan Modra <amodra@au1.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/6] powerpc: Build with LLVM_IAS=1
Message-Id: <164055555286.3187272.4918713007568303339.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:32 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 21 Dec 2021 16:58:58 +1100, Alexey Kardashevskiy wrote:
> This allows compiling the upstream Linux with the upstream llvm with one fix on top;
> https://reviews.llvm.org/D115419
> 
> This is based on sha1
> 798527287598 Michael Ellerman "Automatic merge of 'next' into merge (2021-12-14 00:12)".
> 
> Please comment. Thanks.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/toc: PowerPC64 future proof kernel toc, revised for lld
      https://git.kernel.org/powerpc/c/a3ad84da076009c94969fa97f604257667e2980f
[2/6] powerpc: check for support for -Wa,-m{power4,any}
      https://git.kernel.org/powerpc/c/f5140cab448e4819ca6f158cb4130352f73c92e4
[3/6] powerpc/64/asm: Inline BRANCH_TO_C000
      https://git.kernel.org/powerpc/c/fd983957971632088908c646116383402f04084b
[4/6] powerpc/64/asm: Do not reassign labels
      https://git.kernel.org/powerpc/c/d72c4a36d7ab560127885473a310ece28988b604
[5/6] powerpc/mm: Switch obsolete dssall to .long
      https://git.kernel.org/powerpc/c/d51f86cfd8e378d4907958db77da3074f6dce3ba
[6/6] powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long
      https://git.kernel.org/powerpc/c/62479e6e26ef18f00e2e540c0e30156254533a43

cheers
