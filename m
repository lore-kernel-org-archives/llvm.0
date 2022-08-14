Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B429AC
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 21:20:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id z25so8315408lfr.2
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SkQFrjjD+SLMS1KGY+0ZxG8OFTp1L8fZfcWunvGDMHI=;
        b=sFsepAeLhe3VNoJ+5lZwh6r5C8SM6ty9/yAfJgCTWN3ZFmjtxFgV6E7EwxJA9HvvQO
         VG4bdKIRutMVPYri5AZ6wzsJMAV3QEbRcLTedpdz5ugXStIJpY3AA5tWJjGjMNpPmH1J
         XC1KlCcr5GxoZGF6WPUt4ZMrwh01NlGPCLcd9aVVxISlTDhQTqxIoWl2wyFl/4CjURw4
         uD4XQG7qsBtecGQwBDK0nQxiyA0dvosRivdbq2jr5nIH2cVZylvSqVphXSih1xFi2SU9
         KGHtja+WuWlATJNeey0K7UXRN10qCqgMZBO0aXMygwmT7ZwmeEJ9kTo20Tv17wA8lwNe
         QDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SkQFrjjD+SLMS1KGY+0ZxG8OFTp1L8fZfcWunvGDMHI=;
        b=sbCKj0QoS6FRfqaXK4hprEbM1ETMZgvdLc62TAxyO7jnVJphukXvE8RunqAFNCcVVt
         dLL5fyI0xR6FNvlgltjhMrPCSvqNJLEKIiTnrBBthnp6DgozBmoxpV7E+2MnV5EWDwsE
         3sX+InCxiBtcj3roEmUAF0gGj2d3SDlLY5ZE/rtYqmBxrLBsj8oHxOUnVOLeeA+7tm6i
         0R54TAphLtfVrkrMn2A21moaqXVR2u0Hvz0d7KoEnzlSPt4FtXfvno4Slk+IGJhciGju
         37UtzAfaMyceJBuf32wOJOeFtv/EI5A8nk/11SUACp0uDorhO6uB0l4KzNhgmbxXpQ9H
         /piQ==
X-Gm-Message-State: ACgBeo0r+luyErcFVLdqeHnFNf3hrlwsm0xsetRsjycYbVA4OtFvDzp6
	1u5mgEkdAOy11FaqD5QK20zou8LVd232UpI31inIlw==
X-Google-Smtp-Source: AA6agR57awhlG1SwOBEitCmgKcFGaqz1ZEfQ+SbIU5ZxxUBt6P1IK9W+x8VBkTQijpI1wOk/tWgxr4KxDlXpwqbhFOY=
X-Received: by 2002:a05:6512:b01:b0:48b:a065:2a8b with SMTP id
 w1-20020a0565120b0100b0048ba0652a8bmr4139640lfu.401.1660512015704; Sun, 14
 Aug 2022 14:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOi1vP9BSi-65of-8D0BA1_DC0eVD_TQcWkhrGJwaXw_skhHFQ@mail.gmail.com>
 <5d0b0367a5e28ec5b1f3b995c7792ff9a5cbcbd4.camel@kernel.org>
 <YvVzHQ5DVaPAvw26@ZenIV> <72a93a2c8910c3615bba7c093c66c18b1a6a2696.camel@kernel.org>
 <YvV2zfT0XbgwHGe/@ZenIV> <CAHk-=wgYnAPiGsh7H4BS_E1aMM46PdSGg8YqFhi2SpGw+Ac_PQ@mail.gmail.com>
 <YvV86p5DjBLjjXHo@ZenIV> <CAHk-=wjCa=Xf=pA2Z844WnwEeYgy9OPoB2kWphvg7PVn3ohScw@mail.gmail.com>
 <CAHk-=wjLLw0xjL+TZs5DUGL8hOpmLMa4B92aDVFxw4HZthLraw@mail.gmail.com>
 <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com>
 <YvlILbn1ERLgZreh@ZenIV> <CAHk-=wjvKtkqF9AXx8GoA80h_RNUV=Ld8qhi8ZEPmDXC0VUDUA@mail.gmail.com>
 <CAHk-=wiVyGt0XCFom97ULZyG5Phf7+ifC03sW1i4HUz7xaazng@mail.gmail.com>
In-Reply-To: <CAHk-=wiVyGt0XCFom97ULZyG5Phf7+ifC03sW1i4HUz7xaazng@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Sun, 14 Aug 2022 14:20:04 -0700
Message-ID: <CAKwvOdnL=icZ7j=-i-OY2CaFxgF9eJsNQo=7ARDXUeAraNzhaA@mail.gmail.com>
Subject: Re: [GIT PULL] Ceph updates for 5.20-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 14, 2022 at 1:29 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I dug into it some more, and it is really "load_unaligned_zeropad()"
> that makes clang really uncomfortable.
>
> The problem ends up being that clang sees that it's inside that inner
> loop, and tries very hard to optimize the shift-and-mask that happens
> if the exception happens.
>
> The fact that the exception *never* happens unless DEBUG_PAGEALLOC is
> enabled - and very very seldom even then - is not something we can
> really explain to clang.

Probably if we could express that the do_exception label in
load_unaligned_zeropad was cold then that might help.
https://github.com/llvm/llvm-project/issues/46831

Otherwise, could we put the exceptional case statements in a noinline
or cold attributed function?
-- 
Thanks,
~Nick Desaulniers
