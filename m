Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606D79D6
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:51:37 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id eh3so25056683edb.11
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679086296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGPinKOg8Q94FTw3RW1XhRjZJIhdvmuXH/yX2ELyuDQ=;
        b=WG3DmDXg+dRg2XEOoqHG1aTTee7b7z7lkxgNj97kfM2LcYpZtBUx+fqPvcO1qAIFo+
         OD1yBgA1betDQLOC3NU5jWyEgxLiJY0TmMo8jB54NwoNzEY3usNUFpnbTUQja+ZH1McT
         jmfkAzuaHTo5pbrOHoUHF3AW0lZZsRKcGei0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGPinKOg8Q94FTw3RW1XhRjZJIhdvmuXH/yX2ELyuDQ=;
        b=MKJG5U/zqD/NLxnLfnSNRVkcTaqtrX4zIKOeSC4+Q8BjVJpy29OlNA0ELc450LI3wE
         IPscSmeU/nQpZbvrspefYs4OOmAqoV1OELKBDENIV56tIpXMcL5z2Kg6vHoxW4tSAokK
         3zzaOaJNLQErj5D0qRMgbumajNzsJqwOyvp3SLrDQmjYSVuVhxswFLhiuXoXqZ0IRCQO
         oXuvh0WHhpGMfqHLHC4RcQScaHg2+y1Aj/w6ujtUtTiwcNeCO6CFWAqPm/uVjVf0f2t8
         L8kRPuSJbik9cGgpg0MnLkSxmkbuZrEE/7DPnHiLWbjSMDjGr9TmuXP+pX1UHN1+qBZ1
         s/zQ==
X-Gm-Message-State: AO0yUKWNBBUbrMrLLQJ1KfoQKn8K85kySP4EI8nL40nItqGANtUv4sEv
	3eXKNcZH+w/rbIQ6va5QLZsO2+ldlQtzKvBJN90PaQ==
X-Google-Smtp-Source: AK7set8+atKFsYefYXeqTWSYMjPjVZ6aoD/37PAnjJZ/Ra1QcCnOPC8V+22AlKioliDIPVX+ujlVmA==
X-Received: by 2002:a05:6402:110c:b0:500:4062:99f7 with SMTP id u12-20020a056402110c00b00500406299f7mr3941761edv.32.1679086295662;
        Fri, 17 Mar 2023 13:51:35 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b004f9ca99cf5csm1505085ede.92.2023.03.17.13.51.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 13:51:35 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id eh3so25056435edb.11
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:51:34 -0700 (PDT)
X-Received: by 2002:a17:906:2695:b0:931:99b5:67a4 with SMTP id
 t21-20020a170906269500b0093199b567a4mr291317ejc.15.1679086294427; Fri, 17 Mar
 2023 13:51:34 -0700 (PDT)
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
 <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com>
In-Reply-To: <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 13:51:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
Message-ID: <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:42=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It is comparing against just the `.code` in the `m5mols_default_ffmt`
> table, i.e. the `MEDIA_BUS_FMT_VYUY8_2X8` (8199 =3D 0x2007) and
> `MEDIA_BUS_FMT_JPEG_1X8` (16385 =3D 0x4001), see

Yeah, I see what it's doing.

But:

> If the condition had `++type` instead, it would not be a problem,
> because the loop stops before we go into the out of bounds access thus
> no UB.

Yeah, but clang really should have generated a proper third iteration,
which calls that "out of bounds" case, and then returns, instead fo
falling off the end.

I do think that on the kernel side, the fix is to just change

        } while (type++ !=3D SIZE_DEFAULT_FFMT);

to

        } while (++type !=3D SIZE_DEFAULT_FFMT);

but I would *really* like clang to be fixed to not silently generate
code that does insane things and would be basically impossible to
debug if it ever triggers.

We would have spent a *lot* of time wondering how the heck we Oopsed
in m5mols_get_frame_desc().

             Linus
