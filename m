Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58B2C9E
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 08:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A96EC341C6
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638953765;
	bh=Eko2Wx5nQFmKXKDz/fQjLDLX7s8lD39IKs1xuw9o9eE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GL61B9bP8nKh/AVPPXDP2hg7HRYePKblkrrjbrt7WwjOM2gbdH5PHi2hRN/QguBIx
	 afexMjiieoRW26lRI7JW/i4FAp9++wgrI1WAYZhDxQLNWqTpNkF8NH3aFTM+TB1WiT
	 grPkvEhrzjPdUFSDRYT+DppzUIfY+c/WOft99xgESJ3yyx2lBtpkA5sOpwiikVkqCe
	 b7B/YQrRUzbNmxLMiSyczlvHUGEsndguKWzUY+HStexYYY3LDY4WYFFwaa6jMMxcSQ
	 LSJP8KNlAiQL3VbAAcilxHMt7TCiMwjd+f/ErOcnxZYMp7CIq/VJNTvqepEKTVMOwT
	 3ed1+lTCa62ag==
Received: by mail-wm1-f41.google.com with SMTP id y196so1226989wmc.3
        for <llvm@lists.linux.dev>; Wed, 08 Dec 2021 00:56:05 -0800 (PST)
X-Gm-Message-State: AOAM532307dtTk3nSaqgiEZPWzFf/B8RkNC4i6/Rl0J9HRXOpbCK7XIm
	fQCv8MPkZiwG4F9fZLHyv/OCQ7lGys00/P0Jt5M=
X-Google-Smtp-Source: ABdhPJy+2il4LRg7kk5tsC0x987FYl7fnjjaweB7d96yKIBcRmeTEesTtuvHseEiSldzBXHu11OvpGO2ElHDQrl+ht8=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr14374486wmb.1.1638953763912;
 Wed, 08 Dec 2021 00:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
 <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
In-Reply-To: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 8 Dec 2021 09:55:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Uy0k+SnWYqz7FMsQsu14VzivMJcjGDRBLv17adFYywA@mail.gmail.com>
Message-ID: <CAK8P3a3Uy0k+SnWYqz7FMsQsu14VzivMJcjGDRBLv17adFYywA@mail.gmail.com>
Subject: Re: [RFC 2/3] headers: introduce linux/struct_types.h
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, 
	kernelci@groups.io, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 7, 2021 at 7:17 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Dec 7, 2021 at 7:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Working towards a cleaner header structure, start by moving the most
> > commonly embedded structures into a single header file that itself
> > has only a minimum set of indirect includes. At this moment, this
> > include structures for
>
> Ugh. I liked your 1/3 patch, but I absolutely detest this one.
>
> It makes no sense to me, and just makes that header file a completely
> random collection of some random structure types.
>
> And I absolutely hate how it splits out the definition of the struct
> from basic core infrastructure (initializers etc random inline
> functions) for said structures.
>
> So no. NAK on this one. I think it's a disaster.

Ok, thank you for taking a look!

Here is what I'd try next based on the feedback:

- reduce patch 1 somewhat to only include the types that have a strong reason
  to get moved to linux/types.h, describing them individually but leaving them
  it as a single combined patch

- keep patch 3, but leave 'struct super_block' in linux/fs.h for the moment
  because  of 'struct list_lru'.

- drop patch 2, but instead find a new home for each structure (along with
  its initializers) if needed for defining the types in the new linux/fs_types.h
  without too many indirect includes. I'll skip the structs that would be needed
  later for mm.h/sched.h/device.h/.... for the moment.

For the added headers, do you have a preference for whether to try grouping
them logically or not? I could either split them out individually into many new
headers (xarray_types.h, idr_types.h, percpu_rwsem_types.h, rwsem_types.h,
...), or combine some of them when they define related types.

        Arnd
