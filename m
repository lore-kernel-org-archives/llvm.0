Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D941DF75D
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771198828; cv=none; b=e0Vn3K26O4Vm/JIBH9PxZDG/jQMzMEU3HimuyOkJFEQy+PQLvgrokploDMY+WfqMa6bGhxZxbum1YBG0pEVgQ+8/1M+pTBf8QE3DzzEGvpMwuUPs1ed5J73unirYHJuAA9mOqWZ8JFpCHj2e2FP2cMqGDCnuHpkMfId8AQzgtUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771198828; c=relaxed/simple;
	bh=Uf6V8yhQc1e2KXT6cHyonL8nLVvfR9sCuG0Fc6gk7VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cY9IK6wgLHk+TvNsWmwDN+wHvHh2vBboQvBgztDREGzMVg58RrK5dusiI15lO8dC9czqbYW/KwsIz3BuEUEHolzXQ/WJPMcF1SCToIbx5Lne7CHYjKzdlUKLqxFlZiCCf4OUTu+Sx/P8ZNvlBUjkA2fEL5VW8d4Z7vJvMlr728g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VNTwJBXt; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VNTwJBXt"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b884d5c787bso344294966b.0
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 15:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771198825; x=1771803625; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6NwBIQ7eXVw+znH9rMDvom5IKc0tLlzEwcR2BJoXeg=;
        b=VNTwJBXticnH7GPSwsAl2zvl5s/yfyJlrVqVx+z7N8iU+ewuFYOoznhD1gh7GO8JXJ
         uVGVWKZ1rG8uFtUW2m4Lteb/WPV3MXNB3kG/eCDZgDf4BvtJxtkRhYcLMlqanZER/yhE
         iak7yHLTyhShh1zqi2r5YXZ/nrRPEMjwstSno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771198825; x=1771803625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6NwBIQ7eXVw+znH9rMDvom5IKc0tLlzEwcR2BJoXeg=;
        b=rhMUlhsMmnWrBpjZj3N3ngbdZpGFVxLEJ8Nau9GwrE6abV/INMorG5SgoaiL96+RL0
         rd2UiAmoC/DEOjXUoA/zz/qMNN4yxBNcgXtYNt/CVbbL/qsiFq8u5xJZNo//+k65PftB
         44C3TcJ3D/3A6wAjV00EgswTDQmxscVuHCLFIDyjbhltSnBVWlBVppeOwTyQos59QjsF
         MyVFRu4B1At85R3w+ZJ0FlmcOYbHFcVmqIez7WBvdmrC5bmFhdD9S6Ge0oGHQPlG/IDt
         abxrujDEMNaoeqpzYc8F2j1sntjtTyZX/DPceU/53Gf9+0gr8CtSGmaUO6qdRRApK+Ps
         +DGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGIrwkANwy2DDvdWTLVVV2I62A72ZI3N4uFKoE6u50xUVwCmLTg1O4pFeaXaWd5p2Sn46+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz37ehmuxfuI1uOD4WINfquToDw8c7U5qlr7V0B6F2wg4oV615W
	5rlVgKEJWDNJaDwhiBIJ6XCde3hNV4e/r7Ehtbfl/gnYjpu218gZ8KyFyTCAGIGDmZ7MXhAQlmi
	tCrrKM9oQyw==
X-Gm-Gg: AZuq6aI6r80YfwU18wOTPbJ1FUz9zc0ZhCCjF7FhJFp/yZSEfZxwghKNcs2ZzmDLUbi
	nRTF9LhbHnUFUizYCJun9QfOkFyZWriWCUVYHpfmOxg2Sy6jUVdryqye2LWiH7f7Rgm+h0SbSKn
	WazvUtC3BzRL2h6o2PKZBH+DbvL3q6yE0AiyapjqdrVBqDaEz/5oe0oOHTXUjp+9594cEbxmlvZ
	HXmjC4aMxxeQASDU/UkPnKn5lPUnfq0Wm+AZO4nE6YQIZMI94A+qKtdGTY2frAYURlCi47RwNxP
	fTYsPnKQT9KtZ2wCvGdZpYz8HQAaKe0rqYv1AZqklEfhOcT5Q+eGnZD/ELDJqRFnZtH3IIOpJVv
	uC2ZfDQioJu4+Vc3tIdIzDUhNgPzrzwKQDz0WieIjFnFmkbCW58Y1/dDM774dO7lVXv0dulvDDj
	dgSukN3gKEwzkFOmT79bRV4sZbCBbAdQuJwZnEO6+4Do0Mc2ZmEySq5rAhEDujOkT2EBntyUFZ
X-Received: by 2002:a17:907:940a:b0:b8e:5e2:79fe with SMTP id a640c23a62f3a-b8fc3a3510emr314191866b.15.1771198824812;
        Sun, 15 Feb 2026 15:40:24 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm203728166b.30.2026.02.15.15.40.23
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 15:40:24 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65bfc858561so860239a12.2
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 15:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd5v2uwHxjxu6gQcJNSsakb6uuMbKTjAYPnQt+CWKoNgBBuAKeLxJqhqsKs+LwesOm3uak@lists.linux.dev
X-Received: by 2002:a17:907:7285:b0:b8f:8cf4:adf9 with SMTP id
 a640c23a62f3a-b8fc38f2bf7mr268150966b.6.1771198823544; Sun, 15 Feb 2026
 15:40:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
In-Reply-To: <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Feb 2026 15:40:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
X-Gm-Features: AaiRm51C-TOhqxwqOCsQDQLvUjgYKxEEB-yLqUbC16D4v6k1IC3ICBouNKGd_k0
Message-ID: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Marco Elver <elver@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Feb 2026 at 14:44, Marco Elver <elver@google.com> wrote:
>
> I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
> case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
> 8 bytes (due to that static assert), but that itself uses the
> __READ_ONCE() helper which these patches were touching.

I think we could just make __READ_ONCE() be totally unchecked - just
make it be "const volatile typeof()" and leave it at that.

Anybody who uses __READ_ONCE() would then have to deal with it.

There are very few users of that left, I think it's mainly
arch_atomic_read(), which just doesn't want any of the checking that a
regular "READ_ONCE()" does.

In fact, there are *so* few users left that I think we could probably
just remove __READ_ONCE() entirely, and make our "atomic_t" use
"volatile" in the type itself.

I generally absolutely hate volatile on data structures - it's a
design mistake (an understandable one: it was at least partly designed
for memory mapped IO accesses), and the volatile should be in the
accesses, not the data, because very often the volatility of the data
depends on context, not on the data.

But our "atomic_t" is already properly wrapped, and nobody should be
accessing it with anything but our helpers, so putting the volatile
there looks ok.

             Linus
