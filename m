Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1F48095F
	for <llvm@lists.linux.dev>; Wed,  3 Jun 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491841; cv=none; b=B6JsAzrUeHf8+S97CF5NlOaQsOx7ay3ABrrNtUCQrzKIySPCbJvwUKjhsaOsjB4hNrRcGWoLbWtarFHjY2tXGVa4fUmGZ/lDpReF/QHKaF1fgQu+5cn/S245+cWwGzbkqrX53wYAueyv50y+SQdeCvgqP26mhEz+nr9V4mUOjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491841; c=relaxed/simple;
	bh=MBU7CS7WVwYwMOdcet6ICEOaUIj+8mKXQIBdEMW6F8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6gmYEjy2oKnq210nFmSnbPphWb7a05w6lM6MpZEFw4knbndg4Abx+kY1WTgzK5BFyFeE4m/i3Oc480tDPmgci0NVBh6xfkZ99hWa9W2o2FnET2UzI/V1yof1uksQ4d/mDAqM1fpojJqG+k4YJ08jAsXIA1OAiTAX8gLo7bL3FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT49zpA8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT49zpA8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4600cbb06deso433059f8f.1
        for <llvm@lists.linux.dev>; Wed, 03 Jun 2026 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491838; x=1781096638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npACNw5GZ77miqur21FanA4v5+vTppUVJOnuElrt9AM=;
        b=RT49zpA82jPuPznWFl8S7ldRh9EeU2yUfCkRXvcWsaqxtv9cxIIC5lIIgUVHir01RX
         B6lJV1kjf2Z6DlSDDxENNQ3CO+lRN+CgH4hrnBKC3wRqzzvSRSly41SMEchRtvJ7QS8i
         Bp51b8H9M/JiKIfhKUjKbyUjWoN0oe42iaJ5hO70Jg/BR5vPuSvma/rnsBpk60JZGHV7
         myC/Yw122cMxSIkhXafWPEXJwaABaaEkFvnaYhW6YC6PtW86Uy+gabkv8jEldf96pAbQ
         QdhX3QaezQTDpMJTeUwvIbApFXK0pT7WzXpz8i7aOg793O73Jjn3Cf+iWRcHLaFBRuDh
         y6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491838; x=1781096638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npACNw5GZ77miqur21FanA4v5+vTppUVJOnuElrt9AM=;
        b=FuIw2afehaRpNC35i/C5/JzKawPhxaS/8ZZmeGVju/Ad1b0mST/GsL/LOwbwLwLgeZ
         bmPGekzmIGKlg4+fcDWzaS/3g+JH1DC+b/rsmyB0qKhRJH26c34P8ZigmehDTivf6S3R
         mqeGW9TIC1ULbmeei2FxP+/P3Nsjr4we0ERuwXCi5c4mlGFYePBlj+wf488nehoLZs0C
         2IDBsDHztwKq2KALRIPMslLPBtFen0e8IcEs6ClrQDLi/WyhFZwJ5XONR2xuR/gp6CaJ
         hiSXhWrL9lfvS7xCcHa7UpVFRXLxwDxu7kxPqEAH2FocrmcQpP0QJDuKy4RNfISTA4zC
         x7lw==
X-Forwarded-Encrypted: i=1; AFNElJ8obDENvUwCMnEnV8LZLYttU/nGM4T0zAG9Rd18Ob8xusgHxZ+wmX3YQGZeqiNrHIV9wg+w@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3H8rXjh+B9vbleIvl/O9+BRIMLdMVeejWodEFD677qjWZ5yMT
	UthbVZU9Rt7cE/t80SXkr55BhdZfcsgXV/EChZwnd4Dlgepj6TtYDNJN
X-Gm-Gg: Acq92OHv7psNkMzj+6TvJSj1sIWGoJ5hBvJ/Ctftw1fhAAC9mphC9yQ87haPGMWUCSd
	8YONw+RYzLdgzaLsLUHKqog9enF5MN/5Upbsla73ZAj/naj4kwgf0LyfajVdmIeW+nEb8Czo2tZ
	Y4rsqGetC/Cxyo+GnozmWj2Uh93juz5Eelfz4NiAixkSnfnWH4cd4qaws7Cmh/g/Bx5vRQMxwli
	hAG4I4TfX1liq2UBDwaFXNwE7XYucHXjmK/EHDN8ohP36VkMspNbJEj1Ta/Ov7LOZz9c8hmEyrh
	7Gag9n2WEz6W2qVLVR4zaTSFixitWZTgtHmMdAgCk25Yo2fVX+D0BfDARoOqO11Uu/JvrRYMZu7
	NFc6WVS/nUT40taTXyXJ2bpXhL6W3h8NsKikWDn70f4YBZYWHjqiJ5dU0mKpiwb9VN1ZQcWV6Op
	RE3xlArXg7LYBA9d58s/U2klLZpWelYmfIo7AsvPH+QALarBZ6L5tdWIqU3rWGJd8r0FbLlN4=
X-Received: by 2002:a5d:5f8c:0:b0:460:133f:2a4e with SMTP id ffacd0b85a97d-460212df7e6mr4465185f8f.13.1780491837758;
        Wed, 03 Jun 2026 06:03:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm7576265f8f.37.2026.06.03.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:03:56 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:03:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Rasmus Villemoes" <linux@rasmusvillemoes.dk>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Petr
 Mladek" <pmladek@suse.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Dennis Dalessandro" <dennis.dalessandro@cornelisnetworks.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>, "Arend van
 Spriel" <arend.vanspriel@broadcom.com>, "Miri Korenblit"
 <miriam.rachel.korenblit@intel.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] tracing: work around -Wmissing-format-attribute
 warning
Message-ID: <20260603140354.6744499b@pumpkin>
In-Reply-To: <aafe201a-64a6-438f-89a3-d1cd10a357a7@app.fastmail.com>
References: <20260602150904.2258624-1-arnd@kernel.org>
	<ah8n-Nk305S5hRwN@ashevche-desk.local>
	<WPQQfPHOiGJbSxrXRdFDy9jURhS7JMpNu9sD54Vfe5wB-JOjyGY6xPQyACz3MSGg0xGp79eOYCyZ2Hi2CsPeUg==@protonmail.internalid>
	<35c1ba62-e74d-4abc-aa73-ccd35968ff89@app.fastmail.com>
	<875x40hz7k.fsf@prevas.dk>
	<aafe201a-64a6-438f-89a3-d1cd10a357a7@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 03 Jun 2026 10:41:18 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Jun 3, 2026, at 09:15, Rasmus Villemoes wrote:
> > On Tue, Jun 02 2026, "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> On Tue, Jun 2, 2026, at 20:59, Andy Shevchenko wrote:  
> >>> On Tue, Jun 02, 2026 at 05:07:05PM +0200, Arnd Bergmann wrote:  
> >
> > May I suggest a different approach, that avoids having that extra
> > function emitted (which presumably compiles to a single jump
> > instruction, but still, with retpoline and CFI and all that it all adds
> > up): Keep the declaration of __vsnprintf() in the header without the
> > __print() attribute, but then do
> >
> > int __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args) 
> >    __alias(vsnprintf);
> >
> > in vsprintf.c. Aside from reusing the same entry point, I could well
> > imagine a compiler some day complaining about seeing the printf
> > attribute applied in a local extra declaration but not having it in the
> > header file.
> >
> > Presumably it will need its own EXPORT_SYMBOL if any of the intended
> > users are modular, and it certainly still needs a comment.  
> 
> I had tried that earlier but given up because the attributes have to
> match exactly.
> 
> This definition works with all currently supported versions of gcc,
> but may have to change when the there is a new version that adds
> even more attributes:
> 
> int
> __printf(3, 0)
> __attribute__((nothrow))
> __attribute__((nonnull(1)))
> __vsnprintf(char *__restrict buf, size_t size,
>             const char * __restrict fmt_str, va_list args)
>                __alias(vsnprintf);
> 
> We'd probably want to also add __nothrow and __nonnull macros
> in linux/compiler-attributes.h if we do this.
> 
> For reference, see below for the alternative idea I had
> that avoids adding the __vsnprintf() alias altogether by
> passing down the va_format using "%pV".
> 
> I don't think I actually got this one right in the end
> since I only build-tested it, but I expect it could be done
> if someone is able to test and fix all the corner cases
> properly.
> 
>        Arnd
> 
> diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
> index 4715330c7b6b..8e44fc3e60b0 100644
> --- a/include/linux/trace_events.h
> +++ b/include/linux/trace_events.h
> @@ -956,14 +956,11 @@ perf_trace_buf_submit(void *raw_data, int size, int rctx, u16 type,
>   * gcc warns that you can not use a va_list in an inlined
>   * function. But lets me make it into a macro :-/
>   */
> -#define __trace_event_vstr_len(fmt, va)			\
> +#define __trace_event_vstr_len(vf)			\
>  ({							\
> -	va_list __ap;					\
>  	int __ret;					\
>  							\
> -	va_copy(__ap, *(va));				\
> -	__ret = __vsnprintf(NULL, 0, fmt, __ap) + 1;	\
> -	va_end(__ap);					\
> +	__ret = snprintf(NULL, 0, "%pV", vf) + 1;	\

This adds an extra snprintf call - non-trivial and more stack.
Can't you just use the old code with vf->fmt and vf->ap ?

And does the %pV" include the va_copy()?
It isn't normally needed.
Any scheme for avoiding doing the printf processing twice
is likely to be a gain.

-- David

