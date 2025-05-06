Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E42857FC
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553924; cv=none; b=ksm8DULxwvO8jwWevLDLh4Gb7rDcsjgIXcIePAzYmhJELD6ny3zRUeQab0tTG9M+oL3gm8qGBnwWTuAIa45XgQXAyqTkKzk7dbirFeWT3O+wdIFLZJ2vFGIcAs8PQtn7G5mQo2ZuCVk8IDRx2oUPbN+MDL+BpMkWh9ZrksHia9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553924; c=relaxed/simple;
	bh=fA0K5tQFw5Yp63FtiM4eR0Osn5prSTAMzY4SQURkhXA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Kf7XN5DoOy+Y9hJ1/RRb3DNOsjcY7R/46Wao6J0J7m6G+8blJuoTi8yg0idA8+NuSOVZqGAon7eT0szgFi883Jkg6Di8UIT9/Hndrlz53kbh+RdyRtvpIMYj423BwMILch7SajhYGHItiCBc6qab1J0uhckN7kiIwn1CGQmG2CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Do2b8fY9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c/iVe04C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Do2b8fY9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c/iVe04C"
Date: Tue, 06 May 2025 17:52:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746553921;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4LqRx76U5ZyLsHooPZrl8L9TVtNoP0s5z+HpfXM1d4=;
	b=Do2b8fY99kp/FmLDIJhLl/ZUKZNjNw7QT0l+bk922SqTYUuJaKEO6QsPWVa5OgIdsMY0ae
	ebM89Fa6+qolhaHytfuyeMxXir16ZpamNfs6IY+J1/9matQ1hnVtpJPYb5Ha60mHUqZIRA
	s5UKVsdZJpAjWMzfAYBrKqLzZ5br9Gbk/q68pqK4gwXG0uYgcpsrPqWYP+axvn9KSR2YCW
	PoLTqb56gesGH9oBeumZqE6TfwELJ8Zrr2KRgysQuwZVmRPDZ89e4X937ForPb8ixqel8c
	8/onfqNLB/ECDDw0d28hTbiM8hpft2cA0YzbQzq+YtcTotvO2ZtSsZO8GCzxAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746553921;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4LqRx76U5ZyLsHooPZrl8L9TVtNoP0s5z+HpfXM1d4=;
	b=c/iVe04CX9SpcCtDd2rkPRp3LbEL4EZMn88DMuXf0OitX7PVs3HzrnAaMxi4xiMSX0FVH4
	B19FGVSc/al3elDA==
From: "tip-bot2 for Waiman Long" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/core] locking/lockdep: Prevent abuse of lockdep subclass
Cc: Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 llvm@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250506042049.50060-3-boqun.feng@gmail.com>
References: <20250506042049.50060-3-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <174655392027.406.8515086852883668250.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     6a1a219f535a437eb12a06d8cef2518e58654beb
Gitweb:        https://git.kernel.org/tip/6a1a219f535a437eb12a06d8cef2518e58654beb
Author:        Waiman Long <longman@redhat.com>
AuthorDate:    Mon, 05 May 2025 21:20:48 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 06 May 2025 18:34:35 +02:00

locking/lockdep: Prevent abuse of lockdep subclass

To catch the code trying to use a subclass value >= MAX_LOCKDEP_SUBCLASSES (8),
add a DEBUG_LOCKS_WARN_ON() statement to notify the users that such a
large value is not allowed.

[ boqun: Reword the commit log with a more objective tone ]

Signed-off-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev
Link: https://lore.kernel.org/r/20250506042049.50060-3-boqun.feng@gmail.com
---
 kernel/locking/lockdep.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 546e928..050dbe9 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5101,6 +5101,9 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 		lockevent_inc(lockdep_nocheck);
 	}
 
+	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
+		return 0;
+
 	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
 		class = lock->class_cache[subclass];
 	/*
