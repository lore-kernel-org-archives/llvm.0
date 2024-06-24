Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2B1B950
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719252309; cv=none; b=ubapzDYeLQzwpgfqENiODt2Ugm6ZNiePVJ+8ucKRXYxH/m+WQ2ul7xrPjlz3ScEomXX8hkdOwZM+mf7ka+ist2nwZNkV/tA/mFo5MNfY+K/FzTE5DMluhgKaYmJcEYWJZPMkRal0bhsyzQ7gwWIkPgbXxZq8YCmF/OxRkmEn4L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719252309; c=relaxed/simple;
	bh=25Dq88jBB2CkOkDL/JBMijQofHLFLsFy3IjegoNUwPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTsJLpbO+xM074yNEx8OxVvsX4kek8u8uMaukfw0Rdy5hsYcLbf42Cy4youS+tHbXuRODRzwCUMrE9smcxabGVaE9h+tNanAHdq6I7DGqykr0zTLbQfL9dGOaC3OHf+Q7v/ZeoZpjdNbAbZxAE6PjMv4mRFm0w431FCrbUoO5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pqHwM+zW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pqHwM+zW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d16251a07so953a12.1
        for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719252305; x=1719857105; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iU6twMwsLTVUU1XIizoid6hKLyQKsxMvfVST/Ybsw4I=;
        b=pqHwM+zWDSZaaqbg4DFNyYKNk5PJpT9xCsydHZ1c48KAossjvWWu9tmG/XGdDOAsxh
         tc/CRHl9TMUU0qKTuV+n+BL29I/g9x3w+RAQ4JwAT1IUgNHQIz/J3jUUd85saQZaBR4q
         KhuEjlUVsG3Q9BeESTZdnFCR4Z0nQ48AqJBD7xL65e+J66eDi1bLusNqjoMHQeN2FY0b
         4AHdOWbKBaC0MgsUFjQdoh23+ZKc30IcoNyX27WhK6tQqwfTXoTmNG3WbErqL2cBrXe+
         jKNg432juY1Xq3ZYXak7WZNPX8zOc3cdaaKGrE9keieT2VmGmkhWf6u1tqtPh6bhg17e
         hRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719252305; x=1719857105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU6twMwsLTVUU1XIizoid6hKLyQKsxMvfVST/Ybsw4I=;
        b=JH6P6KMDRR83EDDzSODga9HIr/t5VivWYy8+HiKJTawklWYBoojS7NU2J/WDxgFWFo
         iuzevlD8B9HHMC4+UgKb/x3bgKQBa3jnkdGCBqLmKJ/nrl02WhqqfyQ3ymCUaifBlANc
         OZF9FQP6MXmxn8ntSQ342qKcrBDP7sL8b+GgJ1w+MwZMnQljLIMdRJWwUC07Stj7OBxK
         xi5NL8QndY0aBQjIiHZhBaaviRZJQlX0werPSIunhjbdfM5VXMCGxYyI9VLuzypqoLBf
         3NBNGw9iQY5MnOuY2De2sIdKmCrmOa9lNNkodvWQ0AhK1g6OtzXotvP+6T913ntNKIgs
         R57w==
X-Forwarded-Encrypted: i=1; AJvYcCWryUYNRoebH/HAv6Pspt+cnUhtp1885aYAEoMcrjCsqDnKOVUjP75Xl09Tyu7Q6Q+Fo3o8kY6umsmH2TZRKDvbbKt/iQ==
X-Gm-Message-State: AOJu0YySLw2zsfMFf+xqPy55Q895g2yREd6N8a2/v9Lf5946qqNBNNSG
	5qYUTgEJhRz3X5CMipz6AevmaslPDf/Q4m5GsSQ9GH/lgrRali1rkeZXn1j06cJFKdzBCZHKC2b
	D6ORXK41Vtp7cK3pszwMBzsdFjvahw2erlqM=
X-Google-Smtp-Source: AGHT+IH5Y7rUe3HGR92ggNIqhjJ6oN6APNDpcnfWRdAWF9v82nPgkswGoUuk1iuaf6Hb2+YP+rxpC7Z0nldf36iS1/E=
X-Received: by 2002:a05:6402:348d:b0:57d:6e52:fff6 with SMTP id
 4fb4d7f45d1cf-57de4b68f0bmr4244a12.5.1719252304903; Mon, 24 Jun 2024 11:05:04
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com> <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
 <ZnVe5JBIBGoOrk5w@gondor.apana.org.au> <CAHk-=wgubtUrE=YcvHvRkUX7ii8QHPNCJ_0Gc+3tQOw+rL1DSg@mail.gmail.com>
 <CAHk-=wiBbJLWOJxoz7srMPtKcN7+9cEh79fzf8GKXTJyRdk=tw@mail.gmail.com>
In-Reply-To: <CAHk-=wiBbJLWOJxoz7srMPtKcN7+9cEh79fzf8GKXTJyRdk=tw@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Mon, 24 Jun 2024 11:04:51 -0700
Message-ID: <CALJ9ZPMHCPt-6kf-9McdKYTqs8Vrj9GLhkxObdhjyorgtZQOSg@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nick Desaulniers <ndesaulniers@google.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> In other words, in the kernel we simply depend on initializers working
> reliably and fully. Partly because we've literally been told by
> compiler people that that is what we should do.
>
> So no, this is not about empty initializers. And this is not about
> some C standard verbiage.
>
> This is literally about "the linux kernel expects initializers to
> FULLY initialize variables". Padding, other union members, you name
> it.
>
> If clang doesn't do that, then clang is buggy as far as the kernel is
> concerned, and no amount of standards reading is relevant.
>
> And in particular, no amount of "but empty initializer" is relevant.
>

Thanks for the detailed explanation!
Sorry for limiting the problem to the empty initializer. I didn't
realize the linux
kernel also depends on zero initializing extra bytes when explicitly
initializing
one field of a union type.

> And when the union is embedded in a struct, the struct initialization
> seems to be ok from a quick test, but I might have screwed that test
> up.

I also think so. But probably we need to add tests in clang to make sure
it continues to work.

> Hmm. Strange. godbolt says that it happens with clang 17.0.1 (and
> earlier) with a plain -O2.
>
> It just doesn't happen for me. Either this got fixed already and my
> 17.0.6 has the fix, or there's some subtle flag that my test-case uses
> (some config file - I just use "-O2" for local testing like the
> godbolt page did).
>
> But clearly godbolt does  think this happens with released clang versions too.
>

Yes, I also think it happens in both clang trunk and past releases, as tested in
https://godbolt.org/z/vnGqKK43z.
Gladly in the clang bug in
https://github.com/llvm/llvm-project/issues/78034, no one
is against zero initializing the whole union type.
I feel now it's no longer important to have this patch in the kernel.
But we need to
fix this problem in clang and backport the fix to releases we care about.

Thanks,
Yabin
