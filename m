Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C1017D7
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 11:17:13 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 55FD592009C; Fri, 20 May 2022 13:08:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5282D92009B;
	Fri, 20 May 2022 12:08:02 +0100 (BST)
Date: Fri, 20 May 2022 12:08:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Cercueil <paul@crapouillou.net>
cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
    kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips <linux-mips@vger.kernel.org>
Subject: Re: arch/mips/include/asm/checksum.h:195:9: error: unsupported inline
 asm: input with type 'unsigned long' matching output with type '__wsum' (aka
 'unsigned int')
In-Reply-To: <OB55CR.QAT1J8A48BK21@crapouillou.net>
Message-ID: <alpine.DEB.2.21.2205200510350.52080@angie.orcam.me.uk>
References: <202205200128.layu7VXF-lkp@intel.com> <OB55CR.QAT1J8A48BK21@crapouillou.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 May 2022, Paul Cercueil wrote:

> About the real issue: Maybe the last "addu" in csum_tcpudp_nofold() should be
> a "daddu"?

 It doesn't matter whether there is ADDU or DADDU anymore, given that 
commit 198688edbf77 ("MIPS: Fix inline asm input/output type mismatch in 
checksum.h used with Clang") has added a redundant 32-bit sign-extension 
operation right afterwards, regressing size/performance by an extra 
instruction in this performance-critical code as a workaround for a stupid 
compiler.

 I'm not sure though why the bot has been verifying old commit 
c434b9f80b09 ("MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol") instead, 
which predates the workaround.  Perhaps current master also fails to build 
in this file for one reason or another and bisection has misled the bot 
into an unrelated commit?

  Maciej
