Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D8381AE1
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775430955; cv=pass; b=sBqI47Vd80JgBQUjFlR1ZYmJPsXQWG1/wSOFWltE4jxCS2ZAd9riDQ3CLAdKcSnzqNXd8C1MRawX8tM4ZxKPGwPZShoFaq4bmMTXnHG5aowmiojy2de48W/KtRjrMGERlWcT++hBZGpPqUtSmT2yxVzObbgpdOO+7jqpUd6jves=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775430955; c=relaxed/simple;
	bh=DuXfeYCW4QOQ/5cD3aG7nz3kn7r2sbXuLr+omP2BF5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsNUqP7tGJfkuA//WlRcVJQo3w+1QxEE8fmtQHm0JNOXKwwFZl44rmTQUtc0rM0TFqe8CE4/Ssv5qgNmzULLNumcGNHoPJ4/7Pfm4ToW72c4IT9vp1Y/q/djmy4pVIkBcJssatqJfqVzWfHkWoEvw/sRRrFbO1RIYpj9aRzjxo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGun+Qn5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGun+Qn5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cebe8d21d3so25958eec.2
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=Rey1yZVhpJyZchG+JB9geHDKuxaHgmfNlkF55TfP1VEFaGKumPRQR3Jd2p1mkNYck9
         Qix75xu8NXSlcbUG0gU5JblTkE0y7DFAcdNs0ygOZA8qi/0qgAp+Z9qUw4z90xuHQ33f
         CwrBEpNMEbjymE8vYl9GBg7DCoqusunm6QZTfmoBc9yzkHRTSEu+SBncoQOEKUqQPl81
         W5h0ovMTFzK6Qh+FTcSH7lsdcKEol6IZ/CQfbfpQpXCBaueaS92QdfxO289ZcosbHcXn
         cTGrcJMxoj5wyu7/Iq/BHqPRQBzGBy6yvfwQmtQC5cbBosMFLTIwxQ3k2LNfK2i8NKC/
         DGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=hoPC6zEj3s8UO2270BX3jqug6kaeeBLts5EMRfUKnYA=;
        b=LLKdHWdvdN5RPPvn/iaPBgMpsz5rT8lBT4e1aNz1N+UgyHt3RocV8DjnTSdJy34hBd
         J7tYFL062UEe77lqf1xZOsE2rCoRv7XPdIPRWpErsB50gUQJ5RJGygKUaHpPQjTtxQih
         G0begKV2XiIyvOaeR5mo33ivrBlFucpQk8PqsAc3s9knYi0FTWkvpJ4gyc7Hw8bVGsY4
         GMA83dav8pCWIUjwMKtgcPt8QVMQMAvv8dOOhwZ1qvJpIfMP5EZN1xW+ru8rOIAgFizc
         uZ5xvPRbnRsWvKIClIZ7AomF49qW2DnBa1vjUip483jHCLkvLwo33U5rY18qV3fQr9GP
         yOSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=lGun+Qn5Z+wY5hbpxmvTkUci8uSSHerAlHNC1CFEgaw/wD7AYanck1td5ZMvRSNoMN
         PCZKO1gSSyokBpEjllXah0D+FjwNK6DhlVFY7GJoy5KGdl7uh4Cy/re905z+gF2LFDhu
         HqSj3x/lsi95Xauey+86ZblYTKaypdFzbVLaFL6eLItp/294HetGAxzTkIPVj0B8q4pJ
         kU0RzjEfvloPvb7sCmAeHWIakQEOA4XkT9aJdfi/iOketXiYrKOXKjnp0dZYPm5Q/ynP
         0kM9V1UmmfaT3z12XxDaQGWR2ejqnlAjPNquBxPyNiFgnAMSG+XQyw3tbLAcR24j7tzW
         M72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=JqElYjGWUUare3ibX5+jYTHUM+uk+YEbQp5iTx5qnLB8qg3RAa7VjwGgSWpEgWprZs
         lXWU37sNlAKMdBwSsizRIBT1xNDL99yiZox5eMaJLU+l8VKAVKj55OuUE3oHyQTKj+L9
         x1KV9cW0YwNckW8DJRCrMULOsr5SJjWcQ2NqdwmDWWgDNLf8ko2IXjIQ6XyfVTdhmwxs
         GXjqJkvTmh16MgJkKXaJ/hEtA9LWnfSC66RC7pqbxQVrWmjYkyzggCt55DBq4zXH6ACf
         paOvWcorazK8q88Q/SojvDJ6UVNkDHmFIEiF3CrJMaFCmt7b42Iv4s24FRUGYZ2B5ypp
         Riuw==
X-Forwarded-Encrypted: i=1; AJvYcCXpjql5IkwuRzU3PSGlS6MoI8kXUq5JP6WPHD84zhuTnIotNRkHnlkomUtprRHG2WfMfNXh@lists.linux.dev
X-Gm-Message-State: AOJu0YwCUltsS+O42aXs39vh8NiZKGmtoqm8LdQyJcRl7EjFRGGnrHuv
	kGwV34drYtZkCfHCtWgxtHYTu9I6hGFjh1qlbv6dV+ulB2ANJyU1Emhxz3Dcx63LiyFTOfhjSYG
	QUWEY6T/wZi4+JKkdCyt1l3wxvjsqG+s=
X-Gm-Gg: AeBDievh5fSMOP1x6b/F0Ex0OTReCUuMQgqvUMjgELrmz5DlgoC6tQkEBp6OjQN7DAG
	PtbPvXPKLikxOlgTOpiBrZxXURBxkJE88B/vJImaBWp7Gz4uvzxIh6yMq6mDvAlXJbO4ehWu6nc
	r3d2mCXlMppnE5RJ8uoUJTWpSiyg7y9yX0t2lpW6Y7nJAvr1Js48JCsDc7ieJ1sWaQrXOXZTReG
	iLFTvbCti4GSb1RyKOiezAkiNY4BClwUCU3cBHkvCtjM+E+AodiSaAeszoMgjhwbjJFb9xqpygr
	NLB/nuyMiVowtAjZ3bPV390WMvp4529pC0PVqcX0vHottBWLmYPxMWqdkAtUPa7OWwvyfgQPPRJ
	29XBGrA6tuuzPaRFCyzM+PA0=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel
