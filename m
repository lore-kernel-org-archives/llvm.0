Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714637;
	b=Nou2qLCZr7dgAPPFZ8wIxih0/f3l80Pr4b8ttEnfNe7cgRvIkQhUiiiH78Qpx/xclYDm
	 Mj0HyRK3lZSb5V45uQdUNO6zwVgL6otXzw5y6irbWrYWIJ5NTx7bfvWVvvouZVFkzSku6
	 ZUxFN8HrrPTVIEFB7rtKTBMgxZNaGEzPI/yM5xKiB2rbLTWZifmf5l3kdNyurkfptd1z7
	 RbZmtCsNbXTVs27uwuNnqqWLqmnj/KOYTIOZqZ/eaFZafOmdv/TZ4V/JFP0+C0pP/LOSe
	 xAeSSEk/pwxq8bOJPuYstN0Wx5QdGg6FJwgqyVVN3OW2j8+HBbvfcZ7uYUA6MocQDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=k9AsLihF+plfOh4bix9+PxHbqUaaLj3NetmJnD5B0HA=;
	b=3BD24ghG8buZKrvpSRVwfivpg9zr2Xi8slIIW5cJracNo7FOYYu60ygCW2rlx6sfh5ez
	 kB/STtnF4IWWfHrlP4n+eSsixzfl0+Kli9hGJc3Mb7FYELBj7cDIQnTGiZTpUvSsffS/X
	 10O7rEXJ1YVIV6wgQNEmz199uGLIKTtpk9L6oLn3yWoO3HWcDV5V2jsYko3QM0+TPplQ0
	 n71Q2qR0mhBmfnpp5CZnWGjM3CEnoDnTPxNx5G3p7w1thGXSzpBcGJy/IIoL3As0AOvE1
	 oH9eaB8X4Ez8jkfyO4bI9DPAGgWKIyU2r+kT5Y2+T62iN/lHB+JHVqXndcATBiDTrdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ccH5W30n;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F1606A31E
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 00:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ccH5W30n
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso1244815eec.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 17:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714635; x=1793319435; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9AsLihF+plfOh4bix9+PxHbqUaaLj3NetmJnD5B0HA=;
        b=ccH5W30nmPXbbaN7irAb16ZjzrwNvSoOiWeIqM1jLYJIzsl1qwLd3EyW3qBm1jKuy4
         HfzOVFPw2dUaGNUpHvBZJ9UwisuFAQ549q+crVXcMWf6rj4fsqiDzRPBEipcAabJttKE
         5y6qRSluyC8ROzPPRu6pMqkbDO05bXrfbvkd4DJJd8EK0dOjaS3V1UXkRNOA5Xcxf7pb
         R34KWmXMnqv5g/mSY37Gs5zRUjfZqj+K31I8lYmpsj/Nyp0gt7cStdr1IIcEaLORFP4a
         fijnczoE/mlN4Z2h7Sq5VosqxbIEY+o5Bzt6dtv6iZCDQA5pPhrEfmoPhHZWwar2PmJD
         p6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714635; x=1793319435;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9AsLihF+plfOh4bix9+PxHbqUaaLj3NetmJnD5B0HA=;
        b=cL7rSramx4P/vpCm2K32wh4xquVHTFyT6dIbBrz2K202b9LoSf/JNpYkoL3V0UZwF8
         /W9vTgiKHoWSbLGCmcGoREFviI31shd572DPUUPTy+mNP/9lh/b3SGi2PBNWGZkSB1ig
         +/Dd9vx0LE4vlNJkgAtO2T01PiIFbl47JJ5GP0FZ5S8MV/54gohMaKKxC0dzOqt4KbwN
         nQhssSCl8HSy1fYX4EyTtwYikjEa1MWVvGueaKfJsV/Nx1+Qspeq3CdNnexrEs8ZTQro
         tY8ZJ1AOapvqlh3kme+Ex0R4ns3xA9uWkwh06ts4b1P50qY4WkwgFU1L071LoTMtmVFU
         56wg==
X-Forwarded-Encrypted: i=1; AKwUvBxRH18Gm/kfyHEtg5xjMRQbOXLOjdn+5cv2wylR+I6Sn+PTfRytqeq55P3FQVb/Uet5pyFj@lists.linux.dev
X-Gm-Message-State: AFq9FYLy7pmuBGuo2dlWJ4vAUYyZ3irCswddxvSMu+GdPPW/1/MsDcoU
	Cj6js7SsbnDMRKlnm11BsBYTr0cQMy8Pz/vEQ80F6sGZk8eZFyTOz3G4GKAi0ZC8+NH1X50YC1j
	+i4bsokkp+hYH7Q==
X-Received: from dyuq24.prod.google.com ([2002:a05:693c:66d8:b0:351:4a2a:1ece])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a225:b0:351:6b27:d67d with SMTP id 5a478bee46e88-369d9802e3amr774839eec.30.1792714635111;
 Thu, 22 Oct 2026 17:17:15 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:01 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-8-wusamuel@google.com>
Subject: [PATCH bpf-next v2 0/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

/proc/kallsyms is the primary interface for userspace to query the kernel
symbol table. However, resolving even a handful of symbols or addresses
requires reading and parsing the entire text file, which is often several
megabytes and takes thousands of read() syscalls.

This patchseries adds an extensible KALLSYMS_QUERY ioctl() to
/proc/kallsyms with two query modes:
1. KALLSYMS_QUERY_BY_SYMBOL: Resolves a NUL-terminated symbol name to its
   address. Searches vmlinux first with binary search, then falls back to
   loaded modules. Matches names exactly (without stripping .llvm.<hash>
   suffixes) and rejects ambiguous symbols with different addresses.
2. KALLSYMS_QUERY_BY_ADDR: Resolves a kernel address to the symbol's
   name, covering vmlinux, loaded modules, BPF JIT programs, and ftrace
   trampolines.

Access control matches reading /proc/kallsyms directly: the ioctl checks
the kallsyms_show_value() result cached at open() time and returns -EPERM
whenever symbol addresses would be masked to zero.

There were significant performance improvements with this patchseries:

1. libbpf typeless ksym resolution (8-CPU x86-64 Cuttlefish VM, BPF
   object with 11 typeless ksyms):

   Metric                      Text parse  KALLSYMS_QUERY   Change
   --------------------------  ----------  ---------------  ------------
   Resolve 11 typeless ksyms   157 ms      0.7 ms           ~220x faster

2. Perfetto symbolization & callstack sampling (8-CPU x86-64 VM,
   175k-line /proc/kallsyms):

   Metric                      Text parse  KALLSYMS_QUERY   Change
   --------------------------  ----------  ---------------  ------------
   Init                        155.7 ms    0.44 ms          352x faster
   50k lookups                 25.2 ms     2.2 ms           11.7x faster
   traced_probes VmRSS         15.1 MB     4.8 MB           -68%
   traced_probes VmHWM         23.9 MB     4.8 MB           -80%

Changes in v2:
- Replaced the BPF syscall approach in libbpf with the more generalizable
  KALLSYMS_QUERY ioctl() on /proc/kallsyms, per Andrii
- Added KALLSYMS_QUERY_BY_ADDR for address-to-symbol lookup
- Added proc and bpf selftests and procfs documentation
- v1 link: https://lore.kernel.org/all/20261009130708.1370675-1-wusamuel@google.com/

Samuel Wu (6):
  kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
  tools: Copy KALLSYMS_QUERY definitions to linux/fs.h
  docs/procfs: Document KALLSYMS_QUERY ioctl on /proc/kallsyms
  libbpf: Resolve typeless ksyms via KALLSYMS_QUERY ioctl
  selftests/bpf: Test typeless module ksym resolution
  selftests/proc: Add KALLSYMS_QUERY tests

 Documentation/filesystems/proc.rst            |  15 ++
 include/uapi/linux/fs.h                       |  41 ++++
 kernel/kallsyms.c                             | 132 +++++++++++
 tools/include/uapi/linux/fs.h                 |  41 ++++
 tools/lib/bpf/libbpf.c                        |  78 ++++++-
 .../testing/selftests/bpf/prog_tests/ksyms.c  |   7 +
 .../testing/selftests/bpf/progs/test_ksyms.c  |   3 +
 tools/testing/selftests/proc/.gitignore       |   1 +
 tools/testing/selftests/proc/Makefile         |   1 +
 .../selftests/proc/proc-kallsyms-query.c      | 213 ++++++++++++++++++
 10 files changed, 530 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/proc/proc-kallsyms-query.c

-- 
2.56.0.257.gf7497c7d27-goog

