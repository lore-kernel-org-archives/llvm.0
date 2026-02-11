Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15A36A02F
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807575; cv=pass; b=tL+MDH+N6Bjw0fAB+dJ+DVHPUtgnAsxoXZXfvdWPeph3Uz1d0vtKUT3fQBy3LvElNlYKMMghIGs62OhvFK/zZxvwPCgyA8Mw8vMVT/2x8s+PjExlmL/z5ChPHZ1hJ79qBd7wdXDmc8yhQRnCgG8CoJOP+Dyev6EG7TDAzzEW5zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807575; c=relaxed/simple;
	bh=dJD8+7O1m1UnRE7Nih3CmT9aLuOgfLG7Ag9XDO/BEX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szGwz5wjb/o9XoqCjUp0ZQ0z/H9iVBb7Pg6gJzHSVTaIwBYUaU8egMxccbOQmT4p/QUkPvKptL6nqJmNo/bexs5R6HRwQHhMZJFO4jiBRJrHkQdIxsBaypRaouPsMSzKQYFQsYkgOMI6zDNMQ/sceU+IgBKho9zXn959ZsNuupI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wbjOJX7X; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wbjOJX7X"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12713e56abdso510366c88.1
        for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 02:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770807573; cv=none;
        d=google.com; s=arc-20240605;
        b=CDHxwWBIVet/FmzJoXswm9IWzZe58tSyUeDT49cvW6J2fqRMoYxumdtQUgYB5VOwh0
         TOWo4Z2wDNqgQZltF6oFDNX4MShmoq+MTZa2wJl7w68HgkBQDmbUnwH89qLz76MzvexQ
         8eDB9SuySkcBW5pHKQkgX7+li0/IrazqjScaobYFYMXoGsEm7dVybZHwKKhYfKMr/eQ1
         i5nSNzlRsItuBuuhm+XtMfABGsiKGdceXcGUq4W1T/ZVUcKGBrmuvj//4WsNQSnoTNiA
         5C/CZjhxD3AIpb171KUpGBOpm7TDjXDm7yDjajwsHVSM8C92C4MbnCUOGwf0E3U9obK3
         IqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dJD8+7O1m1UnRE7Nih3CmT9aLuOgfLG7Ag9XDO/BEX0=;
        fh=6uaIcfdUlcqgdcoBIrI7/MCsskYWfkLVn/v8I0pSZqE=;
        b=JUERxp6BTezv0OOQt/RFWw0oVYcNRm/+SCvNHqtdSgiQZ3h3+U0J3VF+5/xmCcLEMH
         xZZrZyoOboULen4vIM23FH+O94p3CA9O09bJkLGH4iFnc1Ika/CzGREMTmvoxC2WziiP
         pwFvuO1mxl9+Szw4SifXg++Uj3xMYboKadBjpPShXsNBm3FTDvj3joSfzhEV0mSPdq3E
         ogUF1ut85Vp7+cHuZPoJbQIADlW4GJbWx5FgOGQJAuweFt634Cuiwuwx8FqYa2Sgp3TP
         i3H6rIfnDCb3U8FuPBX3JqxGZfElm4r4vFBVrVQuNsVLgtwlOxmQXgnaVKvf717XLKZk
         SfkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770807573; x=1771412373; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dJD8+7O1m1UnRE7Nih3CmT9aLuOgfLG7Ag9XDO/BEX0=;
        b=wbjOJX7XtydWu0K5GV1+h0EeOKk5W430vMnYam7I12r5NOgBc8SI2nm66Z4kY1B28O
         fq66vdh/u8z/93HkQDt0qNNXZu7DNxo3cAsn4SE53zxccBX3iiRf2roFHz88orokJOkj
         5hWSqngjyeqjFkIcsI1vsOXjzOMCX5tCJ2i0idQsqCw0HCJXhnKpjjRDFf2APEp4cXZr
         IPM0Z5yYhOqptcqwKjA6/NEmZOubEa4KQ+SvSKmO4bFUkoAYOL7egbTvdf+fzG9HL1cN
         2FnTfuGt0fFbuFnZsw/7lBAikNFKUri6sz8z7qsJGF7vYOFIj9Ypn/zaD3e7GQBJej3q
         l1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807573; x=1771412373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJD8+7O1m1UnRE7Nih3CmT9aLuOgfLG7Ag9XDO/BEX0=;
        b=WKZpBxdrKvXvwbVqKCVkJfbEXD+XlHb5uYsD04UmjHyUPaKz+ei8ZcsI8zWvPhs50U
         ZWKWAliOXaVdl7NoOT6BPl+GQr8xfstBgJ6+OdA6VQYHnijaNuUK5D/MHEbRJpqvCTvX
         7kwbVD9Hpb4Cet9zYek/SKdn/+NxxpRVVrcutVYFb2KkyKBQb6xlCL7+shctip23aYeh
         DJ4Y9+//9bY5bqLhWyeGwDK18t8Ec64/gV8swO/SEzm7YTIAMoSzxpUURXyQwYMZRFO1
         sI72IJYfjewJFrsXFurzZ68Oi7kIKTWRS60k643Do2D+Vqaut8FeIembZE1VmoeIdrwT
         zZQg==
X-Gm-Message-State: AOJu0YzD4uJgM9T7CBTm1nJyFEF0f345urdsV6TGB2lb/b8DGTS0hnXF
	tRShdmVYiuU6xoKtmrEvAhmefemEAN76/gmE+pUkh9UEGrU+glhczCCa6uPSxY0ZW5a5f4Z+LWH
	o4XbiZhSPMxhsJXzNwbtygJzY0dg2vm4YNvFWPxNB
X-Gm-Gg: AZuq6aJcJlC3lEPaj+Vs85lcbfwW3k8eGyXy5x0uz0Zwh8AjqcZxWvNF6a1DzPwP4wY
	BjBOO/0JxZuDyEENgf8QiJSPmHUV7PsOWyT6fiqANsYpEN0i2dlAJ2CoxwxBHjWd7S0EznoCwMU
	SCWq+LMYZNXqp+XiwlVKbUpefhuBqqPs8M+nvG7kc1J2m92DPewkHbfDue7hCzu41AI/JI51UA4
	gx6d4zRugJi/VTBwaB30A4Gofc0HeJm+0IJl1gV299OLXIJn21yAClP1S6B5fpjSgdGdKYLfQsq
	Kz/bsSE4PRCUVMQqOhvwqQHG/z9yj0a+1D4ZrDY=
X-Received: by 2002:a05:7022:691:b0:11b:b471:dc8d with SMTP id
 a92af1059eb24-12723e9e8afmr1996532c88.2.1770807572688; Wed, 11 Feb 2026
 02:59:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aYhfK3tB0X6Y_GyV@gmail.com> <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
In-Reply-To: <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Feb 2026 11:58:55 +0100
X-Gm-Features: AZwV_QinRNdChVTHpOoDmNUIlY5KdYUx2fC3AI7Kh4AWHktjvtlhTPMushv1xfs
Message-ID: <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
Subject: Clang/LLVM 'main' regression testing and -Wthread-safety
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

See below - Clang's -Wthread-safety support was merged.

I'm not too familiar with ClangBuiltLinux testing and regression
testing setups; but I wanted to check if LLVM 'main' is being
continuously tested somewhere? I know the Intel test robot takes a
~1-2 week old snapshot of LLVM 'main' and tests that.

Basically I want to ensure that we're able to catch -Wthread-safety
regressions on the Clang side that affect the kernel. While I've been
adding more and more tests to the LLVM repo for the rather special
patterns we decided to use in the kernel to make Context Analysis
work, maybe some slipped through the cracks.

E.g. I've been reviewing
https://github.com/llvm/llvm-project/pull/178952 and tested it, too,
I'm only 99% certain that PR is ok -- being able to quickly catch a
newly introduced issue before waiting for the Intel test robot to
start spamming us would be good.

I recall there was a CI system that did this, but lost track of what's
the latest.

Thanks,
-- Marco

---------- Forwarded message ---------
From: <pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 at 23:05
Subject: Re: [GIT PULL] locking updates for v6.20
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
Borislav Petkov <bp@alien8.de>, Uros Bizjak <ubizjak@gmail.com>,
Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Gary Guo
<gary@garyguo.net>, Oleg Nesterov <oleg@redhat.com>, Marco Elver
<elver@google.com>


The pull request you sent on Sun, 8 Feb 2026 11:02:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2026-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0923fd0419a1a2c8846e15deacac11b619e996d9

Thank you!

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
