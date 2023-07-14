Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AF15AC0;
	Fri, 14 Jul 2023 18:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FD0C433C8;
	Fri, 14 Jul 2023 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1689358101;
	bh=cOah2wqbTG/or6RUsLhiInE63S3Obr/iI4/ZAF0QdsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fSzjTQK8TrhHROz7kJJUSdVBaVzIdy6cmez8qT6Nk7+Og4FZm8exawmTUUKK/Pqri
	 44CvkqGzxY9roVpcBzb1x9iULJW12iBXwDlZui+bwZBJPlt3nkDevK6zi5wAUrhBRl
	 lO/+ZyN/a8G2yyW0V3AKAWCOsfYVEQcD0dhcn0x0=
Date: Fri, 14 Jul 2023 11:08:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Christoph
 Hellwig <hch@lst.de>, "Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 93/173] drivers/clk/clk-fixed-mmio.c:33:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-Id: <20230714110819.a7a06160032e0f4d350bf99e@linux-foundation.org>
In-Reply-To: <ZLCP0s5aRLLOfVYt@MiWiFi-R3L-srv>
References: <202307131033.JgvCSVz4-lkp@intel.com>
	<20230713092618.9a25417dc886b4f61660fe17@linux-foundation.org>
	<ZLCP0s5aRLLOfVYt@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 07:59:14 +0800 Baoquan He <bhe@redhat.com> wrote:

> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from drivers/clk/clk-fixed-mmio.c:13:
> > >    In file included from include/linux/io.h:13:
> > >    In file included from arch/s390/include/asm/io.h:78:
> > >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      547 |         val = __raw_readb(PCI_IOBASE + addr);
> > >          |                           ~~~~~~~~~~ ^
> > 
> > Thanks.  When I tried that config I got
> 
> These two kinds of errors have been reported many times.
> 
> This PCI_IOBASE warning will be fixed by Niklas's patch at below:
> 
> https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/
> 
> 
> Nathan told this when he reviewed by patch at this sub-thread:
> https://lore.kernel.org/all/20230612160237.GA199007@dev-arch.thelio-3990X/T/#u
> 
> Quote his words here:
> ===
> I believe that this series [1] by Niklas Schnelle should take care of
> the PCI_IOBASE warnings (which are not Hexagon specific), so there is no
> need to worry about them when they show up in build reports.
> 
> [1]: https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/

OK, I'll restore the series "mm: ioremap: Convert architectures to take
GENERIC_IOREMAP way", v8.

This kind of already-was-there warning causes quite some trouble. 
Attempts to fix such fallout are appreciated.

