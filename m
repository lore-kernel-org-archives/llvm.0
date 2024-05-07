Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A251D524
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715053857; cv=none; b=toAMZsx+d1Iw7SGju2NHJKNk5QLOptvlsbh8TYQTr4Gh1pQG+D5qdXjjMMdRQamOiRNN5p0yh0x+9P74hYERSYg+Hv+Np465Nf4OWuqdO9S4uJyJW9w9bXGZRM6btyQE+jzfkjVTTU+qY2O4iPpJF8jXfTzHkA8hFKoJI4XPMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715053857; c=relaxed/simple;
	bh=xBh2sNvnxivKaTg/6xMQ1vH+J1//OY69+3MunvpWfkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bI7hwkTzcoDFxvdEfSNIS9nyLcVvugpFeN8yRAr3W+EQtgAj5z0UCffbWDKnP2VaPT/Lio090Jxeg+5CuaFlUe7uZghJ4MXitOw0i/VwQE5/1a5o+p7r8raRDkqdA85WKTOFJxXj47FlXGrv790ovIjoAJRzOv2CtQDswJX2WVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shsMHwbo; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shsMHwbo"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-47f03844ea3so699553137.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 20:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715053855; x=1715658655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBh2sNvnxivKaTg/6xMQ1vH+J1//OY69+3MunvpWfkA=;
        b=shsMHwbozw9nBmoJnnvlNRx0JaCxFoIs8ao01LRYfz4UHzR22ewxALtHcxfXeof95Q
         3yQvo9B2NlPqeOJdzQKav9lCNqYyadEIe4wHXhzHzoUbo0ITcQkVOAsZX/Y2ZASXBRuE
         WgVek3R0U7vxJGIwh4llW+Gb+bNK/voGUleulUEguD87Wc/LoUa3nzxASbL4YXoGqh1m
         7JshZZvNI83wU7EDgoTlAnAJfQ0kI0VApwPvCkxlqGj+UgJBFx+t493DqMFb9YLlWg/A
         AMXfIqqhg1SftbiUmecbEUNk7rKvNOfNNOwTyV8X9kNrtOqCUZCYU+CtkQI7x0fwk+1T
         rvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715053855; x=1715658655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBh2sNvnxivKaTg/6xMQ1vH+J1//OY69+3MunvpWfkA=;
        b=kr62VUYSkpvjbhDS9JwqeJhxf6UBo4Nao0LCTVbGp9mIS8hnzjoOgAbwyei1f1fMvo
         henkFthe3GIqycWGgxr3cGS3/NUgYgGCBGaJ4EBilzWQmM61AilObVWL/T8hMUCxecfG
         xguwv5MO+/E1nh7mZYZQIAi438H6oBxJkf20gpGzHbmijzAOpo2AZOYadsB1oFgRFY7/
         Qz7ABvk+DuJtLgbBuWXNTLFfspz3tccqeZ3xBX0AXccyGEZKomYwWl1XbNxW8GLrSzFZ
         JFFqfYI3VZfqZeF5kNZb/cKkImAhJLiPyCUNT7/qddGd7aNf3it1OlN/A47AcMM03ewQ
         msXg==
X-Forwarded-Encrypted: i=1; AJvYcCVV3b8BMWX+9souzzJgPu+4LhNJVvHAq4eA1/hBgNwDHK35BVqpXMpeCiSq+bKfH0fh/hIbCS9kRa4Nse8a/wWN0jflRw==
X-Gm-Message-State: AOJu0YzyKSWncRwTq+5BCFYUQTo5Q603TXEBRCNn4tQ9Sqtn6/wkgMyI
	V6W1/S0iM0RU0OMFiSeTvFg00jL9WY5jSHkPUzNoVHKXjx+8SJll8B/jhQoxuY3j7yUdxRX1UE4
	kUywYisjhHXz7IdtCaL3Y/eN9qHFWeFn/K4/3
X-Google-Smtp-Source: AGHT+IFb85IXhA5rUrJO0F2AvjpnYaPXIbrqw6PUpjJNLcgK3c9NShQZyPtn7iG7PO0YAoBSgrPP6/195qfMiOM9fxA=
X-Received: by 2002:a05:6102:244e:b0:47f:1f49:45d1 with SMTP id
 g14-20020a056102244e00b0047f1f4945d1mr4094840vss.17.1715053855075; Mon, 06
 May 2024 20:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-b4-sio-block-ioctl-v1-1-da535cc020dc@google.com>
In-Reply-To: <20240506-b4-sio-block-ioctl-v1-1-da535cc020dc@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 6 May 2024 20:50:43 -0700
Message-ID: <CAFhGd8oUjT3G7hvweWTtd3RLdQMBSjjVS6iHModQPf5VqU039w@mail.gmail.com>
Subject: Re: [PATCH] block/ioctl: use overflow helper for blkpg_partition fields
To: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:10=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
...
>
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang; It being re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
>
> Let's use check_add_overflow to check for overflow between p.start and
> p.length, as this method won't trigger a UBSAN splat.

Whoops, I got this wrong. The third argument is where the result of
the summation is stored. In an effort not to use a throwaway variable
during testing I just used the address of p.start, this is clearly
wrong. I've changed my approach in [v2].

[v2]: https://lore.kernel.org/all/20240507-b4-sio-block-ioctl-v2-1-e11113ae=
b10f@google.com/


Thanks
Justin
