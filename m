Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480151;
	b=OqmIkPvALg4stcv3v0YNJVEIRsryFTjocHTnnpquDmyDFO8aJyP15RaxrFwAsJv8ty3f
	 TVo89vnpNiDgsAtuBcc96mZkyMNswdFvdpunmvdBeltjBSsbKIduTKFxoai94FNKxqURN
	 IRKmdi/NFB5FaBz0unZxDKRjDNeEYNFlEdJwPFPsvASuPT3A4DBqaCktWWRz0FBU0qsfG
	 OVlfA6U6nAYYSxTDTsRZTbjAXPe9KdDWKz0RovpSH9NfhcIEvTe/wfpdviOJbE9JrWpNc
	 4afMOOITFeavB7APAhOnYrbrpdeI6IfioNrk7x7u+HD9qfzt4k3zkH0F5q0Dc9Mk7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=klEvwnZ1yJl7mvpdDWS1ABMi3/7l4BDDL/A2UVpdY0c=;
	b=CovMRe7LxZ8i6+S+3j8dLznNGdcTlCxx6tmssVyTNsPRgYFEmcurLZdZbGBGwwe7SnhB
	 AHzst86Fja6N14m1KJ8uXOyNMY/SgokrP3MOU8iW2+/FtJTATcSP2GTNSmz6q03E6lj0t
	 nT9Ka0QQj/DtwVI72WhP+XqaHgJ40K16zP0yfHI0UVMI3p5RY2qEQjQi5Lw4tbf7TNui2
	 9finB64XDkMlz1zhEWqmT+QYr2qjOU2UkDhlXh1DQrmVCXxmnEiRP87xvCs9hrKtxYH04
	 M+XrbPH9IelNQTPrxpKXZGaxu0xYn5TxFLIZo2HjEEHS8RHxjIpgyjgWEnSsrEP62OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DP7aqI22;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3270606A323
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 10:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3270606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DP7aqI22
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso4153078eec.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480150; x=1795084950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klEvwnZ1yJl7mvpdDWS1ABMi3/7l4BDDL/A2UVpdY0c=;
        b=DP7aqI22E1rubJJNgyNudxSahJ+dM+O7gY+8x7+PEpqbDxR1h9wl4pYKN+iiWvuZjo
         2XeLoR0sT54ASMga8qvjb/yNZ9cMeWQ/bV913dmQvmYXmPAxBAgxsIp+zXTPBKQJ2kK5
         5eHb/6mzBSPX3K0QYgRy8qqJCnazrBYj296pBj6fFn9/e8Ve6+pxul3O4AnjBBeIkDg/
         8gHfIo4jxrS/YEfSQaUMbhH6UOQ6J58Bqq/JKfeKuK241m3CG9mnFKO5ZJ90alMAetO4
         sJ44NFnZJ4v5b2BU1xJtND6JGxtbWF9XEizhlH/6+B3b32fRF1Dg5Z/fxh/Wq0uYsG7U
         qX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480150; x=1795084950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klEvwnZ1yJl7mvpdDWS1ABMi3/7l4BDDL/A2UVpdY0c=;
        b=PTVngoon6vMBLgKd6CBoRsST9jGQKmZESFiqKRQ4V4+y/I+dP4jC4UGzTti1bFSPXL
         OG91N/YLeSYSugvs4Aonluq+xOgp91S8zY+zHw/zL28Pm2wUshClFnpx8PgV4LM9a71Z
         oyJjksh/IPBzyqr8oxOPK+OgoF7YfLsy3KYTI/DY6tf9aPYvZo6m9jUlzBR9vUELzSCG
         iP1fFq+qoo0r6HGI+FKPxp9nF/gQQnNYMEhCR3x6XaBF+lQy9GLWea11XFF6ckMegA9l
         H7UCziSftFz3Onan2lR21/aHjxz2MxjLrPgPGmD1vOYsPrdn43CQeLCawtAoPHcPIfF+
         /1WQ==
X-Forwarded-Encrypted: i=1; AL+hErHYTgGWScJxgWeFiZqo88xXq0lB7C7wUO3VK8c9WwNzrXqsb7/TNrFp1QpvVXZmbTtlGn9r@lists.linux.dev
X-Gm-Message-State: APuU4Z+XGdEiqvom/kOq/oETnZSvKRVd9YNnkWZB/vecM0hA5O7aPSob
	GoE4oy1NvChXvq7n9SAYEWgjF87h1ZXJ6bBpe8lM5r5IsU+GwZ4H58AssjypA4RD77I=
X-Gm-Gg: AYBFou3tniQcIEskUHwbMwd9rLCE4yBnIZgJuWlutvZ4gzgTYajEylaL1DzZUewtDw5
	gYfg5I/QhIhRGvWJlzbTkJd80tOgiKsDGYs96PlP67UzgQsQgAa1PBwy6HK5wUPddv4VdKjFCp2
	49Worxh/hjg5uo1Lg3hQF15SzPgR2EiqHvOndbHp6scSyFOC+F54h7JeTB7A+fQM/me19UxLFWX
	zQvx3jafpa6KqYLF3B0149XxYqlk5iYDVEQWa2+s9uROSaupO1eIGZIABuNffIDXtSiWqVfBv8B
	I5Cg0DALD/0ddRHzK8Z6BSxCcUE+He9iCDFHunvnGikDdO7GwvkJiW2/s+jtrTuGAXs9Q1ir6T+
	0e0WqdcevyPzhCLpPnHihCyz9rM68/7iwScrVxxi8nMoL19aoM1TeehZqUG7WaTi48L0/ARU4vU
	M6faoer0YxoujvEK9fepyLH33xltr2i9i1D9aNiOTwb3WJY6oyu1iEbu267abWMtgQK92TeRSn5
	5sSia1iRcEphU7WwognMoG5oQVICJ0X3Vz/11nRtq4N1ZMU1SNYMjkF+vD0WEgiWJA0cKQeZQtE
	kE8hVmJztMRyq6asbLcnNgTjU+thJjgmYGkDWGAOgHcnVlktUAPXDoEg3p3gUpecoqDNswkJ2+a
	JrN8aWWGqocSL
X-Received: by 2002:a05:693c:808f:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37686858347mr5790109eec.25.1794480147991;
        Thu, 12 Nov 2026 02:42:27 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:42:27 -0800 (PST)
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
Subject: [PATCH v10 0/9] riscv: optimize percpu access
Date: Thu, 12 Nov 2026 18:41:40 +0800
Message-Id: <20261112104149.38589-1-cuiyunhui@bytedance.com>
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

Cache the per-CPU offset in thread_info and implement preemptible this_cpu
operations using recoverable GPR critical sections. Each operation records
the registers used to form its per-CPU address so exception return can
repair them if the task resumes on a different CPU. Use AMOs for
native-width operations. Use Zabha for 8-bit and 16-bit operations when
available, or a 32-bit LR/SC fallback otherwise. Finally, select
HAVE_CMPXCHG_LOCAL so common per-CPU counter users can use
this_cpu_try_cmpxchg().

The recoverable-GPR scheme follows the arm64 design. Only the protocol is
common, however: RISC-V uses a cached offset in thread_info, its own GPR
encoding and exception entry code, and AMO/LR/SC operation sequences.
Factoring these pieces into generic code would share little beyond the
field layout while coupling architecture entry paths, so keep the
implementation under arch/riscv.

As with arm64's SDEI path, independent NMI-like entry paths must
participate in the entry-state protocol directly. Keep the save, clear and
restore operations in common RISC-V assembly macros so SBI Supervisor
Software Events (SSE) can preserve an interrupted per-CPU operation. SBI
SSE support is developed separately and is not a dependency of this
series.

With CONFIG_PREEMPT_LAZY=y, GCC 15, the same linux-next base and
configuration, an in-kernel microbenchmark pinned to one CPU ran each
operation 2,000,000 times for 15 rounds. The table reports the median
empty-loop-adjusted time; lower is better.

  operation                 v9 (ns/op)   v10 (ns/op)   change
  this_cpu_read(u64)            5.668         0.333     -94.1%
  this_cpu_write(u64)           5.668         0.395     -93.0%
  this_cpu_add(u64)             8.002         8.004      +0.0%
  this_cpu_add_return(u64)      8.335         8.004      -4.0%
  this_cpu_xchg(u64)            8.278         8.004      -3.3%
  this_cpu_cmpxchg(u64)        18.713        16.133     -13.8%

With the same configuration, vmlinux .text decreased from 14,369,618 to
14,212,882 bytes (-156,736 bytes, -1.09%). percpu_counter_add_batch()
decreased from 330 to 228 bytes.

Changes since v9:

- Rework the this_cpu operations to remain preemptible using recoverable
  GPR critical sections, as suggested by David Laight and Jisheng Zhang.
- Put the cached per-CPU offset first, then split the exception/fixup
  infrastructure and operation classes into independently reviewable
  patches.
- Keep GPR-state save and restore in reusable assembly macros for NMI-like
  entry paths such as SBI SSE.
- Keep masked LR/SC cmpxchg operands XLEN-wide so RV64 high-byte and
  high-halfword comparisons are not affected by LR.W sign extension.
- Force both halves of the AMOCAS.Q new value into fixed registers so the
  implicit register pair remains valid when either half is zero.
- Use TYPEOF_UNQUAL() in wrappers and fully parenthesize this_cpu_write()
  values.

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

Yunhui Cui (9):
  riscv: store percpu offset into thread_info
  riscv: add infrastructure for preemptible this_cpu operations
  riscv: implement preemptible this_cpu read and write operations
  riscv: implement preemptible this_cpu void RMW operations
  riscv: implement preemptible this_cpu add_return operations
  riscv: implement preemptible this_cpu xchg operations
  riscv: implement preemptible this_cpu cmpxchg operations
  riscv: implement preemptible this_cpu cmpxchg128
  riscv: select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/asm.h         |  25 +-
 arch/riscv/include/asm/percpu.h      | 701 +++++++++++++++++++++++++++
 arch/riscv/include/asm/ptrace.h      |  15 +
 arch/riscv/include/asm/switch_to.h   |   9 +
 arch/riscv/include/asm/thread_info.h |   4 +-
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |   4 +-
 arch/riscv/kernel/entry-common.c     |  32 ++
 arch/riscv/kernel/entry.S            |  10 +
 arch/riscv/kernel/smpboot.c          |  10 +-
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 12 files changed, 805 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h
 create mode 100644 arch/riscv/kernel/entry-common.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5

