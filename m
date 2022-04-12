Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ACD1FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:35:55 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id b17so7025219ilq.5
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KLVJDr6jcH/Hhpk5ljJEeWK/iV9uol+R9xxj2F+8Y4A=;
        b=IiKMX57C5YzcokCDFZdUE8zJQg/C0NyIHC5HWRAvzjaLUUxIxy4ABzQaRjHbEWwACc
         Kg8zVLikJEHR44DHdL7wUaGnMO+0NWiUcb/Gje/dAfucsma0qPwytTqgv8bPfQdwh1FO
         yFDLs486T781Go/Wf08yHKK8UegRCQeaEfuxzC+BKzJ2wcsg+js8ADYm5aI4J4BehwmI
         Dt0TRW0YPQWg2mgrAlfC13jb7/N75LrvuQCrqW4H0g3aBRUsx9Dl36bXb3REoCx2gpkz
         ka20mF4NxvyVsT02NQ7wD2Y9O+DbrwrD8xQ1/G/2Fa66NMVlOQLkxmwcwrZwwVNwTjdh
         CCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KLVJDr6jcH/Hhpk5ljJEeWK/iV9uol+R9xxj2F+8Y4A=;
        b=lrTWjZXnw/tisZMiL78BZU1n5SbZC/bg3HQuXTkK5SLf0JVb9jyGDbXIAixrscyyYN
         fiqbBi6j1KLbTeRQuXPZujfjxO1DXw+f+or5qEFoJtzwM0OGeK5S6Q0Vq9yp0oeS40CQ
         Xat+5oIBKSu0o01hXTD7NkQB7c+GuX1ESCwx45UdLjjp9A85IolNNoSMC9S3Lr+EAm9s
         yB7yGQnEq31Axgn0GX+LPTL3D2oYmWpk6L1d+beS5ZZ/eySAj13ozfV0LVkhcCofYZ7b
         aEfr1dVrvFgzHUQea9AJ0u+nGs0y8U6jFG1b8gU//8rK8Wy3FB97v3cy2FV0/FIEmJTi
         fwrQ==
X-Gm-Message-State: AOAM5332PHqwenWejbC0++UuP5JSV7AfLOXSfOhMCxQ+GPpPtE0ad6Hg
	N3CVazh+LhX6y4O++Fzd/fcGFOMn1b5wOXQ4pVo=
X-Google-Smtp-Source: ABdhPJwR8VvgmSj2khd/OCj8r9by523CzaGYCcVzGx7LxRVB5weURh6GvoH9k/ltUnrPmBQdrleFaQfXN7BhInaRYKA=
X-Received: by 2002:a05:6e02:1a64:b0:2ca:c168:a190 with SMTP id
 w4-20020a056e021a6400b002cac168a190mr3814301ilv.72.1649784954752; Tue, 12 Apr
 2022 10:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220412153906.428179-1-mic@digikod.net> <CANiq72=ogSxwz8iJLZaYD4nSkE71sBhT4dZyDv1HYyo5R43=pw@mail.gmail.com>
 <acdf5af3-f256-8d53-ec44-fcef4022ec62@digikod.net>
In-Reply-To: <acdf5af3-f256-8d53-ec44-fcef4022ec62@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Apr 2022 19:35:43 +0200
Message-ID: <CANiq72mpdYY6Un6UZ49r05AJir_F4xRur9Ecmjw8v8CCWhLJ2w@mail.gmail.com>
Subject: Re: [PATCH v1] clang-format: Update and extend the for_each list with tools/
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, bpf <bpf@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 7:05 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> I'm wondering about the ASSERT_* and EXPECT_* macros from
> tools/testing/selftests/kselftest_harness.h
> Do you think we should treat them as "for macros" as well? They can
> either be used with or without a following code block.

I would keep the style that we have in the kernel -- as far as I can
see, that means without a space.

Also, from a quick grep, it seems most callers do not use the optional
handler, which also makes sense w.r.t. not using a space.

Cheers,
Miguel
