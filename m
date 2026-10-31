Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445050;
	b=MPGgvTbMv3lQHTWCof5vnyJdusssAfXWPwg0caf9sXCAnrNPRDO7wRaWkkff9tniTO/o
	 /B2DIsrX7H9wXOSLciTX/euYzY2CU/d9DUbbLrTcoR04pXl5TUcXXi61u2frQrs1LvUHL
	 EG44SQTZsJGq5/+PviJIFTjvYgmFHbDGE+IQXTSdqs5fZUJBr9ZqEdXyHcgUZ/EngiWfD
	 EbNkI119Pw58ueGGTLB2j6v8ZqatVhad6O7zE7zrvpl7joY+DVROkqiWnr1K0b4jUmgrA
	 KRP0yTjEMjm448fI099K8jbGsBky9u4fJZaP4cVE3YqDMqgXminMa8ncmHYmlZwazFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
	b=rVlLZPlZXJWI5fKPBhNRzIivbK+1BMAociTlontNnAqQwCe7xA42d62KSuIyu13El5Ft
	 vY2UmxKbKJpJIusy12/JcrndHfqlYirFl21Fc9GxzIgLVjJxSKCxXsmTIVPsp+62yn55J
	 Qsu+gFHvYdDW28DHREQQXmqrTTahvpviGwvjlBl8dakLRYLAGey6bRybY2R29pcDS9TWL
	 LhpTFKGFgp/DwDjGduyovtnmTkICaLzF31RV7WNB/1g96BMZg5HWVi8d6gqbQRn8artMy
	 aQnlaJnqbZnIyQYXZfXT+J8HhZ2jwgsTwUkF5QmgP6l36yqjkWMuEIutSmuAY2G8JRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYlqZo80;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7D606A31E
	for <llvm@lists.linux.dev>; Sat, 31 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYlqZo80
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso13569985e9.1
        for <llvm@lists.linux.dev>; Sat, 31 Oct 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793445049; x=1794049849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=PYlqZo80mLE55wXIKQFUeEuSRkmB9jinwsibz27378ySnKFLRXmDf8WqQByktYMPaY
         yMJ1tL81R74512rMvKjK7X0tPRr7Y0c7Bi4L8M+Ih2ncLez2BztDL/5T9KVq7pvcjax6
         65sRdA0svUQqOMmY0rOjLZREKMmTyjMeFQz1thSFEsV+BqRifN9101rD5XoWwon/wfTL
         n2ys8NjvMmhK8+tO2bCFmc57xT9l96g+t+XnZC0R5VL/B4TPlVV62/Vss24kiizD4H3m
         jyIkubCvoPLwNfLgNlG5TlXUE9FKmlcwmIBx85DD2PKEIQ3/YTfUQcDWypoyrA/EBFAb
         1VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445049; x=1794049849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=11puEc5sVw7t/XNxNG0daBR4cH2CAKrZkjRFsyXTrzpJoUJIjjtdaK1gizjWyP3MMA
         S1wlB95tmioQYMThvJ9t66nFqtQKiUxQvBKO2xewELctpv06ec5GTQw5crmAH5BcM8MD
         SuF4EGeZ8VW2gjBGvZjiHYDXRRmxigid2B7jgbW+motC1wmy1Kyp5U3a5krq+pn1cP8D
         1aaKlOz7TuS06O60KlMjWmEhr7gmOPlzg7h8aiDWqrLqtFNJIQe4ZJcvDtiSbm6DWdN4
         +YMjYxDJEElkBldjok3vqgRZJiscDPNVFaOHiS4hZzlmDsif6PpTYTSoqzuI1X+3UyrJ
         CNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBytwRTsJAK0iNAgQg4f38tiihznOwwlnMKXwNPrn3l/r2rMJgS5lZr1ABBHazUqDnC4lTd3@lists.linux.dev
X-Gm-Message-State: AFq9FYJZv2nvXee8e1A1FsrOdd3ASRSrTkeYMPZm6sty2ORHZdllc9wx
	3jQ3eYgEyTQd+72+UF89+aALkITviC+EKmrR9wP513m6cNcVTQ5oBnn/
X-Gm-Gg: AYBFou20Z0SKM8NOcH1WpasHXZLRXG1BkirHWmdasSPGtEyv2voasC0ln7gwAZhYHrc
	vouBusWZ4/dFdFe6ZHeOSqSYjZW5xsuStzxCQ7VOBhZLvn6giQwHy2e3BtfyBigm0H8i5JqXo8K
	wdhKKvf7isymRwmuMZmcRj0u5mtfBZ81ECKRUqahbbMpVhaST1ZhXcZCKzTk/LT0DI9cFqsQFTe
	p5tjnkTfkDGgIblNLGVQox+sBcpZIFuMh+YEHeApzOnd724fjIkrTEXkm1SXb88mgsK7yW61r88
	XYJJhjIsVI/q58kvXSKElP/nyEqjmEk55d7lc3ub5JUYYiM0RnGzoC4hfEQ8oSj4ZwC3Jq2BUfV
	oxbh/Ks+XW2B0+d2bB9T+NkkTnRCN6rQktE6vmzaEjnSr33dcdmi5feGtHeqKipg78qGgrkSiLC
	fHrgPjSUnCY8q7RNZwr+qAUeYw+lZ6QJhPUaTxRSTPwosfbi0HcCn123CVUdLOr81QNZXnNpYY8
	pzxc2r3drK3C+doXD8IOg4BqFRCHoFahUcs0WjoCclCebHoHcuDcN6toBDGYJpKzq5hNU5KrcFs
	5nnoarB7AKSW5bPXCVtqjMCQ5jDmDMUiPHDT3OApootsNRdj+N9O2VCKQpaO0Cll+84r6NOSTLV
	CztT6mhUgOiGDqBkeZzqhk/8zfuY4XFqdf/HUEvEWP6mFT3WIi8tx/GIm7vQasSP3jAyukWza2U
	IQUlqTMVfDwLHhAJ3q8Ty303qrQ5ye
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr117500995e9.4.1793445048512;
        Sat, 31 Oct 2026 04:10:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm117315545e9.8.2026.10.31.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:10:47 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:10:45 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Hongyan Xia <hongyan.xia@transsion.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from
 raw updates
Message-ID: <auXLfz6mFh_uOvRr@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-4-kmehltretter@gmail.com>
 <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029093219.GH1779021@noisy.programming.kicks-ass.net>

On Thu, Oct 29, 2026 at 10:32:19AM +0100, Peter Zijlstra wrote:
> Urgh, so much crazy.
> 
> So WARNs in noinstr code are 'fine'. That is, they should not happen, if
> they do, bad things have happened and we need the warning out ASAP, if
> it takes the machine down, too bad. See the
> instrumentation_{begin,end}() markers in x86 asm/bug.h.
> 
> But yes, the tracing needs to go. But moving that around should not be
> this ugly and also, that will give you the opportunity to fix
> preempt_{en,dis}able_notrace(), since they currently also skip the bound
> checks.

Yes, that's a good direction.

I checked the call chain and DEBUG_LOCKS_WARN_ON() is already fine in
noinstr. arm64 just needs __always_inline on preempt_count() and
should_resched() so Clang doesn't outline them.

I will work on that.

Thanks,
Karl
