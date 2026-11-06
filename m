Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927557;
	b=fbb0BlKm2+38fJsz6aalVsNp5Or0UuvbepO5lG9+CtncjO6M3wjTQEn/6ir1Hf1BBl/r
	 1lQEaFzM+fG/ak+DTcZByh2rKxXofNAmspUjUqHR7hy4D3+jaxXZny9MDi00bB1BlIa3K
	 SHFT+pDsyi8Qe4TiqbsLiEuNXbyU9VSsoM9i26qlFT/Dd2VoCEVxpDfk6hACrU2baMhsk
	 bHSf35O3hlQ1jtKYNRWrjL+cKwAXJqa5nJa9R+x4HvdRSYF7Emw6myAS/WV3CEk8CoIJM
	 CiWweYVlSW5oEtBr4sPak8Dgqq95aYdbD73+eA+mWxDPC2pZuPBShcjtPryQkQwFy0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
	b=eL9VxOu7chIsBn7e/dePS6aMGZdNlZVrayyJNSFXotOXmzvcypBalo2ML8Tgrw7dvPUf
	 it9WbbZWbuwQbPW88XSCTEMARTInjYEffEUvrTukPGs71mrE4AxFgsVyhfPRDH1mITZ20
	 2Gkf3mwFUOew1D/bLaO6QCeVMwe7HlZ/jKm0LE6d0E9iKi+V5rK6761deLju39iqCVp54
	 kS0PMtUCkAvNeErAQJhb+Jr30XIpZVljHFOPnEC8MBMSXM3eVcmsXv2RniV7lGNLowooM
	 c5HyyMwrWvLAZlAgw1eLXYV1LTCaPK2EfxnQz9UFniQlf2xdzsE5aFHY1X2YyrOGa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SJQlTzbf;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF865606A333
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 01:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF865606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SJQlTzbf
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed283cb5b9so7307185ad.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 17:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793927556; x=1794532356; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
        b=SJQlTzbffhS3tIgt/L+vCvb3HfHFCn2miC+u3MP4NaAlR61fi8drEIF3g2gUzeWs8e
         hA/V+QZJggaaa9I79MUq3SvyQ+m6TuBhYVLo1iHUEAHSs47vKmTm5vzYnisDtYVVBgcP
         A7YOj4Wft9G6QGotcQruFRXfpxkDq0P0ZL/gw9UPALYoGvT7YWdvAH/Hju/aVFAiQtFY
         dlcrd8rBqwrTKl6tF00f2pRqeOhWZjD07r9mwD1J+jF8+Mvy64aYgETp03VBpRiqfSFu
         0CJpwSZHpSoeu8YCRUgyytneK9IwgCG91S5HWmWoYYBmhK5lhMBl+509k2hpU35k0Pzd
         kVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927556; x=1794532356;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br8dhDWTMEC1IX0hIx4rLmHT+plyiVBiJUhQUy7wYRs=;
        b=i7qbHUJFLAv4UXPu9o9TsG54NUIx4uCUfCJfdSDgVB4708ASQpaHaroJ/32H6hD2Mu
         PqFocIBlUWO+ZP2XSr1jM6szvc9GF+VW0KbmvMju5ZU3mcbL1WRGj3hiIWe1wQxb2dqe
         tnYI0QKIEC83/x4ln+lVkOjO5tybOuD+1PhhV6R2m71OBRdZx8af4U/CwzPHao0lDe/y
         p6Yfi9YikUZL7yn+HiJFyCq6lN3yimYHvl9WPgJ73xH7O2YnOdg7m+nEcn0eQugMKwH2
         YYWuq5iuhNmVzYWSX4BoI5iXrH31n+9DypUdh6dcaSK9v9+xhZQ49VKF6Vw+DtRT016D
         FZcg==
X-Forwarded-Encrypted: i=1; AKwUvBxQsJl/8mi0usTSJwMPq7NWhU8iKwWUIczV9UzhvmDj7d0L8iCX7FdhqScSxKdXr4oz1vAY@lists.linux.dev
X-Gm-Message-State: APuU4Z+2VQvvrJw1soeKyC+F603DaHGZ7bX3mWm/zmy/YeFvz+dhDO5n
	W9qOl2ZL/tfaa1vukgAfrHjHt+TbxV/hLeiBCFWmk+aFl/TvVzd0Q8tC7qAgawuLMn2UMl1YD03
	UUzLcAHsn5j+/mIN3S85qMQ==
X-Received: from plbkh3.prod.google.com ([2002:a17:903:643:b0:2ed:27e1:d579])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf42:b0:2ed:520:2641 with SMTP id d9443c01a7336-2ed244ecb8emr32394355ad.31.1793927555492;
 Thu, 05 Nov 2026 17:12:35 -0800 (PST)
Date: Fri,  6 Nov 2026 01:12:33 +0000
In-Reply-To: <auxjJapQ4j8518aH@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261030121700.260975-1-jenhaochen@google.com>
 <auwR7gnuLsF0lpmG@google.com> <20261105103947.7521-1-jenhaochen@google.com> <auxjJapQ4j8518aH@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106011233.3270937-1-jenhaochen@google.com>
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, 
	liumartin@google.com, benwei@google.com, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On (26/11/05 20:09), Sergey Senozhatsky wrote:
> >    If we also mark obj_write() __always_inline alongside obj_malloc()
> >    and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
> >    those redundant operations across the fast path:
> >    - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
> >      retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
> >      obj_malloc() alone), shrinking zs_store() under AUTOFDO from
> >      3,144 B to 2,448 B (-22%).
> >    - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
> >      instructions per pair (~4.0-4.5% latency reduction).
> >    - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
> >      latency (-5.5% cycles) per pair, while keeping zs_store() slightly
> >      smaller (1,997 B -> 1,943 B).
> 
> Great, I'd love to see that in v2 commit message.
> 
> > Would you prefer that I send v2 rebased on top of [1] (including
> > __always_inline on obj_write()), or send v2 against current mm-new
> > first?
> 
> If it doesn't trouble you too much, can we finalize [1] first so then
> you can send your patch atop of it?  I can ping you when [1] is done.

Sounds good to me -- no trouble at all. Let's finalize [1] first, and
I'll send v2 on top of it (with __always_inline on obj_write() and the
benchmark numbers in the commit message) once [1] is ready. Thanks for
offering to ping!

Best,
Jenhao
