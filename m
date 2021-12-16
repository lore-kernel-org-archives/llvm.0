Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955EC29CA
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 00:57:10 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639616221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HtVW5kpcTinJbyFAjuXw5VKYcrS836PGPU3LL9cSpwk=;
	b=ip889JsqJlGEmQwaHwtMpEASiULdSLzRzz7EdOQ/ezeHe+E0qk+2dftw+0aVsFFHZ3ZfQ1
	rDNVIw4ajQkI3WHKgzjkXf3jjvaWlg/IuJ5xnw7LtBu3mDRLdeeZDaf+7yHtcBVvHx5qEl
	h28od89kFJYIa+GU27GYY3FeLBZDChdAsVQqMnDOrdXSqg9XucroxaGZrsKSq2eG8YS5tu
	zgCx40/k71KCdvr3bMJpwRgB6Kxoy0LTDIGLodRNd5yBzs7zq0yvPdwRDd/C0KqoIa93sA
	AVhyRh+TKsc1xwkZ9dD5VfWbXWMeR8ljs3kZDi9usSEi73OhWDhtn2Sn5bwgHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639616221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HtVW5kpcTinJbyFAjuXw5VKYcrS836PGPU3LL9cSpwk=;
	b=xODN9S+/QSPgf2ZY+fPjzkp7tLAvMWg/O13rLt1ZI/CMmQkognzC2iFPh3qsBrze2C4qqn
	yVVmIt0Scr2OoxAg==
To: Bill Wendling <morbo@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Juergen
 Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH] x86: use builtins to read eflags
In-Reply-To: <20211215211847.206208-1-morbo@google.com>
References: <20211215211847.206208-1-morbo@google.com>
Date: Thu, 16 Dec 2021 01:57:01 +0100
Message-ID: <87mtl1l63m.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bill,

On Wed, Dec 15 2021 at 13:18, Bill Wendling wrote:

please always CC the relevant mailing lists, i.e. this lacks a cc:
linux-kernel@vger.kernel.org

It's not that hard to figure that out because it's well documented.

> GCC and Clang both have builtins to read from and write to the
> EFLAGS register. This allows the compiler to determine the best way
> to generate the code, which can improve code generation.

Emphasis on *can*. Just claiming that this might improve things does not
cut it. Where is the prove?

IIRC, this was proposed before and the real reason was not better code
generation but to address the confusion of clang vs. the '=rm'
constraint which is still correct despite some clang folks having
different opinions.

So what has changed since then? AFAICT, nothing. So I consider this as
another attempt of "let's see whether it sticks".

Thanks,

        tglx
