Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20614304BCD
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205896; cv=none; b=W7TYlfkExnA1U//NO4ser90GTKvbB6i9H3//rrBmf97R7hdJSHTFErKuaDDlegcBLfe8MJyQFXB7fGRayPwygvZyGElY/j7bfAJMmYkH6oz332g5zhnz25NDQ4UWbh14cCfWz/4xMRS/Vwfaj3ZNLQnlDS4KDkDlDZBDyo4dsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205896; c=relaxed/simple;
	bh=myP/sybN2zsJVXA5VSxoEq1YkiH03BHAZFTkykC2GiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8QRf/PIZ0zbuevjjtJEFjR95Ux6qr0rzAdWd8vRWYYTQgtqWN0IMsweJVJqurb/0tu8GkuE/N8K5KX+PiDj+BJtQKKsxS1Hscwyv/bYbypfcrVvfyufueRxR0EFRMXw3PlClGs6dkamF0LGQu2SZcmVuesxR76n0/xRdpw+uEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UDQZAiM/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UDQZAiM/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-329b760080fso822723a91.1
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758205893; x=1758810693; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=UDQZAiM/hD/UMBZSKOblteWb18byz2eaAzUSgXFPxVJKXxqARLQFNKiLS2jE0BOfY3
         RXrphJG905RtG2ctFkdqQQGRXal4Soi0WuUfcG7/7eg4dBGSeCbleYOf8Ua4ZeEpC6J9
         tEH5AGZPr7716Rp8YGJVzN3QaxMs+URvSCjAfUa/y1CgOrBRBlFgcyOLoZjyJqEgOp2A
         q9ygsGRvmI0vewFQeM+p25O7o29Nitqk5taRFSNXcrggjwZRHDH8lbLvHlz/m8xtvHaF
         CEd3h1cXyC0LQzd4HHbqQtOE+KUMnyP7ZUzyUTNw2y7B8JkRbDL4jcMwF5zfXPyqjlRl
         FBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205893; x=1758810693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=f+wxV0RdWN9sUw0BdR4FNYiOgDYSnSZD6eupnAo4wfZ1qfCWEjhKXu3pQxUPNgexEm
         Cad8IPFQqIvI0WE5R9pHqKfyFYMDCCr/RHII3GQbWI1dmYpzIFZNHVFnmsdSsask4X76
         9U3zISoMTjeWWdrUvGsmzAS8pVzRtVI27TEB5MdxZjDj1lbp/3EtIe6D6r7KqUMR/9wp
         8NI5FsRY1AYs2XE6QT8PgfL65bnaHvKA1SQTEFfHlJ+Vb6ZDuKGmuy7CNT6l/HD+IMoT
         Cqi5yO6ExIH43AX9dOOkvUEjMgGz8LYBuBLAP+z2AA27oDHkdq2PbPOJcRkMEQWGKMbK
         LVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4F5OJvsvq9ejZesg8n2XLNkI3aUegxfzK3ilgDVUyN6OEDrBS1S9naYlq9FatLhbUF0RS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm3tvTDi1q31/dXiZSWfo21kKKGvgqyoAFis2nL/+aiRX1ad8J
	zMqsNP0ymyIcagzrBtZQqLIDO7im68GMwbSFFWPEd/rR/O5IHJsnkbsbLqtvW46308osoFOq7DX
	eFKL4SPwulmIv5Hv5hLkzU1OTeTJYD/I5qcHqYB7x
X-Gm-Gg: ASbGnctFt88BtvOP+2/02L3l+5WO3N4wxhVBkU45GF0s9gnl+S+85wAzputhyTnhBUB
	5lr3UtrzlJ5sheaAmHOOu8xErPIcsJJ58ckbeM8EbRMn6BqiqxCriWjV0+Rs4/VlkKECYpx6sHX
	i9/Q+OCwrFYJhwjdUKD9e5w1OBvDOE7yA81Kv3OAIUj+AJY/C01UQMJkgLsm0YmEBVZpWsvom+C
	QUsMtkiLSB8wzp2HdxnhdqjGPsiUa6vzDTcqd0xbeuW5M+qYdFTucfr/KrwAw==
X-Google-Smtp-Source: AGHT+IHYGUcixIR/dwWsgGEgFB1TOwlgrZ0O4FlqafV2iJGSlcEq1KnUzPyMPrhTBrvu1VqtuDJ2xHHxKwyBuVmjxY4=
X-Received: by 2002:a17:90a:e184:b0:32e:b2f8:8dc1 with SMTP id
 98e67ed59e1d1-32ee3ee55c5mr7425841a91.10.1758205892532; Thu, 18 Sep 2025
 07:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de>
In-Reply-To: <20250918141511.GA30263@lst.de>
From: Marco Elver <elver@google.com>
Date: Thu, 18 Sep 2025 16:30:55 +0200
X-Gm-Features: AS18NWD0SUeFqGV9WlY2IdwTn_KEVlrUb6EWkUXQGUd586AZF2O57bI6Ojf1TCc
Message-ID: <CANpmjNN8Vx5p+0xZAjHA4s6HaGaEdMf_u1c1jiOf=ZKqYYz9Nw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 16:15, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > A Clang version that supports `-Wthread-safety-pointer` and the new
> > alias-analysis of capability pointers is required (from this version
> > onwards):
> >
> >       https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
>
> There's no chance to make say x86 pre-built binaries for that available?

Not officially, but I can try to build something to share if you prefer.
Or a script that automatically pulls and builds clang for you - I have
this old script I just updated to the above commit:
https://gist.github.com/melver/fe8a5fd9e43e21fab569ee24fc9c6072
Does that help?
