Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F81B85FD;
	Mon, 21 Apr 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253754; cv=none; b=A4VJxDtyBeckhoksnkYr3SOEI/fcxzWdey5EU12DfQluxHaP1zvnfcMgyeb2iDppCSdzObBL4qqxwnl8w2LqQXAejpgCGaJ0IdsH3vC8KcGEhexFKpBz2U54ohzGC0eHe28OqlMHd3LLNKk/KGUg3ENcMRPobaCZ3KrGpVvDac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253754; c=relaxed/simple;
	bh=n9vuedf6SLmh7TklE+9GmS5b6pnz2Hcuw8Jcq+yExuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeO/15HuQZxxTV8vVm7toe27ZPkDoywouFRhPscB0WToJTO2WRe/YlDUhYH7RFa5LiEmXyyNYV51n4GahgHedAS9ES3OufTKDSKQ4QCCMLtgRODA1rqjrNJ4dUWynLuSDUlSmQ82Vu4ap5cohx0Avq5JuXdUaWK16rEOS0GUM5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhSOK8WO; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhSOK8WO"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c59e7039eeso590493885a.2;
        Mon, 21 Apr 2025 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253752; x=1745858552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODIKSAWOegt1B2HFm8l018++oeGfbMZqnIZ7rWaQ3pQ=;
        b=bhSOK8WOV5bJS6QxqMXdm0Re/26HI8ml9QPIpAWu1Ff8ELIvBWAIw81rqdrBmr9WYP
         TjGpwq4NpIMnXmX1/+y2/SFJd7UAmN5TPCEQKFbsMPx+4D8OAA1BVDaWxbZ5/xFIxSay
         5z5yA+98z/9xjoKeklrCsiLzS3X7XseO6kbpyiHGVx5Dtd0ym8cEWG/vCWx+vIF26pT+
         xuO37eKGYf/Xdx2/FLguMoOjJB5PwygU31WsQFKyxlkU8EGNwFjxNbEOyWZ8r9Bconkl
         VUAnJTFfLVCX4XEbJ9KolW0TLJptcxzxbvs8MIBh7jK9xiHFtAoJlhUOerjY06juhI+C
         qucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253752; x=1745858552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODIKSAWOegt1B2HFm8l018++oeGfbMZqnIZ7rWaQ3pQ=;
        b=do3XtaEIw+jfuBmB8/mQqoJUTG85Y0V/IZ0PP0rYIl2BKAZOLpLwLdWYoIHS/aaCk8
         EdHgnLxn6T+TKl4iDQNcGWP5pEtl8NmwuGi0h9P1MOYJuqCmmCTmby9hPmL5H+QHnsTu
         EXIRZNhLUmYFusJteTiHqmsRYGzWVONLFytdkpvkmAmj/oX3BIkMQxan+gSOUFSBW0dA
         Lxr3zIdiBXTYTawyctKuPDVwQCxRiHIoD/Hc1r4z4sKGhrKqLRC8W3zSW+vFrVMSgRh5
         MDYRNrHr2Po7KqX8aDQ8u3YJCCnz+AFcK38JTQEq52oi6x0w5x2JcpVgiiZxBRbpo0cl
         ti3w==
X-Forwarded-Encrypted: i=1; AJvYcCUe0qFylFljnbWtUCsywdoNVzvmc4Eh2upk6VvNABu/5zCsOopSQej8ve+nw2d0m9d2G/1s@lists.linux.dev, AJvYcCXQ1mvmhpyEHCVL4fH8u9xJ6p+Nptf+vxLOyaXITpOKehaOd+55FIoV+tL8Pb9d+CxsgeZ0rA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCp4Fp/DVRoXV7UNSoKRgBVq3qbMWTeDje+t+1nSADmF1Emp+M
	PVpEno94X5Sk6XpooOuXtutlhHCFGRSyBwkoUOU3gRx+AxSRnPJq
X-Gm-Gg: ASbGncvzdCxZQECOEwZ4iUudD8hKmi1dro6+4dL30uWoM3ryQpSyWH4o6gdW72S1/kP
	Ayaby/5pKatBSk3bcwzM57uK55ZZmfwQjVq2iqaLIyQ+it3R4/RFrBBcnCF09FVQN1RwJfDJrel
	2aOasifDPz57dwYTxiQBWb7pSKXfgToGaQxzp+MDJBH3UP4We0BBqa+ZYySpZXAvkwXW3MQ6ikj
	Qm5c2m8Q1vCipvKTrF6WAFScgGOkapgah+h0eAdPgJrUHld9aBCk/UHOUp5x/1L8Iv4rtSbDtG/
	PUnwwBfce1MGrSPuOpCpW4dMFq32KlnHiW6riJoPQclX1DnJXqJUd3ohBmOvUytCTaMfOIY/t5B
	ysOc2FC+/dcq1R/K/LmDAsyyw7A6FJGo=
X-Google-Smtp-Source: AGHT+IFJetgkWwTl7QWatfMt6xsWv4F3kEqSbz8SmtOibvoHeVRXwSntbQPnFHig2vufQ6eYaDtCsg==
X-Received: by 2002:a05:620a:f0b:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c92804d010mr2247007985a.53.1745253751825;
        Mon, 21 Apr 2025 09:42:31 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b5f83esm435258585a.90.2025.04.21.09.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:31 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6DE101200043;
	Mon, 21 Apr 2025 12:42:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 21 Apr 2025 12:42:30 -0400
X-ME-Sender: <xms:dnUGaKTlJuxHgt-ByEfqqq6pKkOsT2AMOAdV6wfAPxVU2GN-bFZOAQ>
    <xme:dnUGaPw6B7IAIOuPN4fLcyjSfzr8w_sKGNmhsFvjy6Ezg8Nhk9t-LZlkZOfVJT2xr
    ZPsDvtm1yJDkpUZig>
X-ME-Received: <xmr:dnUGaH3dwis-2V2wO2u33k0Li-fk7BirGRV2xY89LN1lsk-HFPl6qKP11___>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeggeeukeeghfevudektdevjeehhfekffevueef
    udeivdelteeltdekheejgfeiveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmh
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:dnUGaGAIFo9hXK_--fPBdFYreTLGmzR7mN6l8OZDIpoiWnL3BrHWeQ>
    <xmx:dnUGaDiVq-wZpzKikenr_WqjGgjUzfS-Yxejaa7b1Nse-klFgRUpYw>
    <xmx:dnUGaCp1pY3eVeNPRNWYeXo-KJwlKGUjqmFt_YeVcnQfng5DOM-V3A>
    <xmx:dnUGaGgwDNiiaWtfhYyD9JPrJgt7jwz6tyJvo-QoMFT_ZTthuHpDbg>
    <xmx:dnUGaCTZPsnD4RyR99O6Hg_vj72roA5JlZAcikFvF4b6LTZNHnqdt3E_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:29 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
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
	linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
	Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [RFC v3 00/12] LKMM generic atomics in Rust
Date: Mon, 21 Apr 2025 09:42:09 -0700
Message-ID: <20250421164221.1121805-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v3 for LKMM atomics in Rust, you can find the previous versions:

v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/
v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

Changes since v2:

*	Drop the temporary RCU binding since they are already in
	mainline.

*	Fix a few "Ipml" typos in previous versions per feedback from
	Alice Ryhl.

*	Documentation improvement per feedback from Alice Ryhl.

I'm hoping to at least get the first 8 patches (atomic operations on
normal integer) in a good shape so that we can have them in v6.16.
Thanks!

Regards,
Boqun

Boqun Feng (12):
  rust: Introduce atomic API helpers
  rust: sync: Add basic atomic operation mapping framework
  rust: sync: atomic: Add ordering annotation types
  rust: sync: atomic: Add generic atomics
  rust: sync: atomic: Add atomic {cmp,}xchg operations
  rust: sync: atomic: Add the framework of arithmetic operations
  rust: sync: atomic: Add Atomic<u{32,64}>
  rust: sync: atomic: Add Atomic<{usize,isize}>
  rust: sync: atomic: Add Atomic<*mut T>
  rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
  rust: sync: Add memory barriers
  rust: sync: rcu: Add RCU protected pointer

 MAINTAINERS                               |    4 +-
 rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
 rust/helpers/barrier.c                    |   18 +
 rust/helpers/helpers.c                    |    2 +
 rust/kernel/sync.rs                       |    2 +
 rust/kernel/sync/atomic.rs                |  228 +++++
 rust/kernel/sync/atomic/generic.rs        |  488 ++++++++++
 rust/kernel/sync/atomic/ops.rs            |  199 ++++
 rust/kernel/sync/atomic/ordering.rs       |   94 ++
 rust/kernel/sync/barrier.rs               |   67 ++
 rust/kernel/sync/rcu.rs                   |  275 +++++-
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
 13 files changed, 2479 insertions(+), 2 deletions(-)
 create mode 100644 rust/helpers/atomic.c
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/generic.rs
 create mode 100644 rust/kernel/sync/atomic/ops.rs
 create mode 100644 rust/kernel/sync/atomic/ordering.rs
 create mode 100644 rust/kernel/sync/barrier.rs
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

-- 
2.47.1

