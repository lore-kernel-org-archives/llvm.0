Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC94B28D850
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810895; cv=pass; b=RP0yZdwGXtMsNem5aNR6JOd/+Kj8FgIKHxFqwuANBhzzm6N5sYYBEP4bbB8++yJQoI3c5myX+4+4FGzigpOrbwp3FV6GyLye+TRXkG+nYxDHw61RVFKa5OD7pMpLSMYP6wiloi4NT49g39TM/w+iK+ve3aA7kJBTGc0Gdq5teVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810895; c=relaxed/simple;
	bh=3jV60Wnes7P6XTV1ZMaNT8OJGc4hqFFRtPY2mSniCDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozJXWihgaQShDJZbJ8dGOstCcxq2Q6/jIHCe8SOAc6N1JDpKWZtAoNbgJtKItKKnbnENBOJtX8E31Jx7nKAHoLwlJbOjcNol5ecaXPauMneX/rI/FUjtoz/DjnxfHQfUxYR0zgbEJ/Hcvi3Op0ABBVh2pXgzjpExBDX15U5imn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPLUatUO; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPLUatUO"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba716126f5so191851eec.3
        for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 03:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770810894; cv=none;
        d=google.com; s=arc-20240605;
        b=ffqStT8kGeKfIMkMvnmioqLrqqxRSDY+oYpCkNo8+iTJkMKCJInRXwsxMKtrxVNbEz
         +YdA0UsKyjdfqqyzGw0FrQSF7D3MqIAmfB3jWOjNzUEpFMD2gidvANwsBtesJfZ1oNVx
         QCHPTVjd/ttf0EgD2TP1MwReEJDmn+56SumP6rb2ts15JbaZjmpls8uQHIjR8yWoNG8C
         4DWUg5dXVsScj4Uv4LjW9biu2ALa64LzOuehn7SRvGbv+x26bsAq9vC1+Pek+9Xlckkb
         WDWX6EqVoPvPymTzxf6VVH6/UqFuXTMTr0NqELZ4T3wbPeufSVyWmbTZ1ZCx69x906Ka
         8odA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3jV60Wnes7P6XTV1ZMaNT8OJGc4hqFFRtPY2mSniCDI=;
        fh=2pE3bDvf6yyJOOjTqFUcbsq8/5VZ3Xti4ceppF5eQbE=;
        b=V/Ea3TlL0ZZurvZjmHiaeoJ1Qxdpw+n/u+celCAEIteFr8aaDUzS0j5GxEm+nLgDxk
         FrPyQbsjTcAq43KmDMA/jqOfqWtcTIDvExxpCD/+aeonEl5emDkKsdNxAWe6IBuRBkFH
         XRO1CcwYbqhHeyAsn4Ycnex9Dy+Z2eGujy7pU2aF2rXQDzvxix7mqeGCUrvL4beMD5zJ
         L49Ld+Zb95wmFxvwcWtQNYY2Aj3GBkiBm9k8Q11e/B9Kun73hJdkVWav1pmFFV8jyKIf
         RnwMFPZo3i5RVWfB1o8xrecYoc2lwKuwpDkuvN8Zr4uKSmwO2utOosNENJV7mxDSeNoN
         nc6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770810894; x=1771415694; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jV60Wnes7P6XTV1ZMaNT8OJGc4hqFFRtPY2mSniCDI=;
        b=SPLUatUOOqT+1KIiEprfgQNhkVWl2bRLI43Esy1I8ZOmZV1xw9sclshwQ4L0k/Xv9Q
         fqtR1vZns5GqcdHCYfSQkT9qAYR6rMkeyJDEtcowIstNzf04Ac+ojU4IUJ5q4siMczk9
         pMp31ZYwCG8uN4vId+2JQZCh4WJEAOD5HSVqXicQQ714WptMsfkSo64pLfHKv7XWIpSo
         rmyX/Ssv9wKps7nBoVJOygRKJ8EndDVU1T34y+jaqB/v3dttqfYiQWCOGtJREbkRWVpF
         a3Nzs+DrHOdN3lWyT8Bhzv59BACAkOPME6FM6sBlRRxr+byYakV/6eog3e8VQBFalc0X
         kM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810894; x=1771415694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3jV60Wnes7P6XTV1ZMaNT8OJGc4hqFFRtPY2mSniCDI=;
        b=T6aR19UpiXn0hlyUT2pe3kR3hQQtesftAWXsWCBpjKVQh+PwSkQCd1SqIiRWNRB6Hq
         X33ZEkYqXWSOrfAws2yAP+Adp+nfuID4Alx1NGK4Lgu/ojDFD4OCoDaecd5l8IxBJ4Z3
         z3N1rfyhu0MjmyNaTt/APhuvr0ltHBOWDgkczScXsjuCW64qTqCX2B6BIlfZE4z3BmqG
         qhJeQMC6ukteT/g32DkJTDM/Cdqz2MsL7KlXcwtOm5G81TLlGOIkKqHruMb9KHe8OHIY
         4+7mADakrnP5ujxr1lM7918oCsV9u6J2nwlBCwfXhBEZxnHbK8sz1+MPJvPHotxIrWlr
         jL6A==
X-Forwarded-Encrypted: i=1; AJvYcCWQAmQu7XbMY0w1Ko6h+739b/+YRHpGQFJfco/QHLqSzAoLOHLb/gmgL1Z+NoY7pGwnnuyf@lists.linux.dev
X-Gm-Message-State: AOJu0YwJTnRE8wc4ipOaeJJplHwin1mLmI19YzejB5exmVOOlxIBd0XC
	I7LIzX+gQWt77oKFBccg10PRUdDJ+KDt3H/F4bGHc6ckwjh2XUvXiunjKnTAGJ3MrH9oaTaXEML
	tzKQKBmO2gnf4vpYk16utPLzFhcIpmPc=
X-Gm-Gg: AZuq6aIg+2rhf1d4ZsG/3aHQRMsdBnC0xXi8UQQPcPT9gOsSIawQecHCrQ1ekFYo717
	ZXl9MCa3uNY1gUvMj+jfNDEpAwLslXtaHf1IpzvvACeMCsFgy/RGMnmUcBF9u9FOGW7YE+09iwI
	3MCpE+0CzUmmItU3zn6U8YbQqYtpePu+W5JTkLh2orHQXr8fE8aBfW8TvKEEbw7nfMWJ4CfZs8n
	JdA7h+QrxxvxrtnTBUa5VoZf9Gmg/KlUHtG0DX8MGWeMvgU9Ulz9T2z1KCFLUYfhmKhOF0E47ko
	4ZM1hzNQcTgWKWc1kfdodpv5IN0NWxLDs6KFGdKWrNZ5/KrTymESenAvcJgh40/wg9C2Y098g7K
	4ozeBo/rGQ42jIMWtK722LUgR
X-Received: by 2002:a05:7300:7c12:b0:2ba:8204:3f81 with SMTP id
 5a478bee46e88-2ba9e1b736amr306211eec.9.1770810893642; Wed, 11 Feb 2026
 03:54:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aYhfK3tB0X6Y_GyV@gmail.com> <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
In-Reply-To: <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 12:54:40 +0100
X-Gm-Features: AZwV_Qid7s3zDtR84im77Pj5S1Nkj_dHFNPrRAcM8wSGnFCoodd4INgp0-Ozftk
Message-ID: <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
To: Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Bart Van Assche <bvanassche@acm.org>, 
	Aaron Ballman <aaron@aaronballman.com>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:59=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
>
> I recall there was a CI system that did this, but lost track of what's
> the latest.

I think you may be referring to
https://github.com/ClangBuiltLinux/continuous-integration2.

By the way, some time ago I asked Aaron (Cc'd) whether we could get
the kernel into upstream LLVM's CI system, i.e. to at least build a
minimal kernel configuration of a fixed, tagged release for one or two
architectures. Would that help you?

(I also suggested Jose (Cc'd) the same, for GCC.)

The idea is that it helps both sides. It serves to catch issues very
early on (including with subtle things like diagnostics), and thus
avoids having to play catch up later to fix them (compiler) and/or
workaround them (kernel) in either side.

To be clear, this wouldn't replace the other CIs that run out of tree,
like Nathan's and the tests I do for Rust stuff etc., i.e. it is not
about catching every compiler issue or testing the kernel as a
product.

For context, this all happened because I asked the same to upstream
Rust and it was a success there. In that case, the goal was to catch
issues early with the unstable features we use, but it helps with
other things too, and thus I think it would help just the same for
Clang and GCC. So far, we only got pinged a few times, so it has not
been a lot of work, and it did catch a couple issues (which sometimes
may end with a preemptive kernel patch or fixing the upstream PR).

We also did it for upstream `bindgen`, and hopefully it will happen
for `rustc_codegen_gcc` (currently we have an out-of-tree one) and GCC
Rust eventually.

Anyway, this is a bit of a tangent, but I thought I could raise it up
again and see what comes out of it...

Cheers,
Miguel
