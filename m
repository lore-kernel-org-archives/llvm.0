Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA922CA7
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 11:19:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l10so16197500wrh.7
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=clUYj/+nXtJpn7jgCQvOAByqmG1PbwtEaRATW5ebUhM=;
        b=QPsQlTMnsAiwcnPHzxQDtG40F0KjKrgGUxljCrvJBe/jzJ/PJnkTf6osbAbk9ADXoY
         GSMFOErQiLRUXXMcEmMuMAPTi/oluzdei4gLnAsjGfR+LO+vMbrFGrQfEJsvLudHtg01
         TUDt2Q1TpqZh+PT+24RmggJK61nOfSmxJXUZrLEP+LtHW3AZ5b0z7fHSzPmA7YPScerE
         xenrwLyq2j06qmF11HFk4k+4Y+tNH1mELTta615QkekfHA6lkt4lV1NxwG7u6O9gQFtJ
         V7HjtOj1jB6tj4PpbFJ9+CipA2HSdbk71XEDV/91Lf7lmBtt0vb2v+/28gTSZ5IEqWp1
         VMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=clUYj/+nXtJpn7jgCQvOAByqmG1PbwtEaRATW5ebUhM=;
        b=YinCheTl6rJkRVkv4H7BstcG7C2fxpIrr/iVyEWmBHFFlRgSIi15JH0z6eaAmeXPRJ
         KMT0vf/nL+gZwPdd1yio8sFIemv4Om8Ovnh3QvK4GoNXhce5FLD4HL1CpClS3QOpwLh/
         /PQNSHZk5en9CNCN2lT556zeR6/LrCnN5lc54OEiSXByuxWU5R4NEz5zmjC5nLs81Qsn
         9nuR7bMzu+LzTzD4xUflsHu4GMRL6983sYvyXyOOgv/DyRQY912X54OHWVmthDHeTB6n
         NrNcYgGd6UAWxi26ZnH6rNcYy1pn9VYl4YWqKwBXj8D4pH9ksCBxC6s3at9Sc0CNXrNG
         mAKQ==
X-Gm-Message-State: AOAM531Ght4YuDJ5ubetlUwvyoxfXEA2pG10BiczV+KkRdkEahdnMTTg
	iTaJacK2DgXtwULif9GHw7k4wFo/BDc=
X-Google-Smtp-Source: ABdhPJypqzTRkXw/SIFymnr7smoGdQ4sKRQgx6t/yDH6FFJKqUZjTl468/Ok6Kk/UqltZAV90Gn7ew==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr282573wrm.600.1641640742275;
        Sat, 08 Jan 2022 03:19:02 -0800 (PST)
Received: from gmail.com (84-236-113-171.pool.digikabel.hu. [84.236.113.171])
        by smtp.gmail.com with ESMTPSA id g6sm1389563wri.67.2022.01.08.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 03:19:01 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sat, 8 Jan 2022 12:18:59 +0100
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
Message-ID: <YdlzI9P7tBMODxal@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdSI9LmZE+FZAi1K@archlinux-ax161>
 <YdTpAJxgI+s9Wwgi@gmail.com>
 <YdTvXkKFzA0pOjFf@gmail.com>
 <YdYQu9YxNw0CxJRn@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdYQu9YxNw0CxJRn@archlinux-ax161>


* Nathan Chancellor <nathan@kernel.org> wrote:

> 3. Build failure with CONFIG_SAMPLE_CONNECTOR=m and O=...
> 
> I am guessing this has a similar root cause as above, since that commit
> mentions an error similar to this.
> 
> $ make -skj"$(nproc)" ARCH=x86_64 O=.build/x86_64 allmodconfig samples/connector/
> In file included from /home/nathan/cbl/src/linux-fast-headers/samples/connector/ucon.c:14:
> usr/include/linux/netlink.h:5:10: fatal error: uapi/linux/types.h: No such file or directory
>     5 | #include <uapi/linux/types.h>
>       |          ^~~~~~~~~~~~~~~~~~~~
> compilation terminated.

Correct - this test now passes with the UAPI symlink fix applied:

  kepler:~/mingo.tip.git> make -skj"$(nproc)" ARCH=x86_64 O=.build/x86_64 allmodconfig samples/connector/
  kepler:~/mingo.tip.git> 

Thanks,

	Ingo
