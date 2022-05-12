Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA215BE
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 03:02:34 +0000 (UTC)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id E7D8B36F;
	Thu, 12 May 2022 03:02:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id EDF332002B;
	Thu, 12 May 2022 03:02:28 +0000 (UTC)
Message-ID: <154f41707c58acdac26c3300c5b429f381c45708.camel@perches.com>
Subject: Re: [PATCH v4 1/2] x86/asm/bitops: ffs: use __builtin_ffs to
 evaluate constant expressions
From: Joe Perches <joe@perches.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Nick Desaulniers
 <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter
 Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix
 <trix@redhat.com>,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 11 May 2022 20:02:28 -0700
In-Reply-To: <20220512011855.1189653-2-mailhol.vincent@wanadoo.fr>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
	 <20220512011855.1189653-1-mailhol.vincent@wanadoo.fr>
	 <20220512011855.1189653-2-mailhol.vincent@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.64
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: EDF332002B
X-Stat-Signature: s3ny7ydgms8u5bhpy6dseb6xt83hmmrk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/YVM8TxruqLdoykQoTANU1GScIYiXrWm4=
X-HE-Tag: 1652324548-95630

On Thu, 2022-05-12 at 10:18 +0900, Vincent Mailhol wrote:
> For x86_64, the current ffs() implementation does not produce
> optimized code when called with a constant expression. On the
> contrary, the __builtin_ffs() function of both GCC and clang is able
> to simplify the expression into a single instruction.
[]
> -static __always_inline int ffs(int x)
> +static __always_inline int variable_ffs(int x)
>  {
>  	int r;
>  
> @@ -310,6 +299,19 @@ static __always_inline int ffs(int x)
>  	return r + 1;
>  }
>  
> +/**
> + * ffs - find first set bit in word
> + * @x: the word to search
> + *
> + * This is defined the same way as the libc and compiler builtin ffs
> + * routines, therefore differs in spirit from the other bitops.
> + *
> + * ffs(value) returns 0 if value is 0 or the position of the first
> + * set bit if value is nonzero. The first (least significant) bit
> + * is at position 1.
> + */
> +#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))

How about not defining another function and using parentheses around
the function definition to avoid the macro expansion like:

#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : ffs(x))

and

static __always_inline int (ffs)(int x)
{
	etc...
}


