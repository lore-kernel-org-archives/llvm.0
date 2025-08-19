Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E0248F70
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574807; cv=none; b=KaCjGcNH9/Dm/aFTcJbPKR5vi8uswygpuS1tgsqMTBbtJ+ywo94ZdBlsSApIZn+oTUpKFB02q/JPDkh2heU8SFo4wbZ9TmusyJTwHm3oqyerXD1p/uHFSXf5KEGUNp2zL0IrZv6X6j2KwobTTvZ2/lsuPpYxaINqmXG7O6byCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574807; c=relaxed/simple;
	bh=oMMTTpZ7DDLG7SH/wCcYpwJ8GcWUpvWEpD3dzj+P22E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJg7ojKbTq+FX7/aDIglxiJN4WtuHnyiE5FBx+MZ9rcsurZIrNslXQtVYeAvnY6fGiZsyOenLvpwsmNbAfcqjHnMgDdSXnlF2B4QEFnhptWeccpURsMm3zfO+L4MX6yMT6ce5E5B4tQCz/uLjlHSAHglfo774rhyXJ8g5Sqtv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmL8LHc6; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmL8LHc6"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-76e2ea79219so5524192b3a.2
        for <llvm@lists.linux.dev>; Mon, 18 Aug 2025 20:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755574805; x=1756179605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFHQgOMcHjeD9oe1SG5cmQkVXc+xDQWsrx1kiEfHVL4=;
        b=TmL8LHc6vVzLyglcnyD2n6PHginMppzi0/BCn2IJWlkz4bUxE3ffQxv84PXLSoPxYI
         egtUanSdx301QISQGtCi5Ecx4w92MahpW7klzKZ0Hd69kyrQIFXf/7CCRfoXNPehXrY1
         fB/Atd1pbmzXgU1EerJ9SA5T8Fj0As+EUUwAEkZZGrMdxTGnnu1v3G7nVdnKogPZWalA
         f/li1o7dKJvRXE3qbTRBwacW04c5Iulg37K+RMAm/CkWUlzQ1M1qCUUOhwpPW4Gbiu4s
         Vl/BpemlgtO594TxX3sR2oMc5S1kSy+jao0n6DFX1pktSvUMBONT+4JKFK69R8I7ucm7
         EF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574805; x=1756179605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFHQgOMcHjeD9oe1SG5cmQkVXc+xDQWsrx1kiEfHVL4=;
        b=xUG8/RHYREgRweQRiuwV6y9EZTG98REFMDUA9nt/Hd5rx3LvD5waqd48geXpatEi4B
         3BPgku+CqSK172ay0erFTB7vA0yTMCwmj51tyA5LDued+OJ6kUTGCLdcaiPq8s6uIGVA
         IkoI24E06C8ABCrwhtETzBHr5HdNnbclWyxzwub4YqYWNG2wM3eK7FeAHa+2JzngWwpD
         hUkPIjBUHke5Gkth3oLnJTO3NL52o7x/PqXPKO9qF6UDy0yl+o1xjp2NjrOBLRSlyLjR
         ngbTixUZJBrOKGLrfd0K243qfOA9s1qzvt/Avso6hI3Ffo/G/jnISBZHGTY7SBBEy82U
         XNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWZHsbPz8f1khURooczpTYPD2mD0CY95YVkOidHOp/IQ+wzAf2nvN/aFAL+VIoo0J2XyAE@lists.linux.dev
X-Gm-Message-State: AOJu0YyGd9PG8//NWYn1YUZPJoj3BVfL3hJo7e0VwXBD7Hq9ESDwx6if
	PQ8wBGg4sm0FgSJdcMQbIlSdxTjzrhgvFIpn9xy0hP475k7bW6YmMvMM
X-Gm-Gg: ASbGncs6aY2kHuFq/eBHPZea0D+R6ZBEOFDVnbyNrJpPFrVdV285jILJuUxy+Q2L0lY
	qnBEspJ98a6G9jKNpVQoVOGZgTZWtDHLbRc4eF49jfs7/8dw0YNtfRURfUJnhBwZfj5+jQMjTLu
	mV8JDJL+1iuZkNXzX0V0GG6HIJA7DgFChufUy//0niTm/5RJOaMC1F/UZH/j8AYqMzTgpSgKl4f
	u/5FpfjtUMQJONYtIUXZl1+serBWUWqY/wOz95i7fLxspnpJpFosJh9Q9T7rD+D7rCsDylf4fCU
	PUZ+SbDqZgs39ICNVXYmpnczgn1pqsd4X9kTVxxPzvd8X1RvEzb182Kmb1V7DeUbq7ZCHmiFnnq
	GhYOeBHqJ7ZK/xELLhbYLDVyg5K3srw==
X-Google-Smtp-Source: AGHT+IGo53aHj64WUcT7KLQgE0O5qWaO3awd9VIpUREednRbIbqbChBLi5/6xo0pVoRbbwFaPLl3jw==
X-Received: by 2002:a05:6a00:3a07:b0:76e:7ae5:ec95 with SMTP id d2e1a72fcca58-76e81140c6fmr1453049b3a.31.1755574805503;
        Mon, 18 Aug 2025 20:40:05 -0700 (PDT)
Received: from 7940hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22b8sm1109804b3a.4.2025.08.18.20.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:40:05 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	mykolal@fb.com,
	shuah@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next 0/3] selftests/bpf: benchmark all symbols for kprobe-multi
Date: Tue, 19 Aug 2025 11:39:53 +0800
Message-ID: <20250819033956.59164-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the benchmark testcase "kprobe-multi-all", which will hook all the
kernel functions during the testing.

This series is separated out from [1].

Link: https://lore.kernel.org/bpf/20250817024607.296117-1-dongml2@chinatelecom.cn/ [1]
Menglong Dong (3):
  selftests/bpf: move get_ksyms and get_addrs to trace_helpers.c
  selftests/bpf: skip recursive functions for kprobe_multi
  selftests/bpf: add benchmark testing for kprobe-multi-all

 tools/testing/selftests/bpf/bench.c           |   4 +
 .../selftests/bpf/benchs/bench_trigger.c      |  54 ++++
 .../selftests/bpf/benchs/run_bench_trigger.sh |   4 +-
 .../bpf/prog_tests/kprobe_multi_test.c        | 220 +----------------
 .../selftests/bpf/progs/trigger_bench.c       |  12 +
 tools/testing/selftests/bpf/trace_helpers.c   | 233 ++++++++++++++++++
 tools/testing/selftests/bpf/trace_helpers.h   |   3 +
 7 files changed, 311 insertions(+), 219 deletions(-)

-- 
2.50.1

