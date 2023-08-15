Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D41617AD9
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 23:06:41 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-98377c5d53eso765675466b.0
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692140800; x=1692745600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrPa0mBv24tqWNTDwul7//LSN1cVDKf7kn8qJcAv5os=;
        b=I2gqKHVnynhn5a6q7JufzjrjRBbX85r9laDBvivZCmJTEHBX/D5v38OrAFPAQ4Ahuc
         BiyPhwLlWkv5/U0J+sAvWtfA/Ee5uB0NoidvQXMtfa0FS74sBrPLCyRJmmEIQzd8EV7y
         6/y3/f3zM1JfDx/29KU52/0d6Ru65VZzlri72Sx5Xe31cTIDpCeu0hsdP3cBw8UiVdIa
         bJ2H2pnogg1LR7+3bKP5HbfMwKxX9p5tNM4N4yGhHNM0AjDm19KPz9SZ0cpmztJdTEJm
         JYpg4T9J1ZqP6T57bMG+D2pVB60Cbw1NXwlJoKjH8PZ6RtPiWJAYrfjgcJMBFI4n/rwr
         VBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692140800; x=1692745600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrPa0mBv24tqWNTDwul7//LSN1cVDKf7kn8qJcAv5os=;
        b=brCmAwiOaznqx5C3IjgjrbyDcUFFguAQdkKf5C9loxs5GElCx4r7cWvUsvj0hXZNLn
         HHOGgASOQf4VbJJyVkmFCxN4oTBQrm3DKGIGoH73cJEBeunV+fIcvutF0LTN29SRYqk7
         ARwUQitVLNIG/9AX7t2Gca2P7NrgHPyas7Dtm13rEnF3xSL8cKnSL5s2BbN3f+abbmam
         7YZvE4o98PWRju0TbzdlOkxc6rAHpVM2OvpImQYdgYvg9IZa3CkOm59CTtDJpeUrhPA7
         SDo1Em4v1nBJ108adDGduiATcIRoGjBQsB6Oge39+o/1oVqXM2SrYYxHtzX/O6vHheya
         l5qA==
X-Gm-Message-State: AOJu0YwKzzvorf9sR61v5zPdQkmgdxGUmm3iMOPaCoTibWIPjVjnGp0q
	7qZy8cLg0O45D3cO+Bcq3hGOSSyCGcvwNQUGh2m/Pw==
X-Google-Smtp-Source: AGHT+IEYf/fyOVx0742lOUxeNNrFI2vcP6VhqTkYiAQ+DS6mXjvMmtfl0u01KMqRzs8F2tE5QS8vH45FY5IvumziGEA=
X-Received: by 2002:a17:906:19:b0:992:bc8:58e4 with SMTP id
 25-20020a170906001900b009920bc858e4mr75813eja.20.1692140800125; Tue, 15 Aug
 2023 16:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
 <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
In-Reply-To: <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 15 Aug 2023 16:06:28 -0700
Message-ID: <CAFhGd8rTU0o8uiGT1qUKbsOZTgqLR7Sw5h-+07y4SJ6QOd9KsA@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 2:15=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/08/2023 23:11, Justin Stitt wrote:
> > When building with clang 18 I see the following warning:
> > |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to s=
maller
> > |               integer type 'enum versatile_flashprot' from 'const voi=
d *' [-Wvoid-pointer-to-enum-cast]
> > |         209 |                 versatile_flashprot =3D (enum versatile=
_flashprot)devid->data;
> >
> > This is due to the fact that `devid->data` is a void* while `enum
> > versatile_flashprot` has the size of an int. This leads to truncation
> > and possible data loss.
>
> Cast does not solve truncation. This part of commit msg suggests that
> you actually fix real issue... and that is an issue, because then
> AUTOSEL will grab it. This is just compiler warning silencing and rather
> coding standard correctness, no real fix, so please drop the sentence.
OK, makes sense about this not technically solving an issue and thus
AUTOSEL may pick it up. Can you elaborate, though, on how the cast
doesn't solve truncation. Is the initial implementation not a
pointer-width down to int-width cast? Surely we're losing the top half
of bits. I'm still not saying there's data loss, to be clear. Just
that the compiler is warning because of the truncation.

>
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: There is likely no data loss occurring here due to the fact that
> > `enum versatile_flashprot` has only a few enumerated fields, none of
> > which are large enough to cause data loss.
>
> If there is a data loss, cast does not solve it.
>
> > Nonetheless, this patch helps
> > towards the goal of eventually enabling this warning for more builds.
> >
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>
>
> Best regards,
> Krzysztof
>
