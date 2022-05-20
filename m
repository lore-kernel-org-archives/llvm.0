Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9A2F4A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 17:15:23 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id e3so9363304ios.6
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5q9k0da/eVXDTkiJGcgonVdoXFkBjK7hd3VFbFH4vhw=;
        b=czMMupnbSKq4FnJ6sDpWiqRxFmJNvDaZBwGxehqUu02wRBpq48pknNWwA9UzJhsewy
         wHP+g3IPKf+q9B0oB/aI6NMcW3WttDfC6FB9PWRyaijEXBGFcuOQn3OVAWiWKko6sara
         9ehbvUgZyXmcU0izNXqjsYUhW0HOXH1LO+V0tqWRf+LDTyRik3agsLvqif86yLhFIRCk
         yiNMWyViQKeWOVWIHik6Naa6jyT7QJbCOyBr+GCbJBVfhu+/0v9VCv4v4Q3mtTEEK6r8
         kUswfiqgjeCEMA+KYRo03+9xuNlVDxz+m6yQc2YiUko1RorVhb9b6g1YQOy4O5XyD58+
         FQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5q9k0da/eVXDTkiJGcgonVdoXFkBjK7hd3VFbFH4vhw=;
        b=Jc8tmZhdGxsBsKQRK799qU973Ct4bkc4sxYnix1whtdyN0H4BfYN1XOgLgXQwoD5RG
         XUCZTlRjAeROHF5fGB3dkRuv/r0iIWFvhyphpYLbzC+VnS2tH6TvgQ/zKkxid+ra5Fyi
         a92qDGdJ10R1f7XQIfLpqcKuGvlnjI8l0f9hqJLUdzfX3obDrzxWFLPiO0qOS04i1sZC
         SfNnV+HqtWyjF9Uyza4NZTtztbOSClDodCI4EUSwVtkQhQyWZJLf2AjM084+s7Stg60K
         2T3JldZjSCUkXoZ7JHLhS9YcPW4PVL1aNfHtfX3TmvcRB+MXmc1NLbiZSkDfzYjqiSYH
         lBeg==
X-Gm-Message-State: AOAM532hvgRG/JH9cTloCLtdAKesbAwpVAabuqR6I0IiXrvM0oD4K0ie
	BW8cTn9rjtquVD5bYgIdXO/r4l5JvTkMaprZH5k=
X-Google-Smtp-Source: ABdhPJz3POU7VbsuvrNoJkvEZ2aJ7n8c9GU3fPmcEACUCVCqqHtueymxozFHYnQ75CSj/2qO50Amq834K51+YvQakYY=
X-Received: by 2002:a5e:c643:0:b0:657:b1b0:8e2d with SMTP id
 s3-20020a5ec643000000b00657b1b08e2dmr5374422ioo.64.1653066922765; Fri, 20 May
 2022 10:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <20220506160106.522341-5-mic@digikod.net>
In-Reply-To: <20220506160106.522341-5-mic@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 19:15:11 +0200
Message-ID: <CANiq72kbp3xTpj-L2BfLQ1Ecx-2Ki0W3e5YLERx8-T9bjb96=g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clang-format: Fix empty curly braces
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2022 at 6:00 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>
> SplitEmptyFunction [1] should be false to not add a new line in an empty
> function body.  This follows the current kernel coding style.

I don't think this is correct. Checking headers in `include/linux/`, I
see ~70 using {} (when not in the same line as the signature), and
~700 in different lines. In `kernel/`, it is even more pronounced: 4
vs. ~200.

Am I missing something?

Cheers,
Miguel
