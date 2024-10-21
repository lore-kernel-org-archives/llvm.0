Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE711EE02F
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530787; cv=none; b=PHNj4gn1dkU0JVYG8mppNJN5QuBygJuMpZfxl+jJH8w8bG9ILgdMhIuf/6l4i3CR/8Cv9LJb7wo4IsLZSlXca3nh6d9ZY2F9wQ5XA0TMBXKet4TTdhx44vkptHM+CVQ+vG2ytJirAQlPwbzBxTg0gUkSvlS8PbFcR1jJBEfaU9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530787; c=relaxed/simple;
	bh=StgDsdmjWTJEqKodEWbwepqiFWVBxNKa8zEwL3TWimY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgTP55qpTZ1SOiuZy7Y7b0saJGdIrLOWAi5Rz14yw4bhF3IFdqFHRMKZsdXCkPqgMUFH6iwhNBr4Qhq1j9viUv0JMBx8M0C6Js3Ppke8kEJt+tjMSsKbkN+fDxQJGdBeupbiRaBgyQNebaUwxHqIQMFlT5tYoDXZiXN5VKWoHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2Q9+RRn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2Q9+RRn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so45379345e9.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729530783; x=1730135583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu/DhZu6HvkLJQug5aPr8YQgLzNKRwKw+qMAOmhuUh8=;
        b=R2Q9+RRnUefuwPtVinjseb5ItxJjEPFBP+wePIJUB4k9MwdWT5B04+XLJuxYymIgGX
         OLH9gRlRduOo8TvV/kimvL5FieHJQPYj1XdfjQXZGAhT+4nrp4swpujZ9CXHRL+W0drD
         ayjL9Yjzy+uRlvaMTvxa7nqEXr12qoi77faVhLu/Ua++/bygPlM4WacKoItOGla5Cj8f
         7444l3f2JxaZjlOOr5+qvzTndPDFz8bTcfo0gkAmhPHSihWuHkz1EbxFiFNJgE2qTv1r
         rRYMVYYYk5Ki8DO0+JtHLtzG5omNAkYkkCRj9dE0NlNg4/2smGedJfeaZupOfppiLtRI
         PXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530783; x=1730135583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu/DhZu6HvkLJQug5aPr8YQgLzNKRwKw+qMAOmhuUh8=;
        b=kXI6t6yV3402qd7cQmyc0r3JwZQLTMfuXo5wRCzAPVXWrKdO5o6X+hzmOqNiQNzjGm
         ZYTynpeI3Q1yTInRSamLQtvbHjPip1cp31IHilosRjHX2Qs5Wg7lXCp2nYJ3WG4Hm4BP
         8GsWPTx1Q7Whg6fti1FTOgp/GpEF83ezlj+W8o2D0xgMxN/cNrHVIS6ijeMkzpPM6wPe
         0sGzHK0P9cfscZlInkGKqx7irePCQzYBzw/ZauzLmVdVlacO0YE9lwBH5GV76lssvYRN
         rg9Mj6nBHHmnsmAo7KNfv1/uU2sZcr12EuUQKO2zhLJVtJTXfZ/qaHfiNZjJZ4sBuq6w
         wkSw==
X-Forwarded-Encrypted: i=1; AJvYcCXGzV4xJneQVm3gNkPBZElrbRCXhQ1I+dacmQC9snBMAQ5U+DW2WSGMhq6H7/amU6sjedTx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6SWuatl4rHqHrRTJKVbQKEpp186+nWwEChGCp+MFxdx3pPqOF
	WSj7M4CSo2cJ213+z9hlNdPrZrN/SCQOQ9rLBDGUVbkkWzravJgLliLhvYPZ4oNTV/AexWqbfK2
	+iuHl70fa2u6nCLlglfVvBWmxKwI=
X-Google-Smtp-Source: AGHT+IGvg+ZOjt+aJJtnJj8yzwXxnCSUxiSwTE4yQInYvSm883y1SLFNZiKzJVLqmUO1MDxA7cME3bK/dnoIqpAcfXY=
X-Received: by 2002:a05:6000:4013:b0:371:8319:4dbd with SMTP id
 ffacd0b85a97d-37eab7436f6mr9252003f8f.17.1729530783265; Mon, 21 Oct 2024
 10:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021120013.3209481-1-elver@google.com>
In-Reply-To: <20241021120013.3209481-1-elver@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 21 Oct 2024 19:12:52 +0200
Message-ID: <CA+fCnZdr4drxL9UDjAS7sCaDCG_nBJkg=wfX8j=itvo9RdbOsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: Fix Software Tag-Based KASAN with GCC
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, syzbot+908886656a02769af987@syzkaller.appspotmail.com, 
	Andrew Pinski <pinskia@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 2:00=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Per [1], -fsanitize=3Dkernel-hwaddress with GCC currently does not disabl=
e
> instrumentation in functions with __attribute__((no_sanitize_address)).
>
> However, __attribute__((no_sanitize("hwaddress"))) does correctly
> disable instrumentation. Use it instead.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117196 [1]
> Link: https://lore.kernel.org/r/000000000000f362e80620e27859@google.com
> Link: https://lore.kernel.org/r/ZvFGwKfoC4yVjN_X@J2N7QTR9R3
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218854
> Reported-by: syzbot+908886656a02769af987@syzkaller.appspotmail.com
> Tested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrew Pinski <pinskia@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/linux/compiler-gcc.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index f805adaa316e..cd6f9aae311f 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -80,7 +80,11 @@
>  #define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
>  #endif
>
> +#ifdef __SANITIZE_HWADDRESS__
> +#define __no_sanitize_address __attribute__((__no_sanitize__("hwaddress"=
)))
> +#else
>  #define __no_sanitize_address __attribute__((__no_sanitize_address__))
> +#endif
>
>  #if defined(__SANITIZE_THREAD__)
>  #define __no_sanitize_thread __attribute__((__no_sanitize_thread__))
> --
> 2.47.0.rc1.288.g06298d1525-goog
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thank you!
