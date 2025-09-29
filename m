Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF81B87C0
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180223; cv=none; b=dA7i7s+xLn5TMW8rJ5AP/UG5JQRkggWzJs3WapUpZjl5YqhOhZP6Ee3dNb2lxhl/zl8Bu1oxMJXjVbC+7qtz9M0/uKnv1Dapr6eRZMBuHWZ+EFH3qwwh5p8wjsr0ukuMhJUB1yuDhTRvtq0MhnuaioRafe0YWP0PAeWLSfRPAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180223; c=relaxed/simple;
	bh=PnNLfDHqst5vd6hrb/TK0HQlW3cZh7E8xmcGWIkSs4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X35zcF3IOOPXzhiXm+64NaJJvwW1iuJXqQyueim7BV097lxRZ03d3tweBqBxLpFl1CKlRNteLrjla57gvaZhf+x3ZTGbpA5eyJu+ykVdP91oW2Utr3iaf2GPVRNRIvYSC/8ex8UMJilHxebxEFBUK3NK5GK/b3x3E4AFYWy4Ma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j59kdgcp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j59kdgcp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd1so7483218a12.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759180220; x=1759785020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnNLfDHqst5vd6hrb/TK0HQlW3cZh7E8xmcGWIkSs4U=;
        b=j59kdgcpBOkGuv5OA1tKTriagNbCcfKtjVSarr+psYfhjoooXHOdGyJrcmUIje31tT
         NnXeXls3CyX7MfGxyFyvqaW8JwdqXQu/srRW4D49LHyVxJjujcP6nX2V3RpcUj3h1Tjw
         Frr1nQI1M8O2iHhriR0OSX4oglG6/94l6MirCONafzp8lPhYZrvS9ZTDqsDQpxUgIcQT
         5pJzlrVL9mjUMkBeSrS8uDZNApvU86AWKekjetnYMYmBPFbQz6IAk7ed+NlpOw+sOFUh
         b20McEgIWxbIkL53SuigxHz1els0DDCz55Dm3BL/Ri5kPmgFBVUnGr7hCbRPw9/5jOll
         zBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759180220; x=1759785020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnNLfDHqst5vd6hrb/TK0HQlW3cZh7E8xmcGWIkSs4U=;
        b=dWvSN3snQiYrwBd2ng5qzPKUqdTlt1vRR2ZF6yRhmzlvRv/xg51rcoUg943HpMcune
         DLd8jY2R4mT06G0SCsgxjcHrx5sALtLDh8IQCy524eAw9HNfWTqPKq6b9cqplJQyegoy
         95DRW2ezbFO0jlRO9nc/Dzozrc5rfTHkhPLBVCS4KoZDuwI52gkP4Fdill5lWHvLVm9p
         stbY+23L9aqSt9aEq/B31SjS/PcDHGj6V/MhvwCGyChZQrcgGLtfS2uSjenFCoWeDwSD
         +2mu9tq2TBinqZG3ibWpwvqWbctfHmUf2OzkZrwPSDHORnU25jFI4YxYrxAuHlXqSqDq
         4N5g==
X-Forwarded-Encrypted: i=1; AJvYcCWNxBoPPFEXNNTFGUYDiogfY1s4psVqRfb3sgybHIu+5QyInbDdAHUOyK7T2KPn5S6W6mk+@lists.linux.dev
X-Gm-Message-State: AOJu0YwiRawgxgSifoYmJK4aA2ykPKb9ZwCdx8CSXg4Dgq/9zNvF/lQQ
	BwP9UXSD6EXtksTG5m+707Y9oo1zFuttyh6Ew96a+H1ZqbuO5zQXDDsJoz3PUQ7wBiv0xtPTztf
	VjGcpTleNMnybe7cEa5MGSI+fnKg+LpA=
X-Gm-Gg: ASbGncv+wNA/NnwwzybKygMtZzdvIO2xhYnJcUDxIdFJ7n9yMUqmuv8G/W0aZ9fGfhL
	RP8zUEjK1M/YOdJ0BrzXLRfZZS9GAUFXl1t21tz5HqpbyZFF4iDw0E1GEGvxUY/JoAhl6epOxIM
	hQWnqtCbrhF6MTqGgl3sD+SeVnPSvpC0b0CUeE4GlrWvCKLT6vf16/gtoFtgMDgShLzOpp84sXS
	1HjCPj+IONKsIsK30wd0mGJ3BKzotIKj+C9JoamZPYXnes7pu4f
X-Google-Smtp-Source: AGHT+IH6lV5eV1Kt4fx4PJQ/xnpUMkEAkksSmL0ApQf1NYE5kHd4rYc4X1ZnoqKFvlP4C5fI0NBai3/kdLcOSzqbyko=
X-Received: by 2002:a17:907:7289:b0:b43:5c22:7e62 with SMTP id
 a640c23a62f3a-b435c227f87mr12156466b.50.1759180220317; Mon, 29 Sep 2025
 14:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250929160230.36941-2-sidharthseela@gmail.com> <willemdebruijn.kernel.321e70874e73c@gmail.com>
In-Reply-To: <willemdebruijn.kernel.321e70874e73c@gmail.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 30 Sep 2025 02:40:08 +0530
X-Gm-Features: AS18NWCEmn2M-D5zHU0jlR919m1nzZwmzKwrlDEi5S-4Vw12GrNcqqXAq1DzRds
Message-ID: <CAJE-K+B0xssX5TCwxyUwGu=vGMR1u-7r-3wDiMvs4GnqCkYUqA@mail.gmail.com>
Subject: Re: [PATCH v2] net: Fix uninit character pointer and return values
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: antonio@openvpn.net, sd@queasysnail.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	kernelxing@tencent.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 11:28=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Reminder: use the net prefix: [PATCH net v2]
Oh I thought you meant me to change the subsytem in the subject.
Changing.

> My previous response accidentally left a state comment. The main
> feedback still held:
> This default case calls error() and exits the program, so this cannot
> happen.
Alright, I thought error() is like perror(). After checking man pages, the
status being non-zero leads to exit(). So yes, it makes sense now, the
switch case, either loads up a value in the 'reason' or exits().

> End the commit with the Signed-off-by block. Either move changelog
> above that, or below three (not two) dashes.
Alright, Thank you for taking the time to reply. Sending w/ changes.

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
