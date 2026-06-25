Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E033DEFE
	for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374786; cv=none; b=uO7LsGEJC7m/vQUKewzItMUWsJimowTjfi0x2SYicbGYbY1zpriqvAM1i1rXsYP0fHCVePNgZ/Nu5fPv4Myx5YoqAreK4AAXYdUuSRX2UbNn9XwaQlGXhwvFmYZ6nI6+VU4FJsd/pCyIF1ymjr34Q7EAyTrqsnsjkw5TDvmOYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374786; c=relaxed/simple;
	bh=QXjQH/buTcExDsjHMgakhzt8g8gkCM9esJ+xjiUHEYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2Ly11XTp7YUo2eSlCjtaR5h/CXJPerczNxRgDWdzJscV6Ok+E3aAItiVrYk/ovOnd4CQRQHYaNY84L0Lx00KuS19btJd402ofJ4BaON7R5L0p3Ti04yVWCykqkPBFzZbwPhUIzu5QTfUxeJR9oPLoqvveHQocDV2U9tM04JmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTupnyYm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTupnyYm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c08922c23ebso332964966b.0
        for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782374783; x=1782979583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDnOaXCiWv96jSUBbBWKHEoVhfgL164bVFcPRzDH7PQ=;
        b=UTupnyYmzrJIH4R4smeTuU5bEV5yb7w1ZHWa+4ymB6wr8SDoutowVDRXacz0jnFqXR
         6LjldP1BKXtjHI62lbG8n+FtngCB/9Ci4j/L/NYuIv46320B/9U02NYIxN7K55msg2x0
         Oi6lWR3Rd5gAXB/hme1Tx8EEvvlzVRD0vCBM0Rs3KhEhKYMhvo4KoHCjAbOoL7U7abq9
         bbgpB0GA21BdUzVzlaALY6kSykugpFTCvMONmhlpJgZ4u0WuxdYpRG6mLDaanR7nWin6
         vMGJJBfZFfBrE16f5RqVQj+FdymIJ23eDQj7RX6L45UyeXTn8RyHSvj99Q9Sx15GMloR
         GYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374783; x=1782979583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDnOaXCiWv96jSUBbBWKHEoVhfgL164bVFcPRzDH7PQ=;
        b=eMgyWoUXs0kYQGtDhWRmQl3QyFOycXP+JyEtB7c0m4GrK/nYG559x2oQQR8o6os9Eo
         ObylaViKU94hWQAGjK+FTgrhTUl/KIZRLdqGpbhGzYDOb0OitdjkNVz98Nt/1JQMTkRY
         ktb2433lYjUS6Lb9oB9LXWV3sE4tca/vG6TCpumW+lLnrsw+ZGc4UdsBBEUJG9mb3dXz
         U/P/aFHlztC/EcCjKMjB9S6qhhTqhyP2UY+NfbHpW39eS4EAju/SC17Uzv6NeluQ3nV9
         C0zqjPHGh3XZ2lJI+Gm7ulL4LJ6mIkQLRImqpwbCedfy7SXlf83SM9ngx5BHsIY6t6hr
         xQsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWy0p/9UbCDT3oiMLPxHekJ2MAM0ybTCuexBRnnQb/9KtSH2fEdo+HgFDFj+b379QNGeMi@lists.linux.dev
X-Gm-Message-State: AOJu0YxBLpEaUyzmq7VDofeb5h+pmxz+hy+Jep/IDj/eXmcpWPAnz7e8
	wcEcSS0W6RmHGgvkGeQVu0oDJCUdKClyZyNp7EbSTdpvtBxG/G1gAjMB
X-Gm-Gg: AfdE7ck1IvQLOwHo0vi6HRpOtqeRkljSvKBERXYPj4IdPE5tn9NBZui5fZS9vdPZO5Q
	OlZ9IaiQw7sKgl8FwDiuoJVPu0ORXZl0xJIpJmHdmWQqabGCfQ9UvpJv3ya/HBP1lqztI8wrFli
	nycKPG1BhFGsiqQv5zMAOhXU6sM4WSPbfZMmCrFl5jKYDdy2AMXwvziIV8dmpI54hRV8JViNzKZ
	sVFv0XvO1/x2dj2XUuwtO2y35pWYTD8LrzhBWZ457WFyQd3tzjYtSSn+obNy+XCCcWaa1Z2zR3B
	ZlAyMkVpWHI9kgKMggqpLU7PrM+tk5QMvIfZORJ024a60yyZXTGUAWPaNsfqyrtKXi31rCTDxZY
	mCCXf9eNPMzPLHTLqjNGMdE9QAEt5GieKhJUIu9SS0JmlOKe646FfRn6deXYtFaar+cFtKc56BT
	b2ZH7L//EqXl2+PsJSJlW2LahZSSdfcRxHaDfdsJB8uFw7urTAQQ==
X-Received: by 2002:a17:907:9810:b0:bc3:7b0f:91ea with SMTP id a640c23a62f3a-c1205d9862cmr77761466b.19.1782374782801;
        Thu, 25 Jun 2026 01:06:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93cdsm16538250f8f.18.2026.06.25.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:06:19 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:06:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] x86/boot/compressed: Disable jump tables for clang
Message-ID: <20260625090617.4f3f68bf@pumpkin>
In-Reply-To: <20260624221739.GA7516@ax162>
References: <20260623-x86-boot-compressed-disable-jt-clang-v1-1-575fccd58107@kernel.org>
	<ajulLtY29HtgWokg@gmail.com>
	<20260624093848.GA48970@noisy.programming.kicks-ass.net>
	<ajuoqIk4tSV7CmFC@gmail.com>
	<ajupfkcZTTxGP2dG@gmail.com>
	<20260624221739.GA7516@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 15:17:39 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Wed, Jun 24, 2026 at 11:55:10AM +0200, Ingo Molnar wrote:
> > 
> > * Ingo Molnar <mingo@kernel.org> wrote:
> > 
> >   
> > > > I'm sitting on a patch to unconditionally disable jump-tables for
> > > > x86_64:
> > > > 
> > > >   https://web.git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/syscall  
> > > 
> > > In particular:
> > > 
> > >   https://web.git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=x86/syscall&id=76612388fe7aa41a8eb88f890d451bc17255eda0  
> > 
> > Side note: since arch/x86/boot/compressed/Makefile constructs
> > its own KBUILD_CFLAGS, so a change to that Makefile will still
> > be required to universally apply -fno-jump-tables and work
> > around this Clang optimization in the decompression code.  
> 
> Right. I had intentionally kept my change scoped to clang to be less
> controversial but in the face of Peter's series, it makes sense to do it
> for all compilers like Ingo suggested. I have no preference for how we
> proceed here. I don't mind sending a v2 with something like

Isn't this solving a different problem?
Jump tables are disabled for the kernel build to avoid speculation of
mispredicted indirect jumps.
Here they are needed to stop the compiler output containing 'things' the
restricted environment can't support.

Someone building a kernel for a local machine may want to disable all of
the mitigations to avoid their associated costs and also enable jump
tables to avoid the cost of all the mispredicted branches in the comparison
tree.

	David
