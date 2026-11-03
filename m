Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686082;
	b=tvp3fp6iuhX6L1ZIaZqQGx3lT3+6PvUvHxLMLvApGZGUiD09WFgof8cUgBQKxrGWL2Yc
	 cwyZTSoNpwIU8JCZUNZ00nJgEGVwvQ5ILnQhR8SrM/4PIiy3mUwPI2mJUHngLIrXDuIjZ
	 BeVzjG8r6EBX+E2DSIIAGVceZGKMadWKJBwOHHR4wrpfgk+oE+WMk+5qXwCzkWisRb9Cd
	 iDC84TxpliQg7r4Ry2bLiVO0NeVRYfxMNDyvq91sVAMObYIAzGU9Hmy7AaDni1mCNLJM9
	 g16Mr6JuWrdQV2mWCVbZ2v1KfBGh1WBpolnk9aGtd4mS8tGjs7N/+eWM5uWvbGGS3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
	b=RLbSGS1OTlvW0bGbAk6E6819MuwH85wXt1sOFt1hLVZIIQJmAK1QXGLBxftMCJ8jaonO
	 1AvjskSESvG8Ycl38ZcDhPoIYin3KCpSEoFvlp5EljrZU+5loCnCFFzlvRjz3fXNhc5p8
	 jbf0+UXwbBAIYo/E5khbqJxsvTzc3NSwSNfH144PCK8cEb798UAwXyAMXLdsNDJ17ZBfC
	 SR8iORXO254Qhftr+ejKce9Au8Qyml17pkXk3QXsx2NxweN95y1JcRPQ4fDZbrLzEnQ9i
	 tsdlp32YGIzpyOOUlITpRb3AzY56QUNXlr9hZWND0T1WbSkziPV+tBdWv4Mcik/rKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGAwIsX6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE4606A329
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EE4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGAwIsX6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3966617f8f.2
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 22:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686080; x=1794290880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
        b=RGAwIsX6MthysLGiIG/WdO0IB2SEl7VWU7gQd3/cru76QA+CQit3WuSnB8lkJN4KGZ
         efvVljb0khh8st12XnHRcMOX3ECvBvTqj415D0cO2jdnQrI1UhwEuOD+B3NYDqfzL7pY
         93v5xL7GbjbFnh3BFTF0awOJNkyQz2crzvbzyLYwzPTqKcCmO7IauGJB+XQZjIPnRUXw
         YgOKF723MVmf1BE6wfFD8/uijGWzrnDWdc/Jyndn0FlnNMkPXlOzV4INVmdR865e4Q/t
         sFDuft22a1Tsi5Tt8ff8JrLzyi/19aA/cQeveEFb++ROYF5TYA2SRPQAjCWy6SF+afvg
         feoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686080; x=1794290880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
        b=W4/5i1UgZXbaGSMm+FJJ0YCz+By5c1bUlmiGfdn+rmgmuyfHYN1Uws1+f9GIET2+yp
         m8rW7FyDrPJN8I+jMrQeo8RfNN/aShJ5qel7OsczVvyX9KQmeeGfb9Mo0raE6TCxbk5j
         EZnziYCyoWHj6TfYdSyuQzc/NRN/TRG0cXck9hCVMlxiJmGjYVsbaO1sdg6vR1KRcGRo
         uWllBWZIfvmEx1fOsxG8aBB6XiVpXSjizRVR7WWYGxP3KkYya9y2aB552nyg7fhBWW6s
         /asfwc5jOexM9z+ZWstafLVDp/hMCcXgen2lJiRCSmTkh/BiQXolcMiWcxNI7n01W5pJ
         j52A==
X-Forwarded-Encrypted: i=1; AKwUvBwiTXMBtK+f3AzZIVdbXvHjpwZQVKpPvV9PW34v46uPb6IFeh4OuLWFt0271uMwIiZRmXzQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/+uNmb3yESpt9Be3Fp2tOcGvEXFNXNtlm1X1BxUy6yKJ2LPvGu
	dS8AcfZXR2pbH5sxORbJfy4IReu6vR8G7SeQzXRkrt5FJEmVLw1TbSE7
X-Gm-Gg: AYBFou3/4/ktIxDjeWR2ogmfnfG7QqrdHhv6lS2GYt0EEEV6EH9hZBvtcWNNddRF1kR
	+dfQq3VerKexqZE0H4GMvWxfBD7t3W/PrssP9FdHN5qv3wySp9qvjHtyqVcHgfF5OCjdqaVSKmq
	RwJHnPek1C6h9DR5b0VA9m5s6xKKnsCKSEONwhnwiAiFMO5Xn6zy2yx5vHNPUHt+T6eXFCNi+LW
	QYfHmHJQPBqA9t07HdMH4jlI24Ne1QBYspnzT/oMXHgraCY6osCamJ7mT2zFDB5glAmuql54o7U
	MzBko7i2E87k9qUkDewZwT+6GiTwozuIXrkHOb1hckCQ29+yWkRRKJY52hJKGGJatuUstD7cENA
	nSzJrDSsGUhVcpUOQAIFfrNHWngpaZZNGttI9qfnXwRLO8tfjGoUULWyN/IvOsAWaNjnmU24KeA
	oXJuYYmdV7gSC7qtw9oCuICf56ccAK+EP8JfDyr0SsTtU5pJIuqMIS09tqfRjG/1i6rjmxskOCg
	9tOsYFAAPJ9Qc3xsH8le2E3akiT5blyOEYfqDdQEQud9wGYFlC/euVJ7x1Fsx8RBV2uXRUElEB0
	Gw6nK55IWe5fX6bE/qZ5RFtGnYzFZDzJKzF4mRF0bQg10bIVkNP5V1c3HR/oJ1XXhayi3oj2bP0
	1tKgKv23Efhk=
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr27129221f8f.43.1793686080145;
        Mon, 02 Nov 2026 22:08:00 -0800 (PST)
Received: from box (046124040162.public.t-mobile.at. [46.124.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm26072722f8f.6.2026.11.02.22.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:07:59 -0800 (PST)
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Martin Leitner-Ankerl <martin.ankerl@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andi Kleen <ak@linux.intel.com>,
	Youling Tang <youling.tang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Youling Tang <tangyouling@kylinos.cn>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
Date: Tue,  3 Nov 2026 07:06:20 +0100
Message-ID: <20261103060658.696994-1-martin.ankerl@gmail.com>
X-Mailer: git-send-email 2.56.0
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

x86-64 does not define ARCH_HAS_PREFETCH, so prefetch() from
<linux/prefetch.h> is just __builtin_prefetch(). The kernel builds with
-mno-sse, and clang then drops __builtin_prefetch() without a warning,
while gcc emits prefetcht0. An x86-64 defconfig vmlinux has 8
prefetcht0 with clang 22.1.8, all from inline assembly, and 62 with gcc
16.2.1. Also prefetch_range() is empty on x86-64 with any compiler, it
needs ARCH_HAS_PREFETCH.

Give x86-64 its own prefetch(), a prefetcht0 in inline assembly, which
every x86-64 CPU has, and define ARCH_HAS_PREFETCH for 64-bit too. Not
the 32-bit alternative: it becomes prefetchnta on CPUs with SSE, a
non-temporal prefetch, which would change what gcc builds emit today.

Afterwards clang's vmlinux has 57 prefetcht0, the new ones in 34
functions, e.g. __blk_mq_alloc_requests(), prepend_path(),
__alloc_skb(), tcp_ack() and the receive paths of e1000, tg3, sky2,
r8169 and forcedeth. gcc's stay at 62. With gcc 16.2.1, prefetch_range()
adds 16 to hfi1's receive functions and 8 to scsi_debug, which a
defconfig does not build. Youling Tang proposed to define
ARCH_HAS_PREFETCH in <linux/prefetch.h> instead [1].

KVM guest with one CPU on a Ryzen 9 7950X at a fixed 4.5 GHz, clang
22.1.8, 6 boots per kernel in turns, ns per call, median (range):

                    before                 after
  io_uring IOPOLL   680.1 (679.6..684.6)   664.9 (663.1..668.4)   -2.3%
  getcwd()          912.9 (912.0..1019.4)  901.4 (900.1..907.3)   -1.3%

IOPOLL reads 4 KiB from null_blk, 32 per submit; getcwd() is 40
directories deep. Built with gcc, where both kernels have the same
prefetches, the two differ by +0.4% and 0.0%. pread() with O_DIRECT, UDP
and TCP over loopback, times() and clock_gettime() change no more than
that. Unfortunately the NIC receive paths need real hardware, so they
are not measured.

Fixes: ab483570a13b ("x86 & generic: change to __builtin_prefetch()")
Link: https://lore.kernel.org/20240529032059.899347-2-youling.tang@linux.dev/ # [1]
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
---

Notes:
    Code generation, testing, compiling, analysis, measurements, etc. were
    all driven by an AI agent (Claude Code). I have reviewed the results and
    supervised the process.

    A few minutes ago this went to the x86 maintainers only, without the
    lists, by mistake. Sorry for the duplicate.

 arch/x86/include/asm/processor.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c..64748b8705e3 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -624,15 +624,25 @@ extern int			bootloader_version;
 extern char			ignore_fpu_irq;
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT 1
+#define ARCH_HAS_PREFETCH
 #define ARCH_HAS_PREFETCHW
 
 #ifdef CONFIG_X86_32
 # define BASE_PREFETCH		""
-# define ARCH_HAS_PREFETCH
 #else
 # define BASE_PREFETCH		"prefetcht0 %1"
 #endif
 
+#ifdef CONFIG_X86_64
+/*
+ * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
+ * builds with -mno-sse, and clang then drops the builtin without a warning.
+ */
+static inline void prefetch(const void *x)
+{
+	asm("prefetcht0 %0" : : "m" (*(const char *)x));
+}
+#else
 /*
  * Prefetch instructions for Pentium III (+) and AMD Athlon (+)
  *
@@ -645,6 +655,7 @@ static inline void prefetch(const void *x)
 			  X86_FEATURE_XMM,
 			  "m" (*(const char *)x));
 }
+#endif /* CONFIG_X86_64 */
 
 /*
  * 3dnow prefetch to get an exclusive cache line.

base-commit: 2305edc99ef7bbc11a8dcebf78853bc1b6a761bc
-- 
2.56.0

