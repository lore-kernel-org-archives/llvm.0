Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13313FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 19:08:32 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id z2so3131814iln.0
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGR2907jA1AKoyCj8Tk/IjWSPxjZVjA/qpLk/UXRDlY=;
        b=Hu9zaQGAp6wamEYNfxPwGiKlL47T37nt9w+WbLEo2ZSyIQiTi28r+GC4veIIKwxspb
         vM+tG30AJxLZRuKJ4H/qOCIwR3xrkKXzrU5RUIYsNzMWo8U+0qE4cp1kTZwl7yjzUBrk
         cwb61bWa0uruAVM6j+kSRzKaXx6hsl7nnFLcu0aH1r9huIs/u2MQLX7IJ81nAL2ycMg3
         cPbrjHTYXJqEuKcBjSvPKPVNh3b3KpHnGKuGHByPpmQHrRi52snHgGSeFNtAQElpPrTg
         KAXF4zaH0y84+rp55mN9a3eBYcgq374jDodYyer6EBrBg4ncKoQuoT8BtNSsDM2Vohiz
         pl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGR2907jA1AKoyCj8Tk/IjWSPxjZVjA/qpLk/UXRDlY=;
        b=iJlUUn89Khps0NgsZEOOXSUFYwXYcnVBGP9ZgpAgBW3xHY/E/QSDDhqq9xaGmM9E6/
         Z3xUsSW0MVlWu90/djdoagKBAExUH+dKVbXK/kbKDYuhFskNbD6Eiz7y4aKYYfyUvBw2
         gde+UYdNm7dKwTfcNBYC3NdVAPjKRQjEJTCTV8PsSYwNt4gdwPFYQ+wTZtNrY/w2vytX
         MMnao7TLeb2/5lKornQ8BeJ1j5jzK2QdcyuhiN/TJD25J6TPkWgzD8MustTbMc5YsIww
         F5GG5Fk5KTn4cDW4kd5D5KElyIjB+mfqHc/Vw1r4yjaTZxl/SrzZM1wCRCv8zwfKj0qn
         Ca2A==
X-Gm-Message-State: AOAM530Q8uOQzbutu5KbIuoz9NFRvK3880MxK/YSexxdXZf2L9eQdkq0
	27TKKIduNeZbZpxjr1ukWj5Cr6et8t9G8nQBl2A=
X-Google-Smtp-Source: ABdhPJzhzdUaBPwCkzhBi3vRe37qRpviqGQRMvzN5lvBxYoOuwJiWfGRLbrhlhc9KPcsN5usBcAmO1gX9XwapXqESCA=
X-Received: by 2002:a05:6e02:1747:: with SMTP id y7mr5105442ill.5.1631300911962;
 Fri, 10 Sep 2021 12:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210908234751.GA8052@kernel.org> <20210909000141.3136241-1-ndesaulniers@google.com>
 <CANiq72nwzPt2zx-m8Cbi8-GAztknEefVDVM4VGhOFyUvagcukQ@mail.gmail.com>
In-Reply-To: <CANiq72nwzPt2zx-m8Cbi8-GAztknEefVDVM4VGhOFyUvagcukQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Sep 2021 21:08:21 +0200
Message-ID: <CANiq72muNDdCeiA8EWMkuD9Ksa8KKoqMT1h081UfoM3iWbxj8g@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v5.15-rc1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 2:13 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I would like to have that one in -next for a couple days before making
> the PR. Since we are in the merge window too, I decided to send the
> one I had in the queue first.

I am sending v2 now.

Cheers,
Miguel
