Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0633C05
	for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 13:08:56 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 86EEE92009C; Fri, 21 Apr 2023 15:01:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 813D392009B;
	Fri, 21 Apr 2023 14:01:20 +0100 (BST)
Date: Fri, 21 Apr 2023 14:01:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Nick Desaulniers <ndesaulniers@google.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    llvm@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/8] MIPS: Replace assembly isa level directives with
 macros
In-Reply-To: <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
Message-ID: <alpine.DEB.2.21.2304211350000.58739@angie.orcam.me.uk>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com> <20230409104309.13887-2-jiaxun.yang@flygoat.com> <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com> <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Apr 2023, Jiaxun Yang wrote:

> This is a perfect example, strictly speaking VZ extension is a addition of MIPS Release 5,
> LLVM is doing nothing wrong.
> In reality we are happy to run MIPS Release 2 Kernel on Release 5 CPUs, so GAS decided
> to allow it live with any MIPS level.

 It wasn't "decided" for GAS (or libopcodes to be exact), it just happened 
by chance (or call it sloppiness if you prefer).  There used to be effort 
outstanding to clean up ISA opcode assignment in GNU binutils for R3 to 
R5, but following the collapse of IMG/MTI it has never happened.  Cf. e.g. 
binutils commit 9785fc2a4d22 ("MIPS: Fix XPA base and Virtualization ASE 
instruction handling"), and as I recall there was a discussion on the 
binutils mailing list covering these matters too.

  Maciej
