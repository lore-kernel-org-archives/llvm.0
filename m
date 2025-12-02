Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63BA7262E;
	Tue,  2 Dec 2025 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639061; cv=none; b=LrWmqFEt61pkG4uuEDKicfpSkg9P8/BjWsqjDWMxPv0u8+i1UknNll7bxXMJ4xNjIGwcHG9xr0D6NawuC7dYGPz+LLg7OKPMLVRcPCXAFHieKyNeL/BgDlNsbi7vgZUrChdJcR0U556IlxOrWjbllJxR833xwhSo1kTsacK4cEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639061; c=relaxed/simple;
	bh=Coq1iWndgqWSxg9ZfQ6m7gAPBsStohlWSWaBiqak+lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJRAI4oHNd3imBzWA3RGZvcRUeF49jNVk9QnDRGsO4Xe60Naw1//rxaPw4MkrzrZMJpJXMsGVliIi4EFnxs0jAENtPWhaaNWcpPPiblMcHUZ/we4L7KGCR3woUxisHcCX1F3KMJ1CwsmFq6CV9EcH57bDVSPwFpZwxN6LEeNT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK+gWVf1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK+gWVf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967D2C4CEF1;
	Tue,  2 Dec 2025 01:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764639061;
	bh=Coq1iWndgqWSxg9ZfQ6m7gAPBsStohlWSWaBiqak+lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hK+gWVf1lZxYl9/1aPidJa0Zf0i/vln3sXQQkMs4Gp1oBT0wG9+0g7wvlN++9bV5S
	 8YtdZ8WQJbssrJ6jQeTt996S7hsPJuPMK4uLV5QxPLA46E12UPWDFx2b66siVcXj4C
	 2gDdTdQ6BMJ2ShKUnqiGQCcFbnZVRs3vHnaVFv20maK0VUlN1Os7K8CWoHt7ipYK+K
	 AlDu40xZTfMuqU9Wxk4FNX/JGR16x7Qpgomsw8vDwjIdsEU2lba5mYHO8/AMogF9rt
	 J7EthLbznxvDd91I8CQeigQcY9FiML0kJjh5MILvexPel7BxAd7fn/5qiyxtacdrQZ
	 bRox/seoNjSQQ==
Date: Mon, 1 Dec 2025 17:30:59 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, 
	david.laight.linux@gmail.com, llvm@lists.linux.dev
Subject: Re: [PATCH v6 11/30] objtool: Trace instruction state changes during
 function validation
Message-ID: <vlam452zory73y4nvtgl63ofr3yrguguda63qsns3k6r7sgsey@2xhf3fbc5pkx>
References: <20251121095340.464045-1-alexandre.chartre@oracle.com>
 <20251121095340.464045-12-alexandre.chartre@oracle.com>
 <20251201202329.GA3225984@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201202329.GA3225984@ax162>

On Mon, Dec 01, 2025 at 01:23:29PM -0700, Nathan Chancellor wrote:
> Hi Alexandre,
> 
> On Fri, Nov 21, 2025 at 10:53:21AM +0100, Alexandre Chartre wrote:
> > During function validation, objtool maintains a per-instruction state,
> > in particular to track call frame information. When tracing validation,
> > print any instruction state changes.
> > 
> > Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> 
> I am seeing a segfault after this change in -next as commit fcb268b47a2f
> ("objtool: Trace instruction state changes during function validation")
> when building allmodconfig with clang 21.1.6 [1] (I did not check
> earlier versions).
> 
>   $ clang --version | head -1
>   ClangBuiltLinux clang version 21.1.6 (https://github.com/llvm/llvm-project.git a832a5222e489298337fbb5876f8dcaf072c5cca)
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allmodconfig drivers/scsi/qla2xxx/qla2xxx.o
>   make[7]: *** [scripts/Makefile.build:503: drivers/scsi/qla2xxx/qla2xxx.o] Error 139
>   ...
> 
>   $ ld.lld -m elf_x86_64 --fatal-warnings -z noexecstack -r -o drivers/scsi/qla2xxx/qla2xxx.o @drivers/scsi/qla2xxx/qla2xxx.mod
> 
>   $ tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o
>   fish: Job 1, 'tools/objtool/objtool --hacks=j…' terminated by signal SIGSEGV (Address boundary error)
> 
> If there is any other information I can provide or patches I can test, I
> am more than happy to do so.
> 
> [1]: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-21.1.6-x86_64.tar.xz

Objtool is overflowing the stack due to the large number of jumps it has
to follow in that code, thanks to kasan.  The above mentioned patch

  fcb268b47a2f ("objtool: Trace instruction state changes during function validation")

added a 328-byte struct to the stack in validate_insn() which
drastically increased the amount of stack size needed.

I suppose we could hack a fix by making it a static local variable, like
below.

Or, objtool could setrlimit(RLIMIT_STACK) to 16MB?

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index a02f8db75827..206b8589d82b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3678,7 +3678,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 			 bool *dead_end)
 {
 	/* prev_state is not used if there is no disassembly support */
-	struct insn_state prev_state __maybe_unused;
+	static struct insn_state prev_state __maybe_unused;
 	struct alternative *alt;
 	u8 visited;
 	int ret;
