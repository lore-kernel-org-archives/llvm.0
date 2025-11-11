Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A02EBBAF
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853993; cv=none; b=hQvkQpTVikxKDRsYPv7fU5CdHKGkoD595YE40tH6qbmWXubgyt+VoqLvVYzbhus8hAI+fJi6Ou+JDS0fxOdrCS6ktV+mIxkFGVrCtZcBxgEa8QLN1/uYA2MxCGlHoFy68zqZGRxrVLvuezBUWRAJSeE06+WYeUQU0Gsc9k3wb7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853993; c=relaxed/simple;
	bh=0qHk353sMNXNO0DfdJ24OLoqMz+VA+2bTVAiXM7RnOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=filji4bUA57TPLTXTpRgxskaLbNqP3lw9sUJHl9dQlpFntXb3PLf7FzQyjD5e/RFAD0w/HcAb9Sdtg37l2PkXcWhXHqmp5Y3RQRgIP4bSNuRNw5CQeBnpZ5tZd5VBQGBqUwwIcc/eFxw6e/KVr0JcPTQ6hiEjhc3/oPCAne5TIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJtGSZnt; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJtGSZnt"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340e525487eso2701309a91.3
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853991; x=1763458791; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x27CBOBuvs19lllL/4Ne+a54Yz+5/uzP3YpUzWY+JnY=;
        b=PJtGSZnt+8dmV6+pX2NA5JcuyRDWZuPCls/uqTnloKyLfjZs5ChILrKLZE50LCwRkO
         a5p9gU2k0FD9Yr56UwM1kkycxG7QZZgPdWPlBTA8wUmtcP4ZPCyIGbYE3KyrXjYtNCGx
         GdLtEfqHVqJK86HDnBrZr9qvh5Ye2w2oqKCtO6aop3nP/kv/m4Q2bF58/vqo/2cMoHjb
         UY52iukP9dSz/Xf34hcpdDMEnbjeagvTvemFffTxvSYLSIDojKlOYhIlN6uoGeDG2Jn5
         eXLSc+XHeRptEnXu3t3/SwMM0REdrMG4dmoKRGJW0P/47NOpsQClLHDpUC02xrC5vNEw
         gLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853991; x=1763458791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x27CBOBuvs19lllL/4Ne+a54Yz+5/uzP3YpUzWY+JnY=;
        b=dSRa59L0OwBeFrgeUZKxk+kCngr2duaqxpk+V8wm1eZgWQfiwQi2mmy36ffU6pCcF3
         fLM8iW+DhSrgHM6cj9pjzVZ40K+PiqZvSNmeYRnZXKEo3NgMODjc/7Co5w/sL6yL744F
         bAlLzoBiHZgvgiJw9Eq9Nk6yTzojxItlUJpK6iwpGepr4L3qTZ8bbYZ8hzy+AjDihQEz
         73xGFi1dwByjoN8Glhn8gaJPkYv2f7gSzsMa9br0PDA9wSk/JmsqQGNKqCaWuV9tMty5
         WN/pCQSpy2JZF+BR0PdvhnUKi/9Zh10bAT2FfVVAb1AMotVWXj5tGbGBSrVeYIMsk7V9
         FRVg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Gh2L0pKcK+wHbhH8m9TudCLb1ADwBc/uaXizeWPDpuSQPJ/69NUwV+GY97EMpxOhYRZq@lists.linux.dev
X-Gm-Message-State: AOJu0YzUC1a+NPlMqCwLL2+s/I4oBLaEReeWp2o9jNxV5HtLVy5gcfRL
	IXdQ00nGyTRXcXTWT3FkkdsVUpo2PRaJOchdL2nqGrOZz1xkXXxEEifnElj0sMBEsZH4gOSP7B5
	Gn8dMDZhMNgnnYNc5tkgNsEZsrPPvkF2SHkV3nJTg
X-Gm-Gg: ASbGnctScJIUmo9aa8si0wUTsrBal986FJ3PqMu76SJhDO9rLgIdL7aFL1QWEnIA+Eh
	u/1USpbr9a5HsPvOXRh2D6qrHknZB6RujnW1HUhXc88RofHvhAxSgJ5PPAwz6u/Y9jA5Gx8Vg9p
	CLlWrD7PxBCvnr7reNVmLKJG3+WDXW8P0YiNCprFfrAtkB+MBlCnU5jvp41u+DSy7nAB9fanW0r
	iCy4nhH/Mnlbw0Sefk7GnOaeKoK3mhNZpSUpVid4xI3hiuHmTRsOTMUKf81ufjmywzm136Eqtz2
	7t2mt+n4/TJPDH0q4tY42tC1q3C7S/sEqcdN
X-Google-Smtp-Source: AGHT+IHbYtcp4TEm3YWuggGsZDtmzQmO+Esj4ot5UyBq5O3ykfRy1t7VIIRByVPx+YeUvhQm6/mmmHJjCQ5y0jFctOY=
X-Received: by 2002:a17:90b:2f8b:b0:340:ad5e:c9 with SMTP id
 98e67ed59e1d1-3436cb9f0a4mr17438597a91.16.1762853990547; Tue, 11 Nov 2025
 01:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:39:12 +0100
X-Gm-Features: AWmQ_bn-DpseVZlfA_JkC1KeMe_i9gWzENoYdJOcpoJ15BxyTxVZhbSiKbweC94
Message-ID: <CAG_fn=XyQ5Mc_ZvsibN4K0r70xfDAkhPqUJgtojVRcgTt-q0WQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index b00849ea8ffd..952ade776e51 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -61,8 +61,14 @@ int kasan_populate_early_shadow(const void *shadow_start,
>  #ifndef kasan_mem_to_shadow
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
> -       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> -               + KASAN_SHADOW_OFFSET;
> +       void *scaled;
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
> +       else
> +               scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
> +
> +       return KASAN_SHADOW_OFFSET + scaled;
>  }
>  #endif

As Marco pointed out, this part is reverted in Patch 17. Any reason to do that?
