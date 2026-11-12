Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480324;
	b=yiAxHUSC+1wOdE/MolYEUohGZ0aIRNOYaQwswdpMHydzFbhwl2/aQyaKdCGr2DeeZmoL
	 ahRRSbRf5K06JNvqVbbEd/cb6KvaQuMtaHUrkUQz+79jJS6SlcZqC4ZeTWII2LCryA2MU
	 Nh6cQKOYbbNMYm8GyPPO6UMtgOZa+6cQJ+HSjuR4OpncPkiM/whNIrDJ5uxjI4Yq+bog6
	 hMQtXJokVts5ATlUwsJ+I7dKfIUg9A7BAnxrGP81I2AKtUoetnS718LwbGmOkyHuLrAsY
	 6T8QlLB6Js25+UUd3t/Qnvtw2wz/AGD79C07fbH8VwL4d2TqCOSjoKrHmZ8gH+NaboA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
	b=ryTjMC1GXMjuKnMCNF/WdYNLMzEPfYukdCzQ5B6Fkfq4SVTIFAW4awcpbka7DMOIOUdz
	 DanHPLCI15Ew2RNvQtM0+sO1j8S+gLfl6B9fea+O/lj1Vug/2gCpY1PqeFZuGaT/VMkBG
	 Y7TpDVFmAylGNwwC4LOOfU5D9gY1BGix27w8Ydr1MHz+2L+YXH5R5hKCWC1xnqNnH9mOn
	 RdNzf3gYenHD+PUFcn+FBEuAetqpkyA6e9KM9R2X7EpLlRPQ4Yfo54pl/wuiT6TSI4x9N
	 ZnmFGbB5bzXKjT/kHZSot/AfbSxF3qzw1N5o51lOyjnNt96qw1vmlhm855C5S17SU5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=P4cPgsRU;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB8606A32D
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BB8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=P4cPgsRU
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3720addb068so7337895eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480323; x=1795085123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=P4cPgsRUA0z9rjuQJZWmjl/JbuIY0yIn4830h1YPw4TJgqwLlkjEuUhhw3Bjtkxj44
         Z8GVveDA5t9Axyh5eqnY5zOPo2oiz4ShEIUYXaxHDW7GvFfAhv+cdac2xby4GWXMhEfB
         XSD9TCmdLjBPWypuDIbnpvRzyUvE8HX/vp/U8dSCsp/ouJmCMY4qd5MVthBpmeAco9Dq
         3jNbi/u9wXpVtXQpHoQHAxRYLIsOR7aQkSSoppDY/IviHcSDNk2QS9bK3n2vog8WRqaV
         hM2Cu9M7LkGLX24IafifrjrtbNSEhEwHFiiUZiQh0YTSasYzlEOzrKp43jFNPCKGTVoY
         dvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480323; x=1795085123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=bdSmUq4IJgyj0TLAU1wlGuiwvuKVAk9rmGZipI1TWSgKU3Bn6LCtzpAgmDZ8K7N2dz
         C8DvDUm42FCz7uVa93+BjJLuDonm7nXVz+rGg5MKlvaU1XjLcmMxI+U0qMCY1E//9u82
         ag5o95q/6Yk5KnHXPhBN1YegCq3Kk1yzBIVrCPBg6lr82SC0hyOSRcVlKdNPUncU+SCQ
         3hrZq8ZbfgKOOQyVIHBINY4LmeQSKAPDXcXxrbtJbD+SrhFPyIKDq6039o4ukuFSUv0F
         s75Pw9EgXhx8STqGXodL9jT0mTjoy8PCjVvGwHwV20t440oE4oF/xRm7nZQ8cT6atPXO
         M7vw==
X-Forwarded-Encrypted: i=1; AL+hErH1f+prz6X0ix4ymIAfN78IVvYKtEjPbwQrouUi6EEgtCOZ68q3TvXM/bObf4sWF/fIzdxe@lists.linux.dev
X-Gm-Message-State: APuU4Z8C3LwweZ3CUhiItCst4XrQkR8C9bOLKEECCcybKBCRu6PasRYM
	kMPwq2xgMokC19kGrvWoV91myP8NL6WM8ZHFPoBdvFwVHAAnOjfhianmUjyjh6TqjZk=
X-Gm-Gg: AYBFou1PxTPOC4qxLRUfJPV2f0yCZeGZzTDk0BVft7ZPhlPAIz/LQCdX+rhYHshoEr5
	8PDbYNNnUHXthNSEUeeTERCphLyGj3p5hZQbGAV9HE5h6D7uuRJ4OtDO+VQmKNsAX7htpgK4zLQ
	2g2fXC+6xVEtOWjAVzEqETeRLeA9iSkzLfCmMZiqHBuL9ACLf1ydZjOzxlhLelcMGFvQsT10wz7
	wRnXEyN7iYoACwBO/s/A36FUjw/PutUShPQQB0/5SCUXaLPyVzHG2QdW+epxB/Rtg/L8DzbKjJT
	P6yh3xlmPwTvfZDe7BpisUozN7EYQeJseUnElx3pi8rnIbvumMjSDh0vcLiDZ1T7gTp9IjR4c6s
	D4+fC5XoghmRASLpB1YWghH5oX+aDMK/jclL5QogFg5/uvPZI7tU2ljl6kNYQVTB6vvQSZZyPX4
	rabj6f32alHB2ZWUbK86mggn6j/laAeFIiIu5azvUfYnb2H3onNQG2ea5H2Di8kcuJE4hVQEpkW
	XL+SIWgQ8Ok9BAp6EK0eBY+1RHVRIcL29VPORT7EvmGh0jbR3Utm/sSS1epco7tu99kbo/KaIQg
	pE7WDXbds4nNedG6EyC6Mf+BBVNl1zy2g0uO+auKr5FifzFZSGDNT9l7jWeE2zgnck8=
X-Received: by 2002:a05:693c:69c8:b0:369:fe81:a575 with SMTP id 5a478bee46e88-37686756684mr5116143eec.35.1794480322588;
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 9/9] riscv: select HAVE_CMPXCHG_LOCAL
Date: Thu, 12 Nov 2026 18:41:49 +0800
Message-Id: <20261112104149.38589-10-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
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

