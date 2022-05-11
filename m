Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888EA29A0
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 15:29:45 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id r27so2455208iot.1
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CtdNPcv9Xs9pvNuMfHH4clvaHcmZY+jRmMu+Z0g00OI=;
        b=FXyxzi6wVDNzYPNCgOTZK6DWrWW/t2C/I/HWs2S8QRaoWcmdq1/O3iZv5q12z7/qMK
         /mbSq+jDpBY+KphoLfTI+DM1Jpp/cx3qqnLw6hJbl91aAZWIkhmWF/9P4U0TroFCbqmf
         DfYmAdFaSP/aawKG9M/PL1pI/wZnmIrKWj9TdqQjVINq8SA0rI4H8648VOiHq8Yx32+w
         P6lajvFaoltfkAhlLfoG+sR8+bgFjakZf7A/7zBtiXTQy5RQ7Bgw9PJ2wNHK5zzu1CSq
         DppCrezZzMlWJGUQ61u+myWyE2ssCiyMW/C34eAhvzbS1WKfgStC6jfxYeqVaCQKaKJj
         YzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CtdNPcv9Xs9pvNuMfHH4clvaHcmZY+jRmMu+Z0g00OI=;
        b=AZkV5SOdN7SEWWYd3mEGhS3PHNp6aqulrjCwogWYQMhgg5+9weJzUtALZoi+7fzOp8
         05r8p0g2DfQiX3TMsmivYn6cluSp78/xXD2BqqOy/1X6XDAIPbp5ZqxDozCyokrNeGGU
         Gc+rjb+Eh5AjNCUiz3Ev7Uisuqvw0jlP3foMQicPGOGWw9vlvYQ63j/qiyhM0ycVpPMF
         m0+L3P0mxcjGked5qV2/76XkXe4BJzHmJMLrA1fjI1E0cqm4ehGMkZM2Vrfe7Fhn2yfe
         ORYHdY3+cN9xXQXt/1sK1LPeXv5WQUfllBp/kIKVewH7jpbDQ2PEOgB1lpXo9bgMdwag
         YT0Q==
X-Gm-Message-State: AOAM533SQEVVAaPn4T3cHB4mFI/vT3sRaRkKXHfhll0EcsuiWehsSg5B
	cNv2ZSyjxrZqFPUaR5+KQH0cFZp7mRE9CJShcZw=
X-Google-Smtp-Source: ABdhPJw0enMBLm4i62iaBVoiXBvnTDT7dfPXX7omlqXOgjhfI4Tp7zPydctZejKfLHlp/69sQJwFC7rxsWL0yWC++B4=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr11011603iow.172.1652282984563; Wed, 11
 May 2022 08:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <152da06a-330d-3125-6f41-262e0751f41b@digikod.net>
In-Reply-To: <152da06a-330d-3125-6f41-262e0751f41b@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 May 2022 17:29:33 +0200
Message-ID: <CANiq72mST6rfJDVGGT2+=_FUCXwms6N8mo2eoLzQ6KW64M9BtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix clang-format configuration according to checkpatch.pl
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Brian Norris <briannorris@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, 
	Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micka=C3=ABl,

On Wed, May 11, 2022 at 4:19 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> Miguel, what do you think about this series? Do you plan to take it for
> the next merge window? FYI, I plan to use it for Landlock [1] and send
> it for the next merge window. Could you publish your pending
> clang-format changes so that I can make sure everything is OK?

It looked good to me overall (though it indeed conflicts with what I
was doing) -- I will take it for the next merge window. I am thinking
of putting Brian as author and you as Co-developed-by for the last one
to be fair (Brian: is this OK with you too?). Thanks!

Cheers,
Miguel
