Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FC233A708
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577886; cv=none; b=f/Dwj2IxW01DJIYNeUTHhzYdCNXRCbUtmV+kpoucH5onW6PcpH8AQUX+Adt50bZVjr3ImjZXS2bLmshxiw89XPqvTwwcycbvFJx2oaZvnCnbimU8OMR7SWGLNIpNgkfYS3AnpT+aYuKip0jhm9cO4/LJ2fX9k2rHwymXCNzVWvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577886; c=relaxed/simple;
	bh=BOWxuALbnVsg76rC9q42aLUuxBJuctl3jLVjqz1y6Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5ToTaPDnDi7OF8DS0kU7Pv88y+R72bs7fqS+j/6D1QSfr+tLDJEuv/L5d4GzXPitaDpppOE1KcJ3VyrHiAGPgTRYDJOMFYxOhz0n1CB5kuREZMkpOw+IivYmWyKEZho/GXjgZO6WT+6RMl8Z8/6AwAPbbcpTvRBK6sD2qOSxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mbRWAexv; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mbRWAexv"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801bc328easo15173315e9.3
        for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 07:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768577883; x=1769182683; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgFxhnuAvKh4+DybKpe+A5yQM2/DqHkYrZhkViFcA54=;
        b=mbRWAexvtYSWvKD5HOKsAsjqKvhHWYVfDvC+/jLwZ7NlbGtAY1m0yoHr9cMYHrzesI
         /mUjb2A9pJW9u5faiBXKcr/UCZc1tVqHW0fr41IdkewwPT0MK6Mtk38Ir61YgBcrQNJH
         RzUk49kQHoP8D8xTSC9CtD8TP61ogyT64cXhcLmDauLfTqH4YK0bVlTAtOhO70hUu0ib
         S8gn5D6jZylRSxub+HHIZlSbn4dDT4ZKbqNhbKgOXwgONeQeVmrwyiNvqo6Oo61lctWB
         AwM41Qho67/2bdC07dR3k8YXxafrTy2+AaAdzrg5l7zeOwOu7icntQ+uDEzw0ZdacFKC
         QtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577883; x=1769182683;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pgFxhnuAvKh4+DybKpe+A5yQM2/DqHkYrZhkViFcA54=;
        b=mgu7FvpKnztfsSTEVlIpK+K4pwbal7c9YJ+m5U4XY1zxGyRT5YIfHxCFNFRJRdrivF
         BKpMOE+h0zQlqZKsbbHKEMOOU3lYuicqVBIv8xOiaxkhbr7MrjMHJ1WvD69mH0qDKRns
         28yiGA8v7/fdxkdbaHNwZp6Ku57p9b7ESuWiacoFEcTIhYnqo5l1eVfwHzHC4XLG9Wxq
         kKmc8swtwLOGcJ2luXM5N6lUT/FiuNzRQxEMB/IrpoaIVpfkYhxwWHulnAG6o0xETIrg
         ck1pxUTvAIIFjO0n3I6BlKkBFS18gpCt1rAMUydNNbPXXQqQ9fxWodp+Summ3B2SM8Id
         sH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWisVlt5SmJMFeFfg2/JEkPSKVvyfH1kZSL1MKKqBwT/3CuhwYvqcW9FjqCIcreVLkHN3AD@lists.linux.dev
X-Gm-Message-State: AOJu0YxdGtWrIYp25B5qypdHBA5gmiwW5wtFmbEHgM21Y/AOgKs6S8Wk
	Rej4EAZAm/7/1hshbY7UePPDfRHoF4FflQqccX2XP33UXjbxQgwu8/QGARVZ6pDKfg==
X-Gm-Gg: AY/fxX7sF8jINP63kCzqfDX9LeJe4EoEBzLnJ69RRna4NppGJkJU59/nd95T+2PNN4j
	D+eEK+8mH+8ItViYuAiRUTNqUkeBQJHo8Wf9a1lpOgrm2b+i2WlRh1Qk1QV8VWC/llEKOG6QzfU
	YlBluqJlXDrwtf3rkSXMMbOdH2cv2lyluTLdTtSwljMvpEsqJQ41eU4nFA53zKOKnfSBkZihif1
	y6nU/6P7Qx6hKFOBxYI6dqUsc3miW9ZwZJoYaJWM7DS7fZoy1i+jhAPz6esNVMhR9xO7AoshtUk
	GO7uxxcJ5JHyNwhpOJuUaF8tOgmXRTllNWgttuxUu8Fk4aIUAgazbPKhrO0FMEVlmO0fuvIJDtF
	8UUI8uuX3Rv5nLnWYBsx/JO+PAS9SHaRe4t8JrhZUE/zWtX5S5qttrFDriMwOWlnwttSpumUMit
	bfcU1P4g5WkKCM439AlzAztOyTMa79Xy9kI+C+fc1320Ke2hzl
X-Received: by 2002:a05:600c:e41a:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-48024b8a77bmr18132835e9.31.1768577882473;
        Fri, 16 Jan 2026 07:38:02 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:b36e:71f6:fb51:66e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm5892119f8f.11.2026.01.16.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:38:01 -0800 (PST)
Date: Fri, 16 Jan 2026 16:37:55 +0100
From: Marco Elver <elver@google.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <aWpbU3Msh2q-bRH5@elver.google.com>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com>
 <20260116150750.GG831050@noisy.programming.kicks-ass.net>
 <20260116151043.GA18805@lst.de>
 <20260116152016.GI831050@noisy.programming.kicks-ass.net>
 <20260116152741.GA19823@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116152741.GA19823@lst.de>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Fri, Jan 16, 2026 at 04:27PM +0100, Christoph Hellwig wrote:
> On Fri, Jan 16, 2026 at 04:20:16PM +0100, Peter Zijlstra wrote:
> > is *much* clearer than something like:
> > 
> > 	spinlock_init(&obj->lock);
> > 	// init
> > 	spinlock_deinit(&obj->lock);
> > 
> > Exactly because it has explicit scope. (also my deinit naming might not
> > be optimal, it is ambiguous at best, probably confusing).
> 
> WTF is spinlock_deinit even supposed to be?
> 
> I though this is about:
> 
> 	spin_lock_init(&obj->lock);
> 	spin_lock(&obj->lock);
> 
> > Not to mention that the scope things are far more robust vs error paths.
> 
> They are just a really hacked up clumsy way to provide what a very
> limited version of what the capability analys provides, while messing
> up the code.

There might be more design options we're missing, but thus far I think
it's this patch (using the "reentrant promotion" approach) vs. scoped
init guards.

   * Scoped init guards [1]: Sound, requires explicit
     guard(type_init) (or scoped_guard) for guarded member
     initialization.

   * Reentrant init (this patch): Less intrusive, foo_init() just
     works. Misses double-locks immediately after init.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/init-guards

FWIW, on the C++ side, Clang's Thread Safety Analysis just completely
disables itself in constructors to allow guarded member init. So we're
already doing better than that. :-)

As for why this simpler patch, I stand by my points from [2]; trading
false positives against false negatives so that things "just work" does
have merit, too.

[2] https://lore.kernel.org/all/CANpmjNPm5861mmHYMHoC9ErRfbLxmTy=MYwfsGC-YTpgP+z-Bw@mail.gmail.com/

I'm more or less indifferent, though would slightly favor the simpler
patch (this one), but can live with either. I can send out [1] for
reference, and you can choose.

Thanks,
-- Marco
