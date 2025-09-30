Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475D2248A0
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238933; cv=none; b=WbqarQZsxCOpGXBg+GVK0478PdDjfjMlR1dmG7QrJUMP+Q7CYGttYab5NmtTsmEcOZZ0Xjb1CNYOcDFvDyX6d8FTqUaITqgmAmXc3L0pFcWQ9eohmQyJsfVdX7c3tVGtjMPsRcwj49cPWAUvJjjfcVq3iCxFsUIdVHoFGJOT4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238933; c=relaxed/simple;
	bh=5VfR0+ZpkXifBGlKA227sKAgFzJSeMlUIjsSH2QVw/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lb/JvGZXDz2fz/ByqoTuX3Tjro5PtI9++18ktWbVYTW14mwIv+0IFKQi7UClgfhPTAPmgckBgo7rHYd6VrjSpPZB6GXJhQ7LbUZfg3Zke3GpXBR3bHN5jdTR+5AT+WlOlVoRLEIN6TrIAg58lEeaJ2dyP3YPbQ6r3cvZxA6LSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApZs2UfM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApZs2UfM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4539dddd99so130590066b.1
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238930; x=1759843730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VfR0+ZpkXifBGlKA227sKAgFzJSeMlUIjsSH2QVw/c=;
        b=ApZs2UfME4sC04R8TzMEw5KcdMS7gOF0cV1aHpCpVo26lvdZ2+PGpIwH4tUoiAo+r6
         QDujlVBvoCGwaEiNN2pi0D1OnHWSipadciLlLACoKWcuS/69VMlUJyLT027nAYijFUdK
         w8+0Uvm6/waJuXl74QfZvs2m6z5j0kkoXim7oncvOl8EQXiqsWvuMI7/WCavvMWNudNc
         P+Fd7MiJ+jN3DMKHgbkI8s7QPG0MdMIGhvusqA3XLFh4WOEHpYVVtz/4VVDhUnjVW9+X
         Qm5hM/WVmUbD3qqKefzYKXrCN7bwllRrRPJNoX/LON+yxGGv1iarGq6y/smyGi+gnTPf
         4btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238930; x=1759843730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VfR0+ZpkXifBGlKA227sKAgFzJSeMlUIjsSH2QVw/c=;
        b=M0gN+P8sifn/NtA8l+9IwWotcw8V7a8oEvXUsmgQhsCO5bF5TbsX0JfL/K6oFyhHnS
         Pisz4H4cTe7TlP0wXfWdZ3S0syju5htQ0R6IgOG+zeBCDRL3dkziJFllIBKZsTDA7BM9
         c80BItemHyLmTlucENun0GdEEY3QBCWSVAHWmF2boOK9TE08SSKoXCHaglpcwPnCEq3N
         uOAEgkC5d+JLFCBVSAjWoddwHSVAv6i5wKr8vgL4eUQmsrr5P0u0oNEsZruCp6K/XdpN
         rQOJ6A/yWV25u/oJrnrKqiSvLkx2JZDCko6is9H0CI58jm/UbZEmcrt+IOEVGz8rdwSk
         1qWg==
X-Forwarded-Encrypted: i=1; AJvYcCWbYAJV3EIR864GSDY6pgaDoVIU1y65B2MQW+3QEOynHST9rfGYw9j8coPun2ryNejIW1Df@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp6Sv6FwLDVs05PNTLQpgaQ98IBG6+u5KSZ0xf3vyLp42St5kQ
	A52BCrWm2gp5yNGHm9FUYZj+OHGhLHYoz/PRRzjiGLMfd25w9hRiV7cR0FqMv1WaVdW3fvRZTbq
	p7HcgjKhytZU6muqvDCI+zWYlWqZXaIk=
X-Gm-Gg: ASbGncuVPjcrRaqFqReJ1lpAbrIkOo1SVf0lh1ry7vZt27zWO+mnWns2QXdyOIq4jmO
	tRd9UkywJ0Ap7SM15n3hxb0xQNi5Xj9jTIJ1Z57RvRmlw0EdY7h4KYuWDsJjS1O1n0kTvelQs2F
	ctg14P/ITl0GqPjwPJDWJhjZZqQzPd6A2YtbTy4O4knPVY3T+4/9o8ZX2+lsWtj33dXYKTlKD2t
	KohuBfxM9qcpbFZkwZbCg1/uMeG3J9qHP98deYpWAmYi9LG9iPvbH2bp3Gdx+j1XqyIymbsA9PM
X-Google-Smtp-Source: AGHT+IHaQVYd6ImpL5YTGVs15/2JsWNu+7AeBWUGR9qjk8XTSmLtzWaty3ikvQfPDC2IEaImvJGIcGSNpk+GMDcILok=
X-Received: by 2002:a17:907:7f0f:b0:aff:16eb:8b09 with SMTP id
 a640c23a62f3a-b34b6449b22mr1942736366b.5.1759238930230; Tue, 30 Sep 2025
 06:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250930120028.390405-1-sidharthseela@gmail.com> <willemdebruijn.kernel.30a447f86eaaa@gmail.com>
In-Reply-To: <willemdebruijn.kernel.30a447f86eaaa@gmail.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 30 Sep 2025 18:58:38 +0530
X-Gm-Features: AS18NWB4ZnK-hPHM15k8TTyVg96siZ4T3dlet_JRM5E66GuSMxv9aaJCvUWVRAM
Message-ID: <CAJE-K+BN8iAShdMkPUATbDD5pAgSrMUakst2+OzOvH3WkZWEfQ@mail.gmail.com>
Subject: Re: [PATCH net v5] selftest:net: Fix uninit return values
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: antonio@openvpn.net, sd@queasysnail.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	kernelxing@tencent.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 6:20=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
> Since it's now only to ovpn, better prefix, which matches other
> patches in that directory, is "selftest/net/ovpn:"

Alright, this makes sense.

> Btw, review the posting rules. Leave 24 hours between reposts:
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Thankyou for pointing me in the right direction.

> stray line
Ah, will remove in the next v6

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
