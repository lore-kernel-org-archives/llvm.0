Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A008541E48
	for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089141; cv=none; b=r3zZMPeIcJpWrmFnMaL028U1GHAGRw0evLzYasjImoxS44rplnLWPgYZwBQmwYR9jePxxWM/r6J7nhxDg4Aj+2NpOvMeA3/TW6etDy0IfhDsmH5Dq3K9TodxWioU50X/gKyrzq2gR7VM1Wp19qGwtqki+GpBCT2p1cHJ8IUzR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089141; c=relaxed/simple;
	bh=Xcv6XqGr8GRDrZTYE+bcfGYsESnoIwDYOn1wqnCy4NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyhMgjAmnGo7Y9gIFqa1/66LKEME2WxWti1yqnOF0s2lopMaVlmVH6hRcfe+FeHZTlHcpcshJ0ZHAEBV4Bh/78hc+0DK0xeQHDUGfw7pCSgMypKhT6DJAbT5F+tueCDwqHXxwKugmwvh02VrIxOl9jOY8MfyO8BLzbPq02d9PR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzFICIon; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzFICIon"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso3040273b3a.1
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790089138; x=1790693938; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GBsYZYC2tty9xsMubEGxI75zG2Y/0N6IAo5rsTEyC18=;
        b=QzFICIoni+VMQ1cb6wwbEpmuhPUSgL/MCqnBzIAtaRVu0eR/Yjkrl6amA/NG5gvANr
         W1JTYN+ZTqH730vycXIld/OMbrI5L2q9V6X5ZNMd6SKzL2tpCFzBzys7FkFOoc+IynBK
         YGTZReE2awC6Xh595vE2VOCMh2qQY7r3h/XBR3ELFp+C/I13YEqT2xHr+jmgHZFCZ52X
         WyMCcAypntM5/S1o+t6U+sbrs5pvC+TFpFjMWPh1bSZWTmqGxUo3FUfMIQ0OIx88TCks
         GgslNzI3lTXZ5TeqfsCaw4C618W1OYHAd4xLY4gGqBAKSbLHwh+r25UKcaVXnMJuKiAK
         zLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089138; x=1790693938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBsYZYC2tty9xsMubEGxI75zG2Y/0N6IAo5rsTEyC18=;
        b=hKz1B0QOcO3t9/iTBd3WP56O5N9uv/+WDQYyhio9urucDuldJHEBTEe46+IbT8Ick9
         I6MeahozDCVG/VORljHB9P0CUVU7r1YdkR2c0qE16S+iME7iZO1GbuiI5Jbaw1fEwb8a
         BqKj4bN9jgbwrr3C/zFYgFbx14FE3jflmH3ajZSyy1EFi468ds939aUs5MQbwpJand9b
         UHllBLZQ0y3ja5QLu+LYPvWIeYn1LhL7UJ76yBc3q6Q7At6RcBHNZe1UOmUaWj7zoV7v
         MLg9kwBUo/LlZmBslBBLCLjPkRwNCSDADTBJ9gQh97YBy+59nN0fRgCeocjIxL8Kz9Pz
         fhtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWe4ovdaFUQeGUZID1ZS9i6Vrz4gFf9HzU0t8gw+dzaXzeX5VRuztJvy7GNLWgogkH8ZiI@lists.linux.dev
X-Gm-Message-State: AFuF++mgJqEeKZ9t3ZraqFJ3fEKZ3+BSYBvpKjkyUInxIdvYjWvfOl6t
	EfleJv+LzEBYQymrocNPRxTdfW1WeVBOR2jjV/se2TnG07LKmXo5cZI7
X-Gm-Gg: AYBFou0PYSmQyBUOXi7hMcO+DCY/Aizw321+lS0wq3uX9icbF2SRACbokHoUQ/KndU+
	03iHovQBYuP+gnT6/j5snT3MPVahGjR19HuGRsEWgxuUt+aAYb+CU62PBCtSiRuvdpTqhEfrfKm
	yEspEqdvkP1oq+z/IineDCo6UDDrJmogG4goQrFRCSfY9V3M6RJCDfHVslscGojpWeGa8XYsX8t
	poa5lu2qwEZcI5sD4sv0cKH3GKg9JmvAH8/RwfgJzgujjiO20HndrF8+QnnG4KxCfEdFBi4iGAE
	dqGNSuh0OwXxGxLovKQJvLHNy2K7wWSLfw1xSoeD3GplxSqsP2sOP99ThfFRqsUPWWoLGBSuP2F
	y48gE/PrJlQmHN3N+XgblNjIJMoNrROVY7UKqjJNuWOPWM9Wh1zP5Kb2l8rT9dKiv67CBg3LJMu
	iK9Gcsgfd0oL6XiZCCxFaVXPhiyiU5Qg/xpAaRKicomx/rcczG10cc3Eo4cgEjnrZyEjn40xyrX
	CivNcULLtYY
X-Received: by 2002:a05:6a00:8085:b0:874:708d:b620 with SMTP id d2e1a72fcca58-87c8403d93amr1485976b3a.30.1790089137920;
        Tue, 22 Sep 2026 07:58:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8fb4sm1046216b3a.12.2026.09.22.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:58:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 07:58:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
	Justin Stitt <justinstitt@google.com>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Subject: csky ICe (was: Re: [PATCH v4 2/3] slab: improve
 KMALLOC_PARTITION_RANDOM randomness)
Message-ID: <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511200136.3201646-2-elver@google.com>

Hi,

On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> to identify the allocation site. _RET_IP_, however, evaluates to the
> caller's parent's instruction pointer rather than the actual allocation
> site; this would lead to collisions where a function performs multiple
> allocations.
> 
> With the generalization to kmalloc_token_t, we now generate the token at
> the outermost macro, and using _THIS_IP_ would fix this for all cases.
> 
> Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> the address of a local label, which is considered broken by both GCC [1]
> and Clang [2] because label addresses are only expected to be used with
> computed gotos. While the generic version more or less works today, it
> is known to be brittle. For example, Clang -O2 always returns 1 when
> this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> To provide a reliable unique identifier without breaking architectures
> relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> to _THIS_IP_ where architectures provide a safe implementation, and
> falls back to a zero-cost static marker where _THIS_IP_ is broken.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Signed-off-by: Marco Elver <elver@google.com>

With this patch in the tree, I get ICE erors when trying to build
csky:allmodconfig.

Example:

Error log:
sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
 1202 | }
      | ^
(insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
        (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
            (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
                    (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
     (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
        (nil)))
during RTL pass: final
sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
0x779b51e2a1c9 __libc_start_call_main
	../sysdeps/nptl/libc_start_call_main.h:58
0x779b51e2a28a __libc_start_main_impl
	../csu/libc-start.c:360

This happens with lots of files, not just this one. It is seen with all
versions of gcc starting with at least v13.x. Reverting this patch fixes
the problem. Bisect log is attached for reference.

Any idea what I could do to avoid the problem other than stopping to build
csky:allmodconfig ?

Thanks,
Guenter

---
# bad: [93f51579e7df248780214094418f205253383cc5] Linux 7.3-rc4
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [df8f6181ab57d65a99e61fcfc5be22a42df58642] Merge tag 'perf-tools-for-v7.1-2026-04-17' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
git bisect good df8f6181ab57d65a99e61fcfc5be22a42df58642
# bad: [093239070573637ad2b4cb56abc9c4c7ee109294] Merge tag 'v7.2-rc2' into togreg
git bisect bad 093239070573637ad2b4cb56abc9c4c7ee109294
# bad: [b85966adbf5de0668a815c6e3527f87e0c387fb4] Merge tag 'net-next-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad b85966adbf5de0668a815c6e3527f87e0c387fb4
# good: [25447851777a53bd4b501e7f2cb418332ad584cc] Merge tag 'char-misc-7.1-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 25447851777a53bd4b501e7f2cb418332ad584cc
# good: [bd77e50c9a70f844d6073499f3d1a6fd193eae73] Merge tag 'fbdev-for-7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
git bisect good bd77e50c9a70f844d6073499f3d1a6fd193eae73
# good: [972c4dd19cb92e03d75b66c426cfade07582a1ba] Merge tag 'wireless-next-2026-06-10' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next
git bisect good 972c4dd19cb92e03d75b66c426cfade07582a1ba
# bad: [9b40ba14edcdf70240af8114092a76f75f070774] Merge tag 'for-7.2/io_uring-20260615' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux
git bisect bad 9b40ba14edcdf70240af8114092a76f75f070774
# bad: [0d8c1134936f1fb6678156ab4248ac740d274525] Merge tag 'v7.2-p1' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad 0d8c1134936f1fb6678156ab4248ac740d274525
# good: [42a58f08b70a7a320c168a1ce15e3fcfc8568708] crypto: atmel-sha204a - Use named initializers for struct i2c_device_id
git bisect good 42a58f08b70a7a320c168a1ce15e3fcfc8568708
# good: [2c1ccd9a1d786503086e83fe83e5c3b3c953b70e] docs: changes.rst: restore pahole 1.26 minimum (regressed by sort)
git bisect good 2c1ccd9a1d786503086e83fe83e5c3b3c953b70e
# bad: [f8115f0e8a0585ef1c03d07a68b989023097d16c] Merge tag 'slab-for-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
git bisect bad f8115f0e8a0585ef1c03d07a68b989023097d16c
# bad: [dfdfd58cce1c3f5df8733b64595448996c08e424] Merge branch 'slab/for-7.2/alloc_token' into slab/for-next
git bisect bad dfdfd58cce1c3f5df8733b64595448996c08e424
# good: [648927ceb84021a25a0fbd5673740956f318d534] mm/slab: do not limit zeroing to orig_size when only red zoning is enabled
git bisect good 648927ceb84021a25a0fbd5673740956f318d534
# good: [d196ea36a2f2118833ca648af53654553a4a1e7b] Merge branch 'slab/for-7.2/tools' into slab/for-next
git bisect good d196ea36a2f2118833ca648af53654553a4a1e7b
# bad: [e0f54249a491c62ef8196b9f13bd7d95dba47c6f] slab: fix kernel-docs for mm-api
git bisect bad e0f54249a491c62ef8196b9f13bd7d95dba47c6f
# bad: [0fc1bd38a19c108395d8338fb034f90c2d3fbe55] slab: improve KMALLOC_PARTITION_RANDOM randomness
git bisect bad 0fc1bd38a19c108395d8338fb034f90c2d3fbe55
# good: [feb662d9168b63e1d4c02671ec96005410c6f3ce] slab: support for compiler-assisted type-based slab cache partitioning
git bisect good feb662d9168b63e1d4c02671ec96005410c6f3ce
# first bad commit: [0fc1bd38a19c108395d8338fb034f90c2d3fbe55] slab: improve KMALLOC_PARTITION_RANDOM randomness
