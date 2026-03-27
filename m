Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C307381AEC
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612082; cv=none; b=n7N/PKrXE6U+phR9/bGZXlaNOHDmd/z6kIlNBljmBeqxPyl61SmAsTF2w3U5hm2tYJ2tQrZA+/YstuBL0Ljb11DgpwMr3Zj1rOv/smZ+oY/BZ4J6scdhn2TGeQZJwCt3Tdn4Yfvraa1ltYDtFO9ArSmzYz3TI+R06YrZTttVvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612082; c=relaxed/simple;
	bh=6WqNWUbqfb7HlONn5CrSW8B/8IlYYtTlhCxhq+oa1jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nxyB1RlUlwC9VUOrfN8emnSSSz+aFep2cCjny20Dgflq4iWwRlhHIp1N20AYPKXn4jM/7C7ToD0GYQS81DrFAgvGT5sdqc/nD+4p1fLvP2VxOBoc/XnRUva2vUh7gOoOjMEjWm9+SdowIk9+YrZHIKEEwuDwpQUp+EVG89wPcaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kP2iAMWK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kP2iAMWK"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a7539851fso965294b3a.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612079; x=1775216879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=kP2iAMWKgRQ1dbqn2ePcZitWMIaHtDUQ3WXv5c8xJNFToWQzrx6PT2X14iDdpAaW4m
         AedwmCGFc1KuNPjWyVMPH8JcDZ+M6fnFkP5/rbC+rDVUDCH/TX7/MhJ9neaKin8aC6Jy
         FZ08zWB7Pu8U58TXQKxYSDO6RkCvN94hebHrGRAo2DI4wiHDYERAZ+8nnOYzj1PNnEW7
         7B8Z3RYE7PTPBttwHmXAa0nV7i7ffx3rtfaeDzYxu72XuXsV7fxGd667eoaFwQHMLS21
         rAC0EW+RAFe92zQy2JF1clJUHJDc8eivP3Uyb7ZZ7Stwl3mMGuVVfZKGOIl6YWK5vtmv
         K7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612079; x=1775216879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=j5xDVPF4inVSlEs6ekvvsn8BEF7amvtyg8cBtNMohMcANLEGYc4F/1NFMwVzZXJbvO
         BML3gxgCPXbe52SyvY1KDkLnm6yb3Fw51+zFuzoAxlWgXQ8xVnakQGSPNWJVC1pe2Sqw
         gb0MqNGDrsKLacnwDqflqkW6QVnZacbTQneDiy75HRYr8EQXGzFWjfvbm0y5YV1XTuQl
         DiuqsuQ+hchVz3yCuv33OZiFnUxMyR+0qVgcJpZ4m9fhOywCMmt9yT+X9iiAGx0GRsOv
         hsIAPlb9LcQKOVyZZc3pBm81MWPgmYcrne2tYMuhkZAOUVxlrSidxUYKS3eQYigGdBr7
         Qb2w==
X-Forwarded-Encrypted: i=1; AJvYcCVbUu60kC516uXFB/2IClqtOPpcyYXZ5FoCpRMkqviQyEHyUogKxe8Zr3hgbNlNj0PKILSz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0OWhqshrA48GJU+oPrOZJav6chg6ESBVjvK1ru85mE6WR5as8
	pnKkJSNcvere9Y/z9hoT33AYs4CpoF++felbkN3A4iTMcZCr0vCFi6AH
X-Gm-Gg: ATEYQzze52DMxu59SiYSPqiI6PqvmxBBHK9T5p8wZ5poU0jKayCNegatS35OCq4z149
	LverDjZ+ydo11Qj6rJPgZ1lVkbkkFawW4oUrwzfoGS0dXIsBQtJAIkyWlCdaNK2EEUYjTDRYX8A
	N5Vs3Be3CG68iUnZnsfBQqooh1h6Gtd6a5bmZM6dteixU+LFS2LHgaBbKFkdVdQqFxLLye880Wo
	Ic8rDr6K+Y4vciQfOd3f9JONa8Vg6HxgpIWWB2yolyOKD3+6Tzgnh9m5b0oHGADXT7FvkAYd3kN
	xnrO/IzliSKtvTngdLFqzmF095XavpxE3EtRCD/Q0EgD8EtkVCr1jOnzfeg6MvB0ygwQ/dawcLr
	Cg4aXSHF0SqxWCu9V2RrhGLtvq/ryjK7F57ZjGivyjuSYXeydfJrxajxY5KbMvFX9cQltER4VM4
	19JR29YE5IuIaWo/6XQ2gF8DGX432D8K8fpogxzN/yV4wbrHlos3YSTsDRKhupSgY2
X-Received: by 2002:a05:6a00:600a:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c956c2ef1mr2401030b3a.0.1774612078684;
        Fri, 27 Mar 2026 04:47:58 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c289dsm5235572b3a.47.2026.03.27.04.47.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 04:47:57 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: axboe@kernel.dk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
Date: Fri, 27 Mar 2026 19:47:39 +0800
Message-ID: <20260327114741.91500-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

I have been working on adding a new BPF-based I/O scheduler. It has both
kernel and user-space parts. In kernel space, using per-ctx, I implemented
a simple elevator that exposes a set of BPF hooks. The goal is to move the
policy side of I/O scheduling out of the kernel and into user space, which
should greatly increase flexibility and applicability. To verify that the
whole stack works end to end, I wrote a simple BPF example program. I am
calling this feature the UFQ (User-programmable Flexible Queueing) I/O
scheduler.

This patch depends on new BPF functionality that I have already posted to
the BPF community but that is not yet in mainline. Details are in these
two threads:

https://lore.kernel.org/all/20260214124042.62229-1-pilgrimtao@gmail.com/
https://lore.kernel.org/all/20260316112843.78657-1-pilgrimtao@gmail.com/

To try it, you need to apply the patches from those series first.

Note: This is still somewhat experimental. I have only done basic testing,
there may be bugs or security issues, which I plan to address in follow-up
work. I am also looking for community feedback on whether this direction
and the implementation approach make sense, and what else we should
consider.

Kaitao Cheng (2):
  block: Introduce the UFQ I/O scheduler
  tools/ufq_iosched: add BPF example scheduler and build scaffolding

 block/Kconfig.iosched                         |   8 +
 block/Makefile                                |   1 +
 block/blk-merge.c                             |  49 +-
 block/blk-mq-sched.h                          |   4 +
 block/blk-mq.c                                |   8 +-
 block/blk-mq.h                                |   2 +-
 block/blk.h                                   |   2 +
 block/ufq-bpfops.c                            | 213 +++++++
 block/ufq-iosched.c                           | 526 ++++++++++++++++++
 block/ufq-iosched.h                           |  38 ++
 block/ufq-kfunc.c                             |  91 +++
 tools/ufq_iosched/.gitignore                  |   2 +
 tools/ufq_iosched/Makefile                    | 262 +++++++++
 tools/ufq_iosched/README.md                   | 136 +++++
 .../include/bpf-compat/gnu/stubs.h            |  12 +
 tools/ufq_iosched/include/ufq/common.bpf.h    |  73 +++
 tools/ufq_iosched/include/ufq/common.h        |  91 +++
 tools/ufq_iosched/include/ufq/simple_stat.h   |  21 +
 tools/ufq_iosched/ufq_simple.bpf.c            | 445 +++++++++++++++
 tools/ufq_iosched/ufq_simple.c                | 118 ++++
 20 files changed, 2094 insertions(+), 8 deletions(-)
 create mode 100644 block/ufq-bpfops.c
 create mode 100644 block/ufq-iosched.c
 create mode 100644 block/ufq-iosched.h
 create mode 100644 block/ufq-kfunc.c
 create mode 100644 tools/ufq_iosched/.gitignore
 create mode 100644 tools/ufq_iosched/Makefile
 create mode 100644 tools/ufq_iosched/README.md
 create mode 100644 tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.bpf.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.h
 create mode 100644 tools/ufq_iosched/include/ufq/simple_stat.h
 create mode 100644 tools/ufq_iosched/ufq_simple.bpf.c
 create mode 100644 tools/ufq_iosched/ufq_simple.c

-- 
2.43.0

