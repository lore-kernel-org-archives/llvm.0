Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794542325;
	b=ElirUbEyI2xC3VCQCrCw/YSZ52Cjgtbh8JyeQVK5sXBgjcKErptEaWIsDPEIP+oseNZi
	 gdMGUWqrmVfWy5bXZYihibGq5ditqnSmQd1BDXBGpfn7D5+DIEkqMFexrULx+4u7tozKv
	 DNt5OxgO/3MsmPkh5IyGnWSKFj8WYynfzbdRtOB9eVH2Qc6HQqvPOmmoqlI5xofccPCta
	 uBnguwo3UVqea+Tkxxrf1MWnM97P79iH3rbRj6tpWxhymY0RWP+ePoY9Rv/eKAe1+FLke
	 zjhHZ90qf4wR14zsN64zmVqFHySU76Shnka3YMeOfDI1nyrj+dZ5VIgeosvPYczsUZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
	b=szbEaYt2c2+rlrTLbeKoA1mCIBMQ5M21XZInVAUEU10UZmhi5v+raLzsku8sagofD7/p
	 hh4C1724SaQnbhfBONgJNrk2bDL+aQ9L+4JNvyd2iu7kbVd8fWoyBY5M4fzNewQ4X+yE3
	 9rQQYogyILW5+vYVUZLj6cGF7rEvusCphCqLAXkO7NYOVGGNf+k5qY4e/ZZ+C3SeO1Y04
	 77y2+TnIsR/F/Vxr8yLGhwbF2Gep9vzZzvMZX5xBpeicsrg8M4oiBm8IwCa43aBJw5pII
	 g24ZGDnuLSMT6lmu5q0S2Rf5SpF0RYR3IH8LNr5wLqTa1Y7YnENzgB2NSWPOWo3mAqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkNp4eBQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161A606A321
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 03:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A161A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkNp4eBQ
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b32daac9d7so4369627b3.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 19:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794542324; cv=none;
        d=google.com; s=arc-20260327;
        b=sgyX07JEga/gyAAIGO6evhRGNaRJOVt3Z8IagxbOQXGQwrRJi3W2UQMibbCS+VJ1vl
         fOspkmGS//MzQ+xb5EKdH15e6/i88LadORzyF/A3NYecEvvPIT/45Ctkb25kVsCb6stE
         n75lg5dHtuFnNSiK9FDvuJVkYTTKLvBmkSziHjfT2hVYuiQCRtRvI0QPxhNULioCGS8y
         bzr15L3DEM7bCQkVdQhoDxBQPi9/1zyA5YLU1lpI3HhTgGgqERMdC0aXNsb8vQsA++0W
         SXY5I9Pjvq+mmAyx2u7xMF3Oqr6ImUo7k04Su4ZqlB2oGlBPnSaHuX2XbZvvFcbuMFHD
         LcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        fh=x2RzXaqOuT7MZsyQBj276ZP0TbQzAXtrPpXF+nCTn28=;
        b=dHMLcD43gSQmfIniLb4V9HKPk6UvizWOZQE6PkRAsFIc2gpTUoMij/ZUKVLqF9A67T
         OS1Dr7b2Jnw/RLDt32qzHbQ0XobYrWt8OsVXbNZ1AFufUTWXkgwKWPta/oEqtVjcbHE7
         GIPr1kDHUXfrcAWZrxX1dBRnG6LjVG+DsgTm47vfpzc0DOfrpDEtDgk0GcY1H0BZDt4N
         aGRcLh7q5WmSR+9OdHHMbdk4idgV23F6QLgnOVcC/VJZ/vZuerPfNtusI/dxRmNOZ4Xk
         AZ6Bq40abGfIH70MSd3aW91deXAE6z0fPCNExZdV+ugOLQrgD7vWlrE2J8OgjvO/BzwX
         f8xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542324; x=1795147124; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        b=QkNp4eBQOLQ56wI2hjWKnpTE4zLUse34bAxQ4CcUl9uacrLCS8ivk5c5kRQtUW0APd
         pUXKMoUgD+ApjiR2IbBbjYk5i4xEbLQ9jn9UfYdJOauHsXt02ck9KlnJMgqGJEk1byGh
         fVS8iEDeYi8d6d0FKuxPdHaYhEyqgWpqXQj0AQ63qypdgEbKvefk4j1nSWpdkg2T4/p6
         xVEi6I8OuUXzFdfpJGxdhgQBIRX4bE/x2MQFL+QPnVGB4y4tGflm4dQVkVjLLe1aslsg
         wN+thvoueKqbHeYDMd5Hb5a6opoISKEamG7QudICZj9u4gTNSZ9kvI+ZeHhZ9afggLX6
         jCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542324; x=1795147124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        b=WrwngxrLqBX2SyEv5n3zPjiH2ctf6SgF3WlZuVTlw6zLICxd/w0whOygS1aS7+pUSI
         Acf3kHJpy1U3gnxoUYYSebp3COvgxqP6b9AmyalWtuLeLcXspwRMQ56Cz590uTiKHNDW
         YULQn44tG45LQCkkRCYeWuIxZhXeOQNzpUy/8fN1HQ4Bf2wHJrvf2EvU4fEwBgkT3DWY
         diYXZsPqMy22tyIj6lOo67C6cuYzh3NU8umJS+JmRzqSPulgNDuZ7JN07gZ9jXh4ovwt
         X1lk3mADQsZPtKAYkAuZdJXxsUHFgm22NSKZ3UZzChmqYiLtFNZD3Gpqw0XIHv26jLKG
         lcsA==
X-Forwarded-Encrypted: i=1; AL+hErFEzzEIfWI04PsWOTTJ8CD4m4UL+iUT/yaoRPEx3SjIyUsX5VZztSB/EYayNVU7bmk4jrKn@lists.linux.dev
X-Gm-Message-State: APuU4Z/tepJ2uG9BOQr/P22ItMhF0xRPiCVy6cSlF2dAK0WPs7n+F8xg
	YXzoBwIA6xXoUmy55ypw52K6i7lt9RP88aEsFYoLqS2bGPaaWCYj+aZE5p7pGonjVf0jSuRvlla
	EOqEaGth4wT7HsUalSL7eSupjveJuI3o=
X-Gm-Gg: AYBFou0BoFX6A6+jV5vl4XVfC+jYuDUcAYf++xxJlQF+HRlxr7hn7YA41IOrHbAwptF
	Nexj3Irl+w/H8eY6Iuhaw0nZ4Eo/7OlZ8rB8lTHImSZZbL3KZNNqpDW1CtIH4KFO8s0ag/jX9bK
	hs3Y4HKeD++PHqMCroEnsZL6H0YIecXxPc8gw/0CuTO85Iwqj1hDtBozCVmVdYi0+NXt8Y3UP8D
	hk2yK4bSTuhZZ8mpGgjTxf/WwH+LO1hiv3miAHCM6AR2NUUPx9iMDq5DE+g8u9Arvz9+suN1SSP
	KH/HdAobXd8Bsh9RDUcykgoImOXMElAlw7AP0XZ7oBFwGV1yQ7I/Zk2N/tcv5ajDRTH+Dw/bH6U
	ErXTAkGiVFY3sceBCHKq7aKXPSg7kalTKZ0JxOA==
X-Received: by 2002:a05:690c:4990:b0:8b3:b31a:203c with SMTP id
 00721157ae682-8b3bb1dd781mr31064937b3.19.1794542323529; Thu, 12 Nov 2026
 19:58:43 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com> <avZ9Ku61M8z-2axF@jpoimboe>
In-Reply-To: <avZ9Ku61M8z-2axF@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 11:58:31 +0800
X-Gm-Features: AclHuK9vVOZUj5qgELVIIKNjLnGByl8-yGoOG5ihuzJR5hbFOyoI5OJEqSJb2Os
Message-ID: <CAKL4jwXA4OBVLFGAP4DWw6i9d5bneU=Ur=D58FnrssOt7ygm6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I understand the concern about readability. Since English is not my
native language, I drafted the content myself and used AI to help with
the English writing before reviewing and sending it out. I'll keep the
information density in mind going forward.

Just to clarify the background: this design comes from my practical work
on userspace livepatch, and v1/v2 were meant to present the two
layers of that design as a whole. While dealing with LTO in practice, I
ran into many recurring correlation issues, so I tried to abstract and
model the problem systematically rather than hunting for corner cases,
and I brought that modeling process into this review.

As noted in the RFC, this patchset is intended to validate the
feasibility of the approach. I wanted feedback on the overall design
before deciding whether to take it further.

Thanks for taking the time to review and share your thoughts.

Longjun
