Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21122192B60
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739709644; cv=none; b=CcgcAx1Ah+rJzWihIP8rmvFj9R1vyQ/s2bggXcU0gfmfFO4/vv0JxswYZBA/Z7k27qv7K6bbay4anJ6NfRpHTCzfGH1yg5NgHT9mYb5B/bfctoDUs2kMZKCSOep6V+yJ/Xtq43TL0Nx8nkyjm8AeY8+mAp8G6lsIZvoEa66naNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739709644; c=relaxed/simple;
	bh=PiMPkySkppW60OVNSM02PHcpoR5sWMEZlYK3uYSPEM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfNTj5j0L0McIVszZw93UzTcrpf34XRZrozWEEuOi6waa9nNUZTJ3lBbIScU2WZXdNZxhH0GGfPf5Zd5dZkWKwoiVllmBcYIoiU2ZYIpiBbxS7itRkpq7dvGq+EVFTw0OdCfMAXpow1h/YC0JfT46F1Fl1dq4hWDVxHjFJLAHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkaWwMzq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkaWwMzq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220cb083491so7496095ad.3
        for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 04:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709642; x=1740314442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiMPkySkppW60OVNSM02PHcpoR5sWMEZlYK3uYSPEM8=;
        b=JkaWwMzqP+WCPG2Yamgqpi3Lekp6hbZfQVQ8XGsBOjiFtyo1EL9+ASZGAPgzTLIWeC
         U9ydkUoNs95rGo6uBxL2CUqLMs6EGXRLhI0YM+KWBrw1WHlkNavXJgmtcs488uGshBFn
         qxBof2TUkgri+lL/7mjxhEVwi4J5SAsGGBh3t4eCYHL5D3VQOdBELDQVjamVgN3jlYSd
         wfjcG8q1wQkjEPmH+6Ae6jhJ2NjpJeUYPcD1VGeA/SN5TD764kRr8akvS0qAxUQN/daR
         qQH82eog9aBt9D0EvTq51+NWEexLnn4Bm8gjYocaHP1dPiFh43K/EpPy3QX9GlXRE4xZ
         mmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709642; x=1740314442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiMPkySkppW60OVNSM02PHcpoR5sWMEZlYK3uYSPEM8=;
        b=onDC6jag7ywJ7COs/70NgchPE/nMqqGvlSA8hxsB3rzrhhaO+qsGROMCmqbAf8AgUM
         hn6z4GSHXRI0lLFE18H3uYeq1kSIyUX560LkzrD+ChpN44OGpm8X/aVR+eqF/twFyXiM
         aIZQJmQ332zDi0Ivsb857sNsjjrsyAD4TXbE75YLJRExOZr6lQ/vJJQ2LL5c81LnMVUt
         wguQ8RxPYNY9A5JfBZL623Rw3DzSAIdPkqr2CvkBOntlMGE8U6/0iQaXn67W24hRZtMO
         QtTG1sCemuRwBSv2VrfEHz8PHEJVVh+qiUtyS5uJ8dwxUI+0UztsaeoDn2/ZcJXfF2vK
         t4qg==
X-Forwarded-Encrypted: i=1; AJvYcCVrU50D75V4C35YIsMlDLLfd82OzSzwBFtr5jxh13Efwir3mLwwX6yLSdz0h9qeJNNOJjn5@lists.linux.dev
X-Gm-Message-State: AOJu0YxMcxUrdpI4zvr1mxChyt3A2JV5ElEnJ6NyqLJNAAInwN+WZPTt
	RJlSP8nq1SE+lkQUPV3CCoJW6hiVg2PSxQZKZ10bIVUqiI3M7dXJ32ifEH5dX/donfa10WWYW39
	83NNotktaG53lKhffkXpcx7IA0pU=
X-Gm-Gg: ASbGnctykh3AoYSvAnnl9EJknNe1P8Bc+h0XyIidbNOiQ4a10trj4CNte0AtxdK+ZGx
	onLy9OGFGn1I/Q6/GW0EAW5ARzLbZamDtxfksWjCaSJSqRV7/kq5Tx43BrAkqQKtmuf2CHqvZ
X-Google-Smtp-Source: AGHT+IHJTAMuwsJVwkSangFDxZ1CdXoCDX8zCfyQaQkxp0YReVa6st9heBbVKddlUVFJAYIdXIwjVyoBPCBt4bY3ymk=
X-Received: by 2002:a17:902:d542:b0:215:a97a:c6bc with SMTP id
 d9443c01a7336-22103c6dd55mr36013805ad.0.1739709642226; Sun, 16 Feb 2025
 04:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250215223106.2346285-1-benno.lossin@proton.me>
 <m21pvy927w.fsf@posteo.net> <10690211-eb3b-4b95-8d9d-35c62930d924@proton.me>
In-Reply-To: <10690211-eb3b-4b95-8d9d-35c62930d924@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Feb 2025 13:40:30 +0100
X-Gm-Features: AWEUYZl1Z6eCgO4qp8LwTmSceeqr5juaYSjPp0ON81ODkoRWjJ7FttsuVFTrmnY
Message-ID: <CANiq72myMWv87Me2C6Nmse-p=4YL=J+ZTEHe2hu7AhbpfZhgyw@mail.gmail.com>
Subject: Re: [PATCH] rust: fix clippy::too-long-first-doc-paragraph
To: Benno Lossin <benno.lossin@proton.me>
Cc: Charalampos Mitrodimas <charmitro@posteo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 1:18=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> I have done some more digging and bisected my Rust version. It turns out
> I was on a rather old nightly from last September. I also don't get the
> error on a newer compiler version. My bisection identified that the
> error last occurs in nightly 2024-10-18, so from 2024-10-19 onwards it
> compiles without the error.

Thanks Benno, that is very useful and saved me some work.

> So probably `-Wclippy::all` implied the `too_long_first_doc_paragraph`
> lint in that version. That is probably because of [1]. It changes the
> lint from style to nursery.
>
> [1]: https://github.com/rust-lang/rust-clippy/pull/13551

Yeah, sometimes that happens when working regularly with nightly over time.

There is an upside, trying to look at it positively, which is that it
gives us something to look into from time to time (i.e. the new lint)
and give feedback, and sometimes we can clean it up anyway, even if
the lint is broken and we cannot enable it just yet :)

> So we don't need this patch, as it seems this never hit stable. However,
> there is already a patch fixing what this lint reports: 2f390cc58943
> ("rust: provide proper code documentation titles").
>
> I think it's a good lint, so maybe we should turn it on?

Agreed, we should -- it is something we tell people from time to time
to fix in review, so hopefully it will make patches better before the
review phase.

...well, assuming it works well enough, given it was moved to nursery,
e.g. in the linked Zulip thread in your link above they point to
https://github.com/rust-lang/rust-clippy/issues/13315 and
https://github.com/rust-lang/rust-clippy/issues/13538, which we may or
may not care about.

Thanks!

Cheers,
Miguel
