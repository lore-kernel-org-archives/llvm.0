Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F33212B17
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008631; cv=none; b=uN6cBV1gLkWiN8E3Lku9SgFPTGbKBaU1ijSVktZWDM1r0K+NkPOILk9fPiBGzBWCY4hZsL5/734ovWQPsRHL21LH6i7ynr9idnvP7IMPkovbBUE2divG9LH3QzkUoQPM9krsRB7HNcMEZNHH8Yz/2VrkJXnH/aGu7AGO7MAWHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008631; c=relaxed/simple;
	bh=bWdVzLVWRtavYw5+TVc3lHNfvzogIph6bEYfLtcnLfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rLxlE0FKI0UZCVe4rSz/zBWC85ETV6C+cG92ObCN9i+A1lPPTh6nc6rxw7e1V2ptWKr6E79XUKCeUPCYfwkQrcC0A7pgjGGDpGD4G15Jy+tOSvBMylHLqJjPmelMFYpSplHx/YjS87XVGKYvBn4FDoZ3cqIh+l/DSlYKNtYkCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPAkz2fZ; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPAkz2fZ"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22349dc31bcso75967215ad.3
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008629; x=1741613429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gNjkZXsFxPWFMyK2OgocbrFn2IS3HWHLODQTFVqVxX4=;
        b=BPAkz2fZ0+530y9gSd4nbxiclHx6/+Ni8xZR1cTRUwPhfo6UNvD71Z192Fw9boob5z
         QuPOUP+buwv1WYjL4B+GPficILfsB0zZNwifm+KiZ4XVWJnnxAH0u7oFZK5icR1Sh8o5
         jDrTrcCPmhTHQOKcaVJiNWog+jkVnC9mt4c9E4i87TlKNtVDgjieau8vFdjIEgeCfTuT
         agADkEq/pLaDjCoPpwpHz/slm5mzl4GEBA10W8XoVRt1UrgZqCRDWFSnRaeaArHcLz86
         8zBjXXgA+bBKaTeAUy4UtL7IYNrRDu/Gx0n4bvfbTKOJwrl20H5NNSW8b6ApLJEneVtq
         kIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008629; x=1741613429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNjkZXsFxPWFMyK2OgocbrFn2IS3HWHLODQTFVqVxX4=;
        b=rmHRfFpNsHcQKLOoUMPHoJMwX8U/samnSlmeIH2aI9We2wpGRps/ofNWVMyJSgsrN7
         5O5YDF6vvl6F8sKssHo5lt2wlPJURjxPwt9Fpif67PctlOZiyzu2pW5BA+uexJ9rWwc1
         H505Tfvk+w9NQRC/+KawP94ShxmTIESlbYrYcnxOO0A6PGTy2SuCPMC7xh9YAzhtT3Ip
         5renK5HOw5vqVq818NCnw02Jec8GYAC+FV/habvv9FR8LCP+OrW+0vMGWoc+fSrKPWGb
         CgaleAPKunVPBEmvRaQrsw2KR8cAtQfJSO2GamJCh0wVfdy97TFhGT7nB6CjbL7cF299
         Ll5A==
X-Forwarded-Encrypted: i=1; AJvYcCVVOTyMXgJi6Ee/o+bNY6uGZhTJ9KfoM2G9a0Co6kS/cv0LtQ3ZTdhu1ZkAYgFHtAPuIbe0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Wq62tMabxU8YA9SW2vk5uZaMt4mLqr2sObo+y4w17k4wvwIQ
	wEcNFPcZEDgHlL+7neIsusmngIwKWv8etmQHrC+xQIqrCMy5PaF+
X-Gm-Gg: ASbGncvpZpqeij9UrmfGvdh7hVUe6nDZ1LKQeWVWPnHvgWsoWRHeaZ7R3EuPvy2bTct
	cxSzQIfFkWVwUz5hHOyefCv3t1ztm67HvDLvn8hLaQhXW7R3l2B6epbPyi4C/0RPa6tgNNmGMRv
	GKxMg1i6iX1GcgqTO9x7SC/LpeEljb1NihsfTwSL0DrGVef9WWkRvvVRjW6+W1cDlrQVJ/iBQUU
	Wlu0WDEi08kFrtzZ0xDmpDRPEVONA4ws57WysQKmvjFzeGeF7Pzp0mDvASc+EQI0k9JBfwReZe/
	8ICQF3zTdRjG3QLSB+6k4Ogk53tvKB4QdsuxF97avritW/oU4ymk/TBty4cAtA==
X-Google-Smtp-Source: AGHT+IGzwQpz8i9IoNIFYRlZqYmQzdkErFQv2wnbEGpUy1JVrV1T6QdikCneYnb/qYuevmlNGOS4BA==
X-Received: by 2002:a17:903:244d:b0:210:fce4:11ec with SMTP id d9443c01a7336-22368f6a5f1mr188695035ad.1.1741008628736;
        Mon, 03 Mar 2025 05:30:28 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:28 -0800 (PST)
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
Subject: [PATCH v4 0/4] per-function storage support
Date: Mon,  3 Mar 2025 21:28:33 +0800
Message-Id: <20250303132837.498938-1-dongml2@chinatelecom.cn>
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
make fineibt works when the kernel function is 32-bytes aligned.

In the 2nd patch, we implement the per-function metadata storage by
storing the index of the metadata to the function padding space.

In the 3rd and 4th patch, we implement the per-function metadata storage
for x86 and arm64. And in the feature, we can support more arch.

Changes since V3:
- rebase to the newest tip/x86/core, the fineibt has some updating

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
 arch/x86/Kconfig                |  18 +++
 arch/x86/include/asm/cfi.h      |  13 +-
 arch/x86/include/asm/ftrace.h   |  54 ++++++++
 arch/x86/kernel/alternative.c   |  18 ++-
 arch/x86/net/bpf_jit_comp.c     |  22 +--
 include/linux/kfunc_md.h        |  25 ++++
 kernel/Makefile                 |   1 +
 kernel/trace/Makefile           |   1 +
 kernel/trace/kfunc_md.c         | 239 ++++++++++++++++++++++++++++++++
 13 files changed, 450 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

-- 
2.39.5

