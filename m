Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7092521888
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929473; cv=pass; b=Kk5oOFqmbZrUKRoN4tT/05Y0Zm+ZznKlDUeGxmGA7PGMFFjWwQhKi94Wx8OCNkRufJiiBWr5MgTMAjtw3hP5ftHdK/DJ5L2MEBsxY3bRGvOmgZQhPAy3VS8sn61xAF7G/M0SbSaOiHgD5frxLSjw76zhniVf1vvYm6yRhPTPnPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929473; c=relaxed/simple;
	bh=FYTV9FNBFSb9ojtmdwQPjMX2y3qFMZRTL6lxs4fSGMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+FHDSrtWUaN2n0Jr7AFR+KoHioqfjPAYgnInWapcpqq/J55LgJcKnJcZGv/YJuniEKJoWNOS/3BCXdStUsGF+jmuIsBj6S6cbZUyK6hkSxY0Fr8Z/MO8unLeN8VBhdcehQD6fm6nmULY551StfOILJ76kG1pB04cfc5QqfBa18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sgjRFVvD; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sgjRFVvD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so185585ad.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791929472; cv=none;
        d=google.com; s=arc-20260327;
        b=gN3XNjQ6I3yKdfGYWJxAME/GQ6aKHUwtHkpAWeeKyU2Hnc4D50Kfmbg9yjhn55b5uq
         YXyLqUVcSVp3xKzDJKPEgUCZoh3t+l4AfwLKW8Qus6xfHSsaWIQptiyKdw8tBhSttLeD
         QO2Q+g68mYdQh2S4V9WeDmdiiP49MAks8nRf07Wm8jDueJv7IjxW7klztG6VMxW5bNTF
         m/ojm1V0DecmNRTNWNeYkQ+k31Vj4ICOSgENwaG4FuYVEtkCTSz4fZ4Jh07MqI26ilJa
         V3JVW1T0OBeW1eu+fQHUfE0IxcyPnvX3ZqjWsYtyWzslVZ9txuHXTZwo1FLmqbjbgbIz
         orvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        fh=wR+n46xMxDTK2M8V0ktFnupjwlVAC8gdEEu1jfKQ3FM=;
        b=PgNYrafSkqSD2kQrEMNTJYT3WvTgcChJyQE5KELa7eKnHRZB708v26lDLSTejegs9O
         0DbOD7VTpgYXugt7FTC5pqCJIKdXE9zmpLKgSY0/8G6N0d8UF//RAF0lK5HzmZbSuykz
         4tH0RxK7+XwZGBtUWmfD2WY/JpQrLL3eHfe1h7jsLcigMaFGI8D/JBVzXnVJu3N7grTP
         lW319eTkO0fr6WFhe/HSE5iOlUR6huPFDaYhK4K9jQ+v0ggD0i7ARwQ4koD4hCnfIXKu
         fHYuQlayjIlJ+l+iU5i8UooSwC9e0VXavNljO8DDoJIbkKiDo7auFkg8SyrtiuVFXfOa
         0UrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791929472; x=1792534272; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        b=sgjRFVvDj1EzQyxyuBNIEXianO1ED12cHYguaoQirPq2frpow04COLS3uuf9kq1oDI
         unvVi/vSEYbrVCPjFKPyIKgANuSUgu9vUNMwdQ8gsJtl/CytcDu6rQzGdtA+k0WqH5O2
         QOLmMpGwBOSInEvVvFv0q/5qSlBIaug3azjAEUd3xXSBf9+P7Ur/KNmezNkh72R4lI60
         2XOf6FtRYumJtgFChdFBtN27Y5NUXw14g0TebKWHz+ViCNoqajgUkeQo9FkLbddmIcm2
         W4XzZ717HaI44xb9LV/4r3gQuIxQkfxaEUn09oJL2XsTNTVRURkoJW/+y2XMNlXqwMoG
         +DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929472; x=1792534272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        b=iOxlpj7bi37nUm+eH9oeYiRRGtcFs+2VRmtc/tvRTdQrT8NqaDX+DCr/8A6aE3KPMT
         cYn7Xb3MIgD2l5IfidQCQ5so6NK+bzkArvNXcEncTduUD07bZz9mp64sa0qohrD32ikt
         /5sqXoCGZZsY20ZBScOW3wtKwfQ9DLZ9fHp324DB8Ox1wwt3oqpRhhJP55fO3FuT7bbK
         gBEMVWSmCN0mhjgAhZtvU7eiE0B8KM0K72JbNamn3Z/SrJlNO0PCvnXaLtQu+sSgDeRq
         gxx/6Fim7nWfLKMI7NFXwXs7NTI+JO7s6CWAZSiy+Twlrq7qw/a0ar4gLKiYkJU/Cd/0
         hcDg==
X-Forwarded-Encrypted: i=1; AKwUvBxYnDgrdD+jmllHM2BigqMcj9NKVGWllDOLumBX9JVg8nUQYi5JWRNVmT21+WEL7QYtLHKL@lists.linux.dev
X-Gm-Message-State: AFq9FYKJAupvk8XG7gEn6qupNczOwPP2JrcCH9K3VF47Dqap90RCbKc5
	Beo/lgZ6oGhCWSq48fQ8sFtkpo8L8dwx5J1NakCn4eM48zlP6GfMiA3nQiNcp6OgiioQwMS0vV2
	5c9e4osjIYHWk/o/xiypzGLXmLrwRd2n58ehNyLK0FpA4U033wLd1xAvL
X-Gm-Gg: AYBFou2tixYVceTVswvmM4WlHHjiNIokM3/PxLm5SV9cmXy1HQhLe3jueAvB6FUgCoj
	EVX2/QwdEcFhI+ptIRjXbTVWdXRAbEpoqx7OB2pil1czhVjtjKrvZfsD46XoMUvpmuK6uZar/qE
	bgZtVZGwkofEdE83UGtCpR2JMHI/JpruoXUj8+WaSNuYOqB5VoYaCOKdowVBu+YEFHDI+uomZVF
	BXBzZGJBKMNyuB1jMWrXGuxhpGmh4vKK7RQgh02XqXgLfv4vXWB68tvv/n0Wu7DfDO+Bp8GmKxy
	AG46fIFQmsikE00+73jYfO9o6zp3FgszdWXpwmzM/+rTkyoxGH3E8wMKFof/tewDHfs3Ah6/38F
	mPDUEmtlh
X-Received: by 2002:a17:903:2b07:b0:2df:96ca:d7c7 with SMTP id
 d9443c01a7336-2e939abd25bmr287505ad.10.1791929471359; Tue, 13 Oct 2026
 15:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org>
In-Reply-To: <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:10:58 -0700
X-Gm-Features: AclHuK9zqPxbei3yiEwT_Je-bqqvc_vKWZJxCFnB8AYrF-IAVVVXSXOd4HXS8b0
Message-ID: <CAP-5=fX1XZu=3scB1-hA2ppcM0+sR7t_3=C7fFx=kGikm=dLqA@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:44=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 10/13/26 11:24 AM, Ian Rogers wrote:
> > _context_unsafe_alias() does not use its parameter 'p', which triggers
> > -Wunused-parameter when building code that enables -Wextra (such as
> > tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
> > Explicitly cast 'p' to void to silence the warning, matching
> > __assume_ctx_lock() and __assume_shared_ctx_lock().
> >
> > Assisted-by: Antigravity:gemini-3.1-pro
>
> I think this should be changed into Gemini 3.1 Pro. I don't think that
> the "Antigravity" part should occur in the Assisted-by tag.
>
> > diff --git a/include/linux/compiler-context-analysis.h b/include/linux/=
compiler-context-analysis.h
> > index 8302ebc2ea8c..024e303188ad 100644
> > --- a/include/linux/compiler-context-analysis.h
> > +++ b/include/linux/compiler-context-analysis.h
> > @@ -243,7 +243,7 @@
> >    * alias as a function argument).
> >    */
> >   #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
> > -static inline void _context_unsafe_alias(void **p) { }
> > +static inline void _context_unsafe_alias(void **p) { (void)p; }
>
> Why a void cast instead of __attribute__((unused))?

I agree; unfortunately, the macro isn't declared before this header
change needs it and I wanted to minimize the change.

Thanks,
Ian

> Bart.
