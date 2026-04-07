Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B20327C13
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591507; cv=pass; b=uT7ot5y0pKhfoRClJQpZ8ECq54nimFLDD1Pk/rYNsSdl1jg5/i+z0VYhbfIstBdiugp7qCmqXO65FMyMqRrEy+682a1Gilu57mej9kFKuID7V47tS2KdFsNg7BT1R2THPfzE7FBSgrfGN8Q9eht8mlbH4ex+qSytfA5AlsELdgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591507; c=relaxed/simple;
	bh=X70FbpmnI6Ee/UU0VRhiBVt6WUIUuF/wm+uiIHPlZbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cigHflXnfuDqjBtD5z3y9PhbREAyIXfnswL0KzUKIRClevwae99BSo7js1K1iN0/SW8BRdJAZz3i/iwPLOIAcE08379akJMp+Y9M1gtww1am30a1rfnfoCWpNg0LV2e+ryi5Y/JrIox/QrNTU4iSKteVF1dfbAxcNOXAZBw0D7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tNn6wsWH; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tNn6wsWH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so26835e9.0
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 12:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775591504; cv=none;
        d=google.com; s=arc-20240605;
        b=icQ9G+RrL8qo7i/YQY1CRYnQqEvzxwgq8ytc0dSFaSqf1FzsaX6jdo3RVLz7jIt5X2
         T5amQPloPGic+ddjw/l6fUS7X0UxaWnMKGLO9p/KEatheBWGxZUDwXl6Ar2aBi+W9Xpe
         tfwsKz+FcPDcuk+jVN865eXhmiKsZ2xXA7Fq8xkg36fHs/7TtqwL/2wuiMJ5Hjjz7qTQ
         Q/dGby4ZW26oERBTtYBPzC1tlxGSlyKGqP3zoYDQUvhHghVEgcoTiWDjt5e43Mf5XJX6
         uWTItssle0ESEaao8MBMh4MZWuc9hQE1RuVbNm6diUlHgcZ/bFZABYvPiT9EAGRoNgAv
         j93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        fh=ti2HHYwNKM08RH46Y1KRr5sHH7c0YJ9NVdfYRKdX/SQ=;
        b=bnGJWWmig5l5oc5HmSjY6rhEOSS7BSlEVWO9zT+0/WCfHbTTwmFGoVXz7DH1IJDYQH
         D1l0b5wPhFw1o5kqOSRL4SuFt2uQxQLWf86a9idPlgAPueSoMF+Dck1IGwQ/CwXTUeCs
         2Or6ELEnAoDAjCk3t4EoJiJNtEsNhnfqJWH2a8xkGZfZqg/Qj6Y8owHD44PoXg/0Q8XE
         VkCBavRe1drtV1QrnbyXYAh+9qhuuUxvj1oxzp+VeLQ1t/8ISHIrhtSs28pAX+4JUgzS
         XNZxaqBvp8jNuUmnr37X8VzEJnJzhAHoe21yNTSU29bdJEiFkSEKnc0vvLOyEse5E7lu
         m8fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775591504; x=1776196304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        b=tNn6wsWHLIECG3nmOtSUhR0PyfTj+5KxMWBpuoNMdDXgZQhGEyE0czw4v/vGc9InJ/
         94rOVAkJ11FGlmF1NuUBLBivnkKgDj03FBv2NimReKidux3sb/JKSGlTmEDQh4neSLmt
         hoc8zeuF6xjgEWkoFI1l+Pa9BedpfQ1O7FkuUTKjSySlep3OCTFfpp9EcGwuK180evBE
         HgBCPj6LCCbH8BIkMikIVhQ1QqYeTWyrRz1mr7l3k0I2pLoui+kdxkTeCXsAHO0toy1i
         K2CEeWkAKUOzeT0BUDm0Bx7JoHf+3TmvDLEPnp4LOqBOMlC5gish6p6+q9GCCDCo1DbV
         JuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591504; x=1776196304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        b=kurWkE9wILdH1pY37RoV7MI9QDxpVolNaTs69oNk0xnaRGU4TlBL1uWm9c6V4N+ZxU
         jGOefcaXUC3ErfkHyRd3kRccJB1Hp84/3RuNuOxhH4t4jvtuTHg3eJED0xF2HkQhUfOk
         kNXBTP+hJCBf+wGoBN4zvbKxQQzEBO03Ytik6q2w6IMaH3zKyuxnJ1+q5GdR70Sanxep
         J0nXId7pIZ4xouC9Kgq8pdb9zMS6VHdfy0UDJQhUFlsHPflbtU9wUhxGKNiFvGlDhcC0
         BLmeW2VRsaWHKoaQufI+Iv/COZhwYmbmCgW9D8NNFhGfmkx9Vs+eBMQ/34bYnZ4tIT/q
         Pgxw==
X-Forwarded-Encrypted: i=1; AJvYcCUqVy4spRVBZEC5ct5o6mSizYSCL4xF93JWBvTngDByMqrWn/ihq+tdy9qCLyWZ4YpbPVAF@lists.linux.dev
X-Gm-Message-State: AOJu0YwGwe+rM1XYZsFh1ed11XdGNUktnHvOwHtmmmzQZfmCc4jbYnze
	wJTmhkeb+hmBBEyMj+Nvh9dpz4URI6nKBdbGJaE2mE8R5QaH1a+0xzwPYR+w3TK8/8H9wYUWlSi
	rIxUCNQvdxsork7t/LES1Csnut8knsq3v5lQKsSTp
X-Gm-Gg: AeBDieuQ5/Rn7E7sVtuKHQAsKYd/M5pzuHGsuNe+Bvn6Os79l9RxFiRglqG+c9st9Nk
	T6qwTyQOIo3RwumtQ76CZMrf6NJMg0oyekKHtJy/IdqfMzSsfqCmjcWW5I/OiZdxyvMY3HO3tUY
	c6bFWLFi+RJ8Ip9XBm8xGGC07p197xpPfJaA6R1hyeIzG15CA2a5CGc+xbJvr4qbL9Ix8T7D1Ym
	ixYD6dOKArPtI+F0CPQ+UhMPnBAiOJr+xcH+LDT6uWpPXVvhsLqycTT62W4zW33u+Myss1vJkbv
	tmqx8UH95N/0qT65ZCG/ZYSr6MDdiFOfKRnQdA==
X-Received: by 2002:a05:600c:47d5:b0:477:255c:bea8 with SMTP id
 5b1f17b1804b1-4889bf61f64mr3217875e9.7.1775591503327; Tue, 07 Apr 2026
 12:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
In-Reply-To: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 7 Apr 2026 12:51:06 -0700
X-Gm-Features: AQROBzA8MspFFJKveCX0uZI0sP4vGpqImipYGDUPt-LZvJCZDd-1gIOBDFh3djA
Message-ID: <CABCJKufNJBgdfuJwCV1z9m1P4bi5DgcpMnguyuTsDQGfjUPqhA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Define __riscv_copy_{,vec_}{words,bytes}_unaligned()
 using SYM_TYPED_FUNC_START
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Mon, Apr 6, 2026 at 4:26=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
> reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
> check_vector_unaligned_access()"), there are CFI failure when booting
> kernels with CONFIG_CFI=3Dy:
>
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_una=
ligned+0x0/0x50; expected type: ...)
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words=
_unaligned+0x0/0x24; expected type: ...)
>
> The __riscv_copy_*_unaligned() functions are now called indirectly but
> they are not defined with SYM_TYPED_FUNC_START, which is required for
> assembly functions called indirectly from C to pass CFI checking. Switch
> to SYM_TYPED_FUNC_START to clear up the CFI failures.
>
> Fixes: 67bdd7b01387 ("riscv: Split out measure_cycles() for reuse")
> Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unali=
gned_access()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/kernel/copy-unaligned.S     | 5 +++--
>  arch/riscv/kernel/vec-copy-unaligned.S | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Looks good to me. Thanks for testing this configuration!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
