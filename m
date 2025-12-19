Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB107324B1D
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144705; cv=none; b=O4IlLY050a6qeG/0AyzBdb9qTDqa+4+qB58/mEMADnoH6lvfC+F0JPXf4Y7tL9XqeZYKNXq+ikfHzWV7qsHs8MMVnOzQJCal+/kdU4JLOJ5qp0vLrsNchVRCV7I1AphI+odhespGstAwWNZfpnLHoSKZ19QnVtgZbWuQsWKy0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144705; c=relaxed/simple;
	bh=ID4bQttFA8zqpsS/5nate7mn+oSQSb0sOs7DFgvHVT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OMqCEB6EggyPe2Bp+d06MyikTkAZTU8dcXEpuIKCujf3kITTAc4DFD8ma46YDeTKHxPSP7RfDcvaFLM/7UCrISIjiq8O6gaTVinHFBi7tLPqCtAXPZCB2n1yKeEfaRTw13/ZCVSBWMMMgBHbHwQu1++zc+g+EMczh3yUwaBWuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DYslSJJW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DYslSJJW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477964c22e0so12865775e9.0
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 03:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766144702; x=1766749502; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BA99OQkf8fASdQggxqsaHMpRUroLp5LCxZSxzPBRDSg=;
        b=DYslSJJWdB+BSuSTSWDcNybvKS2mgLfakFcs6lW84ZdIL0bHTAh81bngMcwaEfsjLz
         +cTz8UJKT7proBYgKyV/49m3B0R9yqwaS9yKuE0Q5rKrEKP0xmeTyFPFzQjYnPorQ52K
         Nn3+wt1IbIo1V8R8fHeMLaZ/7n5hOvUXaisOwmsi/Bmui1NM9f/HT16fkI+ckb87jCD2
         K4ugYNNQXjuT0KstpXQNLLkQ13PUayAInsy9W6EDnofP13Z6+hj/Dq8fCKlbw0QC+Phf
         nmd1YN+Rua2kxftJ2OvFGmLr42YYE03MYbLtg5Wo3T91yN8MfYonU2BAW8mxDgpO5VnN
         yAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144702; x=1766749502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BA99OQkf8fASdQggxqsaHMpRUroLp5LCxZSxzPBRDSg=;
        b=eU3HP7boa7Y1XhwFEPE58NlWpV/2G6hIonhczTc/gdQGjKD6aZk7Tc/X7ExfpWhqBv
         vGnMHYJKhsOjrYYheEgGmky/CvdDbO0hbhY0JiT/8gjHSIDx7+ZAs/jGnHE+JGBhUejA
         hIGGEvlHA76xd11fAfyXLxkZzCA5Tg5RCHz5tpZgJAi4LDsnpUfrdspUq1X7esutGJPh
         Sx6CqkX0XXFsdG5181BdDZpTW/IZ2sXdeuGkQ8kqX4KBS8ndT62CPDnWEgaq6fb41bVg
         qTxP6OkTose5EovRJGGLxfjs3+x6ccyqs3TPtEvpEYiXIo9FSV70+2ytKUSZTVbaJ6Dm
         zr3w==
X-Forwarded-Encrypted: i=1; AJvYcCWBMwRFgub5YlkVxsmXBupkYx442FbKuqumMEFpmxqoQZofJZ1FIoZz7gdgdaKiSVLijmsX@lists.linux.dev
X-Gm-Message-State: AOJu0YyPpKmxOcPbTHOERbP7sRBPJwOrXHc9M7HxI98wv4kQrNbrtj4i
	uY8YboQsciOq7LEY+osIxSPjx759cpVfGD9jO6P8jK/aFWrlNgcq8b4TTSdrXpvr52hdKVHCsRl
	ReR55j8LazwTjqQ==
X-Google-Smtp-Source: AGHT+IGtc7uhO57hf3FfKwyr39SXu+GjbYT//uhiOsPmrmuqZlo5zaUrtT9fGuX38gwDNjbsBjrG15h9xjaYqw==
X-Received: from wmik22.prod.google.com ([2002:a7b:c416:0:b0:47b:e2d9:2e56])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr25540095e9.14.1766144702311;
 Fri, 19 Dec 2025 03:45:02 -0800 (PST)
Date: Fri, 19 Dec 2025 11:45:01 +0000
In-Reply-To: <20251218092439.GL3707891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
 <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>
 <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
 <DF0JIYFQGFCP.9RDI8V58PFNH@google.com> <20251218092439.GL3707891@noisy.programming.kicks-ass.net>
X-Mailer: aerc 0.21.0
Message-ID: <DF261MXQUYYU.130N0WZE4DP4U@google.com>
Subject: Re: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs __always_inline
From: Brendan Jackman <jackmanb@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Brendan Jackman <jackmanb@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, <kasan-dev@googlegroups.com>, 
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

>> 
>> So in the meantime what's the cleanest fix? Going straight to the arch_*
>> calls from SEV seems pretty yucky in its own right.
>
> This is what I would do (and have done in the past):
>
>  14d3b376b6c3 ("x86/entry, cpumask: Provide non-instrumented variant of cpu_is_offline()")
>  f5c54f77b07b ("cpumask: Add a x86-specific cpumask_clear_cpu() helper")

OK, let's do it this way then.


>> > For the short term, we could avoid this by using arch___set_bit()
>
> arch_set_bit(), right?

I don't think so. Currently the GHCB accessors ar using __set_bit() i.e.
the non-atomic version. Am I missing something?
