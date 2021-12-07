Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7012CA0
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 15:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25EDC341D3
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638891905;
	bh=g79tkc/a+Li5BdZaeuK+ZFDVc5mc9Hy5yd/urszLIjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E6EdCsQGqoI66hJoL3n7EpUqQkRuzF41LWfBtMRAipj4Hpih+lb/EyJGusecHIpJS
	 5v9tW4s3XK05fyMeKXg0fxx0BhC8B8jrBX/gF7KRo1SgAqGs2aFaj+PoTiIsA8GvH9
	 bpMIEDHWDaLpLqh23QL/hjqcOpOlFf1gY4OlxgH9vhK6DIZINIKn8AiR44xjrnlgk/
	 cjitLn+5gTDlFnVujFLlUNooV6zoJS1bnKVJMJ6Xq/SB+pu5pTLZIj9eSi3MntzA+O
	 siq/x4fZMlhHQsR2UjZqikDW6GtEN6INdrj4LYpTD7ABY4c7byjaqFJgGKmIPV6wYg
	 hUhDpO6aA63eQ==
Received: by mail-wr1-f53.google.com with SMTP id t18so6464600wrg.11
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 07:45:04 -0800 (PST)
X-Gm-Message-State: AOAM531gEat4k5LP6t7RTlWgeIlEDfgZYO/eyEyBzWLqv3Xu8ugIvSFl
	W4PIidKV3BxGeUVF19ZF/UCtbuuw8gZLyEVvHUU=
X-Google-Smtp-Source: ABdhPJwSjluaVW946SNUj9vmslHGrDrlZH11Hx32c+bZFjNzQOKfgQhzJkCPBop9NKH1wyvBiaVtudSZnKvhS0MQeEw=
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr52657201wri.137.1638891903239;
 Tue, 07 Dec 2021 07:45:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-2-arnd@kernel.org>
 <Ya979Hh0V2CdhNSU@casper.infradead.org>
In-Reply-To: <Ya979Hh0V2CdhNSU@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 7 Dec 2021 16:44:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gsdbiQoH_82Nm97DeENzJMUZn99m0LHE4Rt-0pd2d6w@mail.gmail.com>
Message-ID: <CAK8P3a2gsdbiQoH_82Nm97DeENzJMUZn99m0LHE4Rt-0pd2d6w@mail.gmail.com>
Subject: Re: [RFC 1/3] headers: add more types to linux/types.h
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, 
	kernelci@groups.io, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 7, 2021 at 4:21 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Dec 07, 2021 at 04:09:25PM +0100, Arnd Bergmann wrote:
> > +struct list_lru {
> > +     struct list_lru_node    *node;
> > +#ifdef CONFIG_MEMCG_KMEM
> > +     struct list_head        list;
> > +     int                     shrinker_id;
> > +     bool                    memcg_aware;
> > +#endif
> > +};
>
> This is the only one that gives me qualms.  While there are other
> CONFIG options mentioned in types.h they're properties of the platform,
> eg CONFIG_HAVE_UID16, CONFIG_64BIT, CONFIG_ARCH_DMA_ADDR_T_64BIT, etc.
> I dislike it that changing this CONFIG option is going to result in
> rebuilding the _entire_ kernel.  CONFIG_MEMCG_KMEM just isn't that
> central to how everything works.

I included this one because 'struct list_lru' is used in 'struct
super_block', which I move
into 'linux/fs_types.h' in the third patch. It is otherwise not used a
lot though, and
'struct super_block' is rarely much outside of file system code. If we
leave super_block
in fs.h or in a separate header, it should be fine.

        Arnd
