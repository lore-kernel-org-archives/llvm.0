Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B386273FD
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741050712; cv=none; b=iUZnxwJ2Mrh3NcVPYP3DrAHOyFky0wvwWxn7PZGZx5s5oppHIQJM7cR+n+eIBUTKRoS4RrKCU9ai4Q9soTkqWiBNenQr1jAqlfqQdy/0SLl8KvDVcpfyr4ZCBLo4NXp4Is3gDHMka0586Rdg5VchzW9C/p2nALG4uQwODxN0kfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741050712; c=relaxed/simple;
	bh=22ZUGvsm1MOkILYiYuUiikpT/81djVg4T133ITjQ2KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBeaqeFm87XvutRzjX20HJvWJnAToYsPjN+mHCMw8UbSzCcOmYVMNF/2mahsE0N5I+jDRFCXKsHL94ITlNKB1TxjZoWmnIK0wVkcosbp8w5a2J5lCNmgONoG33dkn9XxnQoUsCWkURQF0cSCnPdKZsTHPeha9L9GVrNOAxHBotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLweoJ1/; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLweoJ1/"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-6fd65f1d262so18500077b3.0
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 17:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741050709; x=1741655509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vluR2PPVFCeXo4Pv8qn9Rh/dHaN7yGoTkb474FlFpf8=;
        b=BLweoJ1/Jewnl86mh1ROBHzGpbBalG+BZ42aEP8yuq/l95HhoPK3XTC9fLbMwByB7D
         WwssHUWb8IdKSi/t7XoOUbAvpCJjr5Sj2HuS6KOx5Kn4ItGEIZJ4kUL8b1hZsLGsOBqd
         oBiqM90ou2a1VWEag/XGhtJ/SXdyp5wQ/Dj7Dz/SkvghhfywZvh/4dC60mGEdtUmO1uY
         bZzcHDu9Mm0MOLGByMbIHes99LZqhWn2bKjXZkJIb7L/6leDWd0iSBuKzOsCcqXxFHXl
         aepeMrQRLIKfU5O4EhcMNbttbeXNYRBKzVn3MCzQhcpFzl/GRk3pE39fKq31azfrXE+S
         vBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050709; x=1741655509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vluR2PPVFCeXo4Pv8qn9Rh/dHaN7yGoTkb474FlFpf8=;
        b=chXA3Dh+QvJwhCgEA8qn+ojXChMkEjChVtlx0yf6QBOQqNxDwLxVXf6qGhGAFzqvmQ
         0aaoYqG2eP6tl+yfDXHAzc95gF8/IoOvt5o62XhW+4I2OM6kCC5rYDKbMMMiosTSbvtX
         hLn/E6UKa4eBcBxJld9TRYxejLi6Ve1kikCQ12jCknhfkw9P37/SmMrY5Z4aMSTAt7Ki
         m13MQu+G6ZTDacVbwBoza64uZMTfd91oZDucUijAFtZQZDtMauwEpwvUu2xhVrCP2pex
         5cvsu96k5m111E7JKb7tyUNBZk0PBH1/KIs0pmKAFpSdpz0Mbi893ES/uzoj0fc4nCRU
         Oylg==
X-Forwarded-Encrypted: i=1; AJvYcCWMb2L5qqFHbjOxPWXZL1REy9gMbDkiGJKY1jUna3DB7cAzraE1/MNapqlI5r8l+I8W9Fr9@lists.linux.dev
X-Gm-Message-State: AOJu0YwJa/eskoZ0+meJtpCklieNmFXdq8gHRO5MQ1Jswf2zyyeMnQrd
	y8UMP4O7O1qYgNc4f+OfEvHf1esKXOxbaoWhc9KezHjUrJ8A/b96/XwWIj0oPeDJ00+O4TxYGMl
	/1p7GawRKqlFNghkgp0biMxebP/M=
X-Gm-Gg: ASbGnctKaZvzJgvbvgHfw0mDQdTD1umUdxtvyeKi+/7X5t29KkxPjLPjC4IxexHw0cL
	d1xNrrqBK3WV8S4XovgxTw99X2aDWE99kqmMvM2uCcR1acAMiQD1Le7ojcJE2p9jHse5+NODi3g
	H1+/WLN+QAYWgOR4oCLDWdVP7HVg==
X-Google-Smtp-Source: AGHT+IEqUJezS4KkYf0hWTwJ3JT9iuB+Kta0och/jWyl/2qKN2Gk9IsJypM5kJk2wrbNcnQ46yEh3gTwcTGIDUZLWQo=
X-Received: by 2002:a05:690c:3808:b0:6f9:78c0:3a5f with SMTP id
 00721157ae682-6fd4a10ff41mr214699267b3.19.1741050709491; Mon, 03 Mar 2025
 17:11:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250303165454.GB11590@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 09:10:12 +0800
X-Gm-Features: AQ5f1JpFMtKlVjq9NnfZ6GpKN1o8CsUv-3k7tk0XiqG3kcbonZw3mKyWyXRBiyA
Message-ID: <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:55=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Mar 03, 2025 at 09:28:34PM +0800, Menglong Dong wrote:
> > For now, the layout of cfi and fineibt is hard coded, and the padding i=
s
> > fixed on 16 bytes.
> >
> > Factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET. CFI_INSN_OFFSET is
> > the offset of cfi, which is the same as FUNCTION_ALIGNMENT when
> > CALL_PADDING is enabled. And FINEIBT_INSN_OFFSET is the offset where we
> > put the fineibt preamble on, which is 16 for now.
> >
> > When the FUNCTION_ALIGNMENT is bigger than 16, we place the fineibt
> > preamble on the last 16 bytes of the padding for better performance, wh=
ich
> > means the fineibt preamble don't use the space that cfi uses.
> >
> > The FINEIBT_INSN_OFFSET is not used in fineibt_caller_start and
> > fineibt_paranoid_start, as it is always "0x10". Note that we need to
> > update the offset in fineibt_caller_start and fineibt_paranoid_start if
> > FINEIBT_INSN_OFFSET changes.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
>
> I'm confused as to what exactly you mean.
>
> Preamble will have __cfi symbol and some number of NOPs right before
> actual symbol like:
>
> __cfi_foo:
>   mov $0x12345678, %reg
>   nop
>   nop
>   nop
>   ...
> foo:
>
> FineIBT must be at foo-16, has nothing to do with performance. This 16
> can also be spelled: fineibt_preamble_size.
>
> The total size of the preamble is FUNCTION_PADDING_BYTES + CFI_CLANG*5.
>
> If you increase FUNCTION_PADDING_BYTES by another 5, which is what you
> want I think, then we'll have total preamble of 21 bytes; 5 bytes kCFI,
> 16 bytes nop.

Hello, sorry that I forgot to add something to the changelog. In fact,
I don't add extra 5-bytes anymore, which you can see in the 3rd patch.

The thing is that we can't add extra 5-bytes if CFI is enabled. Without
CFI, we can make the padding space any value, such as 5-bytes, and
the layout will be like this:

__align:
  nop
  nop
  nop
  nop
  nop
foo: -- __align +5

However, the CFI will always make the cfi insn 16-bytes aligned. When
we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
like this:

__cfi_foo:
  nop (11)
  mov $0x12345678, %reg
  nop (16)
foo:

and the padding space is 32-bytes actually. So, we can just select
FUNCTION_ALIGNMENT_32B instead, which makes the padding
space 32-bytes too, and have the following layout:

__cfi_foo:
  mov $0x12345678, %reg
  nop (27)
foo:

And the layout will be like this if fineibt and function metadata is both
used:

__cfi_foo:
        mov     --      5       -- cfi, not used anymore if fineibt is used
        nop
        nop
        nop
        mov     --      5       -- function metadata
        nop
        nop
        nop
        fineibt --      16      -- fineibt
foo:
        nopw    --      4
        ......

The things that I make in this commit is to make sure that
the code in arch/x86/kernel/alternative.c can find the location
of cfi hash and fineibt depends on the FUNCTION_ALIGNMENT.
the offset of cfi and fineibt is different now, so we need to do
some adjustment here.

In the beginning, I thought to make the layout like this to ensure
that the offset of cfi and fineibt the same:

__cfi_foo:
        fineibt  --   16  --  fineibt
        mov    --    5    -- function metadata
        nop(11)
foo:
        nopw    --      4
        ......

The adjustment will be easier in this mode. However, it may have
impact on the performance. That way I say it doesn't impact the
performance in this commit.

Sorry that I didn't describe it clearly in the commit log, and I'll
add the things above to the commit log too in the next version.

Thanks!
Menglong Dong

>
> Then kCFI expects hash to be at -20, while FineIBT must be at -16.
>
> This then means there is no unambiguous hole for you to stick your
> meta-data thing (whatever that is).
>
> There are two options: make meta data location depend on cfi_mode, or
> have __apply_fineibt() rewrite kCFI to also be at -16, so that you can
> have -21 for your 5 bytes.
>
> I think I prefer latter.
>
> In any case, I don't think we need *_INSN_OFFSET. At most we need
> PREAMBLE_SIZE.
>
> Hmm?
