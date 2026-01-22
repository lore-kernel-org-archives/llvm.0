Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D538A70B;
	Thu, 22 Jan 2026 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108301; cv=none; b=OVz0mhTAADr63+D2rBmEF9/876+XZzr4sCBHziRZK4GstZMs4v3mFfALYEbM5TAkM9ueDHEB2hjM5cc1W2DFlTfRB64sKt6LZQ5r8C1Q/tNXpFnLcEH2T5MW1VS/22Dqgffx3Ibe9ABtix6CS2K0ynYrqSEP9uH2g12I5XeNXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108301; c=relaxed/simple;
	bh=2Ghu9y+abJd+7+pVokABabRmVG10mN+UuTjAIs8Mih0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIkEUSDnn4hio9qEVPMnmb6WlGB3tOKj+9n3hwJH3tP3hWst+jMsscg8CzPjlA31U/m0HHq3KgNTSJMtgV7prtZP39XxeBAJukeHtzB4xw/F4RK5Pat0yq58vzxUP0L9v1AsXDe2pSq64kyZt+5YMmX+bGhello2rqsvc/4UUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG/cDKjm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG/cDKjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9351CC19423;
	Thu, 22 Jan 2026 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769108300;
	bh=2Ghu9y+abJd+7+pVokABabRmVG10mN+UuTjAIs8Mih0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG/cDKjm+oo0ea+CoLfR3hQahHdxOLkEFpMjtGLe11biZRB/M3foCYnR5Wgj4kL30
	 anb087mKDINmPLO4sBUiysdWeFxpErIGFQSUC76oOwLJob7rJKteIN96j/6gNJpHVz
	 jAVyUxe5AtwSc97Jfotd2YAo7yLHh3tZL1KadzwWpE9947n2f+ofPCsQ90Ybwpk76p
	 RIkpgU2LcXT4e9Z71QSE0PtSn1DUhJoQCbY+3NFjcDtVY/qlrDM8RohWHOKBM6XRyH
	 j7xGtqhdZbUbp4bIISU0JUij/ovQOKzHvaXZGrwgy1wKSavn98Tpb/keQ7tfPyjh6k
	 QkxXrwPP4iS2A==
Date: Thu, 22 Jan 2026 11:58:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, elver@google.com,
	linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260122185812.GB3461196@ax162>
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
 <20260122090402.GD171111@noisy.programming.kicks-ass.net>
 <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>

On Thu, Jan 22, 2026 at 08:28:44AM -0800, Bart Van Assche wrote:
> The build-kernel-with-clang script is as follows (this may not be the
> recommended way to build the kernel with clang):
> 
> #!/bin/bash
> export CC=clang
> export LD=ld.lld      # Use LLVM's linker (optional but recommended)
> export AR=llvm-ar
> export NM=llvm-nm
> export OBJCOPY=llvm-objcopy
> export OBJDUMP=llvm-objdump
> export STRIP=llvm-strip
> export READELF=llvm-readelf
> make LLVM=1 CC=clang "$@"

FWIW, this could ultimately simplify to

    make LLVM=1 "$@"

as LLVM=1 is the shorthand for

    make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
         HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld

as noted in Documentation/kbuild/llvm.rst /
https://docs.kernel.org/kbuild/llvm.html.

Cheers,
Nathan
