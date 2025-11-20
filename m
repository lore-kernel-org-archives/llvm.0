Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEC2DF12F
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651671; cv=none; b=pVvJ4/dApIEiMyIQq+ydOKC0s/DpZq6iHWFqZu2nacBtadVBvu7wjSBfbh7sDr2aEbPgRPgSaGe0vwCSB33ph3NKFbCiTgCIIys3LvAuDNaFk5XUILck+t1xUSrFlkATa53cAXPRHp2l9eWHsL/TUBMm4DDm5ZlcjMyNZNirAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651671; c=relaxed/simple;
	bh=3Y89mJHosRaENaLb5tk2xkCy/Hd7qH1R9BEoKf0fV0w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULDXYnvZVgGBRWmogQwMt8/QfesbcexlDgbjJSbEY/EIWD9wf0MlCAAy+WrOLx5eKePoRKkmYYARWa6xjduA4yPa1yzqpJp8RB7cPxCFOhGzToEff3kQf7GpZ1qv9jrZXq8xeLWI0W0dvgfiZXSOXnOdmVDqJpXbefS5pw/DKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=doBEHpWp; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="doBEHpWp"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b73533b84eeso86576566b.3
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651609; x=1764256409; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kN628sGqwThlti0A3ZPE5fg7KLj/Ov6I/vXTKugeedg=;
        b=doBEHpWpXkWuhAzbvxTvS9ly3ifCR27qzfrxvEAqnmewOtqF9Geiuspvgb2tsl53vS
         f5OoIPqvh6I4CaR6cPYMt5xYkzPJwwNKB3axbhfHp3FH0xtAqf8I+AJeIlF1BBiinRoS
         RJ36KrYSeoVOVFiYC/ZKLLD/fh4t7w5mszBrlM8DgjDJqPsOpGrFDJeuTlRBq9dIa6Cd
         m7wSLjhuDPeftay0UuX++61gEdRGUYo16mliwIMZoUro+vvmkgGne43dyGvqVk5dEoYJ
         +pZYAbFieU61M3/T6wxllVfbuPo2xkrzpbUCIvLeRNYEQCeVjTYT2BrANxEgdrm6gkqS
         iUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651609; x=1764256409;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kN628sGqwThlti0A3ZPE5fg7KLj/Ov6I/vXTKugeedg=;
        b=i5Um3EiMCAO54uq7pv0q+64Vf5r2ikWv4r4FpMWdGSZVkNTFPrTyJQJSfhdf9Zxp1i
         PRAaUzRDrY1uslQVDMPUH48Qbc645n8AU0L8rbq/kSE1M2o5N+RTefpPux6U3mjcvnJh
         WIGftpjHJQFpnf7R23KGXbhCqUirK1QeWsbHI5jtUaMb1X1aaX/TyJTf3LNLaIJHeBwN
         OmFTWlA/z8zKfXZ9WjXVqLXZkVHNtN+i7XuN08NADJ4KN+j6MdASUH8E8XJl0Qq8GWvd
         gVFU4WraQVRHef0xSdD75mQf3LdWI1e+TS78omclN0vcyBBCYpRlB8Fkwz2rUkORzJDy
         E9zA==
X-Forwarded-Encrypted: i=1; AJvYcCUto/xMuC1TOOg97X5Cha21TrMQpdmW/eGDbE0yds8aRw+1cbdW5qXM4i5bCGk338aTC/eC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+iMFeVIPM+9TJH13zsiSEkXFq98RPR0y0gFkFy8GMUqYSxOBx
	0YEQwNaAgKwww5E/JODI0RkWv4x1AcuvyJ/qrOxTTlRyFqpgm8RHeOvzgOcckAWBfpKrSZBga8h
	iaA==
X-Google-Smtp-Source: AGHT+IGPQ40L++aTOvA8JIRy1kdoYShFPO1YhmYJSO3OkON5NZw8EMACaSNJB6l90jTWpiXg4l2yJf3kSw==
X-Received: from ejcwe11.prod.google.com ([2002:a17:907:d64b:b0:b72:63c8:2878])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:6a0d:b0:b76:23b0:7d6f
 with SMTP id a640c23a62f3a-b76554a515bmr362722666b.56.1763651608428; Thu, 20
 Nov 2025 07:13:28 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:50 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-26-elver@google.com>
Subject: [PATCH v4 25/35] compiler: Let data_race() imply disabled context analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Many patterns that involve data-racy accesses often deliberately ignore
normal synchronization rules to avoid taking a lock.

If we have a lock-guarded variable on which we do a lock-less data-racy
access, rather than having to write context_unsafe(data_race(..)),
simply make the data_race(..) macro imply context-unsafety. The
data_race() macro already denotes the intent that something subtly
unsafe is about to happen, so it should be clear enough as-is.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v2:
* New patch.
---
 include/linux/compiler.h    | 2 ++
 lib/test_context-analysis.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 5b45ea7dff3e..8ad1d4fd14e3 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -186,7 +186,9 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define data_race(expr)							\
 ({									\
 	__kcsan_disable_current();					\
+	disable_context_analysis();					\
 	__auto_type __v = (expr);					\
+	enable_context_analysis();					\
 	__kcsan_enable_current();					\
 	__v;								\
 })
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 522769c9586d..4612025a1065 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -92,6 +92,8 @@ static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data
 {
 	unsigned long flags;
 
+	data_race(d->counter++); /* no warning */
+
 	if (raw_spin_trylock_irq(&d->lock)) {
 		d->counter++;
 		raw_spin_unlock_irq(&d->lock);
-- 
2.52.0.rc1.455.g30608eb744-goog

