Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232972
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 17:32:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5DAD613D1;
	Thu, 30 Sep 2021 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633023132;
	bh=RamI4y2DEDbVycOyQwMn9nbwuJrPQmgsrgklzEyEVlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kybyUF4qOB+1FVwjRr5vLvom+HThY3jueIzDsL1bj6Up0kyZR/N0/qGR+hcLjkKVx
	 tKTAh7iGOT8hFnvM3BVcJzs4bhyAk0bTLdLHzuXpsAgJZPUz5X0jg3xNwjNN6ct4rJ
	 tkxkPdWu2sMqIdIHINFXxa4xaNUZCVYWIqwLKR6e8PATHosFBwKoUr8tsTX3A/7f8Y
	 fow4+PI9DPrHOhQT40Jv63uIUM2OVZSKn4pxboB9GWYPnERHwxfDnO9R3huSoaw4FO
	 2DlxLHKY2CnCa1aDs2asiHT3iX0zNMwHdBwixgqBdCPMmuZlwCvnOVZO0kiF0h323U
	 kpbbXid/jhHFA==
Date: Thu, 30 Sep 2021 10:32:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, sfr@canb.auug.org.au, mbenes@suse.cz,
	llvm@lists.linux.dev
Subject: Re: [PATCH] objtool: Teach get_alt_entry() about more relocation
 types
Message-ID: <YVX0lxyRxZuN1idm@archlinux-ax161>
References: <YVWUvknIEVNkPvnP@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVWUvknIEVNkPvnP@hirez.programming.kicks-ass.net>

On Thu, Sep 30, 2021 at 12:43:10PM +0200, Peter Zijlstra wrote:
> 
> Occasionally objtool encounters symbol (as opposed to section)
> relocations in .altinstructions. Typically they are the alternatives
> written by elf_add_alternative() as encountered on a noinstr
> validation run on vmlinux after having already ran objtool on the
> individual .o files.
> 
> Basically this is the counterpart of commit 44f6a7c0755d ("objtool:
> Fix seg fault with Clang non-section symbols"), because when these new
> assemblers (binutils now also does this) strip the section symbols,
> elf_add_reloc_to_insn() is forced to emit symbol based relocations.
> 
> As such, teach get_alt_entry() about different relocation types.
> 
> Fixes: 9bc0bb50727c ("objtool/x86: Rewrite retpoline thunk calls")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

This resolves the instance of the warning that I see with clang-12:

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  tools/objtool/special.c |   32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> --- a/tools/objtool/special.c
> +++ b/tools/objtool/special.c
> @@ -58,6 +58,24 @@ void __weak arch_handle_alternative(unsi
>  {
>  }
>  
> +static bool reloc2sec_off(struct reloc *reloc, struct section **sec, unsigned long *off)
> +{
> +	switch (reloc->sym->type) {
> +	case STT_FUNC:
> +		*sec = reloc->sym->sec;
> +		*off = reloc->sym->offset + reloc->addend;
> +		return true;
> +
> +	case STT_SECTION:
> +		*sec = reloc->sym->sec;
> +		*off = reloc->addend;
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +
>  static int get_alt_entry(struct elf *elf, struct special_entry *entry,
>  			 struct section *sec, int idx,
>  			 struct special_alt *alt)
> @@ -91,15 +109,12 @@ static int get_alt_entry(struct elf *elf
>  		WARN_FUNC("can't find orig reloc", sec, offset + entry->orig);
>  		return -1;
>  	}
> -	if (orig_reloc->sym->type != STT_SECTION) {
> -		WARN_FUNC("don't know how to handle non-section reloc symbol %s",
> +	if (!reloc2sec_off(orig_reloc, &alt->orig_sec, &alt->orig_off)) {
> +		WARN_FUNC("don't know how to handle reloc symbol type: %s",
>  			   sec, offset + entry->orig, orig_reloc->sym->name);
>  		return -1;
>  	}
>  
> -	alt->orig_sec = orig_reloc->sym->sec;
> -	alt->orig_off = orig_reloc->addend;
> -
>  	if (!entry->group || alt->new_len) {
>  		new_reloc = find_reloc_by_dest(elf, sec, offset + entry->new);
>  		if (!new_reloc) {
> @@ -116,8 +131,11 @@ static int get_alt_entry(struct elf *elf
>  		if (arch_is_retpoline(new_reloc->sym))
>  			return 1;
>  
> -		alt->new_sec = new_reloc->sym->sec;
> -		alt->new_off = (unsigned int)new_reloc->addend;
> +		if (!reloc2sec_off(new_reloc, &alt->new_sec, &alt->new_off)) {
> +			WARN_FUNC("don't know how to handle reloc symbol type: %s",
> +				  sec, offset + entry->new, new_reloc->sym->name);
> +			return -1;
> +		}
>  
>  		/* _ASM_EXTABLE_EX hack */
>  		if (alt->new_off >= 0x7ffffff0)
> 
