Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135960;
	b=UXGsW00t6t4OXPygbxrvpWj3KTm3CSn96dxzfPhs1PxZPk8VxWnRY2iM5AoR4NChyRB0
	 omEmbXzlVISUiuas+KXcPuHlhsfSW8plC7srIIz4AfVHwmingIz8x9TeVcZlPqTHXHHZk
	 lfgAXcI5aSIrSju8TGIhUVMjpZvbKf5+chy+wVYxI1dtMcEBpNhNKPKmYujX8NeKP/36Q
	 XKo4RqRTra4OvK50+ZRPBVJr/4yTknavukyND9phQ1PcLlV87HV4hCdil36CdfK91GUmN
	 cAESTHquG6F1OCe8BIGA143arGoVz3lrsVzycuKTFvo4/4ySFajaYDu0oVgPqgh02yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
	b=D1PO3O5rczNSyZ11OXYV2P9dHSTQdChJmdNTkZ8HGciVmlIltcq1Fo6w0puuJURJpWAr
	 5XH2jvmR4Yghf0/59Xdu5vOYfyPMkNqjLd6FGdQZf6phemVGuMiT7pS0EzBB7/1wCByzh
	 P33JQ5DeRQV1RhP6ovhuLe0qxpO31gsdlC9qH7T8/02LLVOvccy0Ifb80PIV3U9WUkQ2+
	 sZ2aFaNmkAiCE0+KzC2LilnnFXcXWAILlyVvGAyAxyJF2r03ofFiVrLPIMw5szWcT11/4
	 x3lRKPYrvCXqQII5++KF2/0c6nZYBbl/Vr+ymkzlHpEYGNvFT4AJYqhnWT7pitlFC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="SkqMs/l1";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A0606A332
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8A0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SkqMs/l1
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso4631a12.2
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135960; x=1794740760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=SkqMs/l1gN9jA2VTjBFrQcTxtGnQra8TO24XDjM9yz3P+HHvJtm9l3ZkyOfnCRi4l4
         K/SCLpgLfg3l55qWggDlASR9HCnVb0DZ6YjuNR90t7Dw7VIkpHgR4twiFhAkrd9USAKi
         tUuspg23B4NnnkxGEEx2cCJ0CaWuJ2tWUdlxvdAAlYWIOAGEqbYgEwOXw3ITeGK7kzhA
         HOKBxm4xr16G2sPeLuv/cUIB+FBtW1kFXRGMi9OAvbQlyzQMq1Vz6jbKxWNtIj4jp01L
         mPg64rF+pnPDgO4VXfXJrNomnBAwUWN5FTGEk7i1pS9wTLJRQiBHzXxiMe8eORQhcPYy
         Kx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135960; x=1794740760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=sdTiQSrIpOIfpsGDhFyQB5aepu3ikYpb/O/xta0/Klrnm4AS8YDIXhHSYWwkRLiIGp
         D2fAQNezFn2LUr+7IMYpdW+AkF8JB0R/RP7CkyHGpOjOvIxns1fMLTLfizF/b2AxUTlD
         Zi5s4p7yvn+bLQK6GlF5oz9Di+OcZjfSsmaiwq9bksfDTD9UufBZF61oPVvIkLOw+xY8
         sktZ6K3JBofpT9//hE39Wv4Gc03v+eo/9mnK7N6GjnAnCIn6ybeH9B1jC19Q3dqlJ8jE
         jXKTrEIx5pYMHpa1gzt+E3ZGEx+Tkx32WeXbZ5f6uzJ7GRC5jwq5uIWuPk58j5FJApyO
         j/Ig==
X-Forwarded-Encrypted: i=1; AL+hErEQDfrxQbZ2/S1yBrtFJ/rLxWZ7j1lJWTnx6cGKlCdzdRlwjcW+IaNEa9XvdIsfH5TLsKEm@lists.linux.dev
X-Gm-Message-State: APuU4Z9a1tNMDvDa9EkNeOX9pPs7xa/U21TJYe26A9BMZPk95FddUxdG
	HFJ8wxsuDwq49XOKbG32nAVIFcqhrnqP3Op0+zN02LVJtozlxm/Gb521HJ6J24j6MPI=
X-Gm-Gg: AYBFou2q/4hi2KUcNm6hYdxB2zQG2Gzx3oLRw2LqcKB0kUwE0oNRREib7FHn2iOjE5F
	HPk9tIPNYv9CtUkbbSsOXTNZSIOUrqPgVwNwE5WOite6evvBEeuSH2kviM846f20iFyXb20SntP
	nUkK4jnFiduqDbXGLtHlPYqhG1hy6ziaDh+yDFkHZ+psbDcdhb0Tg5cVs638PWzIYJCA5N5KOFv
	SEqUntR2lJVB6GPtjJDl8Z6KJxWhjkoz3Qv46YNyxu1VvpNa+hBlyco/cwcXf3Zfd8EFpvL7P68
	bZc3ylfGH73T9jSZThysUjtPY1iEC5iy7rrfhqJ1PwelLUlQEeCIkk7XDrzTdkr8QUyCh8qppMK
	05Gjsr4PcVlL34WeHsn+ZTn8qmP7DtKQ5vmYTVRD+wP+vv71pjqLv0RW94red2GCdAGP5JDWf4O
	c4urBW3XrAl/CpgztdSnnNHBaiDdZp9m10wpiEQS23cNL0MRlBUQ6/iGlKfKOyzAlnrBwnCNFOj
	8FVpFja7vWyt/hEAJPQuKDncCfIAy42VHRfdZHXh9MxfuO2O0kDIwiDjaha/+7C+BA++4/cKT6W
	w+l7Q2R6bSvceaebpwsSGV4a1TVWOHAO/8/D5cNFYz0UDChXag96WvK3DNGajJ0=
X-Received: by 2002:a17:90b:3b8b:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b12d43f8c0mr1076560a91.48.1794135959430;
        Sun, 08 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.05.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:05:57 -0800 (PST)
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
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 3/3] riscv: select HAVE_CMPXCHG_LOCAL
Date: Sun,  8 Nov 2026 19:04:06 +0800
Message-Id: <20261108110406.97495-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261108110406.97495-1-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that RISC-V provides this_cpu_cmpxchg(), select
HAVE_CMPXCHG_LOCAL so mm/vmstat.c and lib/percpu_counter.c can use
this_cpu_try_cmpxchg() instead of serializing per-CPU counter updates
with local_irq_save() and local_irq_restore().

Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038f..458ef01e926a4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.39.5

