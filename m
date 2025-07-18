Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1E2343BE
	for <llvm@lists.linux.dev>; Fri, 18 Jul 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752851438; cv=none; b=B7oczOLKCkB7qujhkxAiXMoD+F9akEAYBO5qtn6ICtpBznDVxIp0utS224vhd8phdLwoxu8oBmmhAwPKrywBOj6klp6iPULdc/9yuTiG4aQtzN42Xesek738sYj8dODQQoA+O5dWLedyuBmLq8w6FiVcbAyt1ra2awuQgJ2672s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752851438; c=relaxed/simple;
	bh=3rNNp44W2uwB+VIQeKmHHv0eZ6jA7AN19TJuJweK7PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQVa/QMkRXsWwMfNmjxgd5DRudYZP6OV9YQTs/y4HyB8JkrdsOWqGy0tpg5+woCALniSrbpt3Ez65xj12TLpJPCZRKhMJvsQ4cPaTxo92aLrdDZaI0g5Nt1m2li0dzFTNVdJgB+ETjHzFqJ5BAb4ryVtJWxuVqI5eFOCCQ2+VYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f6c/woqa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f6c/woqa"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2357c61cda7so127035ad.1
        for <llvm@lists.linux.dev>; Fri, 18 Jul 2025 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752851435; x=1753456235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rNNp44W2uwB+VIQeKmHHv0eZ6jA7AN19TJuJweK7PQ=;
        b=f6c/woqacgnt1wyo2Hb4Uw7J7s831XE4Pp0gV2Q+v2hgyWjPoDdpc2UPUqFOX3395/
         sEoumThFp4lu36Q1h9+khg8lgXKZjirI7WcechvMku+hQYp7wRuCgHh61j/VkXALyxv4
         JGx4EauOQlxV4L9gTpxO5Ru3HzLpmU+IvwLtsul3lMluQxIWe6fBFVT7BadDfjmqDeGD
         NIIPXmvY8tuV9Cn56XrtlDefAAIETgjm/UfTr8v/sFQwySFJBCqw6UPa2og+iy/ZuqpO
         lhjdMpEGBgrnPi6BQAIwqJFMxr411K66GjlVUpZyap/c+nqDgbSwZ69fq8wdmf6en9vm
         cFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752851435; x=1753456235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rNNp44W2uwB+VIQeKmHHv0eZ6jA7AN19TJuJweK7PQ=;
        b=MC96y2O4DN+wv552iloN4x23L9DTy5m5e7r35bwLwu0yBFD7EHlBe3gj3cou5h8wHd
         /Ao5lDnpBfZjgUz56C/Y2zkCf2q4VbkobF0pZEAeJmnQ1IDfnNJxXftjuIyalRF8iAd4
         MPxoomsz/BuZEjPZAyyu8+yiyppjuv2bxVddlLNFKALIy+8uzHzsn32JiYxENmM08Am8
         2ezsR67bS7Cpl3ixjIFSXhMLm3j0Txsw4UCkc8RbNs2wIgWa7N7dsSsqLXWlVnqQmFcE
         ONAJa+hqwerv/D+lH54nZ3IbS6/mHhfSjPs/3NZwMJ4ETPARJEmprZLVmJ6Lfy4Fogyr
         52KQ==
X-Forwarded-Encrypted: i=1; AJvYcCViNNYJyEZCjrblq0sw7eW38vO83tAKXyxZr7mzB3Y/bTDMOUensdNatqfIE8ytsmgHS0wZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxRgLspBbZ4AkwvqFn1D56WqTEfX58DD+PC6FWRzykizeTHfgvL
	kRJ6SjTzkOWQDrrP2oJ2jfnov9oWAjfrsIMNXzgrPVqNrwmCELCWFdQAMRxhyFuqnst4T+VzCvq
	xFCU0NmYV3V30YJx8n6T6jCONIA2J7reQivWiqCQo
X-Gm-Gg: ASbGnct0zr4HTjRrBqtW6Xbu7lHw3dt7loG9CdMEm1HAwH9bjBUQyK/5x3jKOSnRedE
	EP+XQCArDFXZfwDYbLF9d6Qwgtm5a41VTsUkDa0VrJzvsQ/xdSZ7frAYjAlTpMmtan9qpV5iv7e
	RdRvIKumwGeHnpkU5c95UdS7j4Jh3NSOcWkqL0VCYROGcW6y35ZSuvnC+3Q5rbmGh34Fm6iqIud
	hDK
X-Google-Smtp-Source: AGHT+IFY2HTyUffq8avEz87cUjccHqaBKiXifZLyGAfqz+w4f7sOiiG/pvh7lsNvg81HY1rNvJ3qWPbG0/coTbsLaew=
X-Received: by 2002:a17:903:41c3:b0:234:a469:62ef with SMTP id
 d9443c01a7336-23e39266851mr3385765ad.3.1752851434716; Fri, 18 Jul 2025
 08:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUV_NGd5R3=YdE9zg7HeBK1adhj_j7Kpp5-GhOMJLsXyWw@mail.gmail.com>
In-Reply-To: <CA+icZUV_NGd5R3=YdE9zg7HeBK1adhj_j7Kpp5-GhOMJLsXyWw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 18 Jul 2025 08:09:57 -0700
X-Gm-Features: Ac12FXz9DLvvjkB13z-hl0gN7YBt7i9Dqjzv7vwhSA3BSH-tccWajwEpiR3UqfQ
Message-ID: <CABCJKud+0ZkWM33EZv1uoP11aeKtdqJuv5wigoSO9P5p+LXZGQ@mail.gmail.com>
Subject: Re: [LLVM/Clang] Known issues with Linux v6.12.39 and CFI
To: sedat.dilek@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Thu, Jul 17, 2025 at 12:54=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> Hi LLVM/Clang folks,
>
> Hope you are well.
>
> Writing from a Windows host...
>
> So, Debian/trixie aka version 13 is FROZEN and will be released soon.
>
> I was using LLVM toolchains from kernel.org - my last Linux-kernel was
> version 6.12.11 compiled with LLVM-19.1.6 released 17-Dec-2024,
>
> Normally, I use Debian's kernel-config - modified to Clang-CFI and
> using mostly ZSTD settings where possible (ZRAM, (de)compress
> initramfs, etc.).
>
> Are there additional patches necessary - kernel-side - planning with
> v6.12.39 released some hours ago?

I'm not aware of KCFI regressions between v6.12.11 and v6.12.39, but
please file a bug if you run into any issues!

Sami
