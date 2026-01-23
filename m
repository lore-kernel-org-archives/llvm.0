Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AB2367DC;
	Fri, 23 Jan 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166932; cv=none; b=qIMHlDWR2T+ftmODj5TxpZDzyUZ4tcpffQF38u49vvZjnI9ugae2LuOzS9+a2NA2z7DOOXCQLYDMJAkH5U5ra4/JwoRu8L2mem28TzooQfogPpiaUVZH1mHNUPoP/PXuZGrCrIzohuYU0ZvP58BNASGLtbh7WR/DNOKTDe2S8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166932; c=relaxed/simple;
	bh=2QV21ArCZsP9FHwEJajftd7qD03X+rtq818zayPiAlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWhKDJMdaP9pjmAwQu/ZRL5WKCxyUVHST5la6vSPfN5L799zvYvojbFSVIkOEQ0gpRmRFszJ3x/AZHApxXNmoQENFXFXuZuvDFJXnVk6zFQe2LddSemjiiwQsHMJx8PyNubNH9U1EJQbVuL1lBPdGy/IGuclwJrU+UioOCQo4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R86O5iDx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R86O5iDx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b4VHPc/Nvng4W8h1gqKXrOOaXXgkrCLyQUnbzVU0ULQ=; b=R86O5iDxLLcSDm+StNTGPXg6x/
	FjWHo+AgyeqQb94saIEbugfjzT0QMDXR33o9sbKxGlRcEWUqQFYwih+RqGdMG45vmKQfz8DRpdV+l
	Ld15km5WmBXR/Nlt7OZiekyYghEwd9s+JvPqAO6nv04a7L2u2a9yhnJHZJKSyw4Lt547FPZibA0vq
	DBnHOHYe7DqfRprgSIy4wytxixAECCD1D1uXGCDqUSGb+xfWin/M4Tj+tx6mX0FDsxS5RVILMssJ+
	k0d6q3WtXY1tTJ4d4nCKboGMWcEOsK8tNeKfJGRJ5JvYxE86En2yBi0eu7A10dPOrklCZIcKiRlnu
	qCmghptQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjF8O-00000002F15-2gf8;
	Fri, 23 Jan 2026 11:15:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3F4F3007E1; Fri, 23 Jan 2026 12:15:23 +0100 (CET)
Date: Fri, 23 Jan 2026 12:15:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260123111523.GO171111@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
 <20260122090402.GD171111@noisy.programming.kicks-ass.net>
 <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>

On Thu, Jan 22, 2026 at 08:28:44AM -0800, Bart Van Assche wrote:

> then the following output appears:
> 
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      kernel/locking/mutex.o
> In file included from kernel/locking/mutex.c:22:
> In file included from ./include/linux/ww_mutex.h:21:
> ./include/linux/rtmutex.h:44:25: error: reading variable 'owner' requires
>       holding raw_spinlock '&rt_mutex_base::wait_lock'
>       [-Werror,-Wthread-safety-analysis]
>    44 |         return READ_ONCE(lock->owner) != NULL;
>       |                                ^
> ./include/linux/rtmutex.h:52:56: error: reading variable 'owner' requires
>       holding raw_spinlock '&rt_mutex_base::wait_lock'
>       [-Werror,-Wthread-safety-analysis]
>    52 |         unsigned long owner = (unsigned long)
> READ_ONCE(lock->owner);
>       |                                                               ^
> 2 errors generated.
> 

Indeed; I shall fold the below into the rtmutex patch. Thanks!

---
--- a/include/linux/rtmutex.h
+++ b/include/linux/rtmutex.h
@@ -41,7 +41,7 @@ struct rt_mutex_base {
  */
 static inline bool rt_mutex_base_is_locked(struct rt_mutex_base *lock)
 {
-	return READ_ONCE(lock->owner) != NULL;
+	return data_race(READ_ONCE(lock->owner) != NULL);
 }
 
 #ifdef CONFIG_RT_MUTEXES
@@ -49,7 +49,7 @@ static inline bool rt_mutex_base_is_lock
 
 static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
 {
-	unsigned long owner = (unsigned long) READ_ONCE(lock->owner);
+	unsigned long owner = (unsigned long) data_race(READ_ONCE(lock->owner));
 
 	return (struct task_struct *) (owner & ~RT_MUTEX_HAS_WAITERS);
 }
--- a/scripts/context-analysis-suppression.txt
+++ b/scripts/context-analysis-suppression.txt
@@ -24,6 +24,7 @@ src:*include/linux/mutex*.h=emit
 src:*include/linux/rcupdate.h=emit
 src:*include/linux/refcount.h=emit
 src:*include/linux/rhashtable.h=emit
+src:*include/linux/rtmutex*.h=emit
 src:*include/linux/rwlock*.h=emit
 src:*include/linux/rwsem.h=emit
 src:*include/linux/sched*=emit
