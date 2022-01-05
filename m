Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CD173
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 01:07:46 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bm14so155325274edb.5
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 17:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QcBoRznUQAtg4CEHssJ6IifXUoLNnxsCgJFoPsNsb6A=;
        b=LiLJAkJ0XeZjqsciuczbQmeqfldjcMuDVO48OIZgmdniFlvaypegSIX2JGGRz0EiGt
         YbFzR/jt5iCc49g1leTPWmZpyorA9WAZGm2xoEWE86zAKeS8k9BJWAo0T5ghWH3i6bX6
         Z66fNYyf1RYgsnKvIB30W8m49lxPGdFjQW8iIg+orlXe/EnEjqCF0tkSWLQGfoiOxPzl
         NarKYUn5vvQd6IwtHsADDxQJ5Ws1tYq6pOvndi8i0h4A11hFkCicn70YV9VoHJ/KgTDv
         RkgoOwadBua/is1dnpO/ANR2usdDW6WehCfLtG0mPUBkmPa5W1HxjqXezYCmxGZ7+KVN
         Ivrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QcBoRznUQAtg4CEHssJ6IifXUoLNnxsCgJFoPsNsb6A=;
        b=eGDrJcpkdCfGdqadHFeWhdCCM15Mby2iHAlKpMgKYosfbowFZM6sQZXMXA8K0O2YXc
         F7UciP7PRw2rsLCayLBy4h5DnC3jEnlB8oPB3E0+CQOiKz0Gu1zzRhF4hzofe+vOZlIw
         ncMwJczk1PZAa2hraIF71v7tz7bYZvA+rN0lVqxNnY7+oNr6mT7NMO8M2/ubxaFCkOCy
         nyWHzRDMlg2eOnQGaDjCpv5mRaxFxyIoWxJ32ekGEL37OmmoB0/l4bBsA5lsiD/r5mE4
         SXF9u/VIcuLXFbYbNK9JSKgD7hQdwOJAfUUMlEFG69xeCYN0SswynJCf1mD4xSixShR7
         hXjQ==
X-Gm-Message-State: AOAM530Gp+D0W/WrhU1svxqSTEoPuaEfzuaq7DmG42nzZenOQLoHRXPy
	f0mR3EHUXYpdzn1vkxcx86g=
X-Google-Smtp-Source: ABdhPJxwbYP1wQfL9S/iZi9ubZVSGaotyhW3Tig/qr6A+xXhD0bJjHhiaKyAZaRiOHmgJJCtwzW1/Q==
X-Received: by 2002:a05:6402:35d2:: with SMTP id z18mr50100643edc.100.1641344865149;
        Tue, 04 Jan 2022 17:07:45 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id sh11sm11965180ejc.17.2022.01.04.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 17:07:44 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 5 Jan 2022 02:07:42 +0100
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
Message-ID: <YdTvXkKFzA0pOjFf@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdSI9LmZE+FZAi1K@archlinux-ax161>
 <YdTpAJxgI+s9Wwgi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdTpAJxgI+s9Wwgi@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > > I.e. I think the bug was simply to make main.c aware of the array, now 
> > > that the INIT_THREAD initialization is done there.
> > 
> > Yes, that seems right.
> > 
> > Unfortunately, while the kernel now builds, it does not boot in QEMU. I 
> > tried to checkout at 9006a48618cc0cacd3f59ff053e6509a9af5cc18 to see if I 
> > could reproduce that breakage there but the build errors out at that 
> > change (I do see notes of bisection breakage in some of the commits) so I 
> > assume that is expected.
> 
> Yeah, there's a breakage window on ARM64, I'll track down that 
> bisectability bug.

I haven't fixed this ARM64 bisection breakage yet, but I've integrated & 
backmerged all the other fixes and changes, and pushed it out to the WIP 
branch:

    # 1755441e323b per_task: Implement single template to define 'struct task_struct_per_task' fields and offsets

    git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers

Let me know if there's anything missing or if there's a new breakage.

This is pretty close to what will be -v2.

Thanks,

	Ingo
