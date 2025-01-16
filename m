Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858CD1B653C;
	Thu, 16 Jan 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020340; cv=none; b=Dfm7bm/sSolaWplwYzS9hXqNblAHvXNm2npdp/voystf7a3A+XWVtJQdmDNWPJiRK2hkiF802FrabB/RxvSLy09vRYayV+E2DkgvqzCo/NR53g51WG3i3G9r8zoI2neDVOqd6I88JDUicXoBp8thO0rFIPY2AEFn4ltMRBySPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020340; c=relaxed/simple;
	bh=dYyKJqHdhrwmk1YZjRBX/J3WYWm/qlv/Y88sHPXJ9Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubqE9C4j3VUDjmDeJMRSQAavgWErU4qiopjQLwgwnfYInJPMc4P7WJSF3QWw+gWcbZgFU2IV5T5F+K6Llue5Y9io8UQNPUymACte3sTAIhUFTJs7dGmsR7fe5PPwoZV6iLhltB8d26Zp/ZgltjWA5bnpWfAkAU3cgId2GjSJtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tNEt+TND; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tNEt+TND"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sp+FxjCkzTW4qc2F4mDkdN/WiXSt2JPHkUPS5ECiaJE=; b=tNEt+TNDhov73YFgV4d3QuFfxV
	wodGVIjMSeOy/uoYu4slydOluGBThtgfGTQSUSMXUqUkBx3FZUEI/jieBTlfjTs+JrstOjNPh5ioh
	zE9igoQMNvxowDWCDekEhektqAE29BAxX2tAZsnzMKN6Wo/KQd1SaoRbTfLD3NNtmvwP1rvdHY0I9
	K0JYXKyMwq1Q52W6HrVWbF9QTpKEbmdf0+nMip3iVnlpCbl4AUSuSXow6ozld2psjbUfqduuxVZmL
	7xSwg49F9U3irbLXqcyfUSVJcwrhOu6EtTR4fdt8N8h3xIt2AJJWw0SD/UoXLJCKg4ltNYstPQ1OE
	LwIawK4Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMKu-0000000BO6o-0Ees;
	Thu, 16 Jan 2025 09:38:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2920A300777; Thu, 16 Jan 2025 10:38:47 +0100 (CET)
Date: Thu, 16 Jan 2025 10:38:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/15] powerpc/objtool: uaccess validation for PPC32
 (v5)
Message-ID: <20250116093847.GH8362@noisy.programming.kicks-ass.net>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>

On Wed, Jan 15, 2025 at 11:42:40PM +0100, Christophe Leroy wrote:
> Christophe Leroy (15):
>   objtool: Fix generic annotation infrastructure cross build
>   objtool: Move back misplaced comment
>   objtool: Allow an architecture to disable objtool on ASM files
>   objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
>   objtool: Add INSN_RETURN_CONDITIONAL
>   objtool: Add support for relative switch tables
>   objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
>   objtool: Track general purpose register used for switch table base
>   objtool: Find end of switch table directly
>   objtool: When looking for switch tables also follow conditional and
>     dynamic jumps
>   objtool: .rodata.cst{2/4/8/16} are not switch tables
>   objtool: Add support for more complex UACCESS control
>   objtool: Prepare noreturns.h for more architectures
>   powerpc/bug: Annotate reachable after warning trap
>   powerpc: Implement UACCESS validation on PPC32

This mostly looks okay to me. You have a tendency to violate the reverse
xmas tree for variables thing, but meh.

I would like Josh to have a hard look at this though, jump tables are
his thing :-)
