Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5F7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 18:41:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id i4so14070483oif.2
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=zkq99qMAjwvXGkfSNJyXJX+b2TjDRVvHCxXnxYMawmA=;
        b=GR/7JpLQVy0bCTRI+ul+w1w+WTS7yWNb6qXVsEXfXkAYLH51Uq55BIz8LUGL8vbB2b
         cTaJe1WJmdUi66o9AyBlSNt1U61ZZL9rKX+rxWy2zUgcBTXubIbhrCY3lzVs0B6QgfPn
         oy/jkML4xCDxWe2N0bg88dlZNcRZO12/7r+yIi/ZtFPYaQsU7Qmt/8knZN+VqenZhZ8Q
         eH+bOWuVC3aTpmeS2s3hNE70dpKpfDtxRGpxYoYWmtWRkxG+h1Hl51uhnXEhDD60bN3y
         Sb7lb2w/xNO1QC6msk3bDAdDWV4I85I3boKJnzhNO3zTFVQqZ5aD3IiJxTr8vHZQHJIs
         u/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=zkq99qMAjwvXGkfSNJyXJX+b2TjDRVvHCxXnxYMawmA=;
        b=0D+la3y4uKReX8EI10ftkLy0tyC5ok2FhZkTkWq5gp3mlWpOGLU7d4YyNV6fWrxcvD
         XhBQqkw1NyLhLgWL9usviapQnC26z33dFjFhGf7tPk0APQRVOMgXG3MdCJH4iRiTFyfy
         ozHwsB26AQeBsk6lJqhxo2y+3y3yfn5E4K4Mj7fnyo/8RCxCIeCJwSc5ArG/1+7A7vuH
         RafE7X5SVqobx1RHQ+qkmWUQzhEbmMkTD3CHsdZ5XsY4M91/1j+QcZZzsPwvhw7Fxys5
         7WBLUvShRiI04xp/OCQI+7G/kdYLhUagvnLZVt2D5GWFavL0jHY080TlFkS8q+9l8K6p
         yNlA==
X-Gm-Message-State: AJIora8QuYwMjewXV+i2BLWoL2PYelDrlBoBnxkS0KgYGDDl+bSxDqgg
	ScbMO9cAQXKFziSvYVDV7kp1j41JzaQn3yTC7dr+WYAHUfHXTQ==
X-Google-Smtp-Source: AGRyM1sL8m9KrhGGOq9mC6hBze+Dx+mdHvuC13FniC/co9q0GB10W5O/YZiaZSh2RVkSs/vyQZYFll3xdlcT9wTDeQg=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr7053815oib.128.1659379315956; Mon, 01
 Aug 2022 11:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=M3uyJOp-LoP+R=z-GjXUo7RXvTqF7eie7FdFVQ=wf9w@mail.gmail.com>
In-Reply-To: <CAKwvOd=M3uyJOp-LoP+R=z-GjXUo7RXvTqF7eie7FdFVQ=wf9w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 1 Aug 2022 20:41:20 +0200
Message-ID: <CA+icZUVrYr+9d=tkHakT-LQABFXF3qphdX-Z_8grzWAO-fwuxg@mail.gmail.com>
Subject: Re: Some 5.19 development statistics [LWN.net]
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 1, 2022 at 8:33 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> https://lwn.net/Articles/902854/
>
> Thanks to Nathan and Sedat who both made the list of top testers for the 5.19 release! This is a _critical_ role to our team and it is much appreciated!
>
> Nathan and Sudip we're top reporters.
>

Hi Nick,

Incredible news for CBL users and developers.

...and Linus uses an ARM64 (Apple) notebook...

Best regards,
-Sedat-

[1] https://lore.kernel.org/all/CAHk-=wgrz5BBk=rCz7W28Fj_o02s0Xi0OEQ3H1uQgOdFvHgx0w@mail.gmail.com/#t
