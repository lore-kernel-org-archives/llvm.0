Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65932D0C7B
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255995; cv=none; b=X0tixLY4oDUPLfFu1ABqdSoUPWzP0OeyGgvvS45LRn563NLIriqTCdq34Vx8vz1bpFjFdhR4kVnImiEDwoxmnT5N6rr2spHTjezkSTAz/5D8WdiLE9te/HLUgkbZ9gwT09flRmsSnmrFMAUalYQAP1CDfom0l4DSLTyMhYe6AbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255995; c=relaxed/simple;
	bh=3kn5nhTe0qmD7LbZC/I6w4XOMT95gIJ00NRqjHHgyCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sw7NWkRxtZoQwsrBhwJEnikao424hmxjz1xKaAiVHiRNBwc/+YujBhPbpsTh7+TX4K+8XxRAfT/9+px9zqb3/B2JuLvBTzo/vkqMN84TKqqef1MDYN9yuUkmhtVHf9CKalqM7KeB2uZhSjkXIUVyl98mjLIc8OHS1l5kWa5skhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MY2fkJrl; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MY2fkJrl"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso7661916a12.0
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771255992; x=1771860792; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcJklCdj+iuSWVZsmzfOlTt0HmcUV3JKhtJ9znekMoY=;
        b=MY2fkJrliJHyLOCMxGrTEqlJ9wucUuh1MgoQdXrkxfGyPnUfDdvHVPosDuyWA1L8aK
         c3c8BItFf0iaGZTyiChrE8o/BSRetyruBMTPfKplhpyMII6YGHEAiewcbfksVhYsZzyS
         gH/+73HBhiKK0DoVyo9CjptDzSayaiaTW/B0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255992; x=1771860792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcJklCdj+iuSWVZsmzfOlTt0HmcUV3JKhtJ9znekMoY=;
        b=guncqte1ezy7Jn6mslEFvNKV2VbEJPB754hzXVY/67flblxsPTK6EPMFg+GxAV0jgK
         OSV7YPdQaICY8ekTFttwXRZNDIWAUHXee9N2T0lnPxP0BaoWoDYY11lrgOKuTdNGOuh+
         bl71UYXH7XfpZFw4f81X8yUc7OUyhb+CtbelwrO37wbceew1rM2Pi8C6zcd88P6ewoYF
         XJOq35t105jt0/UIaVh/JwZUFvV384e2tqeppY2u8yytWDAQnewokp24e7VDEdedhbVx
         cn/MUXOH9IoPVYFX8/9KNhcNvNqR6l9O8zyRC/qmgpevGTXNp66+YiP1uDkI8xHOxqif
         ko1A==
X-Forwarded-Encrypted: i=1; AJvYcCVWVaoGchQuy1KAhcqrvPpB1dELaswWU6m9wW4jt/JdyCC6hPvB73wvh991l0+yLpipB8Hg@lists.linux.dev
X-Gm-Message-State: AOJu0YzNgRL/WJEVUvda1nwxrV+bfNstexMh16/X6AjfNTHzSxkRTUMX
	yTIuP8X/TKk8ntioqxxV6t8/1R7QnIwd4iUQiIpCxV/nqrd8EuPPgI55hYlkLe1+YbRwe5w1KN9
	KeCpCOkXrBA==
X-Gm-Gg: AZuq6aLOaYAb5Lw7rPxnaEst/4GA/q43661DUc97x1lprjvqu107/E61VHujSAQLN+l
	GoF34DpUOFxizjSvQH4Kh4qrD5lwTDw8R+icV2IqQzjAthiThVIzaJbdwQ3tl3XuchiKxydoJ2T
	yeRCIizGAb1zhQcil8Fp5MVrb1kYCrhmWQ7lUSqDWXLzCn3mLABCfmDTniGFWwSyz28AxkVDLkB
	dRdf6GoMbYtzxQSpP9y6QTPRpB5g/UWkfaWAb1FebK9dyATQ4o4tmXkYKNpchdHLjS9nPUE+YVz
	fM8cLN516wyi8NtMCNRS97hXYL8r3tMUQCaR/zBzN6WjO9k9mgO91hmHrpW9JA7wultDUrny/yZ
	chMKnvPKPaJSXAcy9Q11HxwAg07rjRq92IzJRLcYdMSsJ405w8a+3UeVaT3JOwVu92UE3L8ZCYL
	7MdHIIJWGbJO6nqVT3H4bv567uM7dS43Rkt3PaQoiaGH/Qfvzx7s2xIb7ydqZSVDEkLVTciITA
X-Received: by 2002:a17:907:7b8f:b0:b83:3295:15d2 with SMTP id a640c23a62f3a-b8fc06f028amr521927966b.30.1771255991742;
        Mon, 16 Feb 2026 07:33:11 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7bf7sm260692166b.29.2026.02.16.07.33.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:33:11 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso7661884a12.0
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 07:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuzxtZPAMlyBkV6kU6P1Vb4ZODRgI/dYFBNzc22UVpbjxnqzdBMo3/S+uZBOP6T+1sbJjE@lists.linux.dev
X-Received: by 2002:a17:907:6e86:b0:b8f:e98e:ff5d with SMTP id
 a640c23a62f3a-b8fe98f297emr298866966b.13.1771255990932; Mon, 16 Feb 2026
 07:33:10 -0800 (PST)
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
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com> <20260216110915.4f0d5490@pumpkin>
In-Reply-To: <20260216110915.4f0d5490@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Feb 2026 07:32:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
X-Gm-Features: AaiRm51OTGvN2sCSlh8_Rn9ui_eyEBMKbWkgCuwNwrublXNq6jjEcgPmaKvEAvs
Message-ID: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:
>
> volatile structure members are almost free

No, gcc does absolutely horrible things with volatiles. It disables a
lot of very basic stuff.

Try doing something as simple as a "var++" on a volatile, and cry.

We need to have explicit 'READ_ONCE()' etc atomic accesses, just to
make it very very clear that the compiler will generate shit code.

We do *not* hide them and make them implicit by marking data
structures volatile. I very much want those explicit
READ_ONCE/WRITE_ONCE cases.

           Linus
