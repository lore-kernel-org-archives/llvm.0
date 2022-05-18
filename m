Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5866B33C1
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mAr+xOmPUpatPCsQEvvtVuA3lNcGb0ypfwN80fV79Fs=; b=j2e34UkPXU8jsfY5u4yxYT50Ex
	B3+HdDt7erkE/L/86lgiyQKu1KSEg0OEhUiSPK0vHtrirNwPH8C8rW3rNIycDBkk+V4RxhLmWEy/W
	fbLpqc0WAxXU9Ug4ku1AI8vZO9s6aglmY6sBLAsCo0kvno4lMolAvCY9NWwKACMHLa0nG+KCXaw+9
	x6WkfwOPBwHz2g7AernbWmrYQF0i37wsDbJXCJGjjbDCLeNrQ998Q1W8N1uGJOjyTlGb7/GIE2vRQ
	3HotHqdT5Hc5cIx6MdvXRoeOnqpEgGesKesyqwDE3J0EBwthrcMzwiluz30NYFfnlj9KNN/b7Fcs3
	+ZwEpLtA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrRry-001fUb-Uz; Wed, 18 May 2022 22:10:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9020D3002BF;
	Thu, 19 May 2022 00:10:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7837D20757B47; Thu, 19 May 2022 00:10:12 +0200 (CEST)
Date: Thu, 19 May 2022 00:10:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH] objtool: Fix symbol creation
Message-ID: <YoVuxKGkt0IQ0yjb@hirez.programming.kicks-ass.net>
References: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X>
 <20220516214005.GQ76023@worktop.programming.kicks-ass.net>
 <YoPAZ6JfsF0LrQNc@hirez.programming.kicks-ass.net>
 <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>
 <20220518012429.4zqzarvwsraxivux@treble>
 <20220518074152.GB10117@worktop.programming.kicks-ass.net>
 <20220518173604.7gcrjjum6fo2m2ub@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518173604.7gcrjjum6fo2m2ub@treble>

On Wed, May 18, 2022 at 10:36:04AM -0700, Josh Poimboeuf wrote:
> On Wed, May 18, 2022 at 09:41:52AM +0200, Peter Zijlstra wrote:
> > +static int elf_update_symbol(struct elf *elf, struct section *symtab,
> > +			     struct section *symtab_shndx, struct symbol *sym)
> >  {
> > -	Elf_Data *data, *shndx_data = NULL;
> > -	Elf32_Word first_non_local;
> > -	struct symbol *sym;
> > -	Elf_Scn *s;
> > -
> > -	first_non_local = symtab->sh.sh_info;
> > -
> > -	sym = find_symbol_by_index(elf, first_non_local);
> > -	if (!sym) {
> > -		WARN("no non-local symbols !?");
> > -		return first_non_local;
> > -	}
> > +	Elf_Data *symtab_data = NULL, *shndx_data = NULL;
> > +	Elf64_Xword entsize = symtab->sh.sh_entsize;
> > +	Elf32_Word shndx = sym->sec->idx;
> 
> So if it's a global UNDEF symbol then I think 'sym->sec' can be NULL and
> this blows up?

Oh indeed, sym->sec ? sym->sec->idx : SHN_UNDEF it is.

> > +	for (;;) {
> > +		/* get next data descriptor for the relevant sections */
> > +		symtab_data = elf_getdata(s, symtab_data);
> > +		if (t)
> > +			shndx_data = elf_getdata(t, shndx_data);
> > +
> > +		/* end-of-list */
> > +		if (!symtab_data) {
> > +			/* if @idx == 0, it's the next contiguous entry, create it */
> > +			if (!idx) {
> > +				void *buf;
> 
> Could just do the "index out of range warning" here to reduce the
> indentation level.

Sure.

> > +	/* setup extended section index magic and write the symbol */
> > +	if (shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) {
> 
> > +		sym->sym.st_shndx = shndx;
> > +		if (!shndx_data)
> > +			shndx = 0;
> 
> I think this '0' is SHN_UNDEF?
> 
> Also shouldn't 'sym->sym.st_shndx' get the same value?

This is when there isn't an extended section index. Specifically
gelf_update_symshndx() requires that when @shndx_data == NULL, @shndx
must be 0 too.
