Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236E288C3F
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000861; cv=none; b=gmMkAaNZwpHkXax2bRuPkOBoAC2crjhboKO08/BiRvUysSf6Gg6/Cfyml7TblbvxUdj9Ly5c1xcYdtNELBuAs4WS+z5YEmHwa0D0rnXNDsTK997axgyLK60+P1HnVuIP27ex+OXaNTNEmITH7Ojh5jef9KjDnyE7vQDjFnG0mCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000861; c=relaxed/simple;
	bh=/He7XkJuMD2GHxpy8ngilXXjP86qi/hHg6QMOo5hvwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwV0Mq7QS7zoC2tgrmYZvwX4lDyXxn51JBr+I9EnL+fToE6ZDFA8dcoIXdsJxr5IUWxZVR0tdYDDC7qx4uAs2w/q5IBPcT4L17ddzOmObb13FMm5x4SE8MI0CHmb0ah2pibJZko0KiehQiflzLgZRr+McQxjLsKlXPSZacutMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOwye2+M; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOwye2+M"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso47696545e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 05:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769000855; x=1769605655; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+18IqaYiahx1d0Sw+3yYUAKVk+CC0tUKgi49oNi4j+c=;
        b=hOwye2+Ms1O3xnNuH5IDQ36X0SXHKnt1fdR3xvuZwj0oMGDCoUpaVYeSyxpXQbuTj9
         1Vb0swbbqQeO2zWcm/HPSmiO0NuBY8Bb+NGaYHBa7E/Rj7kEMHE8pInhPUdnE618zUjm
         FD+YqsypW26Yn8RfT5KoHhrtG5rF3zSMI82k2TNeQnxsWdCHL+uTElEiWXQjL8EAEpJC
         0DNpHywJnwlj54MXwAriMUSlm2a4S/2ELVKe6tMxsoVYo9QO5r61jfUR4Af18r7nak6d
         D6aCCH2e6rl9UEMwaABPTXTab9AP/rvVtW70L4bb0lOHk6D47t0g9qs7aPSCV7oLGnIM
         bIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000855; x=1769605655;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+18IqaYiahx1d0Sw+3yYUAKVk+CC0tUKgi49oNi4j+c=;
        b=RbxpXYH00NoEoJ1mBMg+EC8LaHbq9e2c0zb2aq1moJs7n7XJiI/zpbDXky6w4e6xBm
         OPachrQd8fgSkFrTrEcXt4N7B//GzWFjM66nxjeEqp65vG9oGJb5DfGdTBYmce0xlqd6
         MSK0OvB6awlV7T2D6oc+ijPw4nswwnF+wDO0HpthFRJAlXKGmxnxJAZSh/OR8U90x0t9
         cAFRq/5iJUGaqfoyGq+HXnvGhYRGIQ3NeACzW4ViKM9GiBRshSISRq55S3zZBMVNbVnF
         68JUCum54K9LspMCN/Kdkf1yMJ4/UZ69fOQGgCFZd2syqBjtP8YWmlEJ/kQtQKetw5po
         +gRg==
X-Forwarded-Encrypted: i=1; AJvYcCXTquZ7AgZxB1iDivFSQqsmBrGqCSuBGJPxz1gO4XpEzG1XCe2wBz8n1AA6flN2D4ovjT1S@lists.linux.dev
X-Gm-Message-State: AOJu0YxgNd7RjaSsuCXWwQxhlg0akJpqq3yXQk+hVU8P6QkIi3pDrjGu
	sKnDkNjmRLy/e+i4Hpl6HdaYd7cGbmMSrUvDW3BFJM2phtqDo5LkLgFaNc98pgNctA==
X-Gm-Gg: AZuq6aKLF8gDewaxNHFffLBdHOUx+Qa4IAznKoL12stmLkwo9QmZ/LymmISjLuq4Hgu
	8CmfcgVTf2xR74eE77lFSfc3TEwmX2v49hs2ZSlepN3935D9Oo+UziBCT6ximgKeOHHdJ7PHLtm
	5QxYzoNmhZ02CHNzTMZ4pdPHAb+Q1vTnbjupOCWeSJTMqTfWn2VvoPmmXekpVzDB4MCPOEjx4Nm
	dws+p8+GmobGRKUks1WzfDJbFKw2WoamvsImEqL4JHL/sWWH//JbeN1f7RmM4VtR+sfXNC2a58M
	x0/GgL5xEdr1ReS9DCH9EB1hbGiJLyHBxJht2tyhQf8ekcnYfutEAwqnH7rAsSJcKrHl/3K34uM
	1gIdUuu5PbIikugPOiRBhmlNgcQPy9INyxUtbeQjdSFx8LZGFFabh/7JzPaH/16CYNDRLreZQcp
	4g6BZkM6K9IiHxmt097elBxrCUyyMm7NLY2TfDMNC8IXU6oPY01W02Fa1lMTA=
X-Received: by 2002:a05:600c:4586:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-48026040621mr166827695e9.23.1769000855326;
        Wed, 21 Jan 2026 05:07:35 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:2bba:cbd4:de42:72d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm307957095e9.12.2026.01.21.05.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:07:34 -0800 (PST)
Date: Wed, 21 Jan 2026 14:07:28 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
	tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
	longman@redhat.com, hch@lst.de, rostedt@goodmis.org,
	bvanassche@acm.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <aXDPkGmsSKuhFyOS@elver.google.com>
References: <20260121110704.221498346@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121110704.221498346@infradead.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Wed, Jan 21, 2026 at 12:07PM +0100, Peter Zijlstra wrote:
> Hai
> 
> This is on top of tip/locking/core with these patches on:
> 
>   https://lkml.kernel.org/r/20260119094029.1344361-1-elver@google.com
> 
> and converts mutex, rtmutex, ww_mutex and futex to use the new context analysis
> bits.
> 
> There is one snafu:
> 
> ww_mutex_set_context_fastpath()'s data_race() usage doesn't stop the compiler
> from complaining when building a defconfig+PREEMPT_RT+LOCKDEP build:
> 
> ../kernel/locking/ww_mutex.h:439:24: error: calling function '__ww_mutex_has_waiters' requires holding raw_spinlock 'lock->base.rtmutex.wait_lock' exclusively [-Werror,-Wthread-safety-analysis]
>   439 |         if (likely(!data_race(__ww_mutex_has_waiters(&lock->base))))
>       |                               ^
> 1 error generated.

This works:

diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 73eed6b7f24e..561e2475954d 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -436,7 +436,8 @@ ww_mutex_set_context_fastpath(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
 	 * __ww_mutex_add_waiter() and makes sure we either observe ww->ctx
 	 * and/or !empty list.
 	 */
-	if (likely(!data_race(__ww_mutex_has_waiters(&lock->base))))
+	bool has_waiters = data_race(__ww_mutex_has_waiters(&lock->base));
+	if (likely(!has_waiters))
 		return;
 
 	/*


It appears that the _Pragma are ignored when the expression is inside
__builtin_expect(...). That's a bit inconvenient.

Another option is this given its exclusively used without holding this
lock:

diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 73eed6b7f24e..45a9c394fe91 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -71,7 +71,7 @@ __ww_mutex_owner(struct mutex *lock)
 }
 
 static inline bool
-__ww_mutex_has_waiters(struct mutex *lock)
+__ww_mutex_has_waiters_lockless(struct mutex *lock)
 {
 	return atomic_long_read(&lock->owner) & MUTEX_FLAG_WAITERS;
 }
@@ -151,10 +151,9 @@ __ww_mutex_owner(struct rt_mutex *lock)
 }
 
 static inline bool
-__ww_mutex_has_waiters(struct rt_mutex *lock)
-	__must_hold(&lock->rtmutex.wait_lock)
+__ww_mutex_has_waiters_lockless(struct rt_mutex *lock)
 {
-	return rt_mutex_has_waiters(&lock->rtmutex);
+	return data_race(rt_mutex_has_waiters(&lock->rtmutex));
 }
 
 static inline void lock_wait_lock(struct rt_mutex *lock, unsigned long *flags)
@@ -436,7 +435,7 @@ ww_mutex_set_context_fastpath(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
 	 * __ww_mutex_add_waiter() and makes sure we either observe ww->ctx
 	 * and/or !empty list.
 	 */
-	if (likely(!data_race(__ww_mutex_has_waiters(&lock->base))))
+	if (likely(!__ww_mutex_has_waiters_lockless(&lock->base)))
 		return;
 
 	/*
