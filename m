Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CEA53F6A9
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695049; cv=none; b=pSRw4Di09/R2J35gv0Rhlfxi7RZmKIoUXifl4aTYIHkLr8ynYja6djE/pR053yepXRjmZkaYzH3WNHhanS+Pe5+3KRA9t32gIvEAP4qdF4jpyeqvN5ZyCkdj+KEIMqOShxsXxWkwIOCxhNuN7ildCoMGrJ3w6H0bvV8Qr7WvXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695049; c=relaxed/simple;
	bh=UyqxTJzFsBHiwpgeaPtT2Qc3mjNuoQ6QFEr9V0LfDYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKbzIjR29AY9EF/y7K4JsZdfB+Q7QHurNIBaQl3Bs9agwGed8C+gLYWNXSTiL0gaZtNQZUdJWV9r3j6k7c2/gd/ratg62EuCmhD0uWUIXFZULl7wSTOzY00dhc2ewspNYqVNHwFaiVbGE8e/mMEtfxR93xGNmauXcyQrKdkt5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NckCZhjX; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NckCZhjX"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2538149b3a.3
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790695033; x=1791299833; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=NckCZhjXDni824KOL0FIoKh/wzElaPDf1MfkGmKfVebmv22HAhC/oDrxvWi+xqIVOd
         22XF/aGZFq5bnRQLox02/AGUGjrHjBChmcaJEw6RxT6RJZxnyyng5j39q2qWMxaa4KPL
         DMNSILFubT6b+flaZNoomcu1uV4F4uNBn2ohY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695033; x=1791299833;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=Ofin3C/DnBLO1aeT5/6aWRTapepq+ZqIuqnitv8wLl5ro9cRhSycPqlxQ33n+d3rhx
         /OWccvxn73hF3xqsDCcgX4pukXFBrViYhfBlIqNyXyKZGFXWNBJKwydZyP3JXRjyyarr
         GaJm9DKU4XhFWI9FsL58WjmXlF0rjoRPYCANyVfRY5Ka9nmb4KZBBXTnzFDKGJAR6Zbw
         XYnOqJqpqxy3rUM5iOTZpr3mNKO1TshUnSF1QcNOlhxdJK2SrJIPW2WECSymAzzoXVAt
         kzsLb36GAukH2QG2+czOs0eZFU1bohWxg70iADl9tZ3O2GsBHXXoQLjUz3D2DrfRrrxV
         ql0A==
X-Forwarded-Encrypted: i=1; AKwUvBxu9jv4IwQStccOKJhku5BFeiuPua8J/dSQpNHC036H3/pDFLpDHr1sFpbhOTYsmwqOOKQO@lists.linux.dev
X-Gm-Message-State: AFuF++m+y3YFJgBm7hCO52MkaHJZquSizu+kHYjLQsJADL8wjTdhK0ci
	4WkDhrDkDJjLaRW8uA/HY2+rDxx5sIUr/gNFyJ4NbpaQ8e285UcXBP/12vk0DW1t469chhZe+2t
	onRGo5es=
X-Gm-Gg: AYBFou0OvQCV7JWT2AMRW5wuAQ4Wn0EW8VdosOxBVJnDjjCTOh4J8vxNo2/Dgt+JI2z
	/TUChvEx229hSTXp8kCoU9DBbCUZltMk4f8F5d3KZAsspC1ggeq74CVTZtgcEtWOLZkGd355i2Y
	jmbaIZ1ss2f/uIZRlXpEKdr6GXfbSsNNIfbQH0hGcQOehnIIbg5PuAtiHc0/PdjOd8vxsa0Nn9c
	pXm4vHFPAvPxjbFsllbgnNYMf3ec3VoyFCKcebtIsyvMWARrcFuyrIywjBGX617WC+dJaL+W3wh
	8/V+YLhLQInUUYMNf8lbUBFJZH49Q0IOZ3kfy0xruMkznIscrpn7/t5l/Hd9afR+IHw1x+ig68S
	z8CZuhS7zMR+QROd2UqjBxEorsBn2YRNWexadyBm8wADDO1UYpwNqw209xXD/kUpiOB1SnHe7AL
	AuumQy+9xtpksqjMZdsD4Hn/xWhbdWMBIfuuPaC+ejK12CDaMRDSg6FRXCGEsJpGHfXtjXKlGZc
	YdZYQPaaqV4CfcXUHpmxgpijM0V19NGuqy9jl2MujrR4e5mOA==
X-Received: by 2002:a05:6a00:37cf:b0:883:96f0:da3b with SMTP id d2e1a72fcca58-88397003773mr4727736b3a.22.1790695033481;
        Tue, 29 Sep 2026 08:17:13 -0700 (PDT)
Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com. [74.125.227.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868baf8879sm104155b3a.28.2026.09.29.08.17.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:17:13 -0700 (PDT)
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so17565855ad.1
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 08:17:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1eCoYAu5+ynqD2J38JM+T9S+Nt26rliv/GVawZyXnSXyMpKnHgnbo0CwRIH/0iyvQshk6@lists.linux.dev
X-Received: by 2002:a17:902:d483:b0:2dd:ad73:5b68 with SMTP id
 d9443c01a7336-2df7da85639mr143411375ad.24.1790695032383; Tue, 29 Sep 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com>
 <20260927155134.4740-3-mathieu.desnoyers@efficios.com> <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
 <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
In-Reply-To: <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 08:16:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
X-Gm-Features: AclHuK92qcnFUvMDyEty0mgzRt4zpmui3HdPCBaHPsJjfcUlLFRzvquKppDzHHE
Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 08:04, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> I agree that doing it in asm would generate better code. Also, I've
> been told that clang now preserves the address dependency in this
> scenario, so perhaps we'd want to use preprocessor conditionals to
> select how to implement ptr_eq based on:
>
> - architecture (allowing asm implementation overrides),
> - compiler (e.g. if compiler is clang >= version X, just do a plain
>    comparison). Likewise for gcc if it ever decides to fix this
>    behavior.
>
> I think this "hide var" hack is a fallback which can be used as a
> starting point, and then we can specialize based on architecture and
> compiler.
>
> Or do you prefer this in a different order ?

Oh, if there's some sane way to tell that the compiler already honors
address dependencies, then that should be done first and the whole
thing should just become a simple

 (a) == (b)

for that situation - allowing the compiler then the freedom to do
whatever (which can involve not using a register at all, but a compare
to memory, or whatever - the compiler might have reasons to avoid the
'cmp' and use another sequence entirely)

Then a "if we have an architecture fallback".

And then that OPTIMIZER_HIDE_VAR() thing as a last fallback.

               Linus
