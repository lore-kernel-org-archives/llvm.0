Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470743;
	b=h8ZCzp3MNSuQALIy3Qt0oWwg2ZTIK/+/i3O/NCi3m8gmeZx8bzgX5mGv+FIHDzFdB8HF
	 nzaI6qC6Yf9fmsl9GHnsVJibHGeRldTBejWL3i1Hd/Q+CGnJqbOb0WDgJbuSi1CNImQy9
	 SIfD9lXeIATryYtZbjcSJcvFMYig2MBC/rWklQQC+rZnUo6zwt2mZuY+QD4srVwyIOQUo
	 YVaC7H/2QH9yzaHUj8+vUBkR2lm1PpXN+EYHDnAk0smZTidiiNveoNkIkfV2xlnfwvZrG
	 6OsIpdOPoF8fySTdnf8f8MaXXu+ooObVsHwXx+vggoCr9EwzvgZX3L6cnwSpgLwsJEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
	b=BRCilU9aT5RCEk6j0QA5ztyVbDeo/SWUHVURIuanaPWArpRNkI7UgFB48XDlbiGVC383
	 2ysFYropa2iNbLSCZOIvOHwJQ+equSIWhPoyJmWgWHB+hz8wwr5mSBRtM7f5QJvZxzzM0
	 zIG0Bgl+tINnkUqTYtzE9WYoiVpSGpQKs35FFCvFt0hoJkLkfHP/GyswQq+4CBgBhK/MG
	 JdmQ7ORioLtIFOnuFAwBaapNPAaKVHcGTmxRxGyel4bulSX+fzyDO9tDHQpItXDLdZOqQ
	 WZpyvdZ46+foIH1K4YCgGvsJdTAdKkpovdhm8QvwO6UCtlgLCF48DSxVFZKV8GwhhMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Z+d/7lcj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA59606A327
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z+d/7lcj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2650664f8f.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 13:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470741; cv=none;
        d=google.com; s=arc-20260327;
        b=guK0aEaX7taGFiPg1RCyrUFgCN5iROGuf3ubPnqGyUkLkmYllsRIILOwYl6j127Sa3
         gznP8gxMUyTNT9Yi9Kaed5600ZNPRYE5I4PnzdKKqo5sPBCuLojByEcflUG1KFCvluny
         BVPEebT443axwkZcZz7jNAu30xUcfUGVRm5jRcTFtUSQQMlXflqKMMIyDma5LvgNpRuI
         vh1HaAwVA5gF0nsJOQk6QQkKmHP+LpwOkMQtRRZ8aIAXck3dgniKbPLYLpq9mq1JWHv2
         2MjPQjqMrl8NEnB+vVq6CHmYKM+9f+twMCZ0ry1ffWZETVo++F1C5/RLzB9egqUbeuMs
         Uw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        fh=oz9QLiEQHBE+bgM7FtTlJeNnvCMjLk3VS+BRCNnYtoA=;
        b=Mnd0NSaimlV0kqWR9xLNH3NSL5K22p9Z9NUd6gajcYpJKkA3RYGBZ5Qr9wvKpM7xRi
         SAC+GkD0wsCV2JE4vl7wN4dLJNOf/SbCA4HGdJ7dBlQmsdRNT5Xf7N5A+V+WpayN/6fs
         +vl4nOPuvDNVv+F5fQBIUlp7rW972vgc+CRRIykQR2QQMDJ8pdszlsZpyTtLydK5BWyC
         pCsjGxVHEnCreM+qlkSrzks1enFkbMsTRISwL5wCR0qCG1K7PeAWwhA1OQxbOCic8mUq
         1m8DIKRJEf5x8zmd286x8FjtUcW1NYK8CUpdfjGdXvPQh0AjmPpYnhHOgRukv+5be89r
         Am4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795470741; x=1796075541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        b=Z+d/7lcjeGEnJHtMEt53G26xQE13dHcPTs6Fc3wyurE39/371EHegGG/yhrZDMSVPP
         tvb0OR5rIszQcCo4vgDZCyCXIwCIyn62FMHPELFgzduJcZ87wxffTPUKw/UmfnpRlSnf
         TX87J7MC3wTWSqT/PFUdUMhDJ64V4aNaG53ko20uPvNXUi5SGJOrY4qc8MMm/L7fBKaP
         DB2BCpUbUKH6B4buvGbE2jGnY0LZmcwplCJbe29hA6Yjm5X4GXd7m6wSiW1SoptD6P+q
         Pnqc81S8z/DaPkZUMqAlcrQWuWNzXMSyuJgZ9C/2vYerZRQP5ugwHG3SNoAAGGkma1M/
         0aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470741; x=1796075541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        b=TgY/Ru5PN0nndZoSMsDjiDvz+DlbGc117wVYmjkF2ZT14dR6jXZPYxAuNE9c7IC8PI
         EckAtGH3fhHxBxbPqVCrD+3n9cv6P6YckNmjJKpwMrtNMO97GqSTEX4GH4hWyeOpW7MZ
         NP6+1G7f5r/96LomEkq+uUU5eedQKsn0c6I20VGKzBmxq5rn8bM9EvT/mMhV7/7HPqRR
         aD+yFcUARQsK6MCkaH0JuJSLX34XtOnuixrp+EAt/IIJ7j7FuS5ENOzdrP1vRRIjF0gg
         Y/pqBH1fBupFWo0dXSlX7zU2EbwYhZX0EjcZXkHrf6fo0dhBEBfCTUpg4GyoppQuJJi9
         9l4Q==
X-Forwarded-Encrypted: i=1; AL+hErGOKtCF/mTTsGmvVt3NF+GwzYeXgr0qLCgZgktc6mb08FmLtcnqQverekTVnsHpwRyKIhvT@lists.linux.dev
X-Gm-Message-State: APuU4Z+R4DKrAYmOokSyeO3b9su2z7sVBn6k/ARhiH6eq6zuhtNKAyPa
	eUQ5F7Gqa/Pz3AoeNthazcwchFNNcpp0LYh2u07biajGdoh/sb12EqRCfRP1GQ/QVhyuSp3sEua
	lvc+S1eRLh9OGe30ktdSusuigbz8ceuAwAqnIpLd0
X-Gm-Gg: AZFdTZeHU/+KWm1AyVbL+r5XgMxPENz361+Juemiu1FL6By9BuY2b/O+OHmBxJS/sRW
	kfSdny4rCdZ0LyBqhj3gSY/rT8z3HvrSksDttdS5ArkUnZ4SxfRY8IbvUvFXSfCEJ0GrI1OWM1p
	dHQsI5TqiLow/8w8nWhs6oACSzPbVHpsi1pzzUw2RS9INTO4lYcOxm5q8+T4vPeTNZe9rdlQcZl
	AlH0Y5WtZaLybEBNAJVV+6mvwaP8MKDsRtS3pz64IyzO5WTrdAoGuXlLDhRa4wYTXJvQMAndMUq
	7XXmsqLasghll1/DV2+DowrbDHffGdmYQxvfHFOHinUnsPsPhbGC5p3XtXKE++K5l5WdpiBgTiZ
	ZxdadJ/RbQFtfmgXgXNqPMu61x/v9CrmJu9cF281UJi9C6h0ePruqY65r17ik3onU65QhTUzBrN
	Twa6m7/YSzAhGA57XaVu+lhjwjw7+0V8BnBi+NyoZeNByqsLUQc1kNILgm0gLphmkdvW2mPsAR/
	bia/z+RT9D710AbAX+BigO+YiplRUXZts0+8Q==
X-Received: by 2002:a5d:63c5:0:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-4abb4e64383mr18270436f8f.43.1795470740939; Mon, 23 Nov 2026
 13:52:20 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
In-Reply-To: <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 13:52:09 -0800
X-Gm-Features: Aa3M54r-dVRGyZqFhiTlZ0em0MsYGpAQaWxd4FJihJa4G9_V25bkAUXsdWucbxI
Message-ID: <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
> On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> > Very detailed commit message, but you kind of bury the lede here on
> > what the actual problem this patch is fixing *is*.
> >
>
> Apologies. I'll trim it down,
>
> The TL;DR is that non-volatile asm() statements with memory input
> operands are not elided by Clang if their output is never used.

That's not a bug; both Clang and GCC behave that way.
https://godbolt.org/z/sEhec4oae

(perhaps there is a clang bug somewhere, just trying to suss out if
there's something we need to fix here; forgive me for being pedantic
here)
--=20
Thanks,
~Nick Desaulniers
