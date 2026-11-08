Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135902;
	b=riDp5O6qImd435trPud25s9rq+LZOfTBR3Vt/0WZNAI4KMGqp/MPlBEg9KaK+HqDhSlJ
	 HcDu5SiMpXCsWrgkPHrKpbYe6iiIWGi+Xinmve5JewzfjBuoUra2u6EEydfmzACSg7+UT
	 0oWWgcCDBSShFJfVeTCn38d6WVEveecs2OS7KLt2scM/YBjrywPKZ240SAiJz2KJxaQ0E
	 j1eN2LD925/kDHugu9n4/Xdnh/esmjZq7Pt/UU/7LxBAgD9sAYPHgfdamQDhWOvmB9j1X
	 9zXauOUhRj46AhZMLLdcFNXoNZn3JyiFsd12Hpvfl4R7b1LBcdofkhIcXKg/VW6QsJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
	b=G5NWQHRpUsbcEtXXyBPiUeL32TBubfGACOnpo5KblmbEY47+yb5paGWWmU4ED7aTYNTR
	 LnJjnCt6j98YP/C/9zuu8YvGMIKriRLDnns15hCSIJOFs7lzAynlHPiMv9ulD13VfX68D
	 bGKJnQ5jA96yU4ZtCNrA1H1KOsgCnrCs2hepqPP1x76yuCNZGDt24d3+Akeo/BrqNMaZW
	 qmfjHT4Y3tJ9TVmUEhnloMgr4Amx45+to3X+BCuYXSxYGPS4ScNb654zrFOqtyLcqkAcO
	 Mw/anMiOliGeSUtPRTMoIbKCnJhruVJ4bEpFP465DWG2dFnZCWOrPmynb73lHd2M/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TPO8fE2b;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B99606A31C
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 11:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TPO8fE2b
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso5459a12.3
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135901; x=1794740701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=TPO8fE2bNkKE2D8gGpqgtxJ0XbLpaHePj4sUZRInavfrz4Tf/kx6dyaXlwBuyZ8dSB
         mXJWnLw51HuTSfphjpk7rF9LCkecHauLkw0yG3l3kCUoHoKsy4mus40nqgKu5s7tCel3
         Ju9mWSYQaYAuN3xgj7Mduz/n7T0ZChugPwJe9tKqL8WLkPlHLnmnM9EyKzZ3AckjY9A9
         fouFhdb+7XzpdSyZSUT5QPqeMbAWR0FSRQ8okPs1qOy26R2Rx7Q3iru4J3nHxnpUkqNC
         fGp3kivSPLr2xX5Erjfmxnqer9N4yevuENMVCyQkttWsY81quhCbgHyZQx5/QGJ5FjOl
         QIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135901; x=1794740701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=fc9JX2JpMrfPw/5ZZDlNiuktYyen0o+xV1cCUByQZh0GHfhJO4GIN1z9xlbBljOKij
         flnWRW0/eUe3zqmW5R5cV5PaxXA28dnwht4MoXpF1jAx2GN+iwICMP3Qrxi1FsMggoyR
         GGJVjE9vFmU84hYKpMYUO8rc6akQ6JfJ+6In5lDNaLTCCv5bZDU8O9Oeb0kJRKsCDTkK
         837B7UG8qUwnOhEu82T/nsbUyu/xpwppdhXciokNCdbPf/pO1FybIxGlpC/upBxkMVdz
         nty93PzwF3hj8RMVBzE6AbjeqPOkeQ5h5TWD36+OHrMrXijYFlr7J/Xb/EamDsDQkGcH
         bgJw==
X-Forwarded-Encrypted: i=1; AL+hErGoerpqZhbQvpeRvddVslFK6biw6zI+1y/Tn2cljG8R63YQ6ImZSEkbu8svsuzND82kiIVO@lists.linux.dev
X-Gm-Message-State: APuU4Z+x+ap72vjLbqto/bzyOJPVmFK/4/WCJQwk3/tik1shxHE/Br3L
	OVRro38gZvx3KmHmEmL1gt3zev4txJHavHwbIqwOfhQzAFLu3P53oF6WlP2ybVdEAOw=
X-Gm-Gg: AYBFou0FIs2TVAGyOu5rpsneNLdhPW6r7fAZARWlKXQzcc0eOXgw3Ldr9a4SFrMH0se
	TLWObdy66KuzMvahJ2cMXJpqZft6wdUMOpPkUrCQxhifruKsNoGp5iHSe6/a47wg/m0jjCoJluR
	HvMjKSOZjZzU6JQbcoNuWXb7kX0+pz8U7sebz/VoMogtM3AxPMl/MTH/wKyBkM4A7PbQ2cHLrRr
	PMUQSSfU+GgKLyGpcAdICzfyrAySmE9yWvr3nmDbbDykHvuFOm8qRgFW33BS/gMBQ1eRSml5YjF
	XTJJLs1A6ruhOK2TLdzfZEyf/Nj+9jyo7iWhC2rMMRnot38XQfpTzyji1bj1XZKvqs5ql7EwiKd
	irrMj//hE29//dxgf6lM4rWChGfVZ8KIIaaiOolu/O/h9Ls65gShhmhvXCsI85gdGXvhp9bZk96
	d4CSzCu2yDvKLyk2H4MpwVwHm1hsEgyDCJicpL6eXUMTYG9l7Jogw1T3eBFmsyuq7jtG5fjhCOi
	pT8feo5FJso0AzycIM0oixV+byySZPvmemwxQIuf3o/ld23dRrjnK2ZMXbbZ+X2WfMF4y513vEh
	lHu4VV1xUQ1oJ9vFkdt+EMud5WY6kEPFhdZCnDTYEu6jlcomNcRv6JqjTrFYOrg=
X-Received: by 2002:a17:90b:554f:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b12d51f0b3mr872216a91.48.1794135900776;
        Sun, 08 Nov 2026 03:05:00 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:04:59 -0800 (PST)
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
Subject: [PATCH v9 0/3] riscv: optimize percpu access
Date: Sun,  8 Nov 2026 19:04:03 +0800
Message-Id: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic fallbacks that disable local interrupts. Per-CPU
addressing also derives the current offset from the CPU number and
__per_cpu_offset[].

Implement RISC-V-specific this_cpu operations using relaxed AMOs with
preemption disabled. Native-width read-modify-write operations use AMOs,
while 8-bit and 16-bit read-modify-write operations use Zabha when
available or a local 32-bit LR/SC sequence otherwise. Cache the current
per-CPU offset in thread_info, keep it valid across CPU bringup, hotplug
and context switches, and select HAVE_CMPXCHG_LOCAL so vmstat and percpu
counters can use the this_cpu_try_cmpxchg() fast path.

On a SiFive P550, Davidlohr Bueso measured about 15-20% lower
this_cpu_inc() cost in an ad-hoc microbenchmark.

Changes since v8:

- Drop the PIO helper patch, which has already been merged.
- Rename the first patch and update its changelog as suggested by
  Davidlohr Bueso.
- Use value-returning AMOs instead of rd=x0 for CPU-local operations.
- Remove unnecessary memory clobbers from the new relaxed AMO and LR/SC
  code.
- Use .option arch,+zabha for the Zabha inline asm, matching the
  existing RISC-V cmpxchg implementation.
- Isolate arch_cmpxchg_relaxed() behind typed always-inline helpers to
  avoid macro variable capture while preserving atomic instrumentation.
- Make the cmpxchg128 fallback use the already resolved per-CPU pointer,
  avoiding the same macro variable capture.
- Copy the cached per-CPU offset from prev to next during context switch,
  as suggested by Thomas Gleixner.
- Initialize secondary idle tasks in the common startup path, covering
  parallel bringup and CPU hotplug, and remove the duplicate initialization
  from smp_callin(), as reported by Sashiko.
- Select HAVE_CMPXCHG_LOCAL in a separate patch.

Yunhui Cui (3):
  riscv: implement this_cpu operations
  riscv: store percpu offset into thread_info
  riscv: select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/percpu.h      | 574 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   9 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   2 +-
 arch/riscv/kernel/smpboot.c          |  10 +-
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 598 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5

