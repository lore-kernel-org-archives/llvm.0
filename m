Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E496653A88E
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693245; cv=none; b=j+bi31Y9B9/AjtYpamTpiP63GgFbGt/qye3iuOGd56DjPZg/dAXLKoje+k6yougPEca87nggCZipPlehsg5/RRbfTll7CjxMdKqiftC66VZVVFxeorluYbHuPLuI75ZWFDsd9Wb/11EdXdodo0vgSHCMFYfOi5xCNs6eenjbYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693245; c=relaxed/simple;
	bh=SLmPCj6Drkarz6MGesiMP1GtPbh4rsUc3J8b1Kcoqwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoCBr/5CylsKuvc6S2sbFFD18919zbIvcroMyvUbn/Ifuqp7YfCWtlYknoBJyezLdIaF3KjeZIHtMNYpZ1VbZCJZp2SaPMsUJVVnmxzKS3v3Rnqq+RKdVHEE0T0AluyjPMbGGZyByV2S58VA7V3sWUoIsvKjj1E1FQPvT8zIRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gbsNV5sp; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gbsNV5sp"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so445538666b.0
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790693242; x=1791298042; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=gbsNV5spPzZQHeWLkU5PH7HIexFDvcGwNbSMs5Y+kKkVRjgUw3/P0LBONdAYIX8iZJ
         qWk1y4qxuABsVwM/i7pkg/ziqGMPaUwJbPKEpxRfNdYZKEpLHzaxp1UNSniIdzs8jBK1
         yzYY0Z2iyvi3jihiSvjPSHgyEIZJfcoTBnvhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693242; x=1791298042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=deW1nkDW8NM9p1u5sb2drCtSEj4A6uyUUOr3ByNj4Q5XfmwgZ/PyYJO0U01eK/QiTU
         dpgvNyvS6MH7H/XXnlMRdYIThLHK05dEXrl0KJykqOzwfO7rBS2wDdZBXhV/3c2gKjA6
         OO/4lwvB7W7yf/2NzT0F46bd1aDDNYh+qkkRYncXTTzNDJXGjlIoiWoiB6VK1JDAtg5h
         kFG+CmR2fPzscYpCoU6GIkhrJE90VNQOQTfa5uoy6kJXjHuux89rKBaQgoxewjJzhCgx
         zN5Swq2WJKn3qhXX2FuWY78dD4sr3tFr/Lxj4359Dc6BsH1uuQt8aLq1XajP+FF/cwyU
         s59A==
X-Forwarded-Encrypted: i=1; AKwUvBxczD8xv8YlW7jENfEDtCY0CtYl3hmbNKEXBTHoKC9DtQ1CTWjHj82FE9ysaBnybHE+L0Vg@lists.linux.dev
X-Gm-Message-State: AFuF++lP20eundeVECXd2cd+6REEt9RR/S15E2Zsx8pz9/Hu7rt10jsH
	dndO3ANHWoFCZgXDZC8hGlFYWm4z3kYrYnl6AX00iqoOhvjQhZNpAsKR3lrwE/FHkFAPcVfUHgj
	fDbl5/Ug=
X-Gm-Gg: AYBFou2v7ePB0NHTEkB+rdlcFzx2I+quhNvNIx1uanFFKIlMUIFakOL6GFnNFeCBKJ0
	3SSz4yUQyOCoNU+HI7lJPstVKGh9fwoXH4rCLYHVjGmdZOt+XCqEFrQLDLXFrM2Fdc4XNlU18gh
	aqGb2du9h3zLWOssMN2y3xJXzBcKBgmTFKu3dl1ve5vM1buiSHaYoAxNqCNXB1jr9FxUJpKUnrb
	80W/TpY359ZiVG6pplT1BSjoNCCAE+m95b+dbIm9t06VFQNHGTE/Yg/hmyx+7DtovP+9U3JbpM9
	dbJhquAs87rRtYFdtzcLBE3FHy8bo+sOj4vFasLN6cKdurDGSC29PZrD2FGNshTwoD1oKwQ1pbK
	b5I+ejSEWLXKEN/tyDKyh+domvg4EEO92KQ2rF+WMZHJZwAi/Odzc4MoE7XmeKsvNQrRQ6h4d7s
	brt1DGPa4yCBWFGizdsz1PLQkkgj4Qsugs2daUH4wWSqpHSuYNzvIVEOjknQdY2zsmMNIK7Pod1
	FjZ/NucpOf45CCoYbVQYw3E7U4GGDEKkDecmeqxj+NoCg4tftw=
X-Received: by 2002:a17:906:9fd0:b0:c2d:d71c:c2cc with SMTP id a640c23a62f3a-c2dd71d261cmr540395366b.48.1790693241064;
        Tue, 29 Sep 2026 07:47:21 -0700 (PDT)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com. [74.125.228.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcac3sm448943166b.73.2026.09.29.07.47.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:47:20 -0700 (PDT)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso553576566b.1
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 07:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz366pNE3Ku9q9mzCZAVDaQsnTGZZHVHbZDhNXE4An1ny+XngnxsIWpgiJvqf6y9UhuBPRn@lists.linux.dev
X-Received: by 2002:a17:907:c491:b0:c26:1648:a06f with SMTP id
 a640c23a62f3a-c2ac253fd57mr1427153166b.42.1790693237251; Tue, 29 Sep 2026
 07:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com> <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 07:47:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
X-Gm-Features: AclHuK-hIyKMMCYq0m6RbVGEdDaE41y87jUOezwgP_JOLXBYBmnHdH3WXkY-n-A
Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 08:51, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> +static __always_inline
> +int ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       OPTIMIZER_HIDE_VAR(a);
> +       OPTIMIZER_HIDE_VAR(b);
> +       return a == b;
> +}

I had to think about why I hate this so much.

It's probably entirely senseless, but this just rubs me the wrong way.
Those OPTIMIZER_HIDE_VAR() statements are hiding the wrong thing. They
are telling the compiler to treat valid information (the pointers) as
if they had changed, so then the compiler will have to just reload
those pointers when they are used later (and "used later" is part of
the whole *point* of this, after all).

But it was never the pointer values that needed hiding from the
compiler. It's always just the comparison. And while the "optimal"
thing would be to just do something like

  static __always_inline bool ptr_eq(const volatile void *a, const
volatile void *b)
  {
        bool ret;
        asm("cmpq %0,%1":"=@ccz" (ret):"r" (a),"r"(b))
        return ret;
  }

that is an architecture-specific thing - and then have that
OPTIMIZER_HIDE_VAR() available as a fallback.

I don't know if it's really worth it, but I really do despise that
"hide the wrong values" thing that generates two new values just to
compare them and throw them away, and adds register pressure for no
good reason.

               Linus
