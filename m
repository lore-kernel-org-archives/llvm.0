Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1AD314B85
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792655; cv=none; b=i/5V/oY0DJ+RpRaS8Qgi++72dqUk54zXidX5ul/MtKXNacoSO7xccqjmQ34NFCi+dHoNYzhg+TZnxeV/JyoinpNoVHfTCaAEhRDK4SL3k+C/I05R0i5Fd7kECeFaPTKpwp7drkzxXxqT/krADe8mAGwV9jIrjCpIePcResbHw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792655; c=relaxed/simple;
	bh=/b/zOktEwqAjI5HJj6uEpLQ11BHnYeMx0oURGuRUTjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfFzoIovPkTO8Ounwqx2mxbijlY+fKz/7GJcuB8nN/6T2RmgnhYLbrO/QDlL+CPDI9Jrg0UUgpd8rYFYKF60Mf28MeMpOEL7tjpnW6qCKmGtyKLsOFlO/M9fQtCXAIRgupUK381GBCAH/Fzot12Fa6aMkolqFtQToiejC1xk8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1p8Uo0P; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1p8Uo0P"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2489416b3a.2
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792650; x=1763397450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmTHCnPEb0OVb2q4c4fHcn++Nk34I0DPY6dUiFoe4Xs=;
        b=m1p8Uo0P2OYFb+4hvqHecO/8n51KG3bBh+jUvgSKPubteMouiL4odpggjtx/OwuOSU
         PcKTM8ZuFGMA1yPxR/J7VIv8rTnneMlWe7/pHT5Pc7td+IrSvIX64LwFN+2Bunv9VRlq
         ZpgDDJLSIT8+mvaOGjKpdcNVFoBGBhVWh50lP3jCH6XOu7lsXrpb8YsgEIgPj/YuTlru
         m+hGQddlf7C4rzFAMG5HIwuePK6CdSQ3zPMMgIpWW1DR4L8rolCom9QToJ4t9wIGi3aM
         6AUfPH8S2ypsJZ1Dw5KCCHP5Q3bmGLtIH5qJur3atQ75u9GvTX0seOUVdyDK+aiD2qaD
         wdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792650; x=1763397450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmTHCnPEb0OVb2q4c4fHcn++Nk34I0DPY6dUiFoe4Xs=;
        b=TY5fm2Om/qpuADYZzf+UHDbRD8ZjPQlG0HmjPoQWTsQyMYuYeeTR8PMY4ae9hE4qlh
         rcqS0lDTLkC5WuxPoFKe9cZ7MxAkvmJ/hjUFne9kUxbP/c5XH06gSPHEzBQcfG22SbhZ
         rGtvQpm93u8T4lp38R3xuuAfrcNzaQ8+TfbzleznI3mWpFamzlMNU/VahuQea6+hc1fL
         Z6SUlhy3UofT1zQk/IlP6saWIkbXykiAEBzaXptAfuDY78xqOJgmrtc0kUDsAqUrsXRW
         3mtdkvz+zoYoL5hMWrXLzw9bZyfAwm+8xUVCzn/HS37kK7AsrmObhLsMuT4Tjt+5xOym
         UBqw==
X-Forwarded-Encrypted: i=1; AJvYcCWdz4YdiwPbzNQBO8CU9be2b8HyOk1oqsr3lNDM8DsbhMQaINypbat9M2Cnv9KQI1+LtDdW@lists.linux.dev
X-Gm-Message-State: AOJu0YwxFrCon9xPHv8VzDRHVRWtGyFStFSZhIMlcb3mhSE6tTE0UQ/g
	PcBOktTuaawGozM96f9zBOQ/bRAEDmvSv15tyqngwHjHqJRz1ZhUGtXI
X-Gm-Gg: ASbGncuKWTsJMIuMICxzNazyfqMsKHvQe4ghIEc7BarNdmb7uxrCG2OrDRF23rt+pRT
	KDuX2ixjTknVLUPXaRrMKwW1hVCQQBTqr7nenh6+pKIzmuV8abiqtUp8ZZ0B+efQBNfVzQazPaL
	URafQVIqrWSaa6DX/ztMnQHKd/d5VcZHY4CX/spNsDRKZEqOvuqIGhNYl2J+RP1egNcVue/lAyb
	7AHUx6AUR7prSZ94XXquamk/GpoFtKeqZqhs9jztitkCBRZa3MZaGqnHEyTZajZL+UKe9U8NY6N
	F8eXMOKWLtO52NjPavckrcCrD623nYZxx39ejIOUR1uV4FdBhcpbG799bZqc8tqLNGuOUCzp3Nm
	hdERL+uSvL6thlV1oV2+VafCznIHla8kZS+6OShwUAwoiLQqgRxv7KoY8IJ2gnPQmiVzAxHVPkA
	oL/OFDhrBHjX97Rrcelj7Qjg==
X-Google-Smtp-Source: AGHT+IFq15Zr3Z90Q0MMFQV+lAVCnrHviaSI2/PKIFU3mj11pJDvw+OMCcvtXWZk8em43woe/8IelQ==
X-Received: by 2002:a17:903:944:b0:296:3f23:b910 with SMTP id d9443c01a7336-297e5619f92mr100007215ad.9.1762792650184;
        Mon, 10 Nov 2025 08:37:30 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b801sm154506025ad.7.2025.11.10.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:29 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 11/27] sched/ksw: add per-task context
Date: Tue, 11 Nov 2025 00:36:06 +0800
Message-ID: <20251110163634.3686676-12-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct ksw_ctx to enable lockless per-task state
tracking. This is required because KStackWatch operates in NMI context
(via kprobe handler) where traditional locking is unsafe.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch_types.h | 14 ++++++++++++++
 include/linux/sched.h             |  5 +++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/linux/kstackwatch_types.h

diff --git a/include/linux/kstackwatch_types.h b/include/linux/kstackwatch_types.h
new file mode 100644
index 000000000000..8c4e9b0f0c6a
--- /dev/null
+++ b/include/linux/kstackwatch_types.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KSTACKWATCH_TYPES_H
+#define _LINUX_KSTACKWATCH_TYPES_H
+#include <linux/types.h>
+
+struct ksw_watchpoint;
+struct ksw_ctx {
+	struct ksw_watchpoint *wp;
+	ulong sp;
+	u16 depth;
+	u16 generation;
+};
+
+#endif /* _LINUX_KSTACKWATCH_TYPES_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index b469878de25c..db49325428b3 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -22,6 +22,7 @@
 #include <linux/sem_types.h>
 #include <linux/shm.h>
 #include <linux/kmsan_types.h>
+#include <linux/kstackwatch_types.h>
 #include <linux/mutex_types.h>
 #include <linux/plist_types.h>
 #include <linux/hrtimer_types.h>
@@ -1487,6 +1488,10 @@ struct task_struct {
 	struct kmsan_ctx		kmsan_ctx;
 #endif
 
+#if IS_ENABLED(CONFIG_KSTACKWATCH)
+	struct ksw_ctx		ksw_ctx;
+#endif
+
 #if IS_ENABLED(CONFIG_KUNIT)
 	struct kunit			*kunit_test;
 #endif
-- 
2.43.0

