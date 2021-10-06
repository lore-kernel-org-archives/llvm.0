Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ABF2C86
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 16:18:04 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id a7so6683509yba.6
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Az3RnbDsbDEe5BQeBA4RkbM3K2KO2nnyOEu1gJMKy8=;
        b=h12w95BSDwtU2m8MnPhdNVT8cMBy/deUTCoZeqUhZdgQsLqDe+FrqOR/aQ8faIbNW1
         FWnQwsHuYKFCfwI9UkUgP6+dqR6jOFk8mjFYz7rqMNNPxZakginPk/sVEj9/lOhdHXjd
         uNLwkmbsQU6ilj1th4AJMkStoYSLcynW80ZlGkZHfcVImauavrpLSslFBFGgn/vRbNep
         WlUEkUbDN/LBIBJDnmT0dKOwi+M56mp3i70eCmdt30vQ5fPdTnlyIb1YFg6I1ZDHY3kk
         4rPGi2Jjv5OaJj6z0C18lVCqNYpni4hdsrJwQ00lFbDrU9njbAQm1R2UcmbVV31oQRGU
         NTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Az3RnbDsbDEe5BQeBA4RkbM3K2KO2nnyOEu1gJMKy8=;
        b=Ob2/RHIJ1Lh0Z0fzYh6WijOrGYlKoo3Vq2T/RND0Qv7yx40np0TxiXJpA2yDvrTNp0
         PhlFWtecz7kQ8agNJbyVcyfSfkwsGaTC2/cfBqP5N0h+6TGPUE2n+OPfxNCsvUzsEKut
         f8LGlN7IoawWd9GaAuc91eQLWTIMWO79HAJd/TrTwaXJE3XMTCmvOLw5yMolqf9INGth
         BTNlA+IxaoHXf6Wp6nX5MUKivK9u8x0LqiW6luRpobE7r/upvN1oYP8U+Xpk6bm1UH1y
         idXm3i/ZV71kWT2+amn8y2u91MLg/tRooOQssdzU1szd/UUFS2k9kskF9nSQq+ACibT/
         rk6A==
X-Gm-Message-State: AOAM530M5UnsWC0GcoZEclMeWDYNblfB6FhMKKsWLQ+iHluOpzUw/A7O
	2BnVZ5CJR5MTb/qfYiZcecFa2V+tcCm1PyOP5KvO7w==
X-Google-Smtp-Source: ABdhPJxT/XIupfjSJyXj/eYUPTKnfTRQjMGA4Hv97bbuvkz3AF2BKXvxYWlKmo9d5Jzx+hJU9aedr3RiS7pgaW3BV3o=
X-Received: by 2002:a5b:286:: with SMTP id x6mr29888199ybl.59.1633537083704;
 Wed, 06 Oct 2021 09:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-12-samitolvanen@google.com> <20211006033145.vcj3ohkekv5rexpo@treble>
In-Reply-To: <20211006033145.vcj3ohkekv5rexpo@treble>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Oct 2021 09:17:52 -0700
Message-ID: <CABCJKufSkOKm6MXzH3gJP17wte=5QfW0qoXH=Py6e6cAH5YkjQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] x86, relocs: Ignore __typeid__ relocations
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 8:31 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Sep 30, 2021 at 11:05:27AM -0700, Sami Tolvanen wrote:
> > From: Kees Cook <keescook@chromium.org>
> >
> > The __typeid__* symbols aren't actually relocations, so they can be
> > ignored during relocation generation.
>
> Then what are they?  It would be good to add that information here.

These relocations are for compiler-generated constants that it uses
for indirect call type checking. I think we can clarify this in the
next version.

Sami
