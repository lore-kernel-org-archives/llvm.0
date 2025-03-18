Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A1207663
	for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292670; cv=none; b=H02swMDGI45CK1I6a1gvogY0WhV3HzYXpCO2hsTSoeYfipzIvKVZ3Fynt7vxsJ70Z4XWKE4S6dW5NdGCxHQoG4OXB7A7ExuZiMJgV51Fr14YKknLb/Y0NnvqGDtma+zDcwyU+xFZgNl55X2EeQnIMaZbeke1TxqmEI9+KijBOU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292670; c=relaxed/simple;
	bh=puwZpc9fnpT0SxWUpm3PdjIjszBtFGfGzbiYPyhX6wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWYe2tGAXmekqGqDPaXfrBFcQ+5y/9+6Wjiv3RsgYFlJGE3Iup7HQ22EsPZDc+ck/UXkDNUs3jzm1FiOaJFRfiXDKDYqRrRrOCoBf/hUtXei/h52I7Rgt7Pfez5qLPiPuclGjrQeOeNdV6iLVIOII1wzwnFuQJoSp9GozAeDODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsId5ldV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsId5ldV"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso685307a91.2
        for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742292664; x=1742897464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puwZpc9fnpT0SxWUpm3PdjIjszBtFGfGzbiYPyhX6wQ=;
        b=UsId5ldVGvo8nViyCVdLjS5P3g9exfsCHYIc2xm+NN5pHLhu7w6UZ4dnyZ6t61i5iD
         G6kxhjqqzsKlr446OF1MAcKReLzoz1ApoXMrRXqynR8woN0iSIrqz1XvGrfc4imLPmQn
         grX2TnuhAiv8VKpL3IC0FA146VQF9kCCSWhiC3d57JRwWxa/f4DmLdK5wCs04O6VEvPs
         N0mM3bmaSW9A4d7pyWemndIpoF+DK55PdOruwVUKHGzPJuAkvaH7kGXU6egMiSiHXGMI
         tOS8Z+sCvY8cb/oZEOoVS8USL1q1lMwmuzbg6frKCOuU8GwtEl10lz5xsezHC6stlPzd
         EBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292664; x=1742897464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puwZpc9fnpT0SxWUpm3PdjIjszBtFGfGzbiYPyhX6wQ=;
        b=P6e1Z21tvMznWpSM7ItdEUciN8kJoag5+jkoJA4vZXKjO6rQC852iTqwRFgB025rS/
         MEoxAhNQzsAXzB+vi3ikvBxW1+lqOPHLaNM5HNin62oK1SxQ2u6LGQdRVRrU1y++bDTg
         NzDKDkcmdee6QQBKymQeL0LZhr9QV+D6SDWx3keWWAoMUMeXaPVhRHQDPTAGbn717xnW
         TphO1R1L6y77843XXjYY4mogTgwnSYMhEFqH6sdY+/TDdt8o3GrR9fL7qM9RK6lR/49t
         bevD73yEKXp+vw326s8+pr0speQ2aVVLS0E3XPs8OFcHucLqyo1sUVijH1O/XOHVko97
         hG1A==
X-Forwarded-Encrypted: i=1; AJvYcCXr+nqogUNI41IERvcTsH/IBdCL/U7r898aMtXS/mL4B8SpqljyqXhdL8WP9PRP7CZRkFE0@lists.linux.dev
X-Gm-Message-State: AOJu0YxFVZmub2j5jCcCYamvO/LEIWILvQFIWiqCpJ7VFp1Dd6YljaDG
	t7Btfcwl7B6t1x2ILjhXKRtV6DH3X65fJ0RmJYsJlBaMcdS0zlg2awF79Xx14/Z9W1BSyDm9flp
	LHQs2iFZcajChp5kkaKR0Hb1Udcw=
X-Gm-Gg: ASbGncshLeIc78tQrfBWwl8FRc314ha2ZTuhHiFHVHkUQ9vzxSBW42tfhggzo1T4j1t
	+p67LU+nQx1X3GFKTiBq22Nm2FySLYXSqVTRsaQ7mXFXgzs3P4nzCSxMrAV7D5MLmTeBC8b+Zmq
	fnq7kV1jdA6HLGT5BrX7H5tU7jJVko74+SsRif
X-Google-Smtp-Source: AGHT+IGB4pLNiuryWOPuCO6MoIuBuFy1ozidD17nVmrb8yE9r7RMjTngizHJUOGCma5BGINdrBLFwwq4ZGQsKrsA1Os=
X-Received: by 2002:a17:90b:314b:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-30151d89050mr7818390a91.5.1742292664500; Tue, 18 Mar 2025
 03:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
 <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net> <CABVgOSnwkDihbRzYF3uh3At_x0MgOB42_E8sUAD8moKwx+zjRw@mail.gmail.com>
In-Reply-To: <CABVgOSnwkDihbRzYF3uh3At_x0MgOB42_E8sUAD8moKwx+zjRw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Mar 2025 11:10:52 +0100
X-Gm-Features: AQ5f1Jq3f-pICr0X9p55_4vrGdEv6uxkF7XdN3Ns9pEmybRWGVbLLKT6D5l6wa8
Message-ID: <CANiq72nnwopFAdETMhgkCfN9dj+JJZQ=K1BKz_A_xUViis7Avg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pass correct target to bindgen on Usermode Linux
To: David Gow <davidgow@google.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 9:07=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> Is there anything holding this up for the upcoming merge window?
>
> Miguel: I'm assuming you'd rather take this (and possibly [1] as well)
> via Rust, but if it goes in via the uml tree, that'd be fine by me,
> too.

We try to get arch maintainers involved (and everyone else, of
course), i.e. it is up to them. But I see only the list was Cc'd, not
them directly, for some reason -- doing it here.

Ideally, maintainers get involved and pick their own Rust-related
patches, but I can also do so with an Acked-by from them, which would
be nice.

If they don't say anything, then since you have tested it (and you are
a main um user due to KUnit), that should be enough, but then I would
suggest we do it after -rc1 to give them time to react.

Thanks!

Cheers,
Miguel
