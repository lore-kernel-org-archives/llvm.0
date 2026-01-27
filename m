Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122023372C
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512483; cv=none; b=r+VxJi/DwOqRcQaeENwwQTo6F37iLjDXVVa467SjfSfoejPmZt2qRht25Mtt6PzCpolocYTzFfh9i4VJ2LH5QwfLwE5UikghXEDn5ZduRtyyKXpOmWqD8GOnSvTaLJJLpWaDRYPvKChLbZkzu9E5udQ6yvpEVIc2o47LlXbDNiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512483; c=relaxed/simple;
	bh=fUWLwzca4k6EgYAElkRZS1OTbaXERE2ZZqB6LbGZqBs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mMlY2jiiv/XKiyo813OrgeSGdoXHnqn4UTE798y3nkeTCXfcI25Zm84c+1gT5lw/HCZvLUZ+U/roiiV/bjOncmOBtP6lMwWEiPDwRL7ttLrOqjSE4AxxzIqFfwkdegjbW6fSvd3VHcmmz91idYDOkuWfLeS+AGqYdUfJYN7g+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Us69GALe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Us69GALe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48066dbd873so5068695e9.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769512479; x=1770117279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IohieVBc63vjKjGw9ZE3VjDojC3w/1k1Oq7V/hbjYwY=;
        b=Us69GALeNKBa+kYJ7M1iwg7f9zK7Trf0doGSju3CJv4sRr7KpTMnjOXWH18S4vN0L8
         HotEYxZvs4z9WM5ZyV0XJHq/Czr9DxsBBz4A6qJAMmCEVqk4B4Q6/aMrR5fYO9+NjoRO
         hAbgcn/vOsBMW1fG3EfJyN+PgDvEabH+d/asuLHOZoWUDTN5YITLC1oBb6o3ilqbMR2J
         NsBLThxzNSolwjtjpZG9PvO3ZdRVOcRkM4M6EseyKV+JP3j3Ztm6YcEKJLa7WNKlQ+Ec
         hHF6Uy/W5iFVgU6ynBr+sXDy4/+nePCSzmkafML4HU8bRrjzt5JkN4fCUFhqaaPxYHH0
         Rl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512479; x=1770117279;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IohieVBc63vjKjGw9ZE3VjDojC3w/1k1Oq7V/hbjYwY=;
        b=bk/eb1kemHB1n4tX4NqxEhaXjpRfvdHr3aaZZz/m7519SRAjkeRVkhkiFdj/Zlh1K+
         9L88prcbDSZsqjOuv7jIxFlFMHGWUXx5MBZHk7DPXdp7oZOVbSlQPYWRtmqFOz/D1uX7
         B52rI9wW3niOFaMUns2qXSMmAupMWZ2av/zA+aAirOJJS5POjCKRLpG8s0Ut317FcUZJ
         rFXnwz44YCQSJlpWjKmptlEj87F5SB4JIDb8bd2M6ZX+sfU4xfwQfwObtUMNm1Jvl39K
         ez/B9bF3d6Wml4MLFSo6e+6xUXTaAa0oymiGbsJBRhk3ny6g/FyVo/6mXqTkhxP5Z5lq
         HUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWxliPBjc6UGjDkcTjCVGy/EaXzxInio0e+jjcgjn3P/Cx2BTGiMJD11stzi/VL2G1Gqy2@lists.linux.dev
X-Gm-Message-State: AOJu0YzqNkCzUt4tAHPRqDRJ0e56pZkdo/oAt7w5B3cTSq4/+ovtdYAg
	rFb6P5gAN8VlhxBnSPI4a/JU/gRCKGwNE5jqIJx2qvnF7vvPMtMz6k2DSfE76o4aAG61Qj6ozRT
	shw==
X-Received: from wmpg38.prod.google.com ([2002:a05:600c:4ca6:b0:480:4a03:7b59])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:154c:b0:477:b734:8c41
 with SMTP id 5b1f17b1804b1-48069c3f021mr18552805e9.1.1769512479177; Tue, 27
 Jan 2026 03:14:39 -0800 (PST)
Date: Tue, 27 Jan 2026 12:12:06 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260127111428.3747328-1-elver@google.com>
Subject: [PATCH tip/locking/core] tools: Update context analysis macros in compiler_types.h
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In sync with the main kernel headers, include a stub version of
compiler-context-analysis.h in tools/include/linux/compiler_types.h and
remove the sparse context tracking definitions.

Since tools/ headers are generally self-contained, provide a standalone
tools/include/linux/compiler-context-analysis.h with no-op stubs for now. A=
lso
clean up redundant stubs in tools/testing/shared/linux/kernel.h that are no=
w
redundant.

This fixes build errors in tools/testing/radix-tree/ where headers from
include/linux/ (like cleanup.h) are used directly and expect these
macros to be defined:

| cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../li=
b -g -Og -Wall -D_LGPL_SOURCE -fsanitize=3Daddress -fsanitize=3Dundefined  =
  -c -o radix-tree.o radix-tree.c
| In file included from ../shared/linux/cleanup.h:2,
|                  from ../shared/linux/../../../../include/linux/idr.h:18,
|                  from ../shared/linux/idr.h:5,
|                  from radix-tree.c:18:
| ../shared/linux/../../../../include/linux/idr.h: In function =E2=80=98cla=
ss_idr_alloc_destructor=E2=80=99:
| ../shared/linux/../../../../include/linux/cleanup.h:283:9: error: expecte=
d declaration specifiers before =E2=80=98__no_context_analysis=E2=80=99
|   283 |         __no_context_analysis                                    =
       \
|       |         ^~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202601261546.d7ae2447-lkp@intel.com
Signed-off-by: Marco Elver <elver@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 .../include/linux/compiler-context-analysis.h | 42 +++++++++++++++++++
 tools/include/linux/compiler_types.h          | 16 +------
 tools/testing/shared/linux/kernel.h           |  4 --
 3 files changed, 43 insertions(+), 19 deletions(-)
 create mode 100644 tools/include/linux/compiler-context-analysis.h

diff --git a/tools/include/linux/compiler-context-analysis.h b/tools/includ=
e/linux/compiler-context-analysis.h
new file mode 100644
index 000000000000..13a9115e9e58
--- /dev/null
+++ b/tools/include/linux/compiler-context-analysis.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
+#define _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
+
+/*
+ * Macros and attributes for compiler-based static context analysis.
+ * No-op stubs for tools.
+ */
+
+#define __guarded_by(...)
+#define __pt_guarded_by(...)
+
+#define context_lock_struct(name, ...)	struct __VA_ARGS__ name
+
+#define __no_context_analysis
+#define __context_unsafe(comment)
+#define context_unsafe(...)		({ __VA_ARGS__; })
+#define context_unsafe_alias(p)
+#define disable_context_analysis()
+#define enable_context_analysis()
+
+#define __must_hold(...)
+#define __must_not_hold(...)
+#define __acquires(...)
+#define __cond_acquires(ret, x)
+#define __releases(...)
+#define __acquire(x)			(void)0
+#define __release(x)			(void)0
+
+#define __must_hold_shared(...)
+#define __acquires_shared(...)
+#define __cond_acquires_shared(ret, x)
+#define __releases_shared(...)
+#define __acquire_shared(x)		(void)0
+#define __release_shared(x)		(void)0
+
+#define __acquire_ret(call, expr)	(call)
+#define __acquire_shared_ret(call, expr) (call)
+#define __acquires_ret
+#define __acquires_shared_ret
+
+#endif /* _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H */
diff --git a/tools/include/linux/compiler_types.h b/tools/include/linux/com=
piler_types.h
index 067a5b4e0f7b..14e420467eee 100644
--- a/tools/include/linux/compiler_types.h
+++ b/tools/include/linux/compiler_types.h
@@ -13,21 +13,7 @@
 #define __has_builtin(x) (0)
 #endif
=20
-#ifdef __CHECKER__
-/* context/locking */
-# define __must_hold(x)	__attribute__((context(x,1,1)))
-# define __acquires(x)	__attribute__((context(x,0,1)))
-# define __releases(x)	__attribute__((context(x,1,0)))
-# define __acquire(x)	__context__(x,1)
-# define __release(x)	__context__(x,-1)
-#else /* __CHECKER__ */
-/* context/locking */
-# define __must_hold(x)
-# define __acquires(x)
-# define __releases(x)
-# define __acquire(x)	(void)0
-# define __release(x)	(void)0
-#endif /* __CHECKER__ */
+#include <linux/compiler-context-analysis.h>
=20
 /* Compiler specific macros. */
 #ifdef __GNUC__
diff --git a/tools/testing/shared/linux/kernel.h b/tools/testing/shared/lin=
ux/kernel.h
index c0a2bb785b92..dc2b4ccfb185 100644
--- a/tools/testing/shared/linux/kernel.h
+++ b/tools/testing/shared/linux/kernel.h
@@ -21,9 +21,5 @@
 #define schedule()
 #define PAGE_SHIFT	12
=20
-#define __acquires(x)
-#define __releases(x)
-#define __must_hold(x)
-
 #define EXPORT_PER_CPU_SYMBOL_GPL(x)
 #endif /* _KERNEL_H */
--=20
2.52.0.457.g6b5491de43-goog
