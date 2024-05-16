Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855F156F29
	for <llvm@lists.linux.dev>; Thu, 16 May 2024 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715888941; cv=none; b=RKhhDRqLi3PV6udnDmhXKljudM4HLJC2kgBxe1moX3MGNbqHcBOpBCj9B0WcmY1lwL6r0XiAwAiJ90FWL34OI/RjAjFR1V8vCb7pGR3zziV9aZ4Gi/qKuANpBrEhF/GjsMJ1KRmYBmchBnjtMgsPAae88gaXgwIEos4ZQIOxqpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715888941; c=relaxed/simple;
	bh=OnX7TnYfvl3uumb2LydyuGYxZJ5YcwNFgjrDTi8iz+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FE794ZVjbXwtaZqFGpL1Wg1rvC9tF24o7K9qN6nWT48uoDNdy15xIZBQFLWtK0wb+KUwcQpPwd6R96KbuyV0YLpqEmMiLeZel+AIk9kfLLJ0PpRYH1dFRXIgMVnlAIwucYcaR8pySf5JcND0O5oykNV+sml04adRqVgh+/4zujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEdyNbYS; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEdyNbYS"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7f919bc2e1cso4138992241.1
        for <llvm@lists.linux.dev>; Thu, 16 May 2024 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715888939; x=1716493739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnX7TnYfvl3uumb2LydyuGYxZJ5YcwNFgjrDTi8iz+g=;
        b=oEdyNbYSXhGcyTzXtukLw72kKEPbjh7H29xQYVlN3i51/ZW3GaesBGDrTmAtUQUlQs
         5YUxabv7DLhl1Y2w9uxkUkxgAN1HeyWmBar5WWOoWmyng/30aX8R1hra7D21C25RHp2B
         bDR2jf/FuYhvyc5zRQAE0Q0S1U8mOKcN+vL7+H77X3M+xFJYu++3ryF7P0uArI9wfztT
         T1Zq7FPbdyVwRer0FK8wR3umwwkfJl4HzdapcN3aiKtYqJSv4rjLWdHIwD0oAbfwlyW2
         0BqBukTHLCx9nzmsM72OvaFTK4Pu17I2YnFbCT+bm8JFfbTomcIfCDIKKksv/QpMubmq
         vhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715888939; x=1716493739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnX7TnYfvl3uumb2LydyuGYxZJ5YcwNFgjrDTi8iz+g=;
        b=pefwOJq3w/JEX/w4wtaBUVgQKWwUWjY2vJDIjnEJXnv0eQyH58nq/cJqOfi3ORWhln
         8R9T9pgk0jdxpQK8GZ4LTtbbHDXV9V1HlBKwJ0Md11CJ2KoeIohgieXebcZ1toNbkCrb
         ynoePCViL37539LCKq3h7cF8v9MTp4tMYfF2fcP+M5utQUWB/I8OW1sk64jbRElL/baA
         CU4+UoxTBtVyJ4k2KNZBjQ39sPnJBn7cO6tEgiTHWflkXhGRQKgvn9MPK3eK0x+soTko
         pGQ8muQVi6z5VN2vi0UGjdoXbGCcp4eYRHbLcz4phP2ah0RCeywxviuu8dxiVE5EstSa
         mcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJuaGbMAwgcqbkYv7oNi82/U2qM5kbtlZYZNY2RJXgjAmXyBonOgRZikffp1amWvNtVtE/89w2AqeOG2Jz94uJuyM7lA==
X-Gm-Message-State: AOJu0Yx9FWctvIW4QJDDlyU/HushS1kCWgcQ1raEx8g+BEyFJ+UBoe0b
	VZXTmlrVM//LnFXZxbyGZCDhmsrgaI03DRJCqjATMzZepu+Emle0lIvxD0+N/pI2MUlK+XyQ8eH
	m1xBAFtFhB2q9MX1O1xHb1YhRLZ4YLgYaOndX
X-Google-Smtp-Source: AGHT+IF4MCz5IrJ5BpbDJ2N7fvi58cP7oeWW87v31abeJJofLDv76BLf5VYJSRIBXM+DlfiDjV2yxEXxI8RcHWd8W/k=
X-Received: by 2002:a05:6102:dd1:b0:480:70d2:34c9 with SMTP id
 ada2fe7eead31-48070d242f7mr22514069137.15.1715888938839; Thu, 16 May 2024
 12:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <20240515073636.GY40213@noisy.programming.kicks-ass.net> <25882715-FE44-44C0-BB9B-57F2E7D1F0F9@kernel.org>
 <20240516140951.GK22557@noisy.programming.kicks-ass.net>
In-Reply-To: <20240516140951.GK22557@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 16 May 2024 12:48:47 -0700
Message-ID: <CAFhGd8qCCCrccQ2z5bjBD5YcMWHkym9aVz_qYkyyj662XEeHvA@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 16, 2024 at 7:09=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, May 16, 2024 at 06:30:32AM -0700, Kees Cook wrote:
> >
> > I am a broken record. :) This is _not_ about undefined behavior.
>
> And yet you introduced CONFIG_UBSAN_SIGNED_WRAP... *UB*san, get it?

We should think of UBSAN as an "Unexpected Behavior" Sanitizer. Clang
has evolved to provide instrumentation for things that are not
*technically* undefined behavior.

Go to [1] and grep for some phrases like "not undefined behavior" and
see that we have quite a few sanitizers that aren't *technically*
handling undefined behavior.

>
> > This is about finding a way to make the intent of C authors
> > unambiguous. That overflow wraps is well defined. It is not always
> > _desired_. C has no way to distinguish between the two cases.
>
> The current semantics are (and have been for years, decades at this
> point) that everything wraps nicely and code has been assuming this. You
> cannot just change this.

Why not :>)

Lots and lots of exploits are caused by unintentional arithmetic overflow [=
2].

>
> So what you do is do a proper language extension and add a type
> qualifier that makes overflows trap and annotate all them cases where
> people do not expect overflows (so that we can put the
> __builtin_*_overflow() things where the sun don't shine).

It is incredibly important that the exact opposite approach is taken;
we need to be annotating (or adding type qualifiers to) the _expected_
overflow cases. The omniscience required to go and properly annotate
all the spots that will cause problems would suggest that we should
just fix the bug outright. If only it was that easy.

I don't think we're capable of identifying every single problematic
overflow/wraparound case in the kernel, this is pretty obvious
considering we've had decades to do so. Instead, it seems much more
feasible that we annotate (very, very minimally so as not to disrupt
code readability and style) the spots where we _know_ overflow should
happen.

[1]: https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#ubsan-chec=
ks
[2]: https://cwe.mitre.org/data/definitions/190.html

Thanks
Justin
