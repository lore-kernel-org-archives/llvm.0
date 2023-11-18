Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B53D28F
	for <llvm@lists.linux.dev>; Sat, 18 Nov 2023 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PMunbb7S"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6c115026985so2778831b3a.1
        for <llvm@lists.linux.dev>; Fri, 17 Nov 2023 21:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700284028; x=1700888828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lKGCyxChKFOooyn4nhp/fQJjLDjL83Xb5sK6FC0eRv8=;
        b=PMunbb7SR3vJF1dSQ1QFK+AWtWzTU9evBu196q6Gzmpb692znHmtwUPvxYkwMfjunE
         mqPI9ja2DzsiagKp1Q6MAxNiTGE7xW8LvwIOZmVzJSx48yfjnvTwvMvm4Dx+Dw7hEQ4c
         dmy6UqNEgRoNErylylzVpZQdB1F+otf91F0+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700284028; x=1700888828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKGCyxChKFOooyn4nhp/fQJjLDjL83Xb5sK6FC0eRv8=;
        b=eBndkaRyounEKerOe2ZpsnvFlEkpZrIFrUEgvp3v3ol3hCue9ffabMttwWfVufwCPK
         P/BQxnTiJbiYKNzrL3jaoiSUaewN44kDxcfskoCsE7nSGbjuNQfeZ8laHZ44QEtlZoHa
         iYVK4Wy/EA3MX6Y/lAHZ83KPTsd/QT6wyuWUXJs6ccOZ2M4ssObz6DnEEhJ58b5y9aiF
         rSWIp2wncwvbJ6Dxvx0CNpx2tIhDLBryPgLQPaKS7xeZWAxfSM4GkHP04lqsjJ2i34qM
         v9fTy+T91idNg+UbMJ1VDF6Lwvbui11GtVQ0DhjgnjGg02OQ6NJCPJsplnx3uikC7W3L
         j32A==
X-Gm-Message-State: AOJu0YxBN+f5wDkBVd5HmzwX8/isLDlsZezqk9i+JjkudQbNvX2NsP1H
	JYgtrLpA14E2JmR8HHxLV+PK7A==
X-Google-Smtp-Source: AGHT+IGNWlPfhujvnkfEJxzvO5aIVJEKZmNrdSFQ/jpUancAewtxfGDJCqm0j1PoE0vf6VBKOWpI8w==
X-Received: by 2002:a05:6a00:4c81:b0:6bb:aaf:d7db with SMTP id eb1-20020a056a004c8100b006bb0aafd7dbmr2283596pfb.29.1700284028634;
        Fri, 17 Nov 2023 21:07:08 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f32-20020a056a000b2000b006c5da63556dsm2286744pfu.178.2023.11.17.21.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 21:07:07 -0800 (PST)
Date: Fri, 17 Nov 2023 21:07:06 -0800
From: Kees Cook <keescook@chromium.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: CFI support for type punning?
Message-ID: <202311171936.A19E992@keescook>
References: <20231118001208.narka6bl3axdpflf@moria.home.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118001208.narka6bl3axdpflf@moria.home.lan>

On Fri, Nov 17, 2023 at 07:12:08PM -0500, Kent Overstreet wrote:
> [  228.367619] CFI failure at process_scheduled_works+0x273/0x4a0 (target: btree_update_set_nodes_written+0x0/0x50; expected type: 0xb86001b6 
> [  228.367645] WARNING: CPU: 3 PID: 11 at process_scheduled_works (kernel/workqueue.c:2630 kernel/workqueue.c:2703) 
> [...]

Hunh. This is the first report I can find for bcache being tested under
CFI! Dang, perhaps 0day or syzkaller need to grow some bcache (and now
bcachefs) exercises.

> which indicates that bcache and bcachefs are both broken with CFI
> enabled; closures (lib/closure.c, include/linux/closure.h) do type
> punning with passing a void (closure_fn)(struct closure *) to the
> workqueue code, which calls it as a void (workqueue_fn)(struct
> work_struct *). That is, we're considering the closure to be the same as
> the embedded/unioned work_struct, as far as the workqueue code is
> considered.
> 
> Is there any way to tell the CFI code about this kind of type punning,
> or would it be possible to add support for this?

There is no type punning support, though a neighboring idea has been
proposed to define separate groups of the same prototypes (e.g. so one
work_struct user can't call another work_struct user's callbacks). But
that's all future work.

> The alternatives I'm looking at aren't terribly palatable; we'd either
> have to increase the size of struct closure with another function
> pointer (and another indirect function call on every use); or we'd have
> to patch the workqueue code and add a flag (Tejun won't like that), or
> I'll have to convert every closure function to take a work_struct arg -
> with a resulting decrease in clarity of types.

I think the reason the existing compiler warnings we have in place for
this didn't warn was because there was no explicit casting; it was all
hiding in an intentionally overlapped union. :)

struct closure {
        union {
                struct {
                        struct workqueue_struct *wq;
                        struct closure_syncer   *s;
                        struct llist_node       list;
                        closure_fn              *fn;
                };
                struct work_struct      work;
        };

...
        BUILD_BUG_ON(offsetof(struct closure, fn)
                     != offsetof(struct work_struct, func));

It seems the assignment used "fn", and the WORK_INIT used its internal
func for the call. No casting needed. :)

The good news is that closure.h _is_ using the common code pattern for
these kinds of things (container_of() to find the wrapping struct),
but it's using "struct closure" instead of "struct work_struct", which
is what you concluded as well.

Part of the work we did over the last few years now was fixing cases
like this (where the wrapping function was being passed instead of
the work_struct), and it just needed a few localized refactorings
that Coccinelle seemed to handle well. I don't think it should be too
disruptive here either.

static void journal_write_done(struct closure *cl)
{
        struct journal *j = container_of(cl, struct journal, io);

Would, I think, become:

static void journal_write_done(struct work_struct *ws)
{
	struct closure *cl = container_of(ws, struct work_struct, work);
        struct journal *j = container_of(cl, struct journal, io);

Usually these kinds of changes resulted in no binary differences (as
expected). I do agree, though, the ergonomics are a little weird to
expose the internals of closure.h. I've seen other APIs paper over this
in their own special ways. For example, maybe something like this:

#define CLOSURE_CALLBACK(name)		\
	static void name(struct work_struct *ws)

#define closure_type(type, member, name)	\
	type *name = container_of(ws, struct work_struct, member.work)

CLOSURE_CALLBACK(journal_write_done)
{
	closure_type(struct journal, io, j);
	...

The less common code pattern used for fixing CFI issues, as you also
considered, was a wrapper function. (Which would need space in the struct
for the separate callback, as you figured.)

Another example, though not a work_struct refactor, was what we did
in NFS last year (which used Coccinelle):
https://lore.kernel.org/lkml/20221202204854.gonna.644-kees@kernel.org/

And another, which was quite painful, was the struct timer_list work in
2018, which touched something like 1000 files. :|
https://outflux.net/blog/archives/2018/02/05/security-things-in-linux-v4-15/#v4.15-timer_list

-Kees

-- 
Kees Cook
