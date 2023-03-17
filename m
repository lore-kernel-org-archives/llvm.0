Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6537736A
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 18:50:28 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z21so24083979edb.4
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679079026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfTCL+CieKquWU9YnAy2pm4YqQSoRTG8bbhGpXRahXY=;
        b=NqjY/0mf9Vkd/q4nW7r70lfeWL6NKlZ3L0ttql3SOGCsBKpSNIYgt7EK0U+8KFdQBe
         bCoQa9pmPOBa/0o1rflhXfAAQus5zxjYPAQ+US9SZgKVXLi9sb5f/iZ+Stb4+7nnhfNh
         kW1vpxJWF986M3p8kk/DEyRqLAcBtwXEZepXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679079026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfTCL+CieKquWU9YnAy2pm4YqQSoRTG8bbhGpXRahXY=;
        b=QJDJiFO+LEgmoEktV07LPEaltnsCnrOj3TjTgg7WjwjUNDcszw0fCdS+ewxZ2KNwog
         wf0ZxMM9r5hsPQMB1xl6mACYzndbrIY05lQcWYXxGyPoFzJOvz1yxBO+smbhXubVWC3l
         suEScbuEF1BDv0Q6+WZsl8xVw1IQa+F2kElRVudJa1V8UhxswwEYU0/OHoq9vbEAopbI
         Kxl6NyawL+UWoGnphdjZBU7BAtIg50iRWZVszsUtVrFqmF6tFJ4tnBSofxFFVRdAT+M9
         R1dhBE+9RUI/1STjYVv6wlQ3XATBTKeMAI3Rx8XcAbgRPBXtO5Medp0C/SxfvodneaCR
         hltQ==
X-Gm-Message-State: AO0yUKUlJJhBxkj8KKXC+gztpAMAxD4p7eMoUWfokUPYCQnIM43/YWzn
	AdJjw3QEtoR6WY3LTo4cD4ac4zbHRNN9ObrIMEO6yQ==
X-Google-Smtp-Source: AK7set8U7hEl9eA6mLzsUDKCJQR+TCy2kAkGBYPKTLpfxvHTYKHgzSeqrsJTliX3c3A8jaUuSx4moA==
X-Received: by 2002:a05:6402:48e:b0:4fc:40c8:2cdc with SMTP id k14-20020a056402048e00b004fc40c82cdcmr3932628edv.23.1679079026306;
        Fri, 17 Mar 2023 11:50:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id m10-20020a50998a000000b004e48f8df7e2sm1432586edb.72.2023.03.17.11.50.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 11:50:25 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id eh3so23973637edb.11
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 11:50:24 -0700 (PDT)
X-Received: by 2002:a17:906:2695:b0:931:99b5:67a4 with SMTP id
 t21-20020a170906269500b0093199b567a4mr144258ejc.15.1679079024315; Fri, 17 Mar
 2023 11:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk> <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
In-Reply-To: <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 11:50:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1wYh_2d8Y1Vm6YjPTh4yMqWc++aWVY2LpX7n_atc2hA@mail.gmail.com>
Message-ID: <CAHk-=wj1wYh_2d8Y1Vm6YjPTh4yMqWc++aWVY2LpX7n_atc2hA@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:35=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I really really detest this thing, and I think this is a fatal flaw,
> and means that as-is, UBSAN really *has* to be disabled for clang
> kernel builds. Maybe that will make somebody wake up and smell the
> roses, and stop this idiotic "undefined behavior is fatal" garbage.

Btw, this is not at all kernel-centric, even if the kernel may be
special in not necessarily being able to log things on fatal issues.

Imagine you are a database vendor, and you cannot replicate something
that a user sees, and the user is not willing to give you their
database, and you worry that it might be some undefined thing.

Are you going to ship the user a test-build that might die in the
middle, and thus be unable to actually show the behavior in any
half-way production setting? Would any sane user run that pile of
garbage on their machines, knowing that any error would be fatal and
result in their production database being broken?

So any compiler person that says "undefined behavior can do anything
at all according to the standard, so we're compliant with that" is an
incompetent person, and shouldn't be let near a real compiler.

Debug support *MUST* have an option to just continue. Sure, make "this
is fatal" be an option *too*, because if you are a developer, maybe
you really want the "fail hard, fail quickly" behavior.

But that fatal option cannot be the *only* choice, or we cannot use
said debug code in the kernel.

             Linus
