Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA3173
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 00:43:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id o6so155179753edc.4
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 16:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZsER8dwM6Zj8zfdZ7MJqQNqpLImA5s2mJr5orsE/+Bk=;
        b=ZhvMcWxgJor4nybVVrUbIe5NBi5OKCxqmARkFVb5Rorit+kIiFmb4Y3/Jy9UpfHXEW
         NpEOr01dKcg/4AaUdaAXRgozlZ3/AbywrnV/O4J4XuIfao/vg6FylL0//PiTy+7KC5B+
         o4vfZ/9b8bypNFiysKhKD+Fg+VqvLXwJbU9eYhnpRPCODW2mush8yhAPzcDDereAtjiS
         YUFd70AFAb777UTf3tiZ+fATKqj6NpcwaAuGVqQaYasAdheGMd8tvnB4r5lf5UJbRGMq
         +4UVW+csoEOon7832sAqoYfx/+RTT4uLAbYjjMD1HQQWz63AKFZg+NZAMZaHzpAWUsuF
         kGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZsER8dwM6Zj8zfdZ7MJqQNqpLImA5s2mJr5orsE/+Bk=;
        b=WEURH824yVoQK2jCgUzEXh7JprKww06bvexPGfzL/D7aTkzEd2AkIi9b+yDF/cHtB9
         AGi4hM/+RuvBZMHkALbm0bSfZHaD6TPYfonnBZpCg+/pb49W6hE7D+dHWTthXNLDSvxC
         ecVW/5DXhpT5rlpABtxqiRqV9csPILvNr8N8uM9Qgq5fPWwY78YWHjPBPn37L0zhnNoX
         cDt6CFopjNQZKXu33srsKom//GfHdUsyaoqRg6LuIjoyqzsV0DLv4V6kDyW6Gpvp1kIB
         wLD9trEz9XrnkIrZ7NliadOXPgdYacQNfYc/RgFJzDJoyqUYqeHsrE6EguV9qIql4hNr
         cNhQ==
X-Gm-Message-State: AOAM531Inq8ra75xtijcYsagmEO15AN3Rlw/sVxlGAQYdoUrep6WfHdn
	8/SNwelDLkrpvDiDoNXPVSw=
X-Google-Smtp-Source: ABdhPJw3I9BUZcOKnkxGmUz3P2/vk0P4+LzIfz/TxlqdZXCA/+6DM99o8TqM6SLPv7NxMJbXPx8sfA==
X-Received: by 2002:a05:6402:b18:: with SMTP id bm24mr49783061edb.324.1641343419119;
        Tue, 04 Jan 2022 16:43:39 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id p7sm15196127edu.84.2022.01.04.16.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 16:43:38 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 5 Jan 2022 01:43:36 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev, ashimida <ashimida@linux.alibaba.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <YdTpuNrF2QxRzszb@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <CAKwvOdmCgBKiikP2Ja4PfJmVEnzNPGYe19MNd++a5D-asCBG2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmCgBKiikP2Ja4PfJmVEnzNPGYe19MNd++a5D-asCBG2w@mail.gmail.com>


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> > Can this Clang warning be disabled?
> 
> Clang is warning that the attribute will be ignored because of that 
> positioning. If you disable the warning, code will probably stop working 
> as intended.  This warning has at least been helping us make the kernel 
> coding style more consistent.

Yeah, indeed, Clang is fully correct to warn here, and these changes in my 
tree are outright bugs (which bugs Clang found & reported :-).

See the fixes below - by doing it this way the 'spurious link failure' 
problem when a header include is missing should be fixed as well.

Thanks,

	Ingo
---
 include/linux/dcache.h        | 3 +--
 include/linux/fs_types.h      | 3 +--
 include/linux/netdevice_api.h | 2 +-
 include/net/xdp_types.h       | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 520daf638d06..da7e77a7cede 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -127,8 +127,7 @@ enum dentry_d_lock_class
 	DENTRY_D_LOCK_NESTED
 };
 
-____cacheline_aligned
-struct dentry_operations {
+struct ____cacheline_aligned dentry_operations {
 	int (*d_revalidate)(struct dentry *, unsigned int);
 	int (*d_weak_revalidate)(struct dentry *, unsigned int);
 	int (*d_hash)(const struct dentry *, struct qstr *);
diff --git a/include/linux/fs_types.h b/include/linux/fs_types.h
index b53aadafab1b..e2e1c0827183 100644
--- a/include/linux/fs_types.h
+++ b/include/linux/fs_types.h
@@ -994,8 +994,7 @@ struct file_operations {
 	int (*fadvise)(struct file *, loff_t, loff_t, int);
 } __randomize_layout;
 
-____cacheline_aligned
-struct inode_operations {
+struct ____cacheline_aligned inode_operations {
 	struct dentry * (*lookup) (struct inode *,struct dentry *, unsigned int);
 	const char * (*get_link) (struct dentry *, struct inode *, struct delayed_call *);
 	int (*permission) (struct user_namespace *, struct inode *, int);
diff --git a/include/linux/netdevice_api.h b/include/linux/netdevice_api.h
index 4a8d7688e148..0e5e08dcbb2a 100644
--- a/include/linux/netdevice_api.h
+++ b/include/linux/netdevice_api.h
@@ -49,7 +49,7 @@
 #endif
 
 /* This structure contains an instance of an RX queue. */
-____cacheline_aligned_in_smp struct netdev_rx_queue {
+struct ____cacheline_aligned_in_smp netdev_rx_queue {
 	struct xdp_rxq_info		xdp_rxq;
 #ifdef CONFIG_RPS
 	struct rps_map __rcu		*rps_map;
diff --git a/include/net/xdp_types.h b/include/net/xdp_types.h
index 442028626b35..accc12372bca 100644
--- a/include/net/xdp_types.h
+++ b/include/net/xdp_types.h
@@ -56,7 +56,7 @@ struct xdp_mem_info {
 struct page_pool;
 
 /* perf critical, avoid false-sharing */
-____cacheline_aligned struct xdp_rxq_info {
+struct ____cacheline_aligned xdp_rxq_info {
 	struct net_device *dev;
 	u32 queue_index;
 	u32 reg_state;

