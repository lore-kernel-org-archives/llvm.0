Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B34469C
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 05:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ISxEuC4Kiq3vjUGUEirY3WiUkmrk0AhD6N2mrq7YQrw=; b=FiX5lak8VUsm5Z8979SsoFCjc8
	T2oQp66j9cPLFBhrAngOda54jnJI9CZX1TXMKxTp061Nlb9agO73fm0u1EMtVNv++t1Zb7RJoJYcn
	L9DND/cKiXkP+cHucd5hwV4EOP7SDMHMEiNJiaQVTy23F0FX+KmFa2k3zuIeCWbnJDfOIcsOc9Fk0
	ZSt4ixhKLcynJtK8hr009UgvL3NN69LkkwN+JbCyV4j8adRlxKVslooprfsfBuEcuTx2+0S3gcxSa
	KGLCe/9EkN8GZFuGwXh+lOu1botuGT/rzgY+pKj2hUsj1hm4uvXaD4B4M+uppVfHydBmiX5lKQgKN
	htGS6OGA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrCG9-001RwI-1K; Wed, 18 May 2022 05:30:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BDF1C30018E;
	Wed, 18 May 2022 07:30:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A068A206F245B; Wed, 18 May 2022 07:30:06 +0200 (CEST)
Date: Wed, 18 May 2022 07:30:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: objtool "no non-local symbols" error with tip of tree LLVM
Message-ID: <YoSEXii2v0ob/8db@hirez.programming.kicks-ass.net>
References: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X>
 <20220516214005.GQ76023@worktop.programming.kicks-ass.net>
 <YoPAZ6JfsF0LrQNc@hirez.programming.kicks-ass.net>
 <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>
 <20220518012429.4zqzarvwsraxivux@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518012429.4zqzarvwsraxivux@treble>

On Tue, May 17, 2022 at 06:24:29PM -0700, Josh Poimboeuf wrote:
> On Tue, May 17, 2022 at 05:42:04PM +0200, Peter Zijlstra wrote:
> > +	for (;;) {
> > +		symtab_data = elf_getdata(s, symtab_data);
> > +		if (t)
> > +			shndx_data = elf_getdata(t, shndx_data);
> >  
> > +		if (!symtab_data) {
> > +			if (!idx) {
> > +				void *buf;
> 
> I'm confused by whatever this is doing, how is !symtab_data possible,
> i.e. why would symtab not have data?

Elf_Data *elf_getdata(Elf_Scn *scn, Elf_Data *data);

is an iterator, if @data is null it will return the first element, which
you then feed into @data the next time to get the next element, once it
returns NULL, you've found the end.

In our specific case, we iterate the data sections, if idx fits inside
the current section, we good, otherwise we lower idx by however many did
fit and try the next.

> >  elf_create_section_symbol(struct elf *elf, struct section *sec)
> >  {
> >  	struct section *symtab, *symtab_shndx;
> > -	Elf_Data *shndx_data = NULL;
> > -	struct symbol *sym;
> > -	Elf32_Word shndx;
> > +	Elf32_Word first_non_local, new;
> > +	struct symbol *sym, *old;
> > +	int size;
> > +
> > +	if (elf->ehdr.e_ident[EI_CLASS] == ELFCLASS32)
> > +		size = sizeof(Elf32_Sym);
> > +	else
> > +		size = sizeof(Elf64_Sym);
> 
> This should probably be called 'entsize' and I think you can just get it
> from symtab->sh.sh_entsize.

Ok, that would be easier, I'll check.

> > +	/*
> > +	 * Either way, we added a LOCAL symbol.
> > +	 */
> > +	symtab->sh.sh_info += 1;
> > +
> >  	elf_add_symbol(elf, sym);
> 
> Not sure if it matters here, but elf_add_symbol() doesn't set sym->alias
> and sym->pv_target, and both of those are unconditionally initialized in
> read_symbols().  Should elf_add_symbol() be changed to initialize them?

I'll go have a look, breakfast first though! :-)
