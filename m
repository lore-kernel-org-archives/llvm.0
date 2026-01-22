Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E435F8D1;
	Thu, 22 Jan 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072654; cv=none; b=PRzm4lad9iu9og3L0v20FecXXZYxjdW3SxZ6NNPRmY6t+QBgOg+EBTdAIaVIOyHntmswTIq4B5suW3GYgzRPlKbnOS9zQi+nK9K9hSJkSiqFZw8zVKV7LS3ut/NwvbYNy+GK8gzUHrMyUdLWcmuUv12FwbmeW7iTEzRXRpPOuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072654; c=relaxed/simple;
	bh=9m/NEaEfSPp+2xPIx1vPIL2FrAyyxOhVPf4RE4jFzd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk7178+JdpRUCzeQQrXs/LJNrxuJFHap7RdGF0kNIIwZrq5r59EsPgqoGx1sNkWP4BTjAyBkq/hnU0u6sIen3AudnenxniJlsukfZszF+NMiC8JogGtgnG3exmjXW0U+iXCeGSTQ37/hlT931kuZTwcy2bvrnE1Z+8nzdsLK4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OQgQ3xks; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OQgQ3xks"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XUllA3z6xvwso4MPNTeNmaZ7G02VaPIp7hvioKqFSss=; b=OQgQ3xksDFXSMrIEZP3ESmEV7a
	6hVzpC5tQRD3J0z6aGTH+ngSwaYNxhnibUAO6ns0CNPM9GQtXjCSxA8Ikn6UTfQATsBbcQf4nwT3F
	57OzNTQh++p3m+iCqvT0sr71lQHCrsaXFN1EOQRE3B1SugY9vvCCI2R8ukcl5Lka6N5XoN60ShA+e
	7y47Rg2l8dpPNko1hjqmQ7oRb7JWtdZ5wK1KVe6m6Ir8ZGOC4+X0W/YyLA1xu+EUo+UjhcFSx9fCL
	3PzReRKSyJVKvajK77hoALlrGqYpvJR7xSqEHBZejrYAfDD6ffLSLncBqIy9QXGR444pK23i+JDqE
	anBc4HDQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqbj-000000000fD-3rU5;
	Thu, 22 Jan 2026 09:04:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E43C6300754; Thu, 22 Jan 2026 10:04:02 +0100 (CET)
Date: Thu, 22 Jan 2026 10:04:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260122090402.GD171111@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>

On Wed, Jan 21, 2026 at 12:37:21PM -0800, Bart Van Assche wrote:
> On 1/21/26 11:23 AM, Peter Zijlstra wrote:
> > Pushed out an updated/fixed series to:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> 
> With CONFIG_WARN_CONTEXT_ANALYSIS=y, CONFIG_WARN_CONTEXT_ANALYSIS_ALL=n
> and "+src:*include/*=emit" in scripts/context-analysis-suppression.txt
> I see the following error messages for that tree:
> 
> In file included from kernel/locking/mutex.c:22:
> In file included from ./include/linux/ww_mutex.h:21:
> ./include/linux/rtmutex.h:44:25: error: reading variable 'owner' requires
> holding raw_spinlock '&rt_mutex_base::wait_lock'
> [-Werror,-Wthread-safety-analysis]
>    44 |         return READ_ONCE(lock->owner) != NULL;
>       |                                ^
> ./include/linux/rtmutex.h:52:56: error: reading variable 'owner' requires
> holding raw_spinlock '&rt_mutex_base::wait_lock'
> [-Werror,-Wthread-safety-analysis]
>    52 |         unsigned long owner = (unsigned long)
> READ_ONCE(lock->owner);
>       |                                                               ^
> 2 errors generated.
> 
> Should this series perhaps include changes for the file
> scripts/context-analysis-suppression.txt?

I'm having trouble reproducing :-(

You're speaking of something like the below, on a defconfig build,
right?

---
diff --git a/scripts/context-analysis-suppression.txt b/scripts/context-analysis-suppression.txt
index fd8951d06706..6c31eadd0244 100644
--- a/scripts/context-analysis-suppression.txt
+++ b/scripts/context-analysis-suppression.txt
@@ -14,6 +14,7 @@ src:*include/linux/*
 src:*include/net/*
 
 # Opt-in headers:
+src:*include/*=emit
 src:*include/linux/bit_spinlock.h=emit
 src:*include/linux/cleanup.h=emit
 src:*include/linux/kref.h=emit
