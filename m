Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940581FA0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mouIEtj76vKUUk31EBLG/iOWGo2/UyaQmgKTXKtrLoA=; b=Ar2deOFC+ZDQ8WgkdlKuls35H7
	UwIY7pQVOfuQ16yaLcp8jVBq6Y5ukhGNGuYx6XQ09CKzF4jz+0FV13un2sSLrXznWoP/WSPf9OdJ4
	XOSgVtdiU4I3x6aYy1BxRSMyLO3V7HZoaW7nJYn/fL+h0X0mTIauMd492RS8uPW6QzSY+u5FYAQhN
	xtWQaymXLdiqTzy+uIJ2XMY6DcDUY745xYZpInNcd7RMn9tNb41UF7Vxly1N8dbGzXsluAOejzQQ1
	S+mHacRLTz1L1hOcYhfT1lLzbaarZ4wNbceavpIRNfAIOrvm7p5KsCHgkdfOchOj+7zO4LVKT93rV
	/OhIz5vQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4lo-003Xg5-LJ; Mon, 09 May 2022 14:53:56 +0000
Date: Mon, 9 May 2022 15:53:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Tom Rix <trix@redhat.com>
Cc: hughd@google.com, akpm@linux-foundation.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/shmem: initialize folio to NULL
Message-ID: <YnkrBA0RTNdP+GX0@casper.infradead.org>
References: <20220509123116.3169267-1-trix@redhat.com>
 <YnkeUz0Z2O9Xd5O+@casper.infradead.org>
 <0f066c75-121e-05f2-41ed-0d029bf70221@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f066c75-121e-05f2-41ed-0d029bf70221@redhat.com>

On Mon, May 09, 2022 at 07:51:25AM -0700, Tom Rix wrote:
> 
> On 5/9/22 6:59 AM, Matthew Wilcox wrote:
> > On Mon, May 09, 2022 at 08:31:16AM -0400, Tom Rix wrote:
> > > The clang build fails with
> > > mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> > >    if (!page) {
> > >         ^~~~~
> > > The error handler for !page jumps to an if-check for an unset folio.
> > > So initialize folio to NULL.
> > I appreciate you're trying to help, but the fourth report of a problem
> > adds more noise than utility.
> > 
> > https://lore.kernel.org/linux-mm/?q=shmem+folio
> > 
> > shows emails about this from the cgelbot, Dan Carpenter, SeongJae Park,
> > Colin King, Nathan Chancellor and Sebastian Siewior.  So actually you
> > were seventh, not fourth.
> 
> From my point of view, the build has been broken for a week.

Yeah, shit happens when you're trying to fix patches and attend a
conference at the same time.

> It would be good if this and the other folio issue was fixed in linux-next
> soon.

As you can see, I sent a replacement patch series on the 4th which fixes
far more than the two problems you noticed.
https://lore.kernel.org/linux-mm/20220504182857.4013401-1-willy@infradead.org/

I can do no more than this.
