Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5C3F8C3
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LCz5B6hw"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7c4c21eed8aso873911241.1
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474891; x=1702079691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pol7hI1Hy96E33miCesPUidUjW/JKgnpIaa4LePlFSs=;
        b=LCz5B6hwkTOCbXrZlEILa2S8kXFHE12iLorh5s7yyZy7fuMhXAk3moUmrJbgYOzdj3
         Tqe4syBdqno6I2czThxH/QcTpfUyQwFNhFPHSeeCpHiGLSdlK59eLl29Txmi/UoSQBAk
         fsYA05Bu9rnzVedEj1FkXcmwUtGeOWIqCdCpgTT10gUrjDawVrk5nvXzKVAxKyeIOf5P
         boWZI/6uJkSsK2Iw11tLMa3ZSy693FuE1bTsLWZxfuK+sZIrPHIRVdI7MYOxDvbnCaDX
         wqp6RKoc4xVf5RbU7SDFtYlHy23AbHbQI98e+PcvTribJ3Sm27KCtIKsIINFRbCuftkK
         Y3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474891; x=1702079691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pol7hI1Hy96E33miCesPUidUjW/JKgnpIaa4LePlFSs=;
        b=K8Yh8Lv/JFQTOIC5O2sKYC1vpfe8HI4VA/yFUYVvCO6U0+D2xdAbroxGF8IrCnFMLB
         XDuZnXGjHp40yk2fcFTn1FsUyHbwNPBIRF+0vK+08xGlY6ydOSpgOYdOlBeuTZTsIvsc
         4qGCnhnV7u0JMh5BWBFS/7h4lMpwet+HHMu4rSKl+vcdIm3iU5v+XfOGUqX51h6Iquuf
         JnAjAv3c9wV39TbQ6js6N+2Y6iDzNqn6zUUPN/EcykGn+cD+c6z+rD8XTAFQYEOy9ldD
         49gF2V5gm73/c8coJTd7qZixt8quldo9xHV7pAxv+OkpNDzCdqGSpzeIaQRF7zc6T5rm
         b3oA==
X-Gm-Message-State: AOJu0Yxb5zKAQrGcwyE/Ogx8jr6x02nT0QWip4Uk2fC3Wcjaf/OLZZIL
	9UueoYKkl3AU781TrtWosDp171GMVP/ZrkMDIdM0HA==
X-Google-Smtp-Source: AGHT+IFhYdGfLbE8mSyQJ9sVITWjwja5raT5mVt0aQs6YqvlVg9Hcm3bf9FfCdJYLNUrv209BolhENIl06CXXpMM8rM=
X-Received: by 2002:a05:6122:319f:b0:4b2:c555:383 with SMTP id
 ch31-20020a056122319f00b004b2c5550383mr302268vkb.25.1701474891180; Fri, 01
 Dec 2023 15:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com> <20231122111517.GR8262@noisy.programming.kicks-ass.net>
In-Reply-To: <20231122111517.GR8262@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Dec 2023 15:54:13 -0800
Message-ID: <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, jpoimboe@kernel.org, 
	joao@overdrivepizza.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:15=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> So the kCFI thing is 'new' but readily inspected by objdump or godbolt:
>
>   https://godbolt.org/z/sGe18z3ca
>
> (@Sami, that .Ltmp15 thing, I don't see that in the kernel, what
> compiler flag makes that go away?)

Hmm, that looks like that's what we emit to .kcfi_traps. I suppose
Godbolt just doesn't show the section directives?

https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/X86/kcfi.l=
l#L30

Sami
