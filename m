Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3A30CD81
	for <llvm@lists.linux.dev>; Thu,  2 Jul 2026 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960915; cv=none; b=QuRcXWN9V6CFbx4o336ZOV2osysRqF/xmtuzVogUyOqUpkA/RAK1lB80sTbUn0vJ3oeyEThtG9/SCOrX2CyW/0vS5ss3XD9ufelIGXDMF0qX2j+7iVAYVLJKz3KDmuOaek4iw9fKZMMW1OVd+OCQzm15uIESOLZLc83vwFc3EkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960915; c=relaxed/simple;
	bh=pGDpUoR+YVfr0eRZnyVNQJ79pTwqmoMZJvjcbiau6fI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=bGnFBTVJmD82yHIY39hDUlKcTlrSVuxbaV3wiyB9N/tQgs//SVPMlPUN0eDZ7UxC8/hu+7HDLzLtpOhkXiOS1tJTYK/FaTG0EUd/x0NDrKvHlPKMLtj+HyJFW5/LltKqh7NRkEuQdk3Piy3Cfiaz9dPsLvADYP6y4We2B/VG570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KuOlQLvT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KuOlQLvT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso932332a91.0
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782960913; x=1783565713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzv59asYaYM1r1NY8KtOkB7QhvGiD1GkLe9qJuyqT78=;
        b=KuOlQLvTaz8wnMUIAIQxAg/mggEi+Nfm7mPZz4VEnfE1Da7rn/rk4RVUydnqV1ICoE
         CVtR3QVhbXD6ltt21Scs96CeLqydze5BwISMqswdU35502PNHy3VLdmYgsYpmSbrhYPH
         7DdSbL3zhGfHYwcDjSoxpD1dWCKBvLDiE04RChrZtvzo1OUoCL3ckwRZWQ8+LK9fpXBy
         M0TgS+UkdUwPPX4hdrGW0fDH6ayL0H1pHMJQWwT5BkAEfqfNgrPvWT4LjP4m2hSJD1UH
         tuZjZz1FABvnYVmDZlKxNHYcuGA9TvyEM082D4uuMm6XDTi84vKvGTA2bx+NYzmwW6UZ
         plBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960913; x=1783565713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzv59asYaYM1r1NY8KtOkB7QhvGiD1GkLe9qJuyqT78=;
        b=S5vWVxeW5UHLjubrKnJZX8W0z0HXXashPpLIyIly90TdMWry4TmC5g5Y2xyXf2NuC2
         1mjTdvYMTdKLgnPW5cyGxBTvYbsx6Y9hfNl/MAL0wAcNQNW+mu6Fqrz0j8UWVG1xcINg
         FcewTNE6MxeD1f4fdA9D5Vlh/Q8Oudti3vCnByk6FHTiD3Y3DBg/QP712YdSg3dCSFe6
         134jo0/aV3OPm1Rp8XkE3uLFi6trzOtRQDO1U/q5b6nUxGaZY3EDiFOkacBagLiSDCCz
         awPV+skcJRyhKLc/IWUmu4snQ6p8nHaYiL4/2pG5KYVJKJhQ4xOKPT6RKkc+5WUQ5B6a
         7WUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3uHyf6ptH0SXtvy63p8Hx0n0YCPGt6ZDBam+v3XH942jNzmnbHyMDVmC2vP+ZaYxJQdNJ@lists.linux.dev
X-Gm-Message-State: AOJu0YygURtj+nRqnk3bdFBWtlR+ncls0jH7H3ZqZeDN64cYCghkZ4Ju
	Cpbi7szxeUNbdTo4vhzk+vV9HclSS2fPHtfC73ObxBoTyDBVccb1Lsmhwc69LKFGuIs=
X-Gm-Gg: AfdE7cmLhhLz7m2/hdmVkDEaWD+q17o2d30Ji9noSO8CY5iXK2n/UPZvrQMEbTvAX8q
	2UzVxgFU02l6Blv4/Mf0zTRqNoRsmwcxDqfPbezs/Ht9UvKk/Ds0x5KbBkkt0sfF47tXtl7Vlxj
	OIP4kSz2mHnag8Azd/zmnGrlO1bu083GEjVqqZqKMyNNi4xLJ75hJID8guUt3DyNHYKvGZn/N4m
	RdGWHMPU0DMLmhB/SUrpLbgOn965fCHD0JeXjcFVSaLRl4DNu/JmtWaiRh3h+2Rl8+RjMq9F2Dp
	dBglJMGqYaGYG3f4XDuI1C0kYxFeRPbUsVXEkQ6RUFaN/j+EFLTTVKZt5nxliQFE1HK97+8M40r
	GUMrSgBplqxH8T72yQ4iDfvla2s0Rnkc9n/ARVpfDve/Ul3kqQxGoBjvnSysXYojMxR1f0zC7k+
	EA42mNiNWINdvF8FfbSNBRjZtA6YVyMywch7EO9Ev5MnSFAytOStwUEbb5
X-Received: by 2002:a17:90b:580e:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-380a9e38790mr4709918a91.0.1782960912995;
        Wed, 01 Jul 2026 19:55:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm4358686eec.15.2026.07.01.19.54.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 19:55:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Thu,  2 Jul 2026 10:54:40 +0800
Message-Id: <20260702025443.83389-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v7:
- Address the Sashiko comment about inconsistent AND helper naming: rename
  the RISC-V internal percpu helpers from andnot to and, and make all
  this_cpu_and_*() wrappers pass the operand directly.  This is a readability
  cleanup only; the generated operations still implement the same plain AND
  semantics required by this_cpu_and().
- Undefine internal percpu helper macros prior to including <asm-generic/percpu.h>
  as recommended by bpf-ci/Sashiko review. This prevents macro leakage into the
  global namespace and has no impact on generated code or runtime behavior.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 300 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 329 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5

