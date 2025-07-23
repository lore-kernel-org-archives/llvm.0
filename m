Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863D221FD4
	for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310018; cv=none; b=kP0ot2ttM3sZ70KbvN2S+R2gDIYZq788jfC6AUWUb7S5KEe+/pXWavV0RnF1i3ykgaxn6K5lM6lqNOtH8SQOxD0SHoqHXD9QmrkeDJ8jZeDKtxNK/c99HxO/6RNTQHK9MyHs7mwv4j79dxeUMnp8jv/rVoEHxXZzf2QldhisOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310018; c=relaxed/simple;
	bh=yrn43/Dd88jzmaaVGTzLoak7dGeibPTUtixV/XrA3fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6YSukNY1CP3OWvCT4knKUXdvd9QDlqiHXUweLSYkfKZdEdW7JsQ5KpcQSMSJHghho5VQu4+lTBC8bS1pgj4Uqv6EA7oGqJjiia1TK9Udhbp8pQOzxtcmlyXf5nwQY/syaHEFHSykYMmC/l6DCOTHucUwMf2ayGQQUfDSnqWsbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HiWiG44v; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HiWiG44v"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso53128666b.1
        for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 15:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753310014; x=1753914814; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3GqWWXpnYm25spaRnX4CYYgsNtz3In17QSKaRJKdgA=;
        b=HiWiG44vNjAzHfN8eccjGVJUsNhXMhPHx+A2SgdHyVzMtF7cZ8z7Qz41FIb+Z9lA8E
         5nZ/7/2nufBvGtnBbjruvcWlz0ERx2N+g8J0rVdp5onuR0YVzs+D8S9wERytI6Ecj1qX
         urym3e2MOsVEkGEuDs5j9fiS+wi7IV8B5BwAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753310014; x=1753914814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3GqWWXpnYm25spaRnX4CYYgsNtz3In17QSKaRJKdgA=;
        b=Rg0yAryyzeipw9rs2jFF+NFzxWCN6zGsj/bqZPa84dkvjJLxXw/zzP7ObRG+hIMZkc
         1fperLkT+Bt+IrqCW//Xl81dITvLoJRnGJi7LjuRTF4S/zW7qxD29oBRqV6YRuXizVl1
         pjlZIfxjfAL2ITkCtFODM2diPUP9s2yWKhma+WTVR8MVVFPz6kg12JsQDets+leX1wsh
         LURcNIdHhEOe1d3dY3KNaugFxMn81Uzk/moKd5Qzh2OP9M3lleoHStyDGvE63qTPmDLp
         2gYtXfHBpU66G+g6iToSO1giHRbfZSGwTg7BUMI0ABLyvn09leLebfR8hOLrFapeUIWq
         S0wg==
X-Forwarded-Encrypted: i=1; AJvYcCUsXAp6q8ybcJk7mhrTwKXpdJOc3shG0EeO05A894E7Bzsm2fQrdYCEqXNcTrG7ZcI93P0a@lists.linux.dev
X-Gm-Message-State: AOJu0YyASU2Hw9mr9SHMA2JnSzrV/M2GFIhJe9QOkypyaYRtjNRo7VA9
	Ndntwz3hQ80CVoszhLpKKHm15LgUHsHnEfK9SFxwZSbIQqttwhdeYgIP15md98eWg2iE7qDmTWm
	zS2RtzYk=
X-Gm-Gg: ASbGncs97qLPm76ySHYJGG72Kr39OEsjbJItUTDbqflxAv/MC8JnMz7IpAweqOL0qw3
	S2v3AKhr/PbPy/pzLt45jgz6htLZIq8GQhE6nhCGSES7rmG8B985htqLjUGrdMwke+GfR95Qr7d
	zLTEvAoz2KgwQxPXxalnqUMUC3WKA7IucA1PGcaD3iknIdmxce3EcXNMAysqrJp6CZp0jvzUDgT
	J634w3m3rgSwg1M4NQK39P6lIHqB1qp5UEiQlnTtl2bMazqxa1tjVZcRlSkvh3Wj6CYC0t7KCFS
	I7CLBxM65WRZHadPaeM+dnNMK6Z+ZAVTWss3ebILOGExqrM6yEGcCcPn4urRvoVmFMtKgyiEs38
	LTKkfA2yg4e5DkSebSTUGdmv6ZYr0PgtaxNqtPTwcimBijXxBA8jRRYsBdTo0SiVFO3HUr0s0
X-Google-Smtp-Source: AGHT+IH+Fvrfk+/ZNFZ1I0M9LYwAO3kJa+Rxj5XlxyUXW/lydEAjNzweDKys99BXfZUwzphfZ1UGtg==
X-Received: by 2002:a17:906:54d8:b0:af4:148:e51f with SMTP id a640c23a62f3a-af40148e762mr163989066b.2.1753310013889;
        Wed, 23 Jul 2025 15:33:33 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f85ea2bsm16684866b.104.2025.07.23.15.33.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 15:33:33 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so628987a12.3
        for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 15:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfH4UIqHIQMPNsOp7XIY6mPN+C2TOTCwZgZl8UU9OgsTLLtG7M6/42Ij41ZpgQ3OouO1zO@lists.linux.dev
X-Received: by 2002:a05:6402:3096:b0:612:c966:4464 with SMTP id
 4fb4d7f45d1cf-6149b596940mr3270676a12.25.1753310012644; Wed, 23 Jul 2025
 15:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250723194141.617125835@kernel.org> <20250723194211.768813368@kernel.org>
 <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com> <20250723182701.195a5ddf@gandalf.local.home>
In-Reply-To: <20250723182701.195a5ddf@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Jul 2025 15:33:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
X-Gm-Features: Ac12FXyMftZ3rEphBYdwOs1gj8AFlxDMI37MidwdrkgzW5H2-qOMpERJA1z_XSQ
Message-ID: <CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint verification
 check at build time
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 15:27, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> You mean to also get rid of the TRACEPOINT_VERIFY_USED config?

Both of them, I think.

> But this will require that I change how it's done, as it doesn't look like
> it's available when sorttable.c is used.
>
> Looks like it will require a separate application to search the vmlinux.o
> instead of the vmlinux (which sorttable does).
>
> I could probably take some of the sorttable.c elf parsing and move that
> into a header that would share the code.

Hmm. Why not just make sorttable then use vmlinux.o?

No need to do it twice. Can't you just work on the original object
file before re-linking?

                 Linus
