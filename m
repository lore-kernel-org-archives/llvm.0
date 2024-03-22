Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32433A1DE
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711150751; cv=none; b=QB3dIsbx2T8qC9vVTCKszbz2qQWoW6Rmo4YT5rRO13CPlkr7tUZ1URrS0y5xFB1G6+/rUhcpxgMsDdBhSnvD/ktpiGjirSn1iwDNaPb2R/FaGMJKMymdgx4mQiDK+mPcv0xcyvmFTVxig80ESYawfkieoOVXUzADmrjSkU15zmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711150751; c=relaxed/simple;
	bh=IKpP9NgiLUwguiKBIu5gVMzGr4TtPK8PH/h8qTGsc7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSsq3sMPfyQnWFUWApo2UyDWNT98hG5h35ypoyK6B4St+SNAY4zraBWE1CRS6IrRyoZMI9FgHEQIKhJza46vOvlbG9kW/uIZAAJ7HaGoAAipdG0rFiH1y9B6qLAw2bWOwOEuFaCMprvSO+wuJhN7FrEMXEPJZIbKRLalB6iaOQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4h48dz8; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4h48dz8"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-430bf84977dso19359391cf.1
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711150748; x=1711755548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihthLhUKDez7apre5WNcowgmLHfDAeuMZ64Fs/0tAkA=;
        b=W4h48dz8mVktGjIuTz76udXXLpoEKpIIYUjBTT1t836y3YzeTHdQiUD8OT5WtDhirE
         GFY3L5seMh0HynOXJClmJjJ0RRfVPeh8nL/70ESP5gupHrX2meokwSCox0JPFBzWc/Lj
         eTyqeGKn9uZ7KxHkC9w8ZmwhADOXE7lFchj/X55Ll68X2CMRXohwDhjcRysWTq5+cYCu
         gV9NXsocGIDLUtMCgNZIguLayDQfLPzxcDUeUYnEZtON2YXVaRPO3NrkPBBKcr+2XCPE
         oe4WHrRDHwUuwcQ/3bBNI28IhWnHTwWYwykVH0IHua45p2NmC9tRSOCwChFjJZ2b/LLn
         PKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711150748; x=1711755548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihthLhUKDez7apre5WNcowgmLHfDAeuMZ64Fs/0tAkA=;
        b=ZLWDhrSb5oW0TTPJzCHOxtCbPYdYl2B7YhkVxcU+bZusVasN6WerRng0WU45xTftGC
         TB0MrIjnuuZ4oOVBeWKGws9aMaCNdJWxkfpJnYuBK5R+oTX1wNE7aQtHvlBb6GomK0nE
         o5vLu1o72yRhTP3zSDg9udcDHjLJZZzUN89iBaXOZI3Ac1AtkgY0jc1KtUsOaUJpM8SB
         RN3pdeju7JR4MfzOLjtDnWpuHzBN8heILV5WUgSRfxVb5z8E1TXxDtz7cuJvXU75hos1
         GcRuQXdzBzFA7f+ON8sojiD+JlknwXuPTxsqx/JYw/Q0WpBUUQ2lC+CNOVqCb9W1TtfM
         q5iw==
X-Forwarded-Encrypted: i=1; AJvYcCWfahyALctlTp+BXDx5Ted1F0wyTmpPCaB/D9ZoHGdZvo6K2sZvPG6pkx+I1NVozEkp5uXnz41C1lZ8xA6pSVwb4Y/9tA==
X-Gm-Message-State: AOJu0Yym8TaFpgOVduGqyhtVWxB5RawxopiwgYUb0meSBra+iOKvhXq2
	RgEFLaB7PYxdQ1Y9uLdBg9EpJILMiZhrIyM3iHAqsHnzP+GFOGR8
X-Google-Smtp-Source: AGHT+IEtxqGn3kAtIV4D96rJILpY2Sr7kOPlyrqC9vZdift3MfB5dK3Ly5o2AHSrAoeMz8EZNAQnbw==
X-Received: by 2002:a05:622a:5b89:b0:431:3d52:2fdc with SMTP id ec9-20020a05622a5b8900b004313d522fdcmr874851qtb.65.1711150747498;
        Fri, 22 Mar 2024 16:39:07 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id g26-20020ac84dda000000b00430b3fbfeb3sm285249qtw.47.2024.03.22.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 16:39:07 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfauth.nyi.internal (Postfix) with ESMTP id D8C561200032;
	Fri, 22 Mar 2024 19:39:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 22 Mar 2024 19:39:05 -0400
X-ME-Sender: <xms:lxb-ZSqXNEAzynlHnF4fFGyRoHtOexi5knH7feyxPDs96NA_Th3nRw>
    <xme:lxb-ZQo14qQC0HDkun8fN8dNZc31jLQaSSwRp-lSRRbuGMUv8ZZrg1xCldhdG0Wg5
    IFhOLd4gw-M5-JhZw>
X-ME-Received: <xmr:lxb-ZXPpj_hbXPHfobZ5yBfALoDbmEbVHufDqKh84HHxVTsFoobaCxbToRSHag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeivdevvedvffejuedvudekfeeltdeguedtleetudehudfffeejvdelkefgueeh
    ueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhruhhsthdqlhgrnhhgrdhorhhgpd
    iiuhhlihhptghhrghtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlih
    hthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhm
    rghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:lxb-ZR4k61VpjjUgrxvZg6z9Sw0lQEzr87LoxOCl1CB5O4SlQflMpw>
    <xmx:lxb-ZR4ZfWPemcqH1PHUXr6f0hYuQnOym5JONG25ZMBBHNfA1yWQPQ>
    <xmx:lxb-ZRhCY22Y5uR5nXDYDfRfTT9l5j-MkUkRzUHNIVyJK3bPNpooRQ>
    <xmx:lxb-Zb5FYvHuId1iM5Q9_nh_iqfFheWz3O8ETXDxkQLz42YyAeGz6Q>
    <xmx:mRb-Zf6532KQ_U8X8pWPAji-X5fWb2wIg5ADz9JBWOgwYSb7-WrY8pXD0Eb3_0Xl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 19:39:02 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org
Subject: [WIP 0/3] Memory model and atomic API in Rust
Date: Fri, 22 Mar 2024 16:38:35 -0700
Message-ID: <20240322233838.868874-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since I see more and more Rust code is comming in, I feel like this
should be sent sooner rather than later, so here is a WIP to open the
discussion and get feedback.

One of the most important questions we need to answer is: which
memory (ordering) model we should use when developing Rust in Linux
kernel, given Rust has its own memory ordering model[1]. I had some
discussion with Rust language community to understand their position
on this:

	https://github.com/rust-lang/unsafe-code-guidelines/issues/348#issuecomment-1218407557
	https://github.com/rust-lang/unsafe-code-guidelines/issues/476#issue-2001382992

My takeaway from these discussions, along with other offline discussion
is that supporting two memory models is challenging for both correctness
reasoning (some one needs to provide a model) and implementation (one
model needs to be aware of the other model). So that's not wise to do
(at least at the beginning). So the most reasonable option to me is:

	we only use LKMM for Rust code in kernel (i.e. avoid using
	Rust's own atomic).

Because kernel developers are more familiar with LKMM and when Rust code
interacts with C code, it has to use the model that C code uses.


And this patchset is the result of that option. I introduced an atomic
library to wrap and implement LKMM atomics (of course, given it's a WIP,
so it's unfinished). Things to notice:

* I know I could use Rust macro to generate the whole set of atomics,
  but I choose not to in the beginning, as I want to make it easier to
  review.

* Very likely, we will only have AtomicI32, AtomicI64 and AtomicUsize
  (i.e no atomic for bool, u8, u16, etc), with limited support for
  atomic load and store on 8/16 bits.

* I choose to re-implement atomics in Rust `asm` because we are still
  figuring out how we can make it easy and maintainable for Rust to call
  a C function _inlinely_ (Gary makes some progress [2]). Otherwise,
  atomic primitives would be function calls, and that can be performance
  bottleneck in a few cases.

* I only have two API implemented and two architecture supported yet,
  the complete support surely can be added when everyone is on the same
  page.


Any suggestion, question, review, help is welcome!

Regards,
Boqun

[1]: https://doc.rust-lang.org/std/sync/atomic/#memory-model-for-atomic-accesses
[2]: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/LTO.20Rust.20modules.20with.20C.20helpers/near/425361365

Boqun Feng (3):
  rust: Introduce atomic module
  rust: atomic: Add ARM64 fetch_add_relaxed()
  rust: atomic: Add fetch_sub_release()

 rust/kernel/sync.rs                   |  1 +
 rust/kernel/sync/atomic.rs            | 65 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/arch.rs       | 15 +++++++
 rust/kernel/sync/atomic/arch/arm64.rs | 46 +++++++++++++++++++
 rust/kernel/sync/atomic/arch/x86.rs   | 48 ++++++++++++++++++++
 5 files changed, 175 insertions(+)
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/arch.rs
 create mode 100644 rust/kernel/sync/atomic/arch/arm64.rs
 create mode 100644 rust/kernel/sync/atomic/arch/x86.rs

-- 
2.44.0

