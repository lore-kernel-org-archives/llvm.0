Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9EC7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 19:40:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id y19so11447209ljd.4
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jQ6m56IkNfx6TOZa4NyOX1e/UvXRK2PyXxRKo48NDaE=;
        b=lDbFjGKKBhM8Gt+fUkFJKo8DdEovRML0GVwMO6M4CIG7Z75+nYbMyZizZlmJ0lnRUP
         RzwMg6mMX9zlOVwm5aWWup+CIC6WdtUBrDkupJXkIyUWjZ3QQEiqNsWqxwqpOl5Olpt9
         4O9oRII0kbYsbKQULaH3yC3akKRKOqWhw+8hclgX6s10S4gPZq7+Rhux7JFOqGcJaffg
         AGTNHhU3n6JMeGUq6oXFUxuhwaa76C98QMnmY5Fbhf3SI9kIWng/+iMLz7DzqtvT5S9b
         AltxK9/vrTOIYtD4dhfSWF2hQc9tSl1VGRozl0EsqQsXAEcRzFWHRwDeFybxJtIFo4O2
         DGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQ6m56IkNfx6TOZa4NyOX1e/UvXRK2PyXxRKo48NDaE=;
        b=zggdLaOTFGPLiLbdBcIot4GsKn6HOcvpvsrDGcDygzr+JlTul3eyCFPUVzIVivydRm
         TV48Cwt8y6Ml2NHywljqdJewhxTOU3J6hG2KvSszWWNbU1FHhiTSoLh20tCww/Wc5V4j
         kLwMvY3AQqEqKPrc3XXr8QuF6njBLRMAaw7Ri6RWhRwrFUZaOvMujfOKHpZ9rHgvx58t
         av8HYhEdxtkBL/iWTqHnf/fThiUj2gXJnVtZO5COEX0fFY1KZx+l6wI9psJGAcBq4l8r
         MKTDiDh+8QpvWdp2v4Oi/KYlcvMosyxL4JoKzPwy7GtX7JZ8FNGEZLoWgJUAlks41GLI
         WTUA==
X-Gm-Message-State: AOAM531qx/D9C61krg8Zgyqh/CrEv3l4by8uBQnmDCd2K6LIuh/RzKvK
	GR5FyBC50VpLxWbjXFNK13f0bCKKLFXUNYRrio/V0w==
X-Google-Smtp-Source: ABdhPJzyP8gSUBuzQhXkYjjcm6QVX0cIYBMoPrTrbUmdjkIySE8ac4yxDfnc1IsHuZhajCV6mainxrW6qQKLzixG4EQ=
X-Received: by 2002:a2e:aa8e:0:b0:251:f929:3e7d with SMTP id
 bj14-20020a2eaa8e000000b00251f9293e7dmr3860576ljb.352.1652470807106; Fri, 13
 May 2022 12:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510065336.hlfjrc25ajed5zj4@M910t> <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
 <10BD31AB-C9F3-45FD-9A4A-EF7DC07C94D5@sifive.com> <20220512083007.gdvlaq7ar2tyarza@M910t>
 <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
 <CAL5JJjHYLTskw6YdC9qMj4KUAeY+0rO88Gh-TRaZyxCGJe+dnw@mail.gmail.com> <20220513034629.l662gw4mn6bi4zen@M910t>
In-Reply-To: <20220513034629.l662gw4mn6bi4zen@M910t>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 May 2022 12:39:55 -0700
Message-ID: <CAKwvOdnbRnEpxyGu2N0g_AqRRD_YT7rtYTNuknSeCuoSHwKjog@mail.gmail.com>
Subject: Re: riscv: llvm-compiler: calling convention violation: temporary
 register $t2 is used to pass the ninth function parameter
To: Changbin Du <changbin.du@huawei.com>
Cc: Craig Topper <craig.topper@sifive.com>, Alex Bradbury <asb@asbradbury.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, hw.huiwang@huawei.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 8:46 PM Changbin Du <changbin.du@huawei.com> wrote:
>
> On Thu, May 12, 2022 at 07:49:41AM -0700, Craig Topper wrote:
> > Changbin, can you provide a pre-processed source and a command line? I can
> > reduce it on the llvm side.
> >
>
> hmm, clang can not build the preprocessed source by itself!

Sorry, I should have provided more info.

In order to get the preprocessed source, you generally can do:

$ ARCH=riscv make LLVM=1 -j$(nproc) defconfig lib/string.i

replace the final command line parameter with the path to the source
file you care about.

Then, to get the command line invocation, you can do:

$ ARCH=riscv make LLVM=1 -j$(nproc) lib/string.o V=1

Then you can provide the output of those two commands.
-- 
Thanks,
~Nick Desaulniers
