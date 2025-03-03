Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196291E376C
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999198; cv=none; b=guDagPtZ21Ar7bDcEGL5KgRs8YPglUBnmdJWAClGuMaCjZo1ori/2R/PyQbdHUztUAi6NHd0RMgNhZFnokLmvppG0lPJ6dJGWB6pyVdxG4zsaPOP9TW2v7HY5cG8EPjMmScL6CqLrggToMMo1TNALkAOhJxPUvpB9+KTuMrdsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999198; c=relaxed/simple;
	bh=t/g0xd3Ux115LiKLycQFMagbToxXU2ApMLqVpDJxUaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8sJ1NooKgbzVdOxy3lmdPvPnjRBp0BD3eefm/UmuaZoF3kNG5Dn6Klz7+cADeTi77Bebo6Ue4la+t/9Fi4mwGVWOYSO2dme6dHLUWvaBmGpgMAdmkTRyBAeH2gZcCwulxjqhYTKhI/0f6xOME9g4ShnVLm+71SGID6wudWEqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPuJ5dh+; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPuJ5dh+"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-6f4bc408e49so37593297b3.1
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740999196; x=1741603996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqcchcl0H3MHX0plBBglpw5tZdbp+fJLEBNYpMMUwBs=;
        b=DPuJ5dh+XPgY/cRksNPCih5DX4BIHJ09QqHO4AdiAkeJHvIzSSUeeenI+hbOGV83zi
         c1IujAqHjRuhBRpQdjArQ+c1Q63Wy8X4HFx4rxkx84SN3BmT54zQDwjAzSXj0cqUBFqG
         IOlKMCK0AWYFKxL6Z0Gq4P/jZSWqCt7Neuw6fPgXWqKc4F3//gtYT5EPqYikle4Mr18l
         dW2POZ/m1qqoAWxshxRege4XhC34dFaXub5O2RLeQrHyiuhxBuhOKobAfELRtdvUbRmO
         7s0h3pGwwE1qekGYzcy9I44guA8OFQu6tAR+NHr3t3RFGgpnPyjun9uQu5I2khpTwy5b
         9ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740999196; x=1741603996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqcchcl0H3MHX0plBBglpw5tZdbp+fJLEBNYpMMUwBs=;
        b=aVyxT25dlCjgiX9mDRdSVaLcsj9iRgVwmLUtDDeb7R/iwibO3nJU53CAuMBcst4ScS
         /EweLhUVi2zOWFvF8ZsjqDP0OOeYyb7HtMpVba/zn+SPEPLhm/0pgremfE/4hRflu8Yh
         8Fuxm00BRo3un4B2X+He0i/JzFhnLje+ji3jK8zvsu0JkJeYRQONn6H/RmFD+y3ogpFJ
         KF9mbSbc2dPu19ezM6Adsd4Xx0UGX2dsmTbs5TfbSb7w5iY+yYAm9ihsopHmK96kNKKK
         Dpoo1rH1xPc94BifL5yznQ3mf4n9gb3qguJE8lT0wPpuARJ65U8w/rPr+GB+mu3dhRk1
         KQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7xBh1AOBD57xGXC2VtqJceFpEt7iVHFv6ugMZ5AMHz682WtenQDyNp2kJOp/ZnMdzs06T@lists.linux.dev
X-Gm-Message-State: AOJu0YzYbq4nduS4AclTs9Ue6fyZf9PysOuNi6/0++ZwAyKMyZVONrsp
	+8G9OMuxQBl3V6PE42hFDxHDOftqgBCSNgp9TcXSAbFigjZ31/iXxlrsCIAbFhyv5wXVLspwmkH
	Pp0HOiroEV+hPjAOf2PfOwLxljaI=
X-Gm-Gg: ASbGncsiG/ep8f4yLk3+XQFjPo09zayLr7Rt344h4VYxlWr09PTVpaOH9NuUF7EWdFU
	rfqwmYkVGNAe+xBDLx0tSQSchVzzBkm8lEWTiD4EyzXKVl7m5SqhXOCARc2L94xY5BjS85DxjNS
	WyNWKRjrieyHjA6bsQl0ulq/7I4w==
X-Google-Smtp-Source: AGHT+IGPFg7vyGunvepCrP71hctzW/wiFhK2mnTSkLrkuSsp6X2qPRH18XUJIiB5Y7juu2x6EocYr5DNocerNm2QyWM=
X-Received: by 2002:a05:690c:4802:b0:6fd:2f47:f4f9 with SMTP id
 00721157ae682-6fd4a0bad92mr160996667b3.9.1740999195914; Mon, 03 Mar 2025
 02:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-2-dongml2@chinatelecom.cn> <20250303091811.GH5880@noisy.programming.kicks-ass.net>
In-Reply-To: <20250303091811.GH5880@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Mon, 3 Mar 2025 18:51:41 +0800
X-Gm-Features: AQ5f1JolBjCiOEE9gVLsf6wdPN2zmwGfmSm6JtRrhu885EwwD4hwEQ1WHKYNmyc
Message-ID: <CADxym3as+KdeBMUigq4xq302g2U7UG-7Gm+vKiYGnSjHouq=bg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/4] x86/ibt: factor out cfi and fineibt offset
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

On Mon, Mar 3, 2025 at 5:18=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Mon, Mar 03, 2025 at 02:53:42PM +0800, Menglong Dong wrote:
> > index c71b575bf229..ad050d09cb2b 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> > @@ -908,7 +908,7 @@ void __init_or_module noinline apply_seal_endbr(s32=
 *start, s32 *end, struct mod
> >
> >               poison_endbr(addr, wr_addr, true);
> >               if (IS_ENABLED(CONFIG_FINEIBT))
> > -                     poison_cfi(addr - 16, wr_addr - 16);
> > +                     poison_cfi(addr, wr_addr);
> >       }
> >  }
>
> If you're touching this code, please use tip/x86/core or tip/master.

Thank you for reminding me that, I were using the linux-next, and
I notice that you just did some optimization to the FINEIBT :/

I'll send a V4 later, based on the tip/x86/core.

Thanks!
Menglong Dong
