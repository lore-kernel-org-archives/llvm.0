Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344A9371CE0;
	Tue, 26 May 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809772; cv=none; b=QXEj5ykn3dLaDt+AG0RR9GNQcaMK+hWFGU3XvwmzQ3WsTFjgXJ4l3RQX2wT3tgXNs8zyCtVAsUd8HoN6xlP8Y2KBhsp8VQfKHzAoGx/kX6ANpRYqUqiDrI9oPSAFzDcsvBwqz8zyeja0pDVpUn07NBr4LBW4H4NSyuPmRTVpQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809772; c=relaxed/simple;
	bh=ZGN5KfScNcpR0/tJA9G0Ct5OtIryvTTsC0FRzhX//vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx6ALDCbWVeNhLFadCnSAC3yt/hMNOW3pyD2qL0m+17oeyVkyKU6x0ca6tG7AZ7bjXj/B77kLTsCaxpMqpNr8Lu+gZFwMwdsCBnLm/e+TTgQREmOhAXkhxsRRMfq9qs7PQhsoNoRMV4vQX61g7V8BizYQW5MxwSnN3qyMh7JTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRtp9-0003HQ-00; Tue, 26 May 2026 17:36:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A1BD0C0154; Tue, 26 May 2026 16:53:39 +0200 (CEST)
Date: Tue, 26 May 2026 16:53:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] mips: cps: Assemble jr.hb with an R2 ISA level
Message-ID: <ahWz82FORj2pshsD@alpha.franken.de>
References: <20260507232323.489383-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507232323.489383-1-rosenp@gmail.com>

On Thu, May 07, 2026 at 04:23:23PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig built with LLVM can select CPU_MIPS32_R1 together
> with MIPS_MT_SMP. In that configuration clang invokes the integrated
> assembler with -march=mips32, and the MIPS MT path in cps-vec.S fails
> to assemble two jr.hb instructions:
> 
>   arch/mips/kernel/cps-vec.S:376:2: error: instruction requires
>   a CPU feature not currently enabled
> 
>   arch/mips/kernel/cps-vec.S:490:4: error: instruction requires
>   a CPU feature not currently enabled
> 
> The earlier jr.hb in the same file is already assembled inside a .set
> MIPS_ISA_LEVEL_RAW scope. The two failing sites are reached after
> popping back to the file's base ISA level, so LLVM correctly rejects
> them for an R1 target.
> 
> Wrap those jr.hb instructions in the same ISA-level push/pop used by
> the working site. This keeps the MT code unchanged while making the
> required R2 hazard-branch encoding explicit to the assembler.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/kernel/cps-vec.S | 6 ++++++
>  1 file changed, 6 insertions(+)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
