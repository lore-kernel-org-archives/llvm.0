Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885402F5A
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 22:38:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M4wSH470Tz4xG2;
	Sun, 14 Aug 2022 08:38:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Ondrej Mosnacek <omosnacek@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
Message-Id: <166043029181.1050412.4657635247684421735.b4-ty@ellerman.id.au>
Date: Sun, 14 Aug 2022 08:38:11 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 9 Aug 2022 15:29:07 +0530, Naveen N. Rao wrote:
> Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc64/ftrace: Fix ftrace for clang builds
      https://git.kernel.org/powerpc/c/cb928ac192128c842f4c1cfc8b6780b95719d65f

cheers
