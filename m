Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75A17B427;
	Sun, 17 Nov 2024 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731843138; cv=none; b=Nwzado870ivFxwMjPqBgXc5Opmxh/gMyJqRF+uKRpjWWWxwDtK5d/3xxwlylDnTgoNfRQJG0vYKLOp/iFvJ1hzHxzJVDQbXkxpbA9HWuKqys/tU8fAYSMikiZWC+YSerGA8D18oc6RifQsqslkZJZWP0G3dM+sfUEKQJVwgLC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731843138; c=relaxed/simple;
	bh=Pf1KNGU2GqFgF3m7vfsRYdw1KIqGVYztHsVNAPH4qEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAPLKtfmoBNsDdf6HQs7OFxldLISHNRD6Vg7e8/17Va2GiLPlqLpqHWW9icYSjYzPxnVMxJf4r51o+nxJI6BFlL6yPU7hhc45EYqg3vPH1YIv8O+xeyScoXLtEO7ApzJXmjz1xdj8pHLNXTD+lfPG0z6xMU7t6x9iwI9fVzEkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YIewlT7G; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YIewlT7G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e6W2jKEGEf1HSjRTvJxxG10ZL4ob9jvk9gvbhTss0zA=; b=YIewlT7GjeSVQmoM83cg9Wpyzt
	XGbSQexN5bzxVf18O0d8ab0slERm83/5gwZLiBmNCfvE/tw9z5y+XWtYqCREEbkJRqr1kGHNl8YoV
	apVrlUeD44zIuTaFLNeAZvCuDZXALQKfJflKLLexY5mChNE40MNBcQHhxjJ/zI6T62BXe6jApK4Sv
	Xsv/K083KhREbo2/isZ9U3rcXgiAiVAeQv5XVijhoWbkzr0NUAAalo8+YzypleIjYbhJvsNkFoLTw
	wFkAN8EaSo40rIRZ2E/J1SAD9rBm5ZeoBOIulG+KUbek85lurNUHsDjUxhOZFA8muIDLgjOhZGlyd
	fJacxuoQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tCdVk-00000001wrK-09HV;
	Sun, 17 Nov 2024 11:32:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85D1D3006B7; Sun, 17 Nov 2024 12:32:12 +0100 (CET)
Date: Sun, 17 Nov 2024 12:32:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:module/namespace 8/8] <inline asm>:1191:93: error:
 unexpected token
Message-ID: <20241117113212.GC27667@noisy.programming.kicks-ass.net>
References: <202411170618.NtapXkN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411170618.NtapXkN9-lkp@intel.com>

On Sun, Nov 17, 2024 at 06:49:12AM +0800, kernel test robot wrote:

>     1191 | .section ".export_symbol","a" ; __export_symbol_kvm_caps: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_caps ; .previous
>          |                                                                                             ^

Urgh.. so GCC does the expected string concatenation here, while LLVM is
having a wobble because it expects a single string constant, and not
two.

I've tried the whole CONCATENATE() trick, but that doesn't work right
for strings.

And I'm not sure what else to try.. The whole of C is build on the
expectation that two string constants are merged into one, but LLVM
integrated assembler clearly disagrees :-/

Anybody?
