Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63672EADC
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984943; cv=none; b=pyNi9XZ2KzJgd083PY5GPimYjFC1NFbR9pNwQIkwK1x5HiXL4+x/LdIJvRtH1s4lJpwM2XlOGi18QNwKP8QxnMTPoLXh8ueoOLPSYpu86ObHXbtPONFKdsnLjgnjJRl3n7PS+0zgkLITj+M3XT5dEcrRnLjHPEauCRGIo3Ekkxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984943; c=relaxed/simple;
	bh=dG+GmQJ58+AjwIbzHzg+zHRT5V2GWAAOltkTkMVShO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rC4px8pqVLWLqItEtasf3A9imUWfNTQknmrYcztobDDd/wkngVREGPiDaRgQKymaHkUKZh5jLm6kxMipXWi2hn6ukTGQio/cBmYRnw695Gy/028lJiiL8TD4U5SvbrQdCKQ5bwhqzWKMpIGZXLaZGnmASfc69adsyMeOoPHxwps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAmLhMcv; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAmLhMcv"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so8505664a91.1
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 22:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984942; x=1741589742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRORuk1lZoTaQ72m0hDUrhIZjvt/8jV8y2hi7nR1rH4=;
        b=XAmLhMcv/i48zD3vnfAhyo5T203wYjdOudlVWm+CBULgvBIW6tjEGadT//xI1h6t8T
         x3OVKX06jaRyesePvvI2MlSuYm/BNELpV1hAzf2ajizMRp7Z7qVDn8Fhg6hVta7CM7sD
         30zWuu3ibf08KYtGJJI5+CtAisJNF7XXlRacwY/B69G+mqtbbmKjgrkYL0O++CheHpPX
         ClX3KIWB6i51vNGqNU47BnchmW2IRFakWh3s2B6IQyNsHdBQZnSslu5mOAPKzF7ErKiz
         YWOW0WGnpT8Ksp3cqNkZlszy6yFcv5q1f9Cg5F6n8LOjucjEi1DIt+2YLHX3yFLyNabc
         Z/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984942; x=1741589742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRORuk1lZoTaQ72m0hDUrhIZjvt/8jV8y2hi7nR1rH4=;
        b=d6LihIPMIotxhPSka7FlOkIrI4d8qLCc6LEd5Minqsv3bSoV4ltN7OgWo0vpG2K4ZX
         btbSpsedXKiTx7lik9ZUb1LE41y+u8VaseBQuZjSvuz0pzAcyVrGspU/wMPL1iNuN0qo
         A9iSFd/C+TFt9RUf71Gka61cST0GSX88P34y9q6HYiIFP+3FmH9UB8PRPqkOS9y02dp4
         xUR3OH3zXjcKjxqKGmgR+GmKfR8Iuc79yu6Qzi7EXoAOBEG9tGCNpUHaJO4lobjowMM9
         U6OKUEbqPrv+M7xY5ns6rdD1YgbGUCJRQGFmaN3c6DAGwhdQzbZtwhfPmiOsGpqBHLy+
         t3jA==
X-Forwarded-Encrypted: i=1; AJvYcCWMx0iFlF37teRSqru+vaWUuTpJuNNfz6B5htme3MzgTylO6LlKclOvmVhRa0Wzt6aDwIJk@lists.linux.dev
X-Gm-Message-State: AOJu0YwRf1MMxDoaKGJDT+ut4T9KxeZ+kCDveWnbxve1HJyk85kgaGla
	1J0ewrJbmX1PKYgkzSYQuc27nIBoVIhJF6veJ9MGgZ/twzoVY7JL
X-Gm-Gg: ASbGncsNJngO9aLjErRqWsnb1BP5E7oUC2zGgStrS+mqfn04QMS2XW34sgbiyp/CMtg
	BitY2Mm379520btvWZLEL6yAdjhNc09OivZbFHhMRNn4uGymVjrKGv3N9c7PX0h7daNlQH4mx0D
	MYwLYsAecqDl83/SUXz4RBVk9G1lD61rnwl4jS+L4gRRcYDrQwqbCxumZAijBifY26pAplr2bLu
	MV6ntNz1aykUy3ltprnH62IEsu34Z3ILTTahZMxwz4oV4+aZjWLm/sj8aZd8YNdd1LtSFTX1bcT
	zd+2Sd/m7+61XPmU0+h5I4NtApr9RSDwuPfyULmtk4hSk5JN7g329LeM26C76Q==
X-Google-Smtp-Source: AGHT+IHkrQ6QYFMj0geZ0tfgbyR4QorZaQfQ/7JtrPSfKkhKbt8kMcBnshigR2/4fvzZe6e2RxKkcw==
X-Received: by 2002:a17:90b:3ec9:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-2febab78721mr21988807a91.17.1740984941579;
        Sun, 02 Mar 2025 22:55:41 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:55:41 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 0/4] per-function storage support
Date: Mon,  3 Mar 2025 14:53:41 +0800
Message-Id: <20250303065345.229298-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, there isn't a way to set and get per-function metadata with
a low overhead, which is not convenient for some situations. Take
BPF trampoline for example, we need to create a trampoline for each
kernel function, as we have to store some information of the function
to the trampoline, such as BPF progs, function arg count, etc. The
performance overhead and memory consumption can be higher to create
these trampolines. With the supporting of per-function metadata storage,
we can store these information to the metadata, and create a global BPF
trampoline for all the kernel functions. In the global trampoline, we
get the information that we need from the function metadata through the
ip (function address) with almost no overhead.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata.

In the 1st patch, we factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET to
make fineibt works on the kernel function is 32-bytes aligned.

In the 2nd patch, we implement the per-function metadata storage by
storing the index of the metadata to the function padding space.

In the 3rd and 4th patch, we implement the per-function metadata storage
for x86 and arm64. And in the feature, we can support more arch.

Changes since V2:
- split the patch into a series.
- considering the effect to cfi and fineibt and introduce the 1st patch.

Changes since V1:
- add supporting for arm64
- split out arch relevant code
- refactor the commit log

Menglong Dong (4):
  x86/ibt: factor out cfi and fineibt offset
  add per-function metadata storage support
  x86: implement per-function metadata storage for x86
  arm64: implement per-function metadata storage for arm64

 arch/arm64/Kconfig              |  15 ++
 arch/arm64/Makefile             |  23 ++-
 arch/arm64/include/asm/ftrace.h |  34 +++++
 arch/arm64/kernel/ftrace.c      |  13 +-
 arch/x86/Kconfig                |  16 +++
 arch/x86/include/asm/cfi.h      |  12 +-
 arch/x86/include/asm/ftrace.h   |  54 ++++++++
 arch/x86/kernel/alternative.c   |  27 +++-
 arch/x86/net/bpf_jit_comp.c     |  22 +--
 include/linux/kfunc_md.h        |  25 ++++
 kernel/Makefile                 |   1 +
 kernel/trace/Makefile           |   1 +
 kernel/trace/kfunc_md.c         | 239 ++++++++++++++++++++++++++++++++
 13 files changed, 456 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

-- 
2.39.5

