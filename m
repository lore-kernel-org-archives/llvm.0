Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB283A1E92
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 02:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767666674; cv=none; b=YH3MxzlgXQqi6nrk6y3Mi8CKktO59o7oHgtPmxY+Cy3hSIsZ1TZZTPc5BlIZC3cGp0XeYCvRtKi5uaUE8UnigPEiGn0tzSWsFg0SSvbDZkDTIbEvgyQVMR966Qns3CzPQOtfNqNLkb4rfbfB3mBd4oID5IzzBeE/fYFioCV8eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767666674; c=relaxed/simple;
	bh=9a4n2kPDzF0DXccy7fQpDqoOMcVW96AL3BwAsewKImk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJcmRH59S8rj7Q8ODG6HvOpUj+Y8fBKxrzI2zpjIzNa+oX/YpYAMWRE6fRXoYkF0SH8DCSiyS/0z2kZ/X3Y5mOPrNd+r5I6W3LGxptrHREgzn6UIlKXWf+l2pB2p91S0Jt7D25CILJwanmV4oMk0XcAKvzjJl+U3+3gNJbXRgB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc13SZEk; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc13SZEk"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a367a1db0so7025676d6.3
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 18:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767666672; x=1768271472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PneSlTXDqotjglO3Y2Knzidjrv0hwlCbWEle0lUDcE=;
        b=Oc13SZEkhqozfIiZTM56+4/2yGd7YOu/DFzVKyo4VCgMQB0VMZ+mffraPvY3jpp55e
         xq+ksrbMgGhBgaCgNs2+BJbDflyWQkyOzVu62rP+hzkQoJtn7wbGVQBsXCyzzjgQfbMV
         yyXqEHsJseWcMU6n7rQAgJOaJKXsxVnLvmGyPa5Bfi4kOdqGQKi4G/VwBjCdnm03mF6Y
         +Ii2zpN3y7IT0ft5MjbmRnWOqPa02nF07ovElYtoe0Ajp7/7OQwIimRvWKlQ6OYpl6c/
         rLfL+CrJKrP3B5jDXPHAV0MHd7sjpWAaMPSIWXY7jidJEhWKEOi5iNd0Equz2RyKVTlF
         uPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767666672; x=1768271472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PneSlTXDqotjglO3Y2Knzidjrv0hwlCbWEle0lUDcE=;
        b=wkThdzEHgcX8MD3ISlwCMh4wNT8pLxhrdg1VJw9LKheBgL9+2MZSOtOjCxTyyEsyEF
         GSrVA7A+3lxKFg+MY63u9wRZPpwcmh2ArufWxAd6MVlvYmPTHxLGZLCIiBZCo4zo0tpj
         7nSTFgxKOdFF+V+YvjM+GorEs+Koc4vqqT3E2ydYMj997jyVqvdXbg1lxvNP/RTnbP0H
         33y5vxU/oftVtu6b1RuWPL4mltXVfP3tvPlqqMMw5LK3ppLhA5+79P1J+NzTPaNBY7vg
         EdVJn9JhD2kfWHxqjT8k+6olZubLT6VosonqxNNOR7i/RzRaFkKKNkB8pzz0noV7eDHu
         CG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4kF2Im1K543l6zJtxk1gU/2oFjuRCAn/tst414ESA4Q5mui4Dp8KuyolmDrR93JNAsggR@lists.linux.dev
X-Gm-Message-State: AOJu0YwwIYHW3hvCDVZKrsaiCPQd6ldhsFWmtT7y5yAr7cjoUCTvQaTY
	6ojfWZGacF1jBqvkLrT35Dy5ZTONc0+wIUWrBo91YhPObbZXi9P6NeT8z5pBNJ/C
X-Gm-Gg: AY/fxX6xtzV6UpaQoKtEUh3UuHyaSZ224gCCKTzdm+qQCCKmYyPgeJy2Mr+Gk20NT8t
	kPj44OsVnv1G2irty0BsZv6IjQA06KsTQO+Zg6NAMMRmdtT8a8rLkqBk8DZI7QwY+cLjOZKYR4a
	P+K8qfd5/GFEq0hynGyPue3BCrpGgHoofdtmSri6UDx1nQ/TjpgLVMU+4bArf3pd44bT2mc9V3v
	HIb0XRAy8uo8hQnAMtwXFQj2ltwqqV2BDtrp5Yh7YNGjk2JyIIz9ptMe6NWAQjQ/defeZHSnZIO
	TRyy6qU9L6RmZ3NQ2ER2+mTFy3od1bS7Lp8oPR6EgFb4Ur+mrViyOUaYSkoE+ZbCyv4h5zmxmSl
	KHOB98IzXbI/wzymLDWp2x86OiqgkBmymJx3yMdeHMii9OJDasKGjoFuK6K3jyJ3MTXbJElkjr/
	cn7hN6aTIGsO27Y4s4dWPTJ3NW4NGaaT39ilcKALEjgYJ8PWHzbzEDvAx7p6PS/JRf7e/BuQEAl
	fm69Ilbq9yvoNo=
X-Google-Smtp-Source: AGHT+IH/ZnViArMDusDnASin1cg4KvwlFUBMfsXmrGNUlYaoDSSPkbXVeTNfTyQwJuK1hW94jJnL2A==
X-Received: by 2002:a05:620a:1aa8:b0:8c3:55bf:735b with SMTP id af79cd13be357-8c37ec06899mr194116885a.81.1767660549347;
        Mon, 05 Jan 2026 16:49:09 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm62900285a.47.2026.01.05.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 16:49:08 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45B0CF4006A;
	Mon,  5 Jan 2026 19:49:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 05 Jan 2026 19:49:08 -0500
X-ME-Sender: <xms:BFxcacLaYSZeaZHCInRCEKx1t7gio2sOan8nMWlaOAftxb6cMbzZig>
    <xme:BFxcaVi8cvoZQl5Yjxu0XkAdVD9WiLnvhLKqIGJ56Jkc-Uv-6oKEtDTmaK-O0_FI3
    skFnOJcgXWWFOPCRuNqRWaplgcZn0dYLpM2dMrks1atArfO6zbR6A>
X-ME-Received: <xmr:BFxcaVN_MHnqRgCLmuuW_xddB_5EgJOgN5rf_SgfuEUzcrr7m0ALSh6C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepfeffudehveduteeuffeutdetieeftdelfeelveffffevteeffedtteehteegkeeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegs
    ohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeige
    dqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihig
    mhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpd
    hrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgughgvghhrvgihshdr
    tghomhdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhluhhtihhonhhsrdhnvg
    htpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohep
    mhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:BFxcaY5Gx8Jp86sLaYoazAtB9DP7v3tKbfmtFZVR8YT1OUkyVSK-sw>
    <xmx:BFxcaUmk0QWQ3Edbq7ih6qmgSAky7Qhn95FtxRYszP2gv4lO5huQHQ>
    <xmx:BFxcaQJTqkKpqJuZCkQAsFeM0C0nkyz3vT60LAhR_03jL-g4nAaoAg>
    <xmx:BFxcaUTG5mSIvQgOY_GbRZ3D-7cZKEpzjwucqXIXpm73stWvyPiFpQ>
    <xmx:BFxcadtBWFQ5rj93VI_SYR0myk8PisqpeSvfhhy8BiyD_jiI67FztcYD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 19:49:07 -0500 (EST)
Date: Tue, 6 Jan 2026 08:49:05 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [boqun:rust-sync.20260105a 18/22] error[E0277]: the trait bound
 `i8: AtomicImpl` is not satisfied
Message-ID: <aVxcAZe6AEXEfx3G@tardis-2.local>
References: <202601060041.k0JkAkUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601060041.k0JkAkUD-lkp@intel.com>

[Cc UML]

On Tue, Jan 06, 2026 at 12:25:24AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync.20260105a
> head:   243aa6a057d46d3a4de9297422e480d469eddaf7
> commit: 06ed7e7e7aa656f7054af7d3d3387a07244d85b1 [18/22] rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
> config: um-randconfig-001-20260105 (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601060041.k0JkAkUD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/rq-offsets.c:5:
>    In file included from kernel/sched/sched.h:28:
>    In file included from include/linux/cgroup_api.h:1:
>    In file included from include/linux/cgroup.h:27:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:24:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:12:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>    |                                                   ~~~~~~~~~~ ^
>    1 warning generated.
>    llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >> error[E0277]: the trait bound `i8: AtomicImpl` is not satisfied
>    --> rust/kernel/sync/atomic/internal.rs:265:7
>    |
>    265 |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
>    |       ^^ the trait `AtomicImpl` is not implemented for `i8`
>    |
>    = help: the following other types implement trait `AtomicImpl`:
>    i32
>    i64

UML_X86 is using the atomics of x86 kernel (defined in
arch/x86/include/asm/atomic*), right? If so, I think we need this:

diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index bdd7c8e39b01..44b12e45f9a0 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -9,6 +9,7 @@ endmenu
 config UML_X86
        def_bool y
        select ARCH_USE_QUEUED_RWLOCKS
+       select ARCH_SUPPORTS_ATOMIC_RMW
        select ARCH_USE_QUEUED_SPINLOCKS
        select DCACHE_WORD_ACCESS
        select HAVE_EFFICIENT_UNALIGNED_ACCESS

Regards,
Boqun

[...]
