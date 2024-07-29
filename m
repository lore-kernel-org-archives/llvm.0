Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E918D4B5
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722290115; cv=none; b=DjWgKKWDMk+UNDwDSZNmNGxOg+ekXMwdbhyeJMMLu11F2UtBa0ml3d7B1s0bXcbj1Z/s0tJ636Xsvhn0DMBNomR/93hKqm2Yytv+siLBjC0Z2iaHhXS29tF4zt2xkzFA3+5tigbiAE8/ZhEA/w5fGHF9rC6B4EVMTTtyV2SWt00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722290115; c=relaxed/simple;
	bh=vKZzxme3+8GRc4j+6Hu52+kqUU1i1p5BUMeAGAdHVTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3jRT3Z/Rd0LUE1573Gx+4S67wQIIl09/KKY43XjZnl3zf8Xa0EheSTK4ssclIpxEhZvdvntGrc9yIbP5sQpE18fJwgsU7av6c4y8gixS1JCwAjYbTm545lY+/Nt1cqCgpdn9EvqLaWs2DHe7aUdaltuKarvjQTJ5aDYIUFOrJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7HOx9tF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7HOx9tF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb4b7fef4aso2933587a91.0
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722290113; x=1722894913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKZzxme3+8GRc4j+6Hu52+kqUU1i1p5BUMeAGAdHVTQ=;
        b=B7HOx9tFwhMRTUVoN3HgPOkRnbJtDAOmBzqyH/jIznGLv2TRFfGG5GLG8Ft2HN8qCF
         KhWTuhLIiCb/nycikL+IWctj/njmW77OjknRuWxcQ8NDLylsa1bcuW2cwIwNPSix/P95
         138K+fBuNguCu9D5VBf6l6pFfueWq3Yr93eB2O7QZoK/8HDSrmdpeqFKURASalgqlJJp
         n39dnvs5XTfgx5mXilCl/LQ2XRdE7cQ8HZyArU3TnP+jegmOCxNomYot0EJawhemTjVF
         htuERxS5hvnbKqy/Rw8td6G4oVXh4NSg2caSTn95ZVuehYYCy5E6IZ8juAos0/vEat4I
         wI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722290113; x=1722894913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKZzxme3+8GRc4j+6Hu52+kqUU1i1p5BUMeAGAdHVTQ=;
        b=Iqnz7EdEhL1RU6Dr+DPtyX06tPLROVtmtq0lUJtf35o2VBNkwtF2huDacjr8HmNbC9
         8c1rTOqTA3Wpvs/0iGGpLctsRTfzdjn3EZMOmyW530cpOgZulqfKX3JqlZYj63zlkHpv
         Tx7FRais0RtLjBHfATy6Eq9CuHLrvrg46qU6pHpsh2VgZaN3SdOiblogU/CM72o0BPW9
         bFRhSkfWILCQs+GGPJtaencFhTRDwC0iUInJBWzv1HacXB8d2KlRzx/km8hwCopdTvT1
         hs9SS7whHRtVZElBNMy6bisuVQ2rRmuXeK9hpx3XhJKd4SY7jYg36rtIcckkI8MLCYAp
         jzwA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QqCOldeZAnp7espGoFzR3FzmyZCers6QAgNfdgGhX2j/8BT/yjctsfzFKrp+RHM9PDwRYgajbIGz29a7G1SRxGDgwQ==
X-Gm-Message-State: AOJu0YzL53/PKeEzMtChoNJa4xZwlyvnCb0FVTPHBlTxyOkIZAWs+3Zu
	M7iNLQrfbeFcklv6ms9z0fKp3rNiEI43F9plINOr5YBb1lOYz5BeMdqUz799Z1NeWzyR6J3evA8
	nX13/YOyDxhe6QblLyHVwiSYZpqcG4g==
X-Google-Smtp-Source: AGHT+IFxBK99aCFy4PO2Zss0YefeIvqtS1n+5cL3OOdIrhSWftr3LBt+eUy0+Uzc4K4AHH4waY6piMSJxnb6Es9e168=
X-Received: by 2002:a17:90a:5d8c:b0:2ca:a625:f9e9 with SMTP id
 98e67ed59e1d1-2cf7e841c2amr10454711a91.42.1722290113210; Mon, 29 Jul 2024
 14:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
 <CANiq72kFpS5BE7Ea8=Z6SUi_Y2RAt5wsssHyqL3ocgR1UOHJMg@mail.gmail.com> <17e81b06-7778-44f4-94cd-6a2b1fe5c7e0@gmail.com>
In-Reply-To: <17e81b06-7778-44f4-94cd-6a2b1fe5c7e0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jul 2024 23:55:01 +0200
Message-ID: <CANiq72mByZfV62bXkd366GNX1ReF92=rUf9Dyh165Ce+Wc3F2Q@mail.gmail.com>
Subject: Re: [PATCH] clang-format: Update with v6.11-rc1's `for_each` macro list
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:39=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> A quick test threw 326 extra macros that are defined in internal headers
> under drivers/ and arch/. Including internal headers would remove the
> need to update the list if a macro is moved from inlcude/ to an internal
> header, but the list will need to be updated much more often.

There would be more changes in each iteration (which is why we avoided
scanning everything in the beginning), but currently it is
best-effort. If nowadays there are subsystems that want to start
considering soft-enforcing `clang-format` and that is why they need
them updated as soon as possible, then we should discuss other
alternatives (please let me know if that is the case!).

For instance, we could try to somehow divide the list into individual
subsystems, so that they control it and can perform the updates at the
same time in their commits as needed.

Anyway, for the time being, we should avoid editing the list "manually".

Cheers,
Miguel
