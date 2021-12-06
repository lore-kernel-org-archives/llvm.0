Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC72C9E
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 07:16:23 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id n66so19791415oia.9
        for <llvm@lists.linux.dev>; Sun, 05 Dec 2021 23:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMt90pKBGW/au5Bipth7kSeTJYiTzTjqmOMqmPuidYA=;
        b=XEkNxxxqqg+NZL/6yCqEZBN2SeXMqSO5LfwtQ38GYELUORg3SUHVW8Q5aVqB7bhGqn
         P4iX/WHdPtE2QjtkMfpoDJLQXNyPbDZrMsykHhDPapvSd5QU7F3VliQV9Yy6W3/x1/yp
         SPQHl5+NAMtC+/KeBPgVEFMP73nHOjUip8Pe4dz+ysEDvSgMxniak2Xxhya2c2DVmQoB
         PAasdNsXl2mjxk6waC9R44KBY4SXaQNbBsyaROg55cDONmTVDVBc7DjWKqjzSswf44xw
         uR5reE0LtjENxNpcjPtWEzqZ5Ub/3t0LHAu34RONtIOSh3hnK5gcV77ZKBM4aWABzWMB
         VIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMt90pKBGW/au5Bipth7kSeTJYiTzTjqmOMqmPuidYA=;
        b=uJLhCQq1uoD/mrXHRVbIPp3jE4ky1GB6t4MOKB+ZUh4nBXXY5tY0OJJ4uEIclF3AWf
         z5a7DRjZ3aol1rpKnKjv2uYa1kO5EGpTJcZ68xN09nkyhVWM80+AP0PgEcJY/RSSfdeU
         dcnVN01LXGdq8WBqWLEtE6ukFgKBtIeqhQ9hD1N8y9uxsMcQJaBt500vUy614Daj7ZK6
         orNyoXzPTyytXjZPyfzpAe6A9337g+0M6htWz6M7Gvxnyv3ZhI4GiRilGgbZhsmsrKOk
         /dHRC+MStY+wvgeFU4hUgTgQt8LvxVOzLo4kJyKvtVbEvdMNotGDpMM8/T2r/L5ykYYo
         7hPg==
X-Gm-Message-State: AOAM530Ijepbm/21vIhiAO1SKzvbjRIXVB5qIeQ21M6HblyWRlpyBpfm
	SzEA7qjsS+f9GjnRFSz0glDb97Xf6jiA/6eza9ZC+w==
X-Google-Smtp-Source: ABdhPJwuGLpnUIDTjpBX3F4eSh7hJt4tJrtZLc3E+7J6kt6gm5BiWZwD1+kzTVPh5ygzYL7/rFy9FoV52gjMqiSEDPo=
X-Received: by 2002:aca:af50:: with SMTP id y77mr22543199oie.134.1638774982675;
 Sun, 05 Dec 2021 23:16:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com> <20211130114433.2580590-9-elver@google.com>
 <Ya2Zpf8qpgDYiGqM@boqun-archlinux>
In-Reply-To: <Ya2Zpf8qpgDYiGqM@boqun-archlinux>
From: Marco Elver <elver@google.com>
Date: Mon, 6 Dec 2021 08:16:11 +0100
Message-ID: <CANpmjNMirKGSBW2m+bWRM9_FnjK3_HjnJC=dhyMktx50mwh1GQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/25] kcsan: Show location access was reordered to
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 06:04, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Hi,
>
> On Tue, Nov 30, 2021 at 12:44:16PM +0100, Marco Elver wrote:
> > Also show the location the access was reordered to. An example report:
> >
> > | ==================================================================
> > | BUG: KCSAN: data-race in test_kernel_wrong_memorder / test_kernel_wrong_memorder
> > |
> > | read-write to 0xffffffffc01e61a8 of 8 bytes by task 2311 on cpu 5:
> > |  test_kernel_wrong_memorder+0x57/0x90
> > |  access_thread+0x99/0xe0
> > |  kthread+0x2ba/0x2f0
> > |  ret_from_fork+0x22/0x30
> > |
> > | read-write (reordered) to 0xffffffffc01e61a8 of 8 bytes by task 2310 on cpu 7:
> > |  test_kernel_wrong_memorder+0x57/0x90
> > |  access_thread+0x99/0xe0
> > |  kthread+0x2ba/0x2f0
> > |  ret_from_fork+0x22/0x30
> > |   |
> > |   +-> reordered to: test_kernel_wrong_memorder+0x80/0x90
> > |
>
> Should this be "reordered from" instead of "reordered to"? For example,
> if the following case needs a smp_mb() between write to A and write to
> B, I think currently it will report as follow:
>
>         foo() {
>                 WRITE_ONCE(A, 1); // let's say A's address is 0xaaaa
>                 bar() {
>                         WRITE_ONCE(B, 1); // Assume B's address is 0xbbbb
>                                           // KCSAN find the problem here
>                 }
>         }
>
>         <report>
>         | write (reordered) to 0xaaaa of ...:
>         | bar+0x... // address of the write to B
>         | foo+0x... // address of the callsite to bar()
>         | ...
>         |  |
>         |  +-> reordered to: foo+0x... // address of the write to A
>
> But since the access reported here is the write to A, so it's a
> "reordered from" instead of "reordered to"?

Perhaps I could have commented on this in the commit message to avoid
the confusion, but per its updated comment replace_stack_entry()
"skips to the first entry that matches the function of @ip, and then
replaces that entry with @ip, returning the entries to skip with
@replaced containing the replaced entry."

When a reorder_access is set up, the ip to it is stored, which is
what's passed to @ip of replace_stack_entry(). It effectively swaps
the top frame where the race occurred with where the original access
happened. This all works because the runtime is careful to only keep
reorder_accesses valid until the original function where it occurred
is left.

So in your above example you need to swap "reordered to" and the top
frame of the stack trace.

The implementation is a little trickier of course, but I really wanted
the main stack trace to look like any other non-reordered access,
which starts from the original access, and only have the "reordered
to" location be secondary information.

The foundation for doing this this was put in place here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6c65eb75686f

Thanks,
-- Marco
