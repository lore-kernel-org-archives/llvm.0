Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0769433D4
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 20:48:59 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9F3B492009E; Sun, 22 May 2022 22:48:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 987B592009D;
	Sun, 22 May 2022 21:48:52 +0100 (BST)
Date: Sun, 22 May 2022 21:48:52 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nathan Chancellor <nathan@kernel.org>
cc: Paul Cercueil <paul@crapouillou.net>, kernel test robot <lkp@intel.com>, 
    llvm@lists.linux.dev, kbuild-all@lists.01.org, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips <linux-mips@vger.kernel.org>
Subject: Re: arch/mips/include/asm/checksum.h:195:9: error: unsupported inline
 asm: input with type 'unsigned long' matching output with type '__wsum' (aka
 'unsigned int')
In-Reply-To: <Yoe5TafDskZ9JDSW@dev-arch.thelio-3990X>
Message-ID: <alpine.DEB.2.21.2205202256030.52080@angie.orcam.me.uk>
References: <202205200128.layu7VXF-lkp@intel.com> <OB55CR.QAT1J8A48BK21@crapouillou.net> <alpine.DEB.2.21.2205200510350.52080@angie.orcam.me.uk> <Yoe5TafDskZ9JDSW@dev-arch.thelio-3990X>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Nathan Chancellor wrote:

> >  It doesn't matter whether there is ADDU or DADDU anymore, given that 
> > commit 198688edbf77 ("MIPS: Fix inline asm input/output type mismatch in 
> > checksum.h used with Clang") has added a redundant 32-bit sign-extension 
> > operation right afterwards, regressing size/performance by an extra 
> > instruction in this performance-critical code as a workaround for a stupid 
> > compiler.
> 
> Shouldn't this concern have been addressed by Tiezhu's follow up?
> 
> https://lore.kernel.org/1617359240-16609-1-git-send-email-yangtiezhu@loongson.cn/
> 
> I guess it never got picked up?

 Still it is a hack.  I have now rewritten this code in plain C instead.

  Maciej
