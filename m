Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438417DE36
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275869; cv=pass; b=BZKJ5wV5NaED/++a+jx58njjcL+Ytr4NSS8nNQqNhuQX9z3RPkuhgCuGjyYjgWCU1MixwjoHIDMfMmiboHWNGX2wx9sLSMbugeF2GjltktxnMPXMx3nVx1XIfPeDy/37wg8okdGw/tcAnK7YDrLeKCn5bgG+uTU+hNTLX4FVBgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275869; c=relaxed/simple;
	bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7SoPXGUJgt56d5dhElYV+vEAdTHam4kV0kXCy95vpKMgPCsIdAuBZPMm67QXInAxeNb1g22I66UHLBIB95nKO+dTQo83F+gOmCfvsL4YaEsqltjs+AuWqSzoS20n1rWDMOdSdt/kbL83Nntn5dJfvKcWcpSf2M+zPPcXkvONgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKxG39BX; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKxG39BX"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so142119eec.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 07:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774275868; cv=none;
        d=google.com; s=arc-20240605;
        b=NPDFPj1uE6eKGPVTqHxm4Tk7sMwg2/d4dnqectL9vxuT6t8nBDuEz81rXDQoo3LhMn
         iZFmaFAtd4RHYu2OEt2cvF9ovMbKW6yE2lZdkAUWOqLueOIoGnzOX2CxU3lQ3qNckzR/
         DqMlpUAKJLjPb3DRQieKyYwiAxWJkTRWhcjWGJu/kX3XxJ8Fzo4qf4SPqHVCfvVWj4Iy
         cPIap2jBpRwfixWmuVjQACTLaLIGCw8trrM70Vp7uLIcP5ipFmdCCF5Sjqd5DFzf4cSb
         vuqjD6O6c8RzD5cq6r+c+lEO4Oygi+ZZyIzxscZ+9n0bZfmskf95los/srrdj37ghSQu
         8/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        fh=Bes1vR9ekfg/hg3kY5xPYJTj7bCqjtlzmvYVYXGIeGc=;
        b=QZBv4AJox5HxLOocLtBCeV9T3kemk1hG2U8c1y49Olq5/EUgUM7/LSgaebLMjZUnoG
         +j0mV8ncj/T+8NPv5QY+/MA3IN9aBeUhN1aJfVcuSMMbqMFk8JysKJspLCcoCS85AyC2
         D7w0oMdg37EJy3uicxKT8OtoTqgFvBWrnhw8D6wPiU033XBcjYrry03TSl4kIi+92l9g
         NchRGqHdQJwyVZmHxcc7zKq/MxbihVk+zIzlofxmfmk5t901oHGJ7i0aQwRrTJvEftl4
         RwbCLtT4K2/i9DKU66Mnva22KZSoQdbMH5v3rGydl2uJAhJ57UzxRIyqlwYYS58N7nIw
         dnvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275868; x=1774880668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=PKxG39BX6GPq5ioXsu/85NYR3Sok4Bof16KA++VWs27vH2TeeeV4Tdrv5W0Xvkgi4a
         VM+n/MGWS+TF9FzBCETzFft2NH57uEXx1Q2Q354Q6lesxCfRLhCX9YvUGlGGIkD56sO3
         MiWKUJuccDe8DKC7OKBF6gBst7cbygSJt2LaGy9sD9+yW07plKUmbUT1gv/kXYwwc1oi
         VF65GXlIe9OqNls43JEDHAVZdlZOVVB4go5IW0RdVAPQaTDVCG4a9/TcoJCsIBnOImmg
         QojsehIk0BwyeEjtab/YFnF0Zs/ff0F4H4Nsq2Tl2yM4EkY+9CXNUvAxf+pAyUEk1ZSW
         6B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275868; x=1774880668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NmCKdm8Hpc3KKzPb6Sjk+NZScosRjh4V+rX6f4fvYOI=;
        b=frVWB50GH+yaflDhK493HqRJnqC2d48Colpfaw2TZRTuiNlOS/i9U7UUf4hJaES/W8
         FEsbOiiPxeP8KC5qvgDLOl/i5KXxPl/L7iaH+mfZqXgyARHn0ayIduAMlhJETe5OuqxG
         Ey3Y6Tpsk0xfSWhMLIzcD+8Fsw/dpf43ECljCWm5yliHYJSlSMF7iIBwRxXTY8gsaw7U
         4rH6IR9H474VNtuRkXpNr7xndcDMWPFs6lLY1rKLxoIhXoSO5YiMCYT/FpXwpDPleJ8G
         /NAarja736oGzVUHZr2vYUfZ8wT8D+pfHibQpxTFqxQKHvZ0KQr1+nUHvXpbtrodXOi8
         PA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1HNNZeCGCjlrRF6TRFt6yy1YBZV1nLRiPsjI5dfV23Xl0o6uPUx1+1Ja/72EEtwB7VZW9@lists.linux.dev
X-Gm-Message-State: AOJu0YxTYCf7t38q26L0eN+JkxSL9T2CDPXfWpLpdMygBbCJBmZG5T5l
	u5wKmLv7tkslBowlbBcibXYAxeub7xOuY94O4HcJfSZD/YDqhS2duCzSTOd9TvFV616ht5iyEn8
	euvlNb4poZdrIk+/d2Rlw0Ibw9WOmbE4=
X-Gm-Gg: ATEYQzxYZyDsKuZoeusydShNTizF0x005dmZe6EsO5MLG7aonjh+4rCRYnv/x4mlGV1
	969GcQKCkLNYi2/vNOppaINvRm3j69sLkvCwWrcvns3kaJFKS5bUDEOoYSXg5CchHPZ171xBxoO
	h9gdVynElcOoCPeg2oIkD+E/v7S8tnWYmhxdgtkcirbU9Q6VZ0TieHsna52GA2LVWEv2WELyuhS
	CDNljVo7WC2ix+yTO6ZBMhjxJEI+AesZv2ecMzUQeG7Gcocsi+HFBOpALIoIfOz6Lm8PnNs/37c
	buNJuvElO47kr+Rh8UVnkQFXcx6hJ5Rkyc08PztNN2uJlM0OZocuOX8f3NxzYK03H4PSu0ItvI6
	1eJWFReXzl3zN+nRjnRzeHotOxgXytbYVZQ==
X-Received: by 2002:a05:7300:dc94:b0:2be:6e6:e479 with SMTP id
 5a478bee46e88-2c10956b92dmr2532830eec.2.1774275867800; Mon, 23 Mar 2026
 07:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323130224.165738-1-ojeda@kernel.org> <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
In-Reply-To: <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:24:14 +0100
X-Gm-Features: AQROBzAmfgdHr-kq6MIVGANQ2ER2Fz1DKErHcHlGdKPXdISrZZm7VssL1t98GY4
Message-ID: <CANiq72=umSRNNRP-KoFFSe1vYtUf_U3hQhRkGSuLp0F1eQ-0dw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Aaron Ballman <aaron@aaronballman.com>, Bill Wendling <isanbard@gmail.com>, 
	Cole Nixon <nixontcole@gmail.com>, Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, 
	James Foster <jafosterja@gmail.com>, Jeff Takahashi <jeffrey.takahashi@gmail.com>, 
	Jordan Cantrell <jordan.cantrell@mail.com>, Matthew Maurer <mmaurer@google.com>, 
	Nikk Forbus <nicholas.forbus@gmail.com>, Qing Zhao <qing.zhao@oracle.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:46=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Can we avoid cfgs by always wrap things inside anonymous struct?
>
> The comment says "This anon struct can add padding, so only enable it und=
er
> randstruct.", I wonder how much bigger the task_struct will be if this be=
comes
> unconditional wrapping.

Yeah, we may want to do that -- please see
https://lore.kernel.org/rust-for-linux/202512092319.ECBB8613@keescook/
from v1.

Cheers,
Miguel
