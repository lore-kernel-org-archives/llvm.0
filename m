Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9A79D6
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 21:00:28 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id er8so13469888edb.0
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 14:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679086827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZhGvYYe72+EpjoPoiXYwYh2DEQKfYqrF7Ny0kVjGfo=;
        b=bFc0Pc8sXPyYD8hJfB75Je/AWDEaqDQIZcaDrX71XHxJyGUFwcwpRgO9/bCgLPAhi/
         k2z+xzWbM6myBql6/edUy7WUteXBZ0FUU0NO48BMEiEe+BHuiFf3xe0CSmgNetoMFX7Q
         2rc34LiYQV7auDHqin9gPlDHU5jCjsDAE9l0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZhGvYYe72+EpjoPoiXYwYh2DEQKfYqrF7Ny0kVjGfo=;
        b=Bc7QqTlh8CZhhGmWpeASvTW22+oRG/Ki3UMULiqnflxWl+GUd/9UZ2oQ5Cer2SBg/n
         oF6D7c0UsVt3hgZt39xSHt6jlXitZbbXpenv2T6O8nV1NEl8cLKhfKwRSrIg//FdQwys
         3RqMfP9Zeeekcl7HXdCNV77CqCKaABDPeXWspahqv8tqPPm749yZ2bNCfY1QAqXFS17l
         az2j5udaI1PzfLUks4ORnWro8+GUlxO7AuTVUfr/ZUmDec3bycrgrtFUbmcUbf9MFG0y
         uY1xqqSzhbujQ2Uk0mn4iu2u3Jz0LDLMcKn4qLmTcTPygW7vEhLIX4AWUlN28K9jezVc
         WWTg==
X-Gm-Message-State: AO0yUKXJW96P4zBBZgqp8YTKAc/2AuPMnoLVuWVXlBgiw7Sq98Uqj7te
	7USl1hii+Pzcc165zOZA6pGQuCMqPIpg1pCi5wXwcA==
X-Google-Smtp-Source: AK7set9Kvv+/7BuNWsInk/d136GiHnttKBf4kAeGPtIagnzVBwgdBkR3ouNA3i7XXwjqeu5M6o9PKQ==
X-Received: by 2002:a17:906:a419:b0:88a:1ea9:a5ea with SMTP id l25-20020a170906a41900b0088a1ea9a5eamr680613ejz.65.1679086826769;
        Fri, 17 Mar 2023 14:00:26 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id z24-20020a1709060ad800b0092ffc83cc27sm1380971ejf.5.2023.03.17.14.00.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 14:00:26 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id o12so25140932edb.9
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 14:00:26 -0700 (PDT)
X-Received: by 2002:a17:906:ef8f:b0:8de:c6a6:5134 with SMTP id
 ze15-20020a170906ef8f00b008dec6a65134mr298086ejb.15.1679086825747; Fri, 17
 Mar 2023 14:00:25 -0700 (PDT)
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
 <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com> <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
In-Reply-To: <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 14:00:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLBjQZ1Xic9SDvtPOu3MNwRznZygZ35mqq4CpKmWdBtA@mail.gmail.com>
Message-ID: <CAHk-=wgLBjQZ1Xic9SDvtPOu3MNwRznZygZ35mqq4CpKmWdBtA@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:51=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> but I would *really* like clang to be fixed to not silently generate
> code that does insane things and would be basically impossible to
> debug if it ever triggers.

Side note: the key word here is "silently".

If clang notices that it generates crazy code, a warning at build-time
would be preferable to the "oh, we noticed the crazy code generation
because we do sanity checking that just happened to catch it".

If that "fall-through due to impossible third iteration" had happened
*inside* the function, rather than at the end, we'd have never
noticed.

So we were kind of lucky in just where things triggered this time.
Maybe that's always going to be true due to some random internal clang
logic ("dead code fallthrough is always at the end because of how we
sort basic blocks"), but I don't see why it would be in general.

                      Linus
