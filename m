Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC77A
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hz/n40Oa1HVDl1rLa1Fyu+tL1CR4nrdD4E6dqN4uGrI=; b=qVLYYsC2RGSyV/yASxMehKW2wu
	JvyIf+CIlvawa6xDrQbzjivyEvUEqrf3Edjvx4vNUiqON+o+oZUah8VgAZazXBZaZoGCErFcJLQ94
	cyFztFIHB5K/S4LFIT9w8MxlmPDvwl8SWQVCNR50TV7ja7I3yGpgzAtTruFTRuEP7h+tiwdXUwRtH
	UFyCgtb9w6rgYmTmFHJjoI/rm+DTKFOShE5nA6QJif1FkI6es/ezaaN7zTCJic3MlltmCarrHq8y0
	dRdDsXmipWi0c7vWAlNtoc+qPeUjijHLH4UrGCov6UzcN9u++DKAMpIjeMLvB1ljXZBcWLAfzLR7H
	iGa11Zwg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nffyN-00HOpp-8g; Sat, 16 Apr 2022 10:48:11 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 82CD19861A3; Sat, 16 Apr 2022 12:48:09 +0200 (CEST)
Date: Sat, 16 Apr 2022 12:48:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220416104809.GC2731@worktop.programming.kicks-ass.net>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415182130.iltk2uxnubeaa4nk@treble>

On Fri, Apr 15, 2022 at 11:21:30AM -0700, Josh Poimboeuf wrote:

> If LLVM assembler doesn't support this option then we may have to go
> with something like this?  I can't seem to recreate so I'm not able to
> test.
> 
> We'd also need some objtool checks to make sure the non-section-symbol
> fallback isn't being done for a weak symbol.  Or just remove the
> fallback altogether and force section symbols whereever they're needed,
> similar to the below (untested).
> 
> 
> diff --git a/include/linux/static_call_types.h b/include/linux/static_call_types.h
> index 5a00b8b2cf9f..77040ce575fa 100644
> --- a/include/linux/static_call_types.h
> +++ b/include/linux/static_call_types.h
> @@ -52,9 +52,14 @@ struct static_call_site {
>  #define __STATIC_CALL_ADDRESSABLE(name) \
>  	__ADDRESSABLE(STATIC_CALL_KEY(name))
>  
> +extern unsigned long __addressable_ip;
> +
> +#define __STATIC_CALL_SITE_ADDRESSABLE() __addressable_ip = _THIS_IP_;
> +
>  #define __static_call(name)						\
>  ({									\
>  	__STATIC_CALL_ADDRESSABLE(name);				\
> +	__STATIC_CALL_SITE_ADDRESSABLE();				\
>  	__raw_static_call(name);					\
>  })
>  
> diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
> index dc5665b62814..f6e3e0463efb 100644
> --- a/kernel/static_call_inline.c
> +++ b/kernel/static_call_inline.c
> @@ -17,6 +17,8 @@ extern struct static_call_tramp_key __start_static_call_tramp_key[],
>  
>  static bool static_call_initialized;
>  
> +unsigned long __section(".discard.addressable") __addressable_ip;
> +
>  /* mutex to protect key modules/sites */
>  static DEFINE_MUTEX(static_call_mutex);

This *might* work for static_call. But what about things like
.retpoline_sites?

If we get an indirect inside the weak function and at
a different place inside the non-weak function, then we end up with two
patch sites in the non-weak function.

And since all of that is compiler generated, we don't have anything to
stick anything in to alleviate trouble.

(in fact, I didn't observe this with static_call, I just picked it for
the example because it was somewhat easier)
