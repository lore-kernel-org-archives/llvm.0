Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA3257C
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 20:03:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r4so7325745edi.8
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EQf+dWgsYoxxd2dvzOjUZKth6ahCt1jz8pAa/2/RQdU=;
        b=Z34M9+Q1uuvvvI+KYw/avRL2yyUA1m8DGjvaprLJbVuoikvV5MBvcGm2QdAoO6deNq
         GU6cmr8JZETRMdUSJPeQ/TNKqz4kQLXn/KwQnzaD96e1EokSnzXcJtM1v45F7UVSDS2+
         JwQdCJohE3gveqyFlczZ8JXPsxpLBEglcSYyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EQf+dWgsYoxxd2dvzOjUZKth6ahCt1jz8pAa/2/RQdU=;
        b=sQ2hFhCiY5eDgqPk/1bHBQv7KWCQ5vzZh58YOdcVvqyo+6oWcWkcbPQaPEZLEozUFL
         M8ib23pdpOUI6kWtbDTQxXYL8Zb1VaahPTlpdRVh9ofynPQPGQ9LAFMxNpJrbotagLux
         ybRnhSKPEIRy0zm4mKg+FPwkYnuwXRHMYEXAC9Q4mPnlljDQaP+XVadGc/8zlrUbznuq
         gvh5eGvT1okoK6DBzswo1V/VZzYYXFo2DsFSWYOiQODdWkNq+nPZ/VzRz06ip3qc5vGQ
         ACNkp9bVOKedrSFg6mTJCdFtz3+qrlH+l1Si+qoXkGhGBj/03Z1MRVTA3EahC2svInOB
         tNxw==
X-Gm-Message-State: ACgBeo1Qk8U0OLzG4dGFMLDlWe9jXmdPlP94H9x7+b6AodfWKco9O2LE
	kcGQQDacU06rWrGJr/yCshV7TwuiZj2gGozj
X-Google-Smtp-Source: AA6agR75IR7fBJ3dz5RWMjZy29xVwF8CbzFWkNS31aGxYAZ2v9XdlP7Q1gzkk5uPjL593dqBTjp0mQ==
X-Received: by 2002:a05:6402:2714:b0:43d:ca4f:d2a2 with SMTP id y20-20020a056402271400b0043dca4fd2a2mr11930705edd.185.1660507425298;
        Sun, 14 Aug 2022 13:03:45 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id n6-20020aa7c686000000b0043d34ab7ad6sm5305303edq.49.2022.08.14.13.03.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 13:03:44 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id b4so3844439wrn.4
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 13:03:44 -0700 (PDT)
X-Received: by 2002:a5d:56cf:0:b0:21e:ce64:afe7 with SMTP id
 m15-20020a5d56cf000000b0021ece64afe7mr6817978wrw.281.1660507424308; Sun, 14
 Aug 2022 13:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOi1vP9BSi-65of-8D0BA1_DC0eVD_TQcWkhrGJwaXw_skhHFQ@mail.gmail.com>
 <5d0b0367a5e28ec5b1f3b995c7792ff9a5cbcbd4.camel@kernel.org>
 <YvVzHQ5DVaPAvw26@ZenIV> <72a93a2c8910c3615bba7c093c66c18b1a6a2696.camel@kernel.org>
 <YvV2zfT0XbgwHGe/@ZenIV> <CAHk-=wgYnAPiGsh7H4BS_E1aMM46PdSGg8YqFhi2SpGw+Ac_PQ@mail.gmail.com>
 <YvV86p5DjBLjjXHo@ZenIV> <CAHk-=wjCa=Xf=pA2Z844WnwEeYgy9OPoB2kWphvg7PVn3ohScw@mail.gmail.com>
 <CAHk-=wjLLw0xjL+TZs5DUGL8hOpmLMa4B92aDVFxw4HZthLraw@mail.gmail.com>
 <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com> <YvlILbn1ERLgZreh@ZenIV>
In-Reply-To: <YvlILbn1ERLgZreh@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Aug 2022 13:03:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjvKtkqF9AXx8GoA80h_RNUV=Ld8qhi8ZEPmDXC0VUDUA@mail.gmail.com>
Message-ID: <CAHk-=wjvKtkqF9AXx8GoA80h_RNUV=Ld8qhi8ZEPmDXC0VUDUA@mail.gmail.com>
Subject: Re: [GIT PULL] Ceph updates for 5.20-rc1
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 14, 2022 at 12:08 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>
> There's a cheap way to reduce the register pressure:
>                 seq = raw_seqcount_begin(&dentry->d_seq);
>                 if (dentry->d_parent != parent)
>                         continue;
>                 if (d_unhashed(dentry))
>                         continue;
>                 if (dentry->d_name.hash_len != hashlen)
>                         continue;
>                 if (dentry_cmp(dentry, str, hashlen_len(hashlen)) != 0)
>                         continue;
>                 *seqp = seq;
> could move the last store to before dentry_cmp().

I actually tried that, it doesn't really end up helping.

Gcc does well regardless, and clang ends up really wanting to move so
much out of the dentry_cmp() loop that it runs out of registers and
always ends up doing a couple of spills.

I think it reduced the spills by one, but not enough to generate the
nice non-frame code that gcc does.

It's a bit ugly, but the code probably performs quite well - the
spills aren't in the inner loop.

             Linus
