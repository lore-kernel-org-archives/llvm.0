Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C0D3212
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:31:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id eh3so24887890edb.11
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679085065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdwPzVsmob+Q/2o5AaDTACeQ8LqTFlcH3duKRoFq2iQ=;
        b=NRRDvzKrpe8pYBzozs6ge7vqHuUviWfY6zC02S2Qz2ecCTbPpe9T4e6uBCNFzMqCd8
         seWjFsr2PePAi1T70JZzGYiFm0pUqoCfKAHToYFYfQSlppds1cRifzvCzqnfy5Hh7nnz
         wA/Xac9eMopHZS+YhuCw941avlp3Q9/QDL2QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679085065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdwPzVsmob+Q/2o5AaDTACeQ8LqTFlcH3duKRoFq2iQ=;
        b=dTwgbLvIhofynUK9XryBZae4dtXhTTwWyhixljAVo3pCUsXiw0yKZDhFvnzvurMlI0
         9iSluXoY8H7pp2X5WkfP0Xbx813y9l199MzKZFUBG6opK5SlPBtxJnL0rzxGM8tQqMrm
         JWiUyUdM1ygAHnUafd+DLfCYvrZrKfsUF6hX3pIq/oOQRFrHQ1Xfhk9r6GEENz6ETb5T
         KsogfYRxhZT3YugnYZC6oQ6nSXdLUG/zbYMqN+ez1ziw6Z0qKrzic+tzLkX4Va4jvEK9
         P976B2ISu2Qk1rgt88kKqcxU0mBOIGtWNratA0V+oXG2HEiuq44vBdxEzNcZQWWfW3Tu
         EviA==
X-Gm-Message-State: AO0yUKU80kNHdNkt1EcoJEnxaxDd2NshSKDnqu4bzV0y7LVvdywefU38
	55Wqz2wxReVLhh9mM7rV9JxXza82WDpsAY7wZx9zFg==
X-Google-Smtp-Source: AK7set+tT3xFcmnssEXJ0z9j0MaUVODEPNfkSwf6tRTGz99UocsBM0BPOOJ03p7mHTYNdBmuVn6RNA==
X-Received: by 2002:a17:906:a415:b0:932:e6d5:bd7c with SMTP id l21-20020a170906a41500b00932e6d5bd7cmr674397ejz.20.1679085065013;
        Fri, 17 Mar 2023 13:31:05 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id ce6-20020a170906b24600b0092101bb66desm1349332ejb.147.2023.03.17.13.31.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 13:31:04 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id r11so24968626edd.5
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:31:03 -0700 (PDT)
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr2477649edj.2.1679085063365; Fri, 17 Mar
 2023 13:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
 <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com> <6414c470.a70a0220.6b62f.3f02@mx.google.com>
In-Reply-To: <6414c470.a70a0220.6b62f.3f02@mx.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 13:30:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
Message-ID: <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Nathan Chancellor <nathan@kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 12:50=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> I've hit these cases a few times too. The __ubsan_handle_* stuff
> is designed to be recoverable. I think there are some cases where
> we're tripping over Clang bugs, though. Some of the past issues
> have been with Clang thinking some UBSAN feature was trap-only
> (e.g. -fsanitizer=3Dlocal-bounds), but here it actually generated the cal=
l,
> but decided it was no-return. *sigh*

Hmm. The problem here is that we only get an objdump warning by pure luck.

This isn't a "objdump will always catch it", it's more like "objdump
will only catch it if the code happens to be moved to the end of the
function".

So I'm very happy to hear that it's not by design, and that's very good.

But the whole "this is a compiler bug" doesn't exactly give me the
warm and fuzzies either.

The code generation looks *really* odd to me. This is, as far as I can
tell, the code sequence that this code has:

m5mols_set_fmt:
  ..
        movq    %rdx, %rbp
  ..
        movl    16(%rbp), %ebx
        movq    %rbx, %rdi
  ..
        cmpq    $16385, %rbx                    # imm =3D 0x4001
        jne     .LBB24_1
  ..
.LBB24_1:
        cmpl    $8199, %ebx                     # imm =3D 0x2007
        jne     .LBB24_3
  ..
.LBB24_3:
        callq   __sanitizer_cov_trace_pc@PLT
        movl    $2, %esi
        movq    $.L__unnamed_3, %rdi
        callq   __ubsan_handle_out_of_bounds

and as far as I can tell, that "movl 16(%rbp), %ebx" is

        enum m5mols_restype stype =3D __find_restype(mf->code);

in __find_resolution(). But I don't understand those odd constants
it's comparing against at all.

'enum m5mols_restype' should be in the range 0..2, but it seems to use
a 64-bit compare against '16385' (and then a 32-bit compare against
'8199') to decide it's out-of-bounds.

I must be *completely* mis-reading this, because none of that makes a
whit of sense to me.

It's possible that clang is just *so* terminally confused that it just
generates random code, but it's more likely that I'm mis-reading
things.

The above is my interpretation of what I see with the current F37
clang version for a "allmodconfig" build of that file.

My 'clang -v' says

    clang version 15.0.7 (Fedora 15.0.7-1.fc37)

in case some clang person wants to try to recreate this.

> I'm not opposed to disabling UBSAN for all*config builds if we need to,
> but I want to get these Clang bugs found and fixed so I'd be sad to lose
> the coverage.

I wonder how many people actually end up having UBSAN actually
enabled. I get the feeling that most of the coverage it gets is
exactly just the compile-only coverage by "allmodconfig" and friends.

Otherwise it would be really easy to just say

        depends on !COMPILE_TEST

for all these run-time debug things. But exactly *because* they have
caused endless amounts of build-time pain - *and* because I doubt how
much real run-time testing they get - limiting it to non-build tests
sounds a bit counter-productive.

              Linus
