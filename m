Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD579D6
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:42:14 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id n125so7077195ybg.7
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679085733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKqoQMP0cjX6fBJ5Baqr7Cd+5/vuvlm7dezKEA7BumQ=;
        b=OCGa9zSyWLiqiTOYurkRhYHYwN1IW/7p8tGRKYwOYRzWrYTtQe+roJbaEFZMlTPmLF
         mD2N4cUANRFbs1zHFfn495ZSISEGqYDzdrq/syIB1G8Jmp63diqX2hSaPQLNDsuoRwH9
         NOw8U7+kyEnSkTVjJJscfl2Ar07uHG0Sd9hb2bEykj6da6XLFCJZP6j7AnvV0COWl71J
         DZILg3uBs/tuXz25kq8LTzw0WXKIVoUFNiwdmmoktFhJaHAeQVTLBYYlDovGv+wUSbhs
         tsJdWJ1L4qaM7sHIBcNKnHVcRptRu6gNapoZXaIGC39vAJJaZNrX3SLlz7HtEAHYPO1z
         YjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679085733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKqoQMP0cjX6fBJ5Baqr7Cd+5/vuvlm7dezKEA7BumQ=;
        b=ZfZi3kGR49O63g76XqK56x6z98vtNtFQ7Vee/0EVgH2fjJ32aVK4TC2e4ab1oXUBqn
         aQ2LAvm3rqg+R637MRSJqb3RAUv4lNKxQ/kh2xsrHsJaJbYE/Z9uWwlK1PRWJT4sW0VT
         aq4tYLTnj0kfxE08rL2qSsM6imd8HkuUZX7sd+Qhy6Vp//JdVfwtKNtWB2Dnvqxg7wzI
         mrYSrkf/EnZM8q7qWUFHViAJNxW7PS4i1MbX66dtwvjK43Zcctq6IA/eMZZWWBFJ1iCo
         nZr862RjmlmK8hiAF0Z+tsJh8aUkLs/uCu5xIzYRAwqlCGawBTMzx+6BnpsXc5YUmWlZ
         l8QQ==
X-Gm-Message-State: AO0yUKVMEriNl/OuPWoy9WW998x8ZqbeSy1SzUHbJW+wtAkSAXm/DBRG
	H8CxP7Kip4H77oOTcGJNFKjV8WeU5vw4Sac/2Xo=
X-Google-Smtp-Source: AK7set9NqnQJsWl7rP+FHX5er2KO10BEglkFdEEEJn0DvKX5dso/jIWWueYin0ZzNqMU9obvzXGF8nSJrWcmkJvL6Cg=
X-Received: by 2002:a25:ec0c:0:b0:b1d:d57:fbef with SMTP id
 j12-20020a25ec0c000000b00b1d0d57fbefmr584281ybh.11.1679085732986; Fri, 17 Mar
 2023 13:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
 <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com>
 <6414c470.a70a0220.6b62f.3f02@mx.google.com> <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
In-Reply-To: <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Mar 2023 21:42:02 +0100
Message-ID: <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 9:31=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> 'enum m5mols_restype' should be in the range 0..2, but it seems to use
> a 64-bit compare against '16385' (and then a 32-bit compare against
> '8199') to decide it's out-of-bounds.

It is comparing against just the `.code` in the `m5mols_default_ffmt`
table, i.e. the `MEDIA_BUS_FMT_VYUY8_2X8` (8199 =3D 0x2007) and
`MEDIA_BUS_FMT_JPEG_1X8` (16385 =3D 0x4001), see
https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/m5mols/m5m=
ols_core.c#L52.

So it is basically:

    if (code =3D=3D m5mols_default_ffmt[0].code)
        return type;
    if (type =3D=3D 2)
        continue;
    ++type;

    if (code =3D=3D m5mols_default_ffmt[1].code)
        return type;
    if (type =3D=3D 2)
        continue;
    ++type;

    m5mols_default_ffmt[2].code -> out of bounds UB -> unreachable

If the condition had `++type` instead, it would not be a problem,
because the loop stops before we go into the out of bounds access thus
no UB.

Cheers,
Miguel
