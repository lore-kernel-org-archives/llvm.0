Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CC188587
	for <llvm@lists.linux.dev>; Mon, 17 Feb 2025 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818825; cv=none; b=o/ns6MCuB1mGdVyqM8pPojAdNqzhDRfXAPODMG2tJAnPphLTEYt4KFVXpcLjp5vLNTWT4NGmGSJYHOYiLKJQBio+fOsSFCCRljEqgSajgdXnd/nt6FlDNkVjnRcSUPYfCglLjjRnoGnlfHkp+dVatXU0Y+RZoycZK4YDXiuQvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818825; c=relaxed/simple;
	bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvsjoBii4QWb4rYSTmZb4fkyD91x0Ax1p6YFJyU5/y1s7MdHh/Cco9hJ3KStiDqCmc3VMvqRPkuJQUjiD+nxc9iXjhY/qvHyQGNjB3PGEKVFGFkucfgVIbFKMh8v+c6F/zNBdy2XNMLi2L9/kfE8bOO1cnOmXyRoyFEe/2pXiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ekaj97j7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ekaj97j7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so3521085e9.0
        for <llvm@lists.linux.dev>; Mon, 17 Feb 2025 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739818822; x=1740423622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=;
        b=Ekaj97j7tnEWW7ugR80cGOahvVVCRHTBpAQ8Ixf66kfP3+EWhsMydeBS0YM8+5yTno
         5InVnU8hNepdSbgxQVs3ZkYWyHpaLB6ROWUPZ+hYQJrx9PUaxDBba4jEdP92wkdKcocQ
         zfTaXAyPQUAeK3J9zd6dHvjlXOKAJmGpySHc3HpkxHVGVjn/MgVikLcH7ouMStBxV7jZ
         BBRFHf2Ci8/x7GrmFq15BPPvgELVKx/6bMRvtcO2rVuAf/xTDBqr0zVw2/8jfujUBH0k
         uZwrS92Uro29jKWjAh4X+76EUbnWAJR1MtGYGwvDA4Ze4US2iI98lY22z5/N7QAUo2AN
         uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818822; x=1740423622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=;
        b=WL79CzEzC6irrO8ALhZUpLtb31hycegW38Kn+6TBbmoDmryjhf9L9oL8IpC91i7I+z
         2Bmux4GeyQq4sY0fyPbUQtYW7yWa9SXe1AER9NNZKnQsoMPA9i5qNuJXIwpOKXyfz5bE
         RhNcw1o6S54ZwyM2hJr1fmmkRA2ENN5E7l74qrS4jVxKhBdSJru99DdLjZ3ljygaL66a
         RyCjQH5gkluI7ygVZOIK5ZG5wgWWZC88gRdATZF+zDtkAKpYnXJIoUr1Lkvkw962eevb
         QaJoTmt9TS258P8OXHuqEbNY6DA5pmQ4N5E1FWy5tUz6TlASOA4kDYr1lhyTDtCh+cKv
         2lHg==
X-Forwarded-Encrypted: i=1; AJvYcCX3EuynaOwZ65pxi+5mmNW/sZQlVKbSxrCBrjKFg4MO2f2porX9TusRtJST9Cf6Z/OuxEZi@lists.linux.dev
X-Gm-Message-State: AOJu0YwvqCInXtVB4Pbhkuismp+HRKDAsraudWGWtsghpXUeVK8I8cJJ
	rqpbdLN/zVXrt3kRlHLsQigQfKOBxZ/ZudaPQxJxU7bxUoawScrZiFO1X18nCnKIFYoNxaYGUuG
	D52l/HeStuTgFxhRziqwiSKzaeEE=
X-Gm-Gg: ASbGncvhskmlb9hoDpOADVRF1HhYA5/Fqv8UYlMWwG5B8eVhJ9QGE/ZqtbyOH3etueb
	iLnr5OfNIhowKsF+cdYe9EBK81YxDNmRTboqMIPrclRO3dgJAvYzEq5eHEZFaYgdC9atjW88eeP
	A=
X-Google-Smtp-Source: AGHT+IHcNajZe0ENO6NqqO6ktnv6S1yT2v8yKjsxjfUHFFdU9DGQ1lgEBrKS4eB3xN2pkGDfNvSOKZpFCcjlLy+KwRc=
X-Received: by 2002:a5d:6d81:0:b0:38f:2c10:da1e with SMTP id
 ffacd0b85a97d-38f33c288cfmr8157628f8f.27.1739818822023; Mon, 17 Feb 2025
 11:00:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
 <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
 <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com> <kmibbbrtlwds6td64hloau7pf3smqth4wff33soebvujohsvli@kni5dtvpwsxf>
In-Reply-To: <kmibbbrtlwds6td64hloau7pf3smqth4wff33soebvujohsvli@kni5dtvpwsxf>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 17 Feb 2025 20:00:10 +0100
X-Gm-Features: AWEUYZlRIhjmXsKyPCZOszIx8_jhLBbTZLCGYgAeVzNSeJCRFZ5-FeRBt2Jwp0w
Message-ID: <CA+fCnZfBsQd=nJVu7QOX09w6uR5LK1Gc5UqiHS8aCxzhDJsssA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 7:38=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >I'm a bit lost with these calculations at this point. Please send the
> >full patch, including the new values for KASAN_SHADOW_OFFSET (do I
> >understand correctly that you want to change them?). It'll be easier
> >to look at the code.
>
> Sorry, this thread became a little bit confusing. No, I think the
> KASAN_SHADOW_OFFSET values are fine. I just wanted to embrace the idea of
> overflow for the purpose of the check in kasan_non_canonical_hook().
>
> But I'll put down my train of thought about the overflow + calculations i=
n the
> patch message.
>
> >
> >Feel free to send this patch separately from the rest of the series,
> >so that we can finalize it first.
>
> I have the x86 tag-based series basically ready (just need to re-read it)=
 so I
> think I can send it as whole with this patch and 3 others from this serie=
s.

Sounds good!
