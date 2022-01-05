Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED910173
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 00:40:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id j21so154987959edt.9
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 16:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fN42ziO4udJZOMwfp7U3CaF0v31ogcDT0UpfTa7XxeQ=;
        b=EGjTKa0Ym3rjGhs+OIu1mp+QfRepLT6s0RxLzvTTrxKsSkwAE9OxRjekyQvkKzf7nh
         vQivcFRIVKF1+H1lya6DEy/em2pSjTzFtfgvirj+LlqdiEFeyMjreCRWelV/p42kp7uJ
         Sf4lO2/sIDXH1zkUzZYlE8HXrCwS9triGrizzmVWoZOL2Km4s1fQWgm9aw6Su8ltQyMw
         HisOiAxs7+F25Xag0NqFBfF+lK+MrzHu8EmtGLdy2FCsd8T/MWw9y4ChwhfncbAJZPAy
         UqHc2M/3RMN7Dmkah+L+zrp9an6yYTJzKhgSMo3rdTF1jIxys74260C0BKs87SoRrygJ
         bD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fN42ziO4udJZOMwfp7U3CaF0v31ogcDT0UpfTa7XxeQ=;
        b=ASAr5j9Dihh3Zkru6dxxFXm32k+6NGUzPgijaHhAw8qs61LL3yVhE0Codzf3OjikNU
         I7QeTeY9bRg/Q3Z1Mbz8BF5oCnbnrYk6/nC11x1mxVEQjrtWCE8XbYG5byY70cPzHIJj
         ddRXETC8tWs6r6X3AzEI4Zy9EV80Pzu9os2GpzYQN51EvNs4omAUphaJ0Ym30HMo4eVB
         +7kk83lH0qoPiNcLTf6JoTXu3XKBHhWWq9WNdRGxPEMi1qtwqpCOgQcRO9VboyoLNfDd
         tx7vCZJO6ePAiyWh4CyGXCyQjNscD5ldvw8tV461NQH9higqYxTsikYyyV7CoHzoW7FY
         r4gA==
X-Gm-Message-State: AOAM531Rb9utdmlgUaWYmbEIHb9cUXa6dhHdIP/X93uP1kJgXM38VVbG
	CSCO/nUFyevmCb6pvpMOOzc=
X-Google-Smtp-Source: ABdhPJyPBkxLWiu9fIEY9pd/2arX3HKg/G3CQ12wOwDqfECEZAZnss3CAKK7bj8OfePAzYg/Y5pShA==
X-Received: by 2002:a05:6402:5cf:: with SMTP id n15mr48741951edx.6.1641343234290;
        Tue, 04 Jan 2022 16:40:34 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id k12sm11775890ejx.119.2022.01.04.16.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 16:40:33 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 5 Jan 2022 01:40:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <YdTpAJxgI+s9Wwgi@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdSI9LmZE+FZAi1K@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdSI9LmZE+FZAi1K@archlinux-ax161>


* Nathan Chancellor <nathan@kernel.org> wrote:

> > I.e. I think the bug was simply to make main.c aware of the array, now 
> > that the INIT_THREAD initialization is done there.
> 
> Yes, that seems right.
> 
> Unfortunately, while the kernel now builds, it does not boot in QEMU. I 
> tried to checkout at 9006a48618cc0cacd3f59ff053e6509a9af5cc18 to see if I 
> could reproduce that breakage there but the build errors out at that 
> change (I do see notes of bisection breakage in some of the commits) so I 
> assume that is expected.

Yeah, there's a breakage window on ARM64, I'll track down that 
bisectability bug.

Decoupling thread_info and task_struct incrementally, so that it bisects 
cleanly on all architectures, was always a big challenge. :-/

> There is no output, even with earlycon, so it seems like something is 
> going wrong in early boot code. I am not very familiar with the SCS code 
> so I will see if I can debug this with gdb later (I'll try to see if it 
> is reproducible with GCC as well; as Nick mentions, there is support 
> being added to it and I don't mind building from source).

Just to make sure: with SCS disabled the same kernel boots fine?

> Sure thing, I will continue to follow this and test it as much as I can 
> to make sure everything continues to work well!

Thank you!

	Ingo
