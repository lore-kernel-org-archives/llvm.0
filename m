Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12838314A86
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977292; cv=pass; b=SbGtHt1IWhVdzCyDbmnupGcbhNOK/uP5Q3IrSN63DEpY/oMPrM1WJI5QgF+QfKZL3dwsvcA4AtC3sg+2EXJgjFWIKmcsSfy0gswC8Rdy6wCvZlZ4ot5RuPHFjaIKyZGl24z0nHE7WGaRR0eKrdCyITee7Fm/ey15bCzN8T23E+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977292; c=relaxed/simple;
	bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TisDO3qQU7s50/uWcVBHwgmqOJbWY1ASqL2beIhcvCfxmOuHNhMAMEpBDBX36Vk7uf3fNmGmp1yAQ+flaVWE9PIc2GHBstFYbmXW+AbuSbDf0WSDnl4mQ2+1pdlIXA9Kp8JISi9iOkucDsmK5xThvAOeIvdT+5ivXLC8YphYPRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcqPRi3I; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcqPRi3I"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c5cf871adcso110680eec.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977290; cv=none;
        d=google.com; s=arc-20240605;
        b=NzheVMu+xhCa8yhu8MxXGt9RiT2nwQjF7L0AmARui5n9TXggjvC8Rq6w0f0z52otie
         ojBvwwCZoS+6LMJejgSVoKH1WTH1qrVeWty1n67coah+OymHwej2iRM6tDOFbBelY0ui
         K0yck5+fKpVSxKwWSDm6J0ZZxm/nW1S15ccjGpVJknWikHKsa0Mh5mPqrbI9xHyYXNuA
         s1u/GJhATHLTsY51PgXl8bHL8PGN8K4jnfZ+Jsu79+gZqi2hvf+4h2zuhe2UxjdViJ1x
         3CAK6Fi4MV1S6EpU6BmpLh0W+ALaa26bA/CRyVX/AD4iZxBvLNgEWf0IDbY+50CfXUzP
         KSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        fh=Mq7SgxI8oO0WfMkcrnC2k1gEBT76jZtHNEndYftKeNA=;
        b=AbVdmbNFNvnlerpCVdSxAGiLVeVaPuB9y3JHuRWtviQAP2NUzpLCq1mi2f6oQergCI
         hiyUGWmyTWwge0hdHEjhFsYd0C7YrMbMtiisQeMd1lUKiYJId4VjIpGxUl8nyzhNj/Ud
         J4VxK2B1fK594eW9B4spmNkGIL44CwewP+gO2VcnP3xtxZT8Ug+eRWtXVidvFsJYO971
         ji1/TjzC1Y33g80bsDQ4LjdKWL8jx5WGvNZdIl9PjY5lNgy6YoXd70Ss8p1mMvTtKyEm
         5qwMYPhoeMfrPOudNhI85J3sn25tUfO/8wHalcSGM43V/jBgIGkbR81joWP2S+b4qmUj
         7M+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774977290; x=1775582090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=dcqPRi3I4J5NCqtwMvoJq4JSUEsXQ3uZJtCDQsSacZXZXl02ZNfx14bpxochzunB4a
         aPvi4TyU2zFLIdoIJ8cEIIAvi7aOSQ1VLA6AQVhtzadq5HkdOh9whe7eBYMInvCgGI4a
         DHQ76zBiJnZQ6hzzvBG9ICn7O+ZMLt1pxJMMtnZmnCKdbBi+ul/TIMSlW0N9nDsoOp9r
         z7Cen3s9ddyEg2WnbmEuW859p0Jlmb46W3nLecEBi8JnFl4AJQArql1e+7kh17cKC5Ez
         Jqr6aUN2NpTNUdXhil/ItY5SSs6P7lwWtJJznAtR1pCE9+cEWb2nQeDrYnf0jnNmvyuq
         i6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977290; x=1775582090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=kw4hMAab+XzifFGliqDYE4q3jOUrU2xMrRO0kQ/FIyxsI5KQRHudUHPl8j2PbrjVom
         yWXjfwYhnglCta+Wf1t+lr+uKuaXAkaX4k0wJ6y7GyTyLwdcT5GGhJqUU7eUp2oCYszZ
         gToAZQZ5tl0353Jq6mBdFE+bLbzt/WFlAXmZWxOgqW4a9xsEt8uuIZQWM4RRk8EVJBUO
         TIjNfrHXqBBZ2HVsairZ3P8hYx4a/6iZ5wQVbZKdS/wnxixuTqU5hMX88RIqsmmgq5ZQ
         wcOTBI5hq3I/Y2FcZh9ozmvn1Jb8q54YJ9OQyfrvoMfsBFdMOMqbCwZv8Wo6+qxPkOAi
         fDNw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Iwqv6gejjrLHxAQDImBSGS+zG6czApY6KgwIHQ47vsf66LGT2K67A/LiljGPttDN5G9Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwvmWq396N3ZZrdzD+lRGDA38dzdVL/kAt3GkBJsIsQX6JPVZVr
	J2bZ1j893AgZShctvHxq9mbgexOrxeokYliAz2HRmuNVF/qoQo6kLFvqts9ZvRo/Fi8QdoWLm2w
	JNtoX+xVt36Vhoa/6r15HzYtWvRej40Y=
X-Gm-Gg: ATEYQzyzwWjigYUeBWEtA0CmyQV4N1izF+s2j7K4dultlE2CPCpy+cOWTbNFuCqz6gt
	EKXrwuIq2I/hTh4/+O+YImLogz5cIkN09xAhoIoZOvXFxxX26cPeUkwguJCcnEjz+ipWf6jdNYR
	dUKXXSj4zzzhcJWan0cYe03Us+j8QfqB7McZMDz2OZf2XFfKM1hhgD2/HxTY9Z7UNZgHtlL724O
	2teJaiG+gOkK4mOU0N7jHh+BbLJHRAse+Q9BtKZsx+ga45iSjcuaJEtijCzVN728cc9VNigxiKu
	HR/9ppzAx7stwjOo4xZHj8O+NGFZdRTzD8JZERhTcSIVq4drZBK07KYldA7bjZMqkBobfCUACJ0
	dfMH+M92zBiCa4sLYztMI5Qc=
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr7028eec.7.1774977290081; Tue, 31 Mar 2026 10:14:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com> <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
In-Reply-To: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:14:37 +0200
X-Gm-Features: AQROBzDhgoRzvErl2Hff4GGNXVWp6S_FczTi75dcVGu_6O4eHFWwYHMrEyNGrVg
Message-ID: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> __ob_trap and __ob_wrap are defined by the compiler.
>
> There are some examples within the documentation additions of this patch.
>
> Kees, is it possible to make it more clear about what we expect of
> kernel developers in terms of style? Should they use keyword
> spellings? attribute spellings? only use custom types?

Yeah, I noticed that right after sending the email, sorry.

So I tried to use a macro even if happens to have the same name as the
keyword, since that form is a bit more flexible, but it is fine either
way.

What I would suggest is adding to the comment that these were decided
to be used as keywords, and thus we only need to define them as empty
in the disabled case.

Thanks!

Cheers,
Miguel
