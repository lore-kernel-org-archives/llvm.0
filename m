Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254A2C9D
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 22:56:28 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso6807699pjb.2
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679093788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgl6/Ew3LdfVeuq3EG0BPByS9IqpLUKC1pNwODZSZMU=;
        b=e6R9EwymyM8VB3T/Qk9Bv7+QepHZSKJljv0Tk0WcqnlmSGmI/JU/r9KMRinX1eUh3Y
         +2zTFGLlEhiGkYfExeZ0TLIqg4/MZG8WTJ1/bK4fTPeSFCS2KlnbRRscLIoJw/EiZvy3
         wOjxustqLkj0IMLmd0C7JiYUaCLuTV3rJAnwmmblpoUX/eI5O02Ac2urVs3k6Sq3OddO
         ukQ9C+M5H4d1KShMTho2fwl2AOx7i/LJljqCBPIb06zvUWJKpbUxefq9DUiXheNRTrCW
         QsEYIYgTgsvg1dCdT+IwAGgGVI+1GztUQJscTfQvk5daK0y+1dfdmUH9ckBCUbrKy2o9
         RmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679093788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgl6/Ew3LdfVeuq3EG0BPByS9IqpLUKC1pNwODZSZMU=;
        b=JaBzrqQpZTa5JUo8HLJeAX/KGbrd2olnfAY+LVhdS/MZ6xZ48vSDKC6j5maEf/9i2N
         LUBuojr+0ZCKYRIi93M9SBW9YjgfAtuqRZWMQ8AU5Qbyi2JJdGaZrZ7tDED7vrY2S7xA
         NIInUuYS5g9X0J/Xojfi9l+x9MDcLoHLiFSAdSY04TLFx+si2ZJ9Q96FlULzTpkpALEU
         NRc3LRhZsfdkfJ6dmKp9Ag9vaoUM5/2zgGV1FXq1Vqg+veOknJCzGqUa9CElZDdzFAOv
         AcCcLqnwTupRPjDmaAmqEHgijSUOIK3WOyBHkioDXyf4TPxQLg8XPmm9/K+WeHiWeIVn
         z6MQ==
X-Gm-Message-State: AO0yUKXN2qFi63YetMjc86QJP3VXUxkXQkaB8bE96osq8MRW3DpxZCOE
	fztWEA/8JIJ5pqO4cVOz79z8H6EOMqENJwkrvUb79w==
X-Google-Smtp-Source: AK7set+VZ1C/vdje0Qf+DN5K6lCsci8LicRW622ZINtSJOlwFek/UOb9dFwUqU2dwUFenMc0n7bU0LcAGLAMvZzPf6E=
X-Received: by 2002:a17:902:e749:b0:1a0:4aa3:3a9a with SMTP id
 p9-20020a170902e74900b001a04aa33a9amr3500662plf.2.1679093787879; Fri, 17 Mar
 2023 15:56:27 -0700 (PDT)
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
 <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com> <CAHk-=wgLBjQZ1Xic9SDvtPOu3MNwRznZygZ35mqq4CpKmWdBtA@mail.gmail.com>
In-Reply-To: <CAHk-=wgLBjQZ1Xic9SDvtPOu3MNwRznZygZ35mqq4CpKmWdBtA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 17 Mar 2023 15:56:16 -0700
Message-ID: <CAKwvOdkSBASKK9LZowSdNyN+OR7Kx+j5sMdiJ1nSwbvoQPzNVQ@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 2:00=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 17, 2023 at 1:51=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > but I would *really* like clang to be fixed to not silently generate
> > code that does insane things and would be basically impossible to
> > debug if it ever triggers.
>
> Side note: the key word here is "silently".
>
> If clang notices that it generates crazy code, a warning at build-time
> would be preferable to the "oh, we noticed the crazy code generation
> because we do sanity checking that just happened to catch it".

That's fair.  I have something hacked up locally that can spot the
fallthough from m5mols_set_fmt() as objtool did. With some polish, we
can likely ship that as a compiler warning.  Then we can have these
checks regardless of objtool arch support.

First I need to teach LLVM that __stack_chk_fail is noreturn, though
I've only verified that thus far in glibc, musl, and bionic; I still
need to check that's the case for the BSDs' libcs.
--=20
Thanks,
~Nick Desaulniers
