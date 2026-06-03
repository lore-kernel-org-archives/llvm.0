Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB939902D
	for <llvm@lists.linux.dev>; Wed,  3 Jun 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470935; cv=none; b=cXtQ5WYGB3bVOSP09KGAEp1P8lXEqEnOqruB2rBQXq00dSESQb71b0KmOySeisNEqpAVqhX5BoEU7PdfN3BXQEzhL0nqsKnGDmZLiV7WZcKAyCkt3TP96MrD8hVKpjjHHybLC0GVRyusAbHvSUZMf/KVUiuiqC4pLINpjHDqG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470935; c=relaxed/simple;
	bh=M1qhC0UFXz8MVPH15I4zPG/B8TW75biCWf4twzWwS/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OGjk6ouinY8Ged3DTawa3BrAr9vNOOYIzxvQplaBYTv3KdJ6ZacKpzQAyXz+DqL5HMxc2JMeGAuBRDcHB3NvTTijiJtnnaJ14DxHQHcIA9Hec/GyYvt8HMLRGZ5Nq6tFcGjUXGBFiKvrjSWqdexCWV2kedlRaG53qlJF2cDrt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=PQbU687e; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="PQbU687e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1780470921; x=1780730121;
	bh=LmZEeSZAd+OZ1Gn48j9QvYPymSsKNATaHgUOGJMb/zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PQbU687emmJLIgwcPqMgFazSSKX0n0cdzFemS41SLCaXBkfiNvkSXGFWGo/n0UiqD
	 oc3+1sUKRdBrTkJ0u6DrQtBYqE/67eBNluaDN9SbjNwZL6mJQtY7CIFAVv2Oq+/ZIt
	 jvFfcGMHkPqudRC0yuZqRg6nksQi7sGyEP6TbUdYj1lg/9M4/oRdbj4wYXflpAwtlG
	 zYVA7vUcVJ5Z6/+X5XKinW8nlbv948aAcHGuMzDAUQ+ns8HvapWodahfQOKD/6n9oV
	 AhDAIn+6TmVBlnnICNTlwVoFnIvCwOVO65mMr+Sc5eZBYOU1Nzibau0b5NDda6Au50
	 sZ/qvAPNDmkFA==
X-Pm-Submission-Id: 4gVf9D52zyz2SccQ
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Steven Rostedt" <rostedt@goodmis.org>,  "Masami
 Hiramatsu" <mhiramat@kernel.org>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Petr Mladek" <pmladek@suse.com>,  "Nathan
 Chancellor" <nathan@kernel.org>,  "Dennis Dalessandro"
 <dennis.dalessandro@cornelisnetworks.com>,  "Jason Gunthorpe"
 <jgg@ziepe.ca>,  "Leon Romanovsky" <leon@kernel.org>,  "Arend van Spriel"
 <arend.vanspriel@broadcom.com>,  "Miri Korenblit"
 <miriam.rachel.korenblit@intel.com>,  "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>,  "Sergey Senozhatsky"
 <senozhatsky@chromium.org>,  "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>,  "Bill Wendling" <morbo@google.com>,
  "Justin Stitt" <justinstitt@google.com>,  "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>,  <linux-rdma@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-wireless@vger.kernel.org>,
  <brcm80211@lists.linux.dev>,  <brcm80211-dev-list.pdl@broadcom.com>,
  <linux-trace-kernel@vger.kernel.org>,  <llvm@lists.linux.dev>
Subject: Re: [PATCH 1/2] tracing: work around -Wmissing-format-attribute
 warning
In-Reply-To: <35c1ba62-e74d-4abc-aa73-ccd35968ff89@app.fastmail.com> (Arnd
	Bergmann's message of "Tue, 02 Jun 2026 22:32:04 +0200")
References: <20260602150904.2258624-1-arnd@kernel.org>
	<ah8n-Nk305S5hRwN@ashevche-desk.local>
	<WPQQfPHOiGJbSxrXRdFDy9jURhS7JMpNu9sD54Vfe5wB-JOjyGY6xPQyACz3MSGg0xGp79eOYCyZ2Hi2CsPeUg==@protonmail.internalid>
	<35c1ba62-e74d-4abc-aa73-ccd35968ff89@app.fastmail.com>
Date: Wed, 03 Jun 2026 09:15:11 +0200
Message-ID: <875x40hz7k.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 02 2026, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jun 2, 2026, at 20:59, Andy Shevchenko wrote:
>> On Tue, Jun 02, 2026 at 05:07:05PM +0200, Arnd Bergmann wrote:
>>>
>>> A number of tracing headers turn off -Wsuggest-attribute=format for
>>> gcc, but they don't turn it off for clang, so the same warning still
>>> happens on new versions of clang that support the format attribute.
>>>
>>> To avoid duplicating the same thing in each tracing header, as well
>>> as changing all of them to also turn it off for clang, add a new
>>> __vsnprintf() helper that is not annotated this way in linux/sprintf.h
>>> but is defined to work the same way as the regular vsprintf.
>>
>> vsprintf()
>
> Fixed now
>
>> Why the __printf() annotation is in the C file and not here?
>> Is this all about headers as the second paragraph in the commit message
>> explains?
>> I would add a comment to explain it here, otherwise we might see false
>> patches to "make things consistent" in a wrong way.
>
> I've tried to come up with a kerneldoc comment now, similar to
> the one for the vsnprintf() function, and added a separate prototype
> in the header. Does this address your concern?
>
>       Arnd
>
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 3caf0796f54d..7c696aea2ed3 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2975,7 +2975,23 @@ int vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
>  }
>  EXPORT_SYMBOL(vsnprintf);
>
> -int __printf(3, 0) __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
> +/**
> + * __vsnprintf - vsnprintf() wrapper without __printf() attribute
> + * @buf: The buffer to place the result into
> + * @size: The size of the buffer, including the trailing null space
> + * @fmt_str: The format string to use
> + * @args: Arguments for the format string
> + *
> + * This has the exact same behavior as vsnprintf() but can be used in call
> + * sites that are missing a __printf() annotation, e.g. because they
> + * get a 'va_format' argument instead of format and varargs.
> + *
> + * For this to work, the attribute is added to the declaration here but
> + * not in the header.
> + */
> +int __printf(3, 0) __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args);
> +
> +int __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args)
>  {
>  	return vsnprintf(buf, size, fmt_str, args);
>  }

May I suggest a different approach, that avoids having that extra
function emitted (which presumably compiles to a single jump
instruction, but still, with retpoline and CFI and all that it all adds
up): Keep the declaration of __vsnprintf() in the header without the
__print() attribute, but then do

int __vsnprintf(char *buf, size_t size, const char *fmt_str, va_list args) 
   __alias(vsnprintf);

in vsprintf.c. Aside from reusing the same entry point, I could well
imagine a compiler some day complaining about seeing the printf
attribute applied in a local extra declaration but not having it in the
header file.

Presumably it will need its own EXPORT_SYMBOL if any of the intended
users are modular, and it certainly still needs a comment.

Rasmus
