Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6314AB4
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 12:13:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso2861587e87.3
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688127210; x=1690719210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7twfZotfcVAo8HDyHViXvS6PUSJNCPNn24nmZO5Ouw=;
        b=WNjV4Mw1Fod95iFm7lO7tuiDyjHZVX5fSVy8qc2hsOVo6QATOdhnEO0wjDFo8fEv58
         Ei9zrNHj18XKP7LXlxwQ+1XqpY0K2F8XErKC1AHd1WeMkvXGVQWCQVVnqCanLZ6QK6+e
         euafEWSaCiW0qgFrPtnWtkccmdBxKVpuPAqPKvb7xQ2XCpIcx4fkkgspECdBswmhgXfZ
         fmJz1pWMA1MSPBRPF1y9w666DPVyrHjF1e3iFycOuUAvxWKailmDyIp2eR+nftJvObQR
         i4WU3SDi+BA2NzrRV+NATwPhKSyvcVAVeV2tAurURMf8ECNr77RWy2WYJh72yqgTn/kt
         fmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688127210; x=1690719210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7twfZotfcVAo8HDyHViXvS6PUSJNCPNn24nmZO5Ouw=;
        b=lWSJmGq63332TqD2LOhs58VzcXeJjqSExI08HIQ+cmINwVCVn5/q0ePtTZZH3IDVKB
         HByVo/fcGrneHetijGPIOt3eiCf+Sjng07/c6PA+BPJBo9oCbhYdBWWQ2DhQ/l2r5WAN
         4bfaySj6tMh0UfEjBTx5WbpPzfEZ/E3kd2bnzrRWVRtx3gbdgd05Bj47zoTQSrmSCpri
         9T1CytwB/k3Xyy4MbGFyQrUBu1yKVO6b3Wi6mBta01NxVlg1+1QNh4o9aZWLyMNztK3Q
         PouGbpXhIvkaZo0XhRQY5VTF+U3HOpyOUcDxx0L8+uCvnbfNfr6kQphnpXYWvkLtrZMi
         v/VA==
X-Gm-Message-State: ABy/qLbpkId28vbtZ/X1kUVLTBMmJrUWny1E7gvNHApwUydtKBvdRrbF
	t8kJC7/QPbbLTgDsXwDXv3zn8A==
X-Google-Smtp-Source: APBJJlGHAhFmWKRIdbg7zEy5w4+o+FvHdIq/YMx829mO5Tmp54dmAHDACR1wM+u0dNEGS2XhmkhKyg==
X-Received: by 2002:a05:6512:3e26:b0:4fb:780c:fce9 with SMTP id i38-20020a0565123e2600b004fb780cfce9mr2527865lfv.58.1688127209799;
        Fri, 30 Jun 2023 05:13:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003fa973e6612sm13742006wmc.44.2023.06.30.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:13:28 -0700 (PDT)
Date: Fri, 30 Jun 2023 15:13:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dmitry Antipov <dmantipov@yandex.ru>
Cc: Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-nfs@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] SUNRPC: clean up integer overflow check
Message-ID: <ac54a100-9e7f-47bf-a415-ca3784c08b1e@kadam.mountain>
References: <2390fdc8-13fa-4456-ab67-44f0744db412@moroto.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2390fdc8-13fa-4456-ab67-44f0744db412@moroto.mountain>

We were kind of having a discussion about static checkers earlier...

The point of static checkers is to find code that doesn't behave as the
authors intended.  It can be tricky to determine what is intentional or
not.

If you have a condition which can never be true then that's fairly
suspicious.  Why would we write a condition like that?  But you have to
look at the context.

	if (!p) {

Maybe that's part of a macro and even though "p" can't be NULL here, it
can be NULL in other places.  So we can't warning about bogus NULL
checks if they are inside a macro.  There is a valid reason to check.

With NULL checks, people add a lot of unnecessary NULL checks just out
of caution.  So even though the NULL checks are unnecessary, they aren't
harmful.  You only want to warn about them if there is something else to
make them suspicious.  For example, the if the pointer is an error
pointer but you're checking for NULL then probably that's not
intentional.  Or people think that list_for_each() loops exit with the
iterator set to NULL but that's not how it works so those checks should
trigger a warning.

Maybe we have a condition "if (unsigned_val < 0", and that's very
suspicious, but maybe the context is:

	if (unsigned_val < 0 || unsigned_val > 10)

In that context we can see what the intention was, and that condition
will clamp the value regardless of the type of unsigned_val so it works
as intended.  It's not a bug.  The static checker should not warn about
that.

Another impossible condition could look like:

	if (x & SOMETHING_ZERO) {

Quite often the SOMETHING_ZERO is because it depends on the .config.  So
in Smatch what I do is I make a list of macros which can be zero or not
depending on the .config.  In a lot of cases, what was intended was:

	if (x & (1 << SOMETHING_ZERO)) {

That's a useful warning, but you have to create that list of allowed
defines otherwise it generates too many false positives.

So here we have:

	if (u32_val > SOMETHING) {

The condition is impossible when the code is compiled on a 64-bit
system, but a human reading the code can see that it is an integer
overflow check and Smatch can see that too.  I haven't looked at Clang
or GCC internals to see how hard it would be to fix them.  Maybe it's
really hard to fix?

With static checkers we have to accept the checker is going to get it
wrong some times.  The checker is going to warn about code that works
as intended and it's going to miss over 97% of bugs.  But hopefully
it generates enough warnings to be worth the time it takes and the
number of false positives is small enough so you can keep up.

regards,
dan carpenter
