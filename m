Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535D2141C5
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899693; cv=none; b=VQuDDELlw8SoL3tj8EtV3ORr0iIZvqOND5rY3kB2nDDxjfCgOYY4RHgnuhd2JGvGHGPB4vC9/fkC6vzabZRmYd35LmiqrgsMsCBMDJvROtxm2DYkzxWVpFT5fhIApMCu16cRzwPXOu2Hq5UoHq/8T4Hls147pD3IbwcxcXAoZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899693; c=relaxed/simple;
	bh=26ch3VLdZlgASzApmc+sdmN42sQrSbzi8ri/yXB2hcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7uyrlM2FqJsIvEmofLO/cuRlTqNTf7VKwo2mJEpIqP0ZJXI9m6fi8iuTMQeCdvgWLq5sRv8Yp/LfcDwpvw6KP/62DnSgp+e87BHA08fDeDQf6FH5qdUTMcLvBYQSrox6P7QKQiAefxlIVcCqXlrrUOhnzi+KARKi/MaDh7RWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PdFYeW6s; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PdFYeW6s"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-537a399e06dso177464e87.1
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727899688; x=1728504488; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=PdFYeW6s8KpJ9w9KnGwXQVhKzEeqfbGykSBmJgOlx1ZU1Vc+oiVGNM6yhRW+AUn32U
         dlKRF2/UDgJh1w1vUvTIuVST95/k0gyKRRNi78o10O3fl3Ajt9g0M0vBQZYvR7K5MXFa
         ycSMzNeeeyteiUsxUD5ldyugq495R3igl9quw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899688; x=1728504488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=FYOCZLzH3mv+/JXcq7Krc9u5BTrkhUzhGrxXWdT46sTFOJkUl8bmkmSsOczhD0KRD1
         U6i958DEN3sfaGy0fjWpEDN2VZXG4qQ6S0tkzr4H0tg9RBvCv7Ms6d/b2KFI1+Icdsj5
         cr8R7cSPMDTcPBaT7FK1bjtE8TwQ0fLLEWAondPfhVAzpyv8IS7W/nWxYlUirE+ZPNiz
         a9lcqXUUOlyYqKaqSoCB9uI0hXxAvJETUq48SMVOhMFgyL7PZDaHY5O2WC8X8FcLeyGY
         c3cFDV9RvQ08nGOI8og/2jw6fYZAKnrRfsqoJTBXFZidEe9UpyMWaYADWwum8AtxbHhz
         s6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWeXckWehZgrA0ISqiDD1fiI6wOINf8TGubrW5VIhPCHSQn3rjW3+TXFHlaKnkUgCZZN/04@lists.linux.dev
X-Gm-Message-State: AOJu0YxSmu1JpuDGoNEFe/Bqrusf4TlttDWkwibWIyThM+QeCtkRIyjg
	Uta4RmZDohemXl3JfjwHhw/CG8blq86Nckm803iUElXGBcbCZgDhrBJs7WAxSsgXOIwJF1LTpHu
	VBvwA6A==
X-Google-Smtp-Source: AGHT+IEQ0bw3rqigi9IlkW6kEGIq6n0/VrvR2kRhrKwcI8Sy3c1BZ8Zcgt+hZqPI3uu0AypsEGGN1Q==
X-Received: by 2002:a05:6512:2349:b0:530:b76c:65df with SMTP id 2adb3069b0e04-539a0684352mr2857540e87.35.1727899688265;
        Wed, 02 Oct 2024 13:08:08 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a04413edsm2009053e87.253.2024.10.02.13.08.06
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 13:08:07 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398f3be400so194361e87.0
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 13:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFjuAKuyYeZoriuMuhC2w0mAexH9OLSel4F0bwL/PjKB73gWfriWMN+ks1m3TjytzGI2oR@lists.linux.dev
X-Received: by 2002:a05:6512:e9e:b0:535:6795:301a with SMTP id
 2adb3069b0e04-539a079eb59mr2506573e87.47.1727899328912; Wed, 02 Oct 2024
 13:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
In-Reply-To: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 13:01:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I guess you are referring to the use of a GOT? That is a valid
> concern, but it does not apply here. With hidden visibility and
> compiler command line options like -mdirect-access-extern, all emitted
> symbol references are direct.

I absolutely hate GOT entries. We definitely shouldn't ever do
anything that causes them on x86-64.

I'd much rather just do boot-time relocation, and I don't think the
"we run code at a different location than we told the linker" is an
arghument against it.

Please, let's make sure we never have any of the global offset table horror.

Yes, yes, you can't avoid them on other architectures.

That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
feel are a complete no-brainer and should be done regardless of any
other code generation issues.

Let's not do relocation for no good reason.

             Linus
