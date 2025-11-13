Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AA2C11F0
	for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044247; cv=none; b=OpHsNSKpJ5FlzqLakwc44cM05mC7ratOk5IzHgpGs036FKCBkREd2Tsm/G+yGbIZcOpuWdDUOpcU6WFuJL4hKHKevp3ow9rmhMQzS1gnb7QE4Bfigs3KWGP0JJu+k0zC7oFXWIrkmifSR6e4KRpPrB+MQIs9dJcBQeuUPIZdLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044247; c=relaxed/simple;
	bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MS4c+uiHarLVnmRFGCGDBzFl4jIwvnE8NZeHUB+M5mInfKFez+5lnTttLy5clNvIRcZYz6Cj5kafiWDCz3qBeC1gD5uTFZnYMeK1yWGS2CI3Z2sVNyCCp1XXhTaCN9VHfzapu02Kw8uMIXZgEwMQsLRRXNntsC+89f63kvu6jSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUVkF2VE; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUVkF2VE"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo842095b3a.2
        for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763044245; x=1763649045; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
        b=jUVkF2VE0jgy6vhQKtDbIZMGgeiTkp6E2nRUhUhxj++R3HbrWpHqyGGuev69muqQOs
         AvghR8oUgDlFlM7CnttpId425ILqOAh3XfikNrZkgyQIK1NuJvvyX+kAlUWePR6KvcmX
         CBB0VrE0D4qfhy3dwXe7ddcyWi6maWtpQ2gXqFDHRpjEW1uI14LIiCyVmd9u+nsQTSna
         k9B5lNwCLMWTOUAPjXwZSfQlIg9ezwRj82bmweZwI61H/vDBJLVnfADpdWFb2kC3lYGR
         ku3jVSNkDXVbHZD9qIHgiqVPo8MYTQj/c06mIwocQ/taLTjhjCQD0EWxVBCDdUv/pCAz
         JJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044245; x=1763649045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
        b=QUdITtMTyqKvFA3xU3ez0MYDdeMEtaP47PpmXXK/KXkQJDUoYjr1CxwGjB8Y0iB0Wz
         IJ0KgEMMOazkf1wLEyauarXKf6Q7qAvQJgGW2izTmCxoaYPIYlD53wmZ3QEEX0zqBjKV
         z4UXjJctgzAsUr1wcMUev/4mWvYIfx3kGe9KcalSxIWqOc93Ft8enrSE+Xqk+0u0vrwO
         ThCp5S4/tqiBLFshrZDPAY9RmrKC0As46okD4+A7hmEuHNj05YNg1wcZPz4hqKdB25Ho
         CrMOxS/0g5wAI3IGkcVQbAF9drVuinFWRAuwkHjPUEuzZNuxuFwxRlnC9lPv4QZ3i5WQ
         LXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVqauRR3sJOsNEpH0KPiapa54c7RIjBfsFg2febGcGmYnvB7NzA04dRiceRULEGpGOmpvsQ@lists.linux.dev
X-Gm-Message-State: AOJu0YybhjqQrbJjJiAZe0Zw0XU48ShbynbIf/6dfLH5kspKhU0gcVBB
	RLjBko4Kn0lFB5dhcArhUL1Y3jTfdWNdd9QFzLYIi19OYAGhxJ08rob/1ijaFQ0j4fbIFCId4ED
	RXuZwiqEBQ8txTba2B62peiN28MFP+U4T3orhnOBS
X-Gm-Gg: ASbGncupZEZvjM4uqCKbi857gtM+XajXtORfVV+dJ5ScEO5dIo73TGF3WXL6E5ei1CW
	Cl60F7Ssp2jbAbeZQoRVetNbq49qppv9tifdDfn97iDYJKP3Ne6CpTxZn0anwIST2Tm0XLU4d7e
	um3XLB9NXIXRwy3PBw8V2nUQdQ2fvAKhNCLdTPUPSu1xBBeW7KWz65YN4OYKO5PSbXEFJS3K6fT
	fYrLYQU/IOZopAevC572FXh2TmMlnC92hBY1FWAZbS2ee01rwd5oUpPk4AJoNkRFw3980wI6fwm
	oe2Ues+fXUlpLlydmkcamFw=
X-Google-Smtp-Source: AGHT+IFnNFIlMm9/L/bcyHMVah+51vkdm0T/jdjxqhLQ7LFy8/zaHzLzvotK4qxuC0MECLmidBODybpZNRr9UFx4Cuk=
X-Received: by 2002:a17:903:fa7:b0:294:f6b4:9a42 with SMTP id
 d9443c01a7336-2984ed2b5edmr67173465ad.9.1763044244630; Thu, 13 Nov 2025
 06:30:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com> <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
 <aM0eAk12fWsr9ZnV@elver.google.com>
In-Reply-To: <aM0eAk12fWsr9ZnV@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 13 Nov 2025 15:30:08 +0100
X-Gm-Features: AWmQ_bmFh2aVYHZwkaHdVYkb7IeD9B_c5E9TrUEhRxSr8kO14B_rxSCEK8GKI2o
Message-ID: <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 11:10, Marco Elver <elver@google.com> wrote:
[..]
> I went with "context guard" to refer to the objects themselves, as that
> doesn't look too odd. It does match the concept of "guard" in
> <linux/cleanup.h>.
>
> See second attempt below.
[..]

I finally got around baking this into a renamed series, that now calls
it "Context Analysis" - here's a preview:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/dev

As for when we should give this v4 another try: I'm 50/50 on sending
this now vs. waiting for final Clang 22 to be released (~March 2026).

Preferences?
