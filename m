Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6C2C80
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 11:02:38 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b13so146900511edd.8
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rRDBA6dGfnGP5OAkgHem6ju0LPPyWJk+kpQ57nDCkIM=;
        b=BZKJpmtqW8JYm0lVrL8ScDrDKgMpiIg/aCQiAR1xe0mm/rAdkNovCx7RWmBeRYAjJB
         eh3CguKWPaRsFodhRl6uI6ChL1cDUwd6WBb3vTWQhFzis8J4cDN/SfIuThhXCT2WsgeB
         655rbG1pSX86HudA4oXdFsgmM4buBJzNN+JAa9qG0roEVTGA2EMrgIUDJwEwCIljqQq6
         OuIlYANbu7FKUcDKVurXA68P7X71B07X6s12Xjkb7JERos6wBwLt9QLo7GfZ0acAcKBP
         wGbmJlGb3WstFW+BPIhPVksynSyKweIE+bG0Ib3bW6vt2z9b6uk3PjvLvj9iFIqUBACS
         lZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=rRDBA6dGfnGP5OAkgHem6ju0LPPyWJk+kpQ57nDCkIM=;
        b=pHuuHFbfxtRk41CK92kUggUkL98MeHO/7LZ6ufH8kLpJydaK9OS2P8Qt484wtCtRcG
         dEf9k8UWwfjlwclJPfHSH5xDZns9HiGvAhk1nnvLoXpZc7HUxWlZ2MdjOI0XM1xJJRj+
         WpaW13Q990pJPw6yaRcaWWQYLNJBXSLgRWw37g5hUohDWO3NIy/hhBo/ywaf7+lEaYpJ
         6/9RzRaxnB4SBjJg2wuP+bQDsUxFWNo13+9+Z/1ireFT4leHIEzSeADF99UlY65b6ZFC
         uDylG0MnbRbUYXRFIVYXgVePGIDRrcybUtnQQbYYJWqOSKnUW0BmJzVV5OjiLzltGgBm
         CqnA==
X-Gm-Message-State: AOAM531XPEk6R93Z3Qnl8vAkZb85ZAxLFsQWA04ShgGkc37u5drCICGT
	he26K9ioDyaJlqesu7WliK4=
X-Google-Smtp-Source: ABdhPJykDklM7AOsIrxJTs6xjJJgzSwnifoTQQG2u9q2STn1UF9zNoe6v4jxr90Y650YtXI2n5pQVQ==
X-Received: by 2002:a05:6402:5190:: with SMTP id q16mr48587736edd.332.1641294156592;
        Tue, 04 Jan 2022 03:02:36 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id sb7sm7624638ejc.203.2022.01.04.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 03:02:36 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 4 Jan 2022 12:02:34 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
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
Subject: [PATCH] headers/deps: dcache: Move the ____cacheline_aligned
 attribute to the head of the definition
Message-ID: <YdQpSigW9X224obC@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdQlwnDs2N9a5Reh@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> > 1. Position of certain attributes
> > 
> > In some commits, you move the cacheline_aligned attributes from after
> > the closing brace on structures to before the struct keyword, which
> > causes clang to warn (and error with CONFIG_WERROR):
> > 
> > In file included from arch/arm64/kernel/asm-offsets.c:9:
> > In file included from arch/arm64/kernel/../../../kernel/sched/per_task_area_struct.h:33:
> > In file included from ./include/linux/perf_event_api.h:17:
> > In file included from ./include/linux/perf_event_types.h:41:
> > In file included from ./include/linux/ftrace.h:18:
> > In file included from ./arch/arm64/include/asm/ftrace.h:53:
> > In file included from ./include/linux/compat.h:11:
> > ./include/linux/fs_types.h:997:1: error: attribute '__aligned__' is ignored, place it after "struct" to apply attribute to type declaration [-Werror,-Wignored-attributes]
> > ____cacheline_aligned
> > ^
> > ./include/linux/cache.h:41:46: note: expanded from macro '____cacheline_aligned'
> > #define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
> 
> Yeah, so this is a *really* stupid warning from Clang.
> 
> Putting the attribute after 'struct' risks the hard to track down bugs when 
> a <linux/cache.h> inclusion is missing, which scenario I pointed out in 
> this commit:
> 
>     headers/deps: dcache: Move the ____cacheline_aligned attribute to the head of the definition
>     
>     When changing <linux/dcache.h> I removed the <linux/spinlock_api.h> header,
>     which caused a couple of hundred of mysterious, somewhat obscure link time errors:
>     
>       ld: net/sctp/tsnmap.o:(.bss+0x0): multiple definition of `____cacheline_aligned_in_smp'; init/do_mounts_rd.o:(.bss+0x0): first defined here
>       ld: net/sctp/tsnmap.o:(.bss+0x40): multiple definition of `____cacheline_aligned'; init/do_mounts_rd.o:(.bss+0x40): first defined here
>       ld: net/sctp/debug.o:(.bss+0x0): multiple definition of `____cacheline_aligned_in_smp'; init/do_mounts_rd.o:(.bss+0x0): first defined here
>       ld: net/sctp/debug.o:(.bss+0x40): multiple definition of `____cacheline_aligned'; init/do_mounts_rd.o:(.bss+0x40): first defined here
>     
>     After a bit of head-scratching, what happened is that 'struct dentry_operations'
>     has the ____cacheline_aligned attribute at the tail of the type definition -
>     which turned into a local variable definition when <linux/cache.h> was not
>     included - which <linux/spinlock_api.h> includes into <linux/dcache.h> indirectly.
>     
>     There were no compile time errors, only link time errors.
>     
>     Move the attribute to the head of the definition, in which case
>     a missing <linux/cache.h> inclusion creates an immediate build failure:
>     
>       In file included from ./include/linux/fs.h:9,
>                        from ./include/linux/fsverity.h:14,
>                        from fs/verity/fsverity_private.h:18,
>                        from fs/verity/read_metadata.c:8:
>       ./include/linux/dcache.h:132:22: error: expected ‘;’ before ‘struct’
>         132 | ____cacheline_aligned
>             |                      ^
>             |                      ;
>         133 | struct dentry_operations {
>             | ~~~~~~
>     
>     No change in functionality.
>     
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> 
> Can this Clang warning be disabled?

Ok, broke out this issue into its own thread, in form of a patch submission 
- so that others don't have to wade through a massive tree to find a single 
commit ...

I'll of course drop these (non-essential) cleanups if the upstream policy 
is to follow Clang's quirk/convention, but I find the forced attribute 
tail-position a sad misfeature, due to the reasons outlined in this patch: 
a straightforward build failure in case an attribute is not defined is far 
preferable to spurious creation of variables with link-time warnings that 
don't actually highlight the exact nature of the bug ...

Thanks,

	Ingo

=====================>
Date: Sun, 20 Jun 2021 09:41:45 +0200
Subject: [PATCH] headers/deps: dcache: Move the ____cacheline_aligned attribute to the head of the definition

When changing <linux/dcache.h> I removed the <linux/spinlock_api.h> header,
which caused a couple of hundred of mysterious, somewhat obscure link time errors:

  ld: net/sctp/tsnmap.o:(.bss+0x0): multiple definition of `____cacheline_aligned_in_smp'; init/do_mounts_rd.o:(.bss+0x0): first defined here
  ld: net/sctp/tsnmap.o:(.bss+0x40): multiple definition of `____cacheline_aligned'; init/do_mounts_rd.o:(.bss+0x40): first defined here
  ld: net/sctp/debug.o:(.bss+0x0): multiple definition of `____cacheline_aligned_in_smp'; init/do_mounts_rd.o:(.bss+0x0): first defined here
  ld: net/sctp/debug.o:(.bss+0x40): multiple definition of `____cacheline_aligned'; init/do_mounts_rd.o:(.bss+0x40): first defined here

After a bit of head-scratching, what happened is that 'struct dentry_operations'
has the ____cacheline_aligned attribute at the tail of the type definition -
which turned into a local variable definition when <linux/cache.h> was not
included - which <linux/spinlock_api.h> includes into <linux/dcache.h> indirectly.

There were no compile time errors, only link time errors.

Move the attribute to the head of the definition, in which case
a missing <linux/cache.h> inclusion creates an immediate build failure:

  In file included from ./include/linux/fs.h:9,
                   from ./include/linux/fsverity.h:14,
                   from fs/verity/fsverity_private.h:18,
                   from fs/verity/read_metadata.c:8:
  ./include/linux/dcache.h:132:22: error: expected ‘;’ before ‘struct’
    132 | ____cacheline_aligned
        |                      ^
        |                      ;
    133 | struct dentry_operations {
        | ~~~~~~

No change in functionality.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/dcache.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 41062093ec9b..0482c3d6f1ce 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -129,6 +129,7 @@ enum dentry_d_lock_class
 	DENTRY_D_LOCK_NESTED
 };
 
+____cacheline_aligned
 struct dentry_operations {
 	int (*d_revalidate)(struct dentry *, unsigned int);
 	int (*d_weak_revalidate)(struct dentry *, unsigned int);
@@ -144,7 +145,7 @@ struct dentry_operations {
 	struct vfsmount *(*d_automount)(struct path *);
 	int (*d_manage)(const struct path *, bool);
 	struct dentry *(*d_real)(struct dentry *, const struct inode *);
-} ____cacheline_aligned;
+};
 
 /*
  * Locking rules for dentry_operations callbacks are to be found in
