Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1CE2749DF
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144185; cv=none; b=Fm53uOzDF+eWFDP8V5GszncbAbJcKzExgiQ7SobhVQRFndLJ2iD0dsWBG4+8npW5Y6Ofw3zClfsMxJNo+7gNh72tOCFDW8NCzXY6EUgNkIeppjcmU6MPD5pYc9WOxAOuhVX9BI8inkKcfYWghGAMO52vyjYPt/YaWfQDKJ9V+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144185; c=relaxed/simple;
	bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKStIExpfQLhGS9I+elDyWMQxwWCAKzHC6Fd4IP8Nr0l3MXaG8bPdUrpwpyPOLfQ6hyL/yUel27JgpFDQ0OzE7aUYOCxlRVNWWY9S3qD/WhEWf/UwGINHKZhTgiQxRrMf/zxTbae4m6RT6I8JPaFvtU8ml3jskTZpFjpJLw7lN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afmlVUWf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afmlVUWf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-312cdbc67c9so197223a91.1
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749144184; x=1749748984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
        b=afmlVUWfJmH0Nt2vZm3My9klBB1Tr+dbFW0Uts9XRxzGl+U85hdlOl9nh12FyV16Lt
         eO7u77DFKKuyJZHO8MO/pi2dHacai8UFNAto6BGiu+amRIPy/u4xZdjj/V4i7bF+kqvD
         WLEVcH0H7h5NcfntW8YpSf6tO6TNL9Wtr+4wSexMFseIICMZefN5OzZffKKjL/6mQwiC
         XdYvSC55SB55pmoCuvFINh9enaYbazNfe7kfAi8r1TVlcqCB+D8wOOiEE2RC+ENdFsJF
         MqBixuyvdaLF6xM/VmrDU6kRLaFDUUmhk5L1e0hSOBTA6KfcNWSCQ7a7yB1kNhg/wuJG
         RxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144184; x=1749748984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
        b=b5jx0l+7qCh7WcfAZBykyeS1B5M1NDLKw1ZGjXmq+yNcS9idLt/hpMqh5+vwWST4Vp
         gPFJXT1zYAejky0yff8yU4otbkfJv+ekimHPThOfxmL/FBzY7donVCnB4nR1jheTZ3p4
         B6wAj/g4UWO3P6Zfd8D3mfT+3HSUMlqh7iL1iQQkjIBcGpiGMSSDNnFgXN1rHLg/YAwk
         CJvtv9zz4k4hnWD25PQJFSoxJRWi2Xf1e2o0W1myeepzXaurpvCGBIrmugnznZG7sbus
         ZcuDzpJJhwud9heqxiPcDJK1rtRF2+QMTFFXalgAV98+Z7xLDfE+sR79BdNcq8RCcU4C
         JNKg==
X-Forwarded-Encrypted: i=1; AJvYcCVvJDZwbzDoxYjkjEe0xABclbqVzpIm4FOTox5QOwIXpsT8XGJ7NeHMJTYq4ecbEPI5Nsc9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+iAYvxqWm6s2bQMomeJKVnfduOvzvvzyJpE9BUmW8sZ0X7WNc
	tfT3fxHEr3JpTXCc9Q9XcmzBLnWYmWTiz7dYDTWi+l94nreBCT+k2VGWIIIs1GtaJ0/Hz6RuaEX
	Pskvf0EnQEijiDfmV7Kkh6fvJrakeBGc=
X-Gm-Gg: ASbGncu2Bu+bLnd4Tvuy2yW5xkw1isnY3O4locTwaxgPXEHu9Vj+5mXq1Znv5D2VvfB
	zhJX17EKU7q0jUEGUDBMEGOHNyMdLdAJoPKA5DT48Sw2/GbZcigDGxRPsK7EKTq5+BKMfL0nOXu
	W/CpuRouyGMr+FCe1Cu4drHoXvo0PUFQA2v6d1DzvLlNw=
X-Google-Smtp-Source: AGHT+IFL93Dn+JPYLvdJ97OS1e9Y7WI8nNfScy/BvawuaHEKEfXx1cgMVsWswxX1DXxUVjKFqj43r25VkwIzBxqwwJw=
X-Received: by 2002:a17:90b:57c6:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-31347a28f5dmr221166a91.3.1749144183617; Thu, 05 Jun 2025
 10:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com> <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
In-Reply-To: <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 19:22:51 +0200
X-Gm-Features: AX0GCFsKx2Moxjr3HRPaNrk2wzvk9Nc89fe4Aa5PGppcA4ASb7L4anzao8sQk4A
Message-ID: <CANiq72mVuPex3fLd5n8jMtU30QStLs=vhsChENdX1hGhA4KKpg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 7:03=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> The upstream rust PR [0] that changes this was just merged. So now `Unsaf=
ePinned` includes
> `UnsafeCell` semantics. It's probably best to also change this in the ker=
nel docs.
> Though it's still the case that removing the guarantee is simpler than ad=
ding it back later,
> so let me know what you all think.

Since upstream's will imply `UnsafeCell`, then I assume they will not
take it away, and thus we should just document it the same way, so
that eventually we can just alias the upstream one.

But that last part can only happen in a long time, when our minimum
upgrades past 1.89, since otherwise we would lose the `UnsafeCell`
with an alias.

If we really wanted a type that does not do that, then we could have
another one, with a different name.

Thanks!

(By the way, please try to trim unneeded quotes in replies; otherwise,
threads become harder to read in clients such as lore.kernel.org, and
it also becomes harder to reply)

Cheers,
Miguel
