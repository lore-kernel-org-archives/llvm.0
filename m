Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA44E3ED4
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452277; cv=pass; b=JuLXi30Q+4xHRNfcOeEt0EZ192l0ZlUfhvZ6LAuc6Y5TlSg01P4Q9aglx9Bag1LapA4RoMn+P8IS1g8qLyy7LlLsvn08/u76cFLiMRirNBcGoDfmtcurhu1gL+nAlDk/JorCF7pQ5nX8NqJDUpRyp7IRw2OjZVJXoVB0JDI/fqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452277; c=relaxed/simple;
	bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edEaD2c25mCAaz/9r0Cy220XgcVFzjQfVFlYxDELeN/5XqayE69UgmRUn6WUQT5sBVu2UE16FMV7cAqfr3BuLiYpSoqakxUzwWJOpYQUSUgnxu6gsBVJdFKI1Z6OgSXUAAmr6CWf71r0TQH3+yh2yIjmTpir7eIXTsaq/C/tAqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZpcQCMff; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZpcQCMff"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so38742f8f.2
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 09:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788452274; cv=none;
        d=google.com; s=arc-20260327;
        b=aXr7wnLSq4OHbs9qCkKz9wfdSajefpNKtNkz2t5qDFzAYoY+WElZjyK5d3zvIs24Fy
         q4SDTnR+IoD/yNdwlcxvI6XpYlQB5Yf86mQxqldT5hZmNo4DjTFExd3TyTAEOKN68+DW
         z37ve81AjBTalRkIuO3lzX/F1BLaBYtccqfF/FAvABoNRTc0BkJina6E/EuE//nDVXjv
         iglWA7kHrJhvXEGzzWuxPkbUhcodu6MEH/DYmZIizwrVSr2dSdpX77ZJ8EK3DiM4tRYd
         +PBnq5tEd6qQN7reKkgDHL5e+7uK59pyPqFw2vktzDf2fPHsdfDBe+VzU56JIK5ZBtgz
         9/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        fh=cbop3wWq/tCkaKjVYDmqX7XbphUydgTDZ67RiboXp1I=;
        b=ndyjbbDicuEz765hb+h6oqRshrf9d++IKeGLGO5c+xSjVwivMxyq7xf0q1D4oU6c9+
         Ft5IAHWL4OcEjTnQylLsvn2lKwN9Zbt+8UUKbcuicobPEv/LxJ/MJlWbpEiBc1kyFCa1
         vqG3mPSpeARIjHRpbZByXaxR7ROwZ9XLSoIySDyJPKjEifHcy67G/AOlg0dF+lqYdhjK
         W7ENb4YOmQTQkM9oZMVnuA0RKLEcRHIY/gr5GvT9DIh3uH9ptkNF+3mmFKRhViiHIgGy
         EjqRZCgGYW5JPdJZRdcL9hhaMt+6LIqMTtNxlR54JlQu5FTYeADQ9ufKUHNEY3TFk8NK
         x6Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788452274; x=1789057074; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        b=ZpcQCMffRwzzORFIPY6EgUZg2ZNIrdpCSPclMNV0AgzJVdJB40yUL8e1adcaVZJLJP
         0zmfp/H44/ra9KVFQ3le1RNolhWqa7XdWPXHpNUmx5SSkiPVI8an67u1ej+ImRUR9d/F
         HI/mNYxqwIS8j1MfLn6hQ5yryD7zt1d940ppF7KDgEHXBfMJIbc8i0PO1QoT4eH35MUJ
         M/GQP9uT9TQ2JmQ0aX4YmZ8p+IiF+4x0O1u8ngW4vGdAA2aEXzapfqjXKKzMyBBJ+0Jb
         lVyVU/dlNFHOs3fBClLXgigQWYxRkC8wOxT1KRYOxK9BLiiDURMbRTciIehyz3n2Vn5q
         filw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452274; x=1789057074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        b=aiK0JnlisB1V42Zyq1chCx12rT6CXnmX670FvwBQYcZWjlqLnOyi2YiSIYooWHS5Sr
         gCuEfYZyWuhGQsB96F8us1qFJHMM1AIw9MLYyH9zfj+STlB/8L35pIH1vi8iByf2TX8Y
         PIPPM6T1ihBmCKZPIivk3+PYUD/nmyOyaRbNxq1hJz7vEGTZ9fTj2NPBaVvSY8+j1FWz
         vh9lqocTpLjzJUTidr7SgZI3hCg3/JijUTT1xXO/WBUxqA8fkGMbPbcTb/CMes2mNSqT
         ipYQAbcZBtHsDObD2/h3lFUFYnVlMSTRon65jE55s20f13t+MorVFmU7drXEK+/cmr0Y
         Ylzg==
X-Forwarded-Encrypted: i=1; AKwUvBwJJaQ5K3x0XJV6K0sGX5XBZkhR5X7xc/3Bc6Qu52HvFU8Qz7ZU+el6i6THQFJ59KUp5DDa@lists.linux.dev
X-Gm-Message-State: AFuF++nTGKn1WK4wNE4+qiJGFADqDHpVn8S0Ujl1Udeku+irE40LRtFf
	qt2Cq9o0UirqrPSlgKz5PLG9nbhXW7f5W8A9SXltrVy4V4NEh+Od55slIP9M8iuUbVBo83YnsNU
	i88nXTERhNj/Cc4rdXXlYYoPyq0TCF48CN8Bsj09c
X-Gm-Gg: AYBFou1GLn9v09jK0dU88yKxPt0dAJrrsMuvJrB7JEhYNIG34yJBQCyMSo8mUc3Zd+8
	8DqDtJkKXuOC1UmhfLp9QnIpUQxGgiq4dGh/EzHciop/6c8Xj6YAKIutctOXKMUl0HLmwUf9f1E
	6s/LVZ0j2JyvKk0bR3rAYOf25I1eyLo4WuGHxhxqwZaU4JMqAcg+sYw6nToX7FoyHp6jmgRMMgf
	T+W1txxO7Zmp67XLnFLbDntAiGYA9pCkK/TLSgKcf0RQ8di4zY0Wvyh0j1XevEvOu9YxIBI0oty
	yYgDE/JSyDny+APbuxDTA1dXfPm93OJmiCK5/GBjRhxMYAzlW4x4cD3jtSwrnKIecw2RSWx1Ddl
	vNSFW/s2Gzkyc6hnTNb602CJXsHV8JiWcJhKvMDSh2n4DMZdC7DZ8zWI=
X-Received: by 2002:a05:6000:25e1:b0:482:f270:65c5 with SMTP id
 ffacd0b85a97d-4858708dcdamr364644f8f.9.1788452272960; Thu, 03 Sep 2026
 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com> <20260902175154.14870f981733146727c67c20@linux-foundation.org>
In-Reply-To: <20260902175154.14870f981733146727c67c20@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Sep 2026 09:17:41 -0700
X-Gm-Features: AcwNN1X6P51z_SmCYkBPOVdoAklFk1QzWRkytYd-vXw09T7vR9Dr79krTAbesqQ
Message-ID: <CAKwvOdneQYJ+sHj1jFUJfV6oLty55e5p9x-VoAKz_oehschdfA@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkstack.pl: support llvm-objdump disassembly
 for x86
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:51=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 02 Sep 2026 14:01:53 -0700 Nick Desaulniers <ndesaulniers@google.=
com> wrote:
>
> > When running `make LLVM=3D1 checkstack`, OBJDUMP is set to llvm-objdump=
.
> > llvm-objdump outputs disassembly with instruction size suffixes (such a=
s
> > subq/addq/subl/addl), tabs/whitespace differences, spaces after commas,
> > and trailing comments (e.g. `# imm =3D 0x...`).
> >
> > Because scripts/checkstack.pl used rigid regular expressions specifical=
ly
> > tuned to GNU objdump format (e.g. requiring exactly four spaces, no
> > suffix, and no space after comma), checkstack.pl failed to match any
> > stack adjustment instructions and yielded no output when using
> > llvm-objdump on x86.
> >
> > Update the regular expressions for x86 to match optional suffixes,
> > variable whitespace, and trailing comments.
>
> OK, so checkstack is broken with LLVM.
>
> Users of checkstack/LLVM in earlier kernels won't like that, so
> should we backport this with cc:stable?
>

/me looks around

yeah, all...one of us!

I'm kidding, thanks for picking up the patch.

--=20
Thanks,
~Nick Desaulniers
