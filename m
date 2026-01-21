Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1046C43D51C;
	Wed, 21 Jan 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994005; cv=none; b=JfYPzRQD8itxf8brT9XgNewIG4riX9ANBGu5danp4G59TiyclSp4S0mPRf4Gee266SeCirXF2IrTG/neuqr8Bt+vEm8MYPYJczTr+NDhpb+ZHFeZxqv13XZietzHxKzlGBmXmokQdOC2CRaUatbFhGujDBvQ6Fgb/XFbQUnEu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994005; c=relaxed/simple;
	bh=XqwdFQXRBbSMjzmudyP0OeCw8k+8X3f2d9+Z7GOquXA=;
	h=Message-ID:Date:From:To:Cc:Subject; b=K281M+JjNXE+g5103MG/A/ojt78zODrc1aZJmH8sE0DGmnAJrCMhx4M4/x1dzna2YdMra7xTsQ5EB72Cbhs1OreaUpf543zGO1nuJH9CIzIOy/cbPSBjXnFai6uBy9i3fgbL7BRfC29w5SlnQS9bXksl/GXnWBWjWfj5yah83qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YiZLWPVv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YiZLWPVv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BaEeWrPNxLVUQ+V0YLyYJBpkU7M6Bo96bHJOCZGewog=; b=YiZLWPVvvcbpISsbuzxzBPj1l5
	yqVal+BXBBGXOMy/O8Dq6lZlICs0mK0E6ApUF5XG2R+vGr9dlnYACz+iou1h4QqPOoO73Fale9nEY
	sX77y1olQfebTuWqIzuQYMrTomkNclh5cRkaAi7SjOnxyT7JI/i+mFxDQi372a14qHR/b2ZWFfEtb
	yHXu39ckJX6oI7MIGUnZPNOVme3o/ut/g5ZD23ycX2LDTotkBNZw2WgZ/ghF34+u77KM9BrcFx2TA
	AxHyKsokctjH+DoFZc8K7rSCLDBTOCovuymZJKFOAtonDrThkw6elG0ykOk/0NTiZJoBKSIJ+p27p
	CI1G7kcg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW9E-0000000GGca-3tbn;
	Wed, 21 Jan 2026 11:13:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 8E7D0300756; Wed, 21 Jan 2026 12:13:10 +0100 (CET)
Message-ID: <20260121110704.221498346@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 21 Jan 2026 12:07:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: elver@google.com
Cc: linux-kernel@vger.kernel.org,
 bigeasy@linutronix.de,
 peterz@infradead.org,
 mingo@kernel.org,
 tglx@linutronix.de,
 will@kernel.org,
 boqun.feng@gmail.com,
 longman@redhat.com,
 hch@lst.de,
 rostedt@goodmis.org,
 bvanassche@acm.org,
 llvm@lists.linux.dev
Subject: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hai

This is on top of tip/locking/core with these patches on:

  https://lkml.kernel.org/r/20260119094029.1344361-1-elver@google.com

and converts mutex, rtmutex, ww_mutex and futex to use the new context analysis
bits.

There is one snafu:

ww_mutex_set_context_fastpath()'s data_race() usage doesn't stop the compiler
from complaining when building a defconfig+PREEMPT_RT+LOCKDEP build:

../kernel/locking/ww_mutex.h:439:24: error: calling function '__ww_mutex_has_waiters' requires holding raw_spinlock 'lock->base.rtmutex.wait_lock' exclusively [-Werror,-Wthread-safety-analysis]
  439 |         if (likely(!data_race(__ww_mutex_has_waiters(&lock->base))))
      |                               ^
1 error generated.


