Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908512C9C
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 09:58:10 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y196so3710251wmc.3
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 01:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=WEDTgzpiltL1NT8/HeGXwilTe74ZNI0f4xOOiwCoVRw=;
        b=LGp39MjftM0OspcLXJkgCqcd7OB1O3sI0SITiKJQs5oOZSnbReKaANYsVcPG3PC07h
         07n3KHntv3+ki7Mfzmpsmvcd5VJXySHAPRKSYchciARew9FRWwgvluFC/+KK+bu/8J6S
         lhojSB7axu7nf7VukWinEvvVjiuMOWnwFLLIEpM7YQ8jqPNBcrBavp6w650QNhcYsPk7
         YVK66ta/J7zfFnZNcutQWMjaLELFlkXBHq2wWwpn4vyfUsVBDNvi8h0kmFCG3+Plt94v
         U4d1EGGssf+AMrQY5XZqbfmYSdH23/BIW6vK/ITqaB9iHPSM+46HMUBN9+9wiTJgdQ3L
         V6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=WEDTgzpiltL1NT8/HeGXwilTe74ZNI0f4xOOiwCoVRw=;
        b=oDUR70YaMjxpzwQydRQ/3I2O+KLdLOmupy5dvSBTzUwla+ToKp+H4swEPwR8iZx96p
         4mq2TojL7jyuTTNDUVkaG9kUW6guyqHwsxV8tRYx7nXYqXvmPGT7J3u8fBU7wCTKNN8R
         P6YooMcWgnOFA+otKzvS33YsjNCA3QCSP9KQfHqEMvUuMOo8mNGC2oLSjd9SJIei3pP1
         zROTAxW9HiuFZ6k4povYOutx8DmYTDX0dbjcsO4lz7CHGfJc5QYfQ/kezQqJJwVoHSUV
         MuhnNoRBSxpCul9zFSKwY4Km2Oks8UelqoD6+Vp7vnkNanMv61V5+yaBelAwwX5jtgs2
         0Vwg==
X-Gm-Message-State: AOAM5338lWHSJRqV11GED5YXRlWx9iUnpVARGaAA8XFuR7afcUeWSSz5
	z8PhpBmLjebMiyU233Vi6AnTGQ==
X-Google-Smtp-Source: ABdhPJxsgxY5kYS121TEh7VHEfUyE1K0dFFItk6fzDJR4MCdR5mdBamlRuqXOBTWaKs1BMSy2HmzsA==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr5903612wml.105.1639043888649;
        Thu, 09 Dec 2021 01:58:08 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:21de:5a72:cfa8:19ce])
        by smtp.gmail.com with ESMTPSA id f15sm6351289wmg.30.2021.12.09.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:58:07 -0800 (PST)
Date: Thu, 9 Dec 2021 10:58:01 +0100
From: Marco Elver <elver@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Jann Horn <jannh@google.com>, Peter Collingbourne <pcc@google.com>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: randomize_kstack: To init or not to init?
Message-ID: <YbHTKUjEejZCLyhX@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.0.5 (2021-01-21)

Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
default since dcb7c0b9461c2, which is why this came on my radar. And
Clang also performs auto-init of allocas when auto-init is on
(https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
allocas.

add_random_kstack_offset() uses __builtin_alloca() to add a stack
offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
enabled, add_random_kstack_offset() will auto-init that unused portion
of the stack used to add an offset.

There are several problems with this:

	1. These offsets can be as large as 1023 bytes. Performing
	   memset() on them isn't exactly cheap, and this is done on
	   every syscall entry.

	2. Architectures adding add_random_kstack_offset() to syscall
	   entry implemented in C require them to be 'noinstr' (e.g. see
	   x86 and s390). The potential problem here is that a call to
	   memset may occur, which is not noinstr.

A defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:

 | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
 | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section

Switching to INIT_STACK_ALL_NONE resolves the warnings as expected.

To figure out what the right solution is, the first thing to figure out
is, do we actually want that offset portion of the stack to be
auto-init'd?

There are several options:

	A. Make memset (and probably all other mem-transfer functions)
	   noinstr compatible, if that is even possible. This only solves
	   problem #2.

	B. A workaround could be using a VLA with
	   __attribute__((uninitialized)), but requires some restructuring
	   to make sure the VLA remains in scope and other trickery to
	   convince the compiler to not give up that stack space.

	C. Introduce a new __builtin_alloca_uninitialized().

I think #C would be the most robust solution, but means this would
remain as-is for a while.

Preferences?

Thanks,
-- Marco
