Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CBE288C81
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 19:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769457274; cv=none; b=M/7b8N2iHDBNi7TWQVHngZZ8gCdgPp3DqTLjgmkU4evxYcPA/Qm5tNF+gD6NY5vJ9ajB2ENuTwzBAtbNPeFz4wA/ZMLBYXTOp3biWtDY70DuLlVAdKbdHjVkvoAkvgi23/PveZdHl0BDwdD9fYskAe3bzHViub72BgN6dBgHaLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769457274; c=relaxed/simple;
	bh=ViHUiOzDITl/2oYwnvg+mHOvHbAoJDAo1r8q6uy1Ihs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+5i6ORyOfjhm1MNPuVVpPAwLJaAxurZkBg7pg14R6RHopyGbS6zamky+lMceZ+ZhD9f5ycXL/so+S/V+SDz88MpPJCvG+YXEVdRgDvLQOFSvEJUBwSI9z6NvhJKdY2jOLUpBnu1AK7MgfCM4Ree7s4oCRWc+WbzXoJ7HpkS408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+J+LSIN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+J+LSIN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so41910345e9.3
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 11:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769457272; x=1770062072; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIvDHxjEBk/q7zSGk0OAMTPAzA3q+FQQ/WT+Ixk4ezQ=;
        b=C+J+LSINB4AMWs2i8Hc5uUFDkFkWVAwYFjzjWsieErK2hI6wiS0bE1wkEAYJtSeM/Q
         /rFi6ji3T1ECQmPuKu1b7uOH2Zu93bUBrn+rY1rtdLcq47y82n8/upJljdDNe+kjOaDX
         pH1fBrFVCJu5lNbLKY+VGjQAwD4n6e8macfcW9X03fdkQIiH7LfDCpFLGcT4/NQhx4Xx
         3l7h0qYfC3XxlZ2y/CgcjH/b4eunDXS5IMVpS1IhvEHZB5ryoaLjrDygBrS+xrYfQ1Pr
         UjjS4oQB3jRq6CP5R2DvSgZF1TAgnZlaeR9O5mWBYKSQTrAJGr9q1I+x7QWHKDD0pqYq
         GeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769457272; x=1770062072;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIvDHxjEBk/q7zSGk0OAMTPAzA3q+FQQ/WT+Ixk4ezQ=;
        b=OIwedcULnEeWz+gz86KVjuS/tj6r2wydORY0WRe4bTB+yPWHEnTxx8+jmzKGXfekkY
         KYUnFUwrOPNktBloJGJyzQjZEJQOnEd/u2ah+0gnJ5DcVAfDlSn/xzP+s0KMQ28qcawC
         EV8rnc2iprSCgtbVKtyfZKz/BVEjoFHXSIFjEPw8RAvBKPV4Cipmo1bS/aqctGV/UUhJ
         YhTWih5pP1uHpDDCqgr5makUFLcBPp1apQqAsKIflSFwwodZfnMyzeI8nNT/yrphhJKP
         Nl+gjrwhYENSIHdrWN51duMY6h4UjSNDWq7O7F7JV5/GZpU7g4lr+hX4budLtPmWvYJn
         Um5A==
X-Forwarded-Encrypted: i=1; AJvYcCWLe0/odOxH1xbr10r5nT4zPMhjs8dED23lCJ1Y5J4bSE6/3mViWgs8lyHzqhl1QodgHpaU@lists.linux.dev
X-Gm-Message-State: AOJu0YwgRYmB0upWI/7DP/HCx9tLccvPuFFY8S1sjQedRq+4T1lgf90+
	c7hSy5fhDj/dYUUDibkaE7hT9fjj5pJBkD28KTVPtCOwuddvtNgPG21sfVfwW0qe0A==
X-Gm-Gg: AZuq6aJ0/WdhPcBDAl7eLZLIMglqr2nkGUEaJt7GSGvD87BYiPGXVX915jzaG6O/CGN
	N6+Y/h6m8A1aDOgX8sFSpiFFGFbXgoVhBTl8Oo+PRYxwhwELv+guMHRC+5X2kDGeRZ9d85nmSaB
	Q/m1UXUJdjbUMdjgmGhnBPB8bQWTpk/JExgpu1XmXWXeP9j9GJq3bhEKp3I7FTqUZQL/hu43KDq
	fPymfW42swC6hth44CqecXF79APZNk8c2gBdIjXFmz2gfjxdGWsHN4pylF/G/4tA4982j/3LX3w
	AijsARddbj9vFxTQUdE52y7zKfCkjRF38xFda+OstB+BVrFATaKml4SdbuHebpXiA4yEB7ACQth
	JYB042FMD/Kyg2zCD8NMZDvn3OpyxJtcA87YBMIP3AfwLFxF5p/wQ4zvyBvyGQJ/2mPYDdeoZ1e
	95yLnWSFnsTAJgzWM2snZW7T2HHbPImRCLz3YRH0lCnHywj8jd
X-Received: by 2002:a05:600c:5248:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-4805cd4587emr88693725e9.1.1769457271541;
        Mon, 26 Jan 2026 11:54:31 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:c598:7cce:ca6b:8ab7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm22270685e9.5.2026.01.26.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:54:30 -0800 (PST)
Date: Mon, 26 Jan 2026 20:54:24 +0100
From: Marco Elver <elver@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aXfGcIpeXQNRUI-A@elver.google.com>
References: <20260126002936.2676435-1-elver@google.com>
 <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index fc0fb42b0b64..9963948f4b44 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -32,8 +32,7 @@
> >  #define __READ_ONCE(x)							\
> >  ({									\
> >  	typeof(&(x)) __x = &(x);					\
> > -	int atomic = 1;							\
> > -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> > +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> >  	switch (sizeof(x)) {						\
> >  	case 1:								\
> >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> 
> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> 
> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> on gcc-13, clang-18 and earlier, and not strip out qualifiers.

I think we only need to worry about Clang for LTO builds. But yeah, our
minimum supported Clang is 15, so between 15-18 it'd be broken.

> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> to do the right thing already.

It'd still be broken for Clang 15-18, so it won't help much. We need
this to work for more than "scalar", so even though it'll work for Clang
19+ given the redefinition to __typeof_unqual__, we should deprecate the
_Generic-based __unqual_scalar_typeof() sooner than later.

I was able to make this work for older compilers:

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 85b1dd7b0274..d6c808cc01be 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,18 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __read_once_typeof(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers to infer an unqualified type, using the fact
+ * that __auto_type is supposed to drop qualifiers. Unlike typeof_unqual(), the
+ * type must be complete (defines an unevaluated local variable). This must
+ * already be guaranteed because sizeof(x) is used in the __READ_ONCE macro.
+ */
+#define __read_once_typeof(x) typeof(({ __auto_type ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +44,8 @@
 #define __READ_ONCE(x)							\
 ({									\
 	auto __x = &(x);						\
-	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
-	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
+	auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret;	\
+	union { __read_once_typeof(*__x) __val; char __c[1]; } __u;	\
 	*__retp = &__u.__val;						\
 	switch (sizeof(x)) {						\
 	case 1:								\


Thoughts?
