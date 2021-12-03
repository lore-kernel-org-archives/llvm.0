Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E562C9D
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 23:42:15 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso5352182otf.12
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 15:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JwQlDJ0eW7f9hYvr2thOhENg/qO/ZaZzGs6+sDFshM=;
        b=AJ/TTnwyVYSX6l2dbIpeBUSjXxXc1p865vm+D2RhGu04FOd1dojH/S075xAjkHvREE
         CX63gNQpg8eFmDqxN/+1Qwah0kEZdrJU5IZLuEmukgMBSbGT8ZVsX87ACdVvxTvnXDBK
         mZYWElg8rD4PTchWPB7nykjdZkyxRmpHBGGNR8kqpq8vCZXDfxbqez7uIQ5NdV7hMoCV
         Lf3SWZgqQW1MzTH/UOTBSje7705REt9thTaNdYmeUjFBEC9AlYqm2gHhrWgfoy3hsGkp
         iLaT99dRzBy0QEyguUM6y79ZuC6inrGFlSDfBARE+En7rgXRrfkwyxOXfrRn2Ukcdd0x
         ZlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JwQlDJ0eW7f9hYvr2thOhENg/qO/ZaZzGs6+sDFshM=;
        b=2d/VIG75vYLkcXc/K283387xUa1LPf3Z/Tg9n+Ed5swehscJ/ozLJ3l1Hi99whakfg
         8yZ/n0VH+beO1ydvmUFHiUMZVizRIGhQVUGmCU/FvWjfQJbjlzaA9KAsiGOaNc6Alkrm
         QiySc2iJ7/Y0sNhWNzSo850MVk/d0aGxYQQJSl4mgjPIHhbEvhl9pbyu1mZmEpAdC6r8
         Fv3+3/HyGswIEKjfgILb8f6Z5EOKsVFqutItBpJcqfrnXIdD33AErrH/Km2ExwDk/WXC
         oGILRC+iJAy6HCztdB1PUWqgE+sVv9+DKYdmHIWF6gBMuW1sTy+e3B08W77yMsJ3990T
         YmwQ==
X-Gm-Message-State: AOAM5312JpfKzOmsurK3OAwz3y7R0ETh0D4hV4AjQIWPbarznpHjNKKB
	MCtmeLsqL6Dp3hw7L/HLc1IwENdlfSSy0fWqtn3JSw==
X-Google-Smtp-Source: ABdhPJzmeHxYPCJX3eYijPp8C1oQT6JTRLMS+qeYs0OAMS77tBDynJpAjMPOmqpeKVSmDxkzBYLKtTfkIQWBc6uaOn0=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr18387018otl.92.1638574934196;
 Fri, 03 Dec 2021 15:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com> <20211130114433.2580590-5-elver@google.com>
 <YanbzWyhR0LwdinE@elver.google.com> <20211203165020.GR641268@paulmck-ThinkPad-P17-Gen-1>
 <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1>
From: Marco Elver <elver@google.com>
Date: Sat, 4 Dec 2021 00:42:02 +0100
Message-ID: <CANpmjNM0X1iAgz4vHTH4FSzdWdr1PiQQnoyFt-zoT2_VonFvVA@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] kcsan: Add core support for a subset of weak
 memory modeling
To: paulmck@kernel.org
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Dec 2021 at 22:09, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> A few quick tests located the following:
>
> [    0.635383] INFO: trying to register non-static key.
> [    0.635804] The code is fine but needs lockdep annotation, or maybe
> [    0.636194] you didn't initialize this object before use?
> [    0.636194] turning off the locking correctness validator.
> [    0.636194] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.16.0-rc1+ #3208
[...]
> When running without the new patch series, this splat does not appear.
>
> Do I need a toolchain upgrade?  I see the Clang 14.0 in the cover letter,
> but that seems to apply only to non-x86 architectures.
>
> $ clang-11 -v
> Ubuntu clang version 11.1.0-++20210805102428+1fdec59bffc1-1~exp1~20210805203044.169

Good catch! That would be lockdep telling me off for putting test
locks on the stack. :-/

I thought I had tested this with lockdep, but it seems the set of
semi-automated tests I run didn't (yet) generate a config with
KCSAN_WEAK_MEMORY + LOCKDEP.

This should be fixed by:
https://lkml.kernel.org/r/20211203233817.2815340-1-elver@google.com

Thanks,
-- Marco
