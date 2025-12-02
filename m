Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC522367D5;
	Tue,  2 Dec 2025 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692003; cv=none; b=Cwp1fGVzX5+Oc/SKcDbe/43gwj4nZ8acjR/vwZ9kipuUBMNVmW47oUt8t0cKEwUZjonzXNELCoIFu1fTCmwzvDsbkoqcT9QIe5ubswax4R/bwMcJXiLGLmqH7FhClcVINYn9RSIK8pvMDpoQy32ZBEREslG6bCW8tl3vX4slgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692003; c=relaxed/simple;
	bh=1PLZza1bgVMei1SAfPyLtRIddHux1CNqjH9ILmO/xJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnzKpbXXUhvi1BBXVG7jOC4QRwJ9CEtZokFU4P1Al28DcmnkZAnbQrf7aVgX0MFPnUKmAC2iXVJJgCgOE5cN4uDfF1mYaHnll/eJqTEXrYrbh8Rim+ZTQ8PoJYlp45LUOGZI0maA6yYHTRHFX1yiPTToJHpBhwZfBzVX40ezMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubmMX7mg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubmMX7mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B5C4CEF1;
	Tue,  2 Dec 2025 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764692003;
	bh=1PLZza1bgVMei1SAfPyLtRIddHux1CNqjH9ILmO/xJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubmMX7mg5DZBNxOJA4HRyjUSOJbtEfWaW4+1vJsGYiJAlIxk6XYnZO+vC2gdTCXgP
	 JowzuCGcyGSSz4/l/41OaAjRfw8L3HoEhOP7YsR/3R3CYNaIsivub3+hE1kJcUqFOi
	 vZqRlY+iotLR2JgLMdsuttcz3Sxqr/NxQHTnZHUxQ4kQK5uzIDzgNdFP4z2UXIpCNE
	 7W4mKm4uQ1xPuJ7ZxzshJPeWr2AHXuO0UZ3XPsCYr1pULJkj/PkLxR1dBFG6Vw3jAL
	 S4ABPIGJcJ2nZNfibvZedoxmct0jae0TXiyZgfxyUyWfRy4Lriy/EFgQSR4dgQRW+f
	 WyYIBuAYCv8/g==
Date: Tue, 2 Dec 2025 08:13:21 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	mingo@kernel.org, peterz@infradead.org, david.laight.linux@gmail.com, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 11/30] objtool: Trace instruction state changes during
 function validation
Message-ID: <gl5aug2lwyhjyp2adwjtomxodxixqbpzxj3bcbnimfzo3xmce5@tvpxxghlmxif>
References: <20251121095340.464045-1-alexandre.chartre@oracle.com>
 <20251121095340.464045-12-alexandre.chartre@oracle.com>
 <20251201202329.GA3225984@ax162>
 <vlam452zory73y4nvtgl63ofr3yrguguda63qsns3k6r7sgsey@2xhf3fbc5pkx>
 <96eb8fc0-b93c-4ec1-9d04-eb7b67857b11@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96eb8fc0-b93c-4ec1-9d04-eb7b67857b11@oracle.com>

On Tue, Dec 02, 2025 at 09:34:20AM +0100, Alexandre Chartre wrote:
> 
> On 12/2/25 02:30, Josh Poimboeuf wrote:
> > On Mon, Dec 01, 2025 at 01:23:29PM -0700, Nathan Chancellor wrote:
> > > Hi Alexandre,
> > > 
> > > On Fri, Nov 21, 2025 at 10:53:21AM +0100, Alexandre Chartre wrote:
> > > > During function validation, objtool maintains a per-instruction state,
> > > > in particular to track call frame information. When tracing validation,
> > > > print any instruction state changes.
> > > > 
> > > > Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> > > 
> > > I am seeing a segfault after this change in -next as commit fcb268b47a2f
> > > ("objtool: Trace instruction state changes during function validation")
> > > when building allmodconfig with clang 21.1.6 [1] (I did not check
> > > earlier versions).
> > > 
> > >    $ clang --version | head -1
> > >    ClangBuiltLinux clang version 21.1.6 (https://github.com/llvm/llvm-project.git a832a5222e489298337fbb5876f8dcaf072c5cca)
> > > 
> > >    $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allmodconfig drivers/scsi/qla2xxx/qla2xxx.o
> > >    make[7]: *** [scripts/Makefile.build:503: drivers/scsi/qla2xxx/qla2xxx.o] Error 139
> > >    ...
> > > 
> > >    $ ld.lld -m elf_x86_64 --fatal-warnings -z noexecstack -r -o drivers/scsi/qla2xxx/qla2xxx.o @drivers/scsi/qla2xxx/qla2xxx.mod
> > > 
> > >    $ tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o
> > >    fish: Job 1, 'tools/objtool/objtool --hacks=j…' terminated by signal SIGSEGV (Address boundary error)
> > > 
> > > If there is any other information I can provide or patches I can test, I
> > > am more than happy to do so.
> > > 
> > > [1]: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-21.1.6-x86_64.tar.xz
> > 
> > Objtool is overflowing the stack due to the large number of jumps it has
> > to follow in that code, thanks to kasan.  The above mentioned patch
> > 
> >    fcb268b47a2f ("objtool: Trace instruction state changes during function validation")
> > 
> > added a 328-byte struct to the stack in validate_insn() which
> > drastically increased the amount of stack size needed.
> > 
> > I suppose we could hack a fix by making it a static local variable, like
> > below.
> > 
> > Or, objtool could setrlimit(RLIMIT_STACK) to 16MB?
> > 
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index a02f8db75827..206b8589d82b 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -3678,7 +3678,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
> >   			 bool *dead_end)
> >   {
> >   	/* prev_state is not used if there is no disassembly support */
> > -	struct insn_state prev_state __maybe_unused;
> > +	static struct insn_state prev_state __maybe_unused;
> >   	struct alternative *alt;
> >   	u8 visited;
> >   	int ret;
> 
> static looks good enough to me.
> 
> Reviewed-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> 
> Thanks,

The static local bothered me, I went with a different approach to move
that variable (and its usage) to handle_insn_ops().  Will post shortly.

-- 
Josh
