Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC867F
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 01:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F43C385B8;
	Wed, 18 May 2022 01:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652837071;
	bh=cZ2O9NOlY984cGIAsEwAguwouqwzPyw0CuWZHAKHjZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1QiMPVKBFCZ8e3aj6D0tG8+xMSDHs8voek5NGNvS5iDpQFufmL2/XBeI3qikGA2H
	 WYwHdHlKjwt3Gw+u22lUw1v3lRtmTa/UMyewtlNG8Wn7Vt2z8HKHpLDYJi15mdypDM
	 lgchQPCnn5VJ0CJ7gILieyU/OWyKc5OgYGAtNNAmP1+g1nhyM2RrE7/Iu/k+jkBM/E
	 0DdXysnwAy1do6ZHkLAWvgUlCg2OzgyntMhD0Bp2oHvda37FUkZDOELljZkhTLgqu/
	 g3856uLAF6pa8yoR83/FpcRP3KIcxxv0qWNJj/RYoR6Lmyuym0JGb3ViqzDyn5JzxK
	 ZGXIvcUJvJjbA==
Date: Tue, 17 May 2022 18:24:29 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: objtool "no non-local symbols" error with tip of tree LLVM
Message-ID: <20220518012429.4zqzarvwsraxivux@treble>
References: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X>
 <20220516214005.GQ76023@worktop.programming.kicks-ass.net>
 <YoPAZ6JfsF0LrQNc@hirez.programming.kicks-ass.net>
 <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>

On Tue, May 17, 2022 at 05:42:04PM +0200, Peter Zijlstra wrote:
> +	for (;;) {
> +		symtab_data = elf_getdata(s, symtab_data);
> +		if (t)
> +			shndx_data = elf_getdata(t, shndx_data);
>  
> -	sym->idx = symtab->sh.sh_size / sizeof(sym->sym);
> -	elf_dirty_reloc_sym(elf, sym);
> +		if (!symtab_data) {
> +			if (!idx) {
> +				void *buf;

I'm confused by whatever this is doing, how is !symtab_data possible,
i.e. why would symtab not have data?

>  elf_create_section_symbol(struct elf *elf, struct section *sec)
>  {
>  	struct section *symtab, *symtab_shndx;
> -	Elf_Data *shndx_data = NULL;
> -	struct symbol *sym;
> -	Elf32_Word shndx;
> +	Elf32_Word first_non_local, new;
> +	struct symbol *sym, *old;
> +	int size;
> +
> +	if (elf->ehdr.e_ident[EI_CLASS] == ELFCLASS32)
> +		size = sizeof(Elf32_Sym);
> +	else
> +		size = sizeof(Elf64_Sym);

This should probably be called 'entsize' and I think you can just get it
from symtab->sh.sh_entsize.

> +	/*
> +	 * Either way, we added a LOCAL symbol.
> +	 */
> +	symtab->sh.sh_info += 1;
> +
>  	elf_add_symbol(elf, sym);

Not sure if it matters here, but elf_add_symbol() doesn't set sym->alias
and sym->pv_target, and both of those are unconditionally initialized in
read_symbols().  Should elf_add_symbol() be changed to initialize them?

-- 
Josh
