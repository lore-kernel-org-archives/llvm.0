Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470D168DB
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zZ5cpGmi"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77432add7caso459604985a.2
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697709906; x=1698314706; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3bjb9rubAXmEx3BuTMzb9DXzA+Icb3ceQsdxtJC/Jk=;
        b=zZ5cpGmiJ6LHOvdE+xbTV/tQmKvsfldaItwirtXlAqC1RdBenfLUDEHcHW3uqi5QAi
         Uaqg2BrSiLNEa5HYliPUc7NuOiTkux2zVr+SZqCID6gO6beyl3u9EftjT2NohNLKJxET
         7dlq6IHTxMK1xFtWRHbi8LsKpQaOKU5xRTmoo74cEQrxNX8FH0smSTIw6NtuQ+qdL6O4
         +zvX/D69SSDKEtNaMTyQHiCUjpXMAlYT1w85oDvTm+FYH+piSpP1h4hUMDQTqtmnL3yp
         a/zqS7T073IpM8bFU7F/PIHBL/RyYb/94Am1H6YSTyH7kIB7vLxuh/B9VSHB8K2t2Bzw
         BX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709906; x=1698314706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3bjb9rubAXmEx3BuTMzb9DXzA+Icb3ceQsdxtJC/Jk=;
        b=n5rb16OUOy4UqgHffWR1xWZVt0YV+Pc9XEjPAhtVVYWfxSA4dzGaJ4eZ2LEa4MLsGz
         C3RZk30Hm1WTQBtKSJwRhylBM1261aSHIQw+CtpQSkhqRgqfgp+pDbOdvNBNIhZO+Axt
         WKK36LdL2x7ZonNMCf4zREs6aLnX4FH5qq0268sWDOYnpkvNKufi04prH+ww1DoSUJb0
         SzMBRNpbxvZWDDF4afn2xxR6lOkNJQS8Csj/ib87NJHGwfYhnDtPVdcfSmSltHVmIhLe
         G/i5pioLRjHU8oyHj/RnZREnd5Fpp/8B857Ststfzx83S2MCIK3U1BEP7gY+KQdqHQIO
         NMEQ==
X-Gm-Message-State: AOJu0Yy5ndOMGC/eONenGX1DiKnT5CySknECRo6w5klGrl5X9DVPXoRI
	yvWaz7PsIaOgB88B++NIGq3W/wmkouFS5e5+kzBaJQ==
X-Google-Smtp-Source: AGHT+IH6FHJbxjRMVCH1yb8tkbndeFnPREHuEjI+EYywqZ7BjmHUvnxgyZZpMGESGZMAgQQUcjtqiwGQIFSoapndiHM=
X-Received: by 2002:ad4:5f0b:0:b0:66d:1624:2200 with SMTP id
 fo11-20020ad45f0b000000b0066d16242200mr1943369qvb.13.1697709905579; Thu, 19
 Oct 2023 03:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018182412.80291-1-hamza.mahfooz@amd.com> <CAMuHMdXSzMJe1zyJu1HkxWggTKJj_sxkPOejjbdRjg3FeFTVHQ@mail.gmail.com>
 <d764242f-cde0-47c0-ae2c-f94b199c93df@amd.com> <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 19 Oct 2023 12:04:23 +0200
Message-ID: <CAG_fn=XcJ=rZEJN+L1zZwk=qA90KShhZK1MA6fdW0oh7BqSJKw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: disable FRAME_WARN for kasan and kcsan
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org, 
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Li Hua <hucool.lihua@huawei.com>, Rae Moar <rmoar@google.com>, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > Are kernels with KASAN || KCSAN || KMSAN enabled supposed to be bootable?
> >
> > They are all intended to be used for runtime debugging, so I'd imagine so.
>
> Then I strongly suggest putting a nonzero value here.  As you write
> that "with every release of LLVM, both of these sanitizers eat up more and more
> of the stack", don't you want to have at least some canary to detect
> when "more and more" is guaranteed to run into problems?

FRAME_WARN is a poor canary. First, it does not necessarily indicate
that a build is faulty (a single bloated stack frame won't crash the
system).
Second, devs are unlikely to fix a function because its stack frame is
too big under some exotic tool+compiler combination.
So the remaining option would be to just increase the frame size every
time a new function surpasses the limit.
