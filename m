Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E132EA729
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671963; cv=none; b=Gat3vuCtMUxFufWQ85UnzB359oMhfRdy8M5CNlPPQN2sccVajpVSBIRlPDFaXW48C3ax78v9UTp4QSUoWNIC0dB0KMT1ZpLy0dg4dAVZbAgNAB0oENTzAhbvmkA8lzCckF/arsYjtGR6KI9AHYvWaqpqAsajqzpXV3FxOCRoQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671963; c=relaxed/simple;
	bh=Un+cr8+CAx8R+jlvlSG9Ydlf8KMHwbHKNBBW5RhycS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ7ilRKZ/apxsSiwM3or31OtCwAb7RA+1dLhDzlWm3+ZfiCykEB4cmlaj0WJRLsLemtfwE5uM1RDy+vrAs/xc0SAF12x9sHuNjC1qvEveRScLiOu6Uzl2fXQMMqsQnjJnSxIFKE/zVCfhdiox1ayWhC4wkEzxfgt1LklCYsaIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZyFbmYt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZyFbmYt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b54a2ab01ffso1157122a12.2
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671961; x=1758276761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTRhetdXz/AlDveQ7cC4oIBX48CBF691SylMydPRcTY=;
        b=NZyFbmYtkaVsRqjut6KtmJ39KveCnnTuIagvEDpiz75NHAfGQuQgKuZjd5Nx6FFhRe
         MfaFxxx5aMG37N6me4qSNMHLTZ/OXJT+ytz8Vx4oVwkMYSu+jIQCL0idycP9wRO/6o0j
         lT4HDlfbkBTXnD2w/UaAjQs3UIaHBItJeSz7wdrMEkLUAD9eWGoyore0YRhoKzuhVLai
         bemeFf5UPHk01dHb6Knsg17WGWLw1Z98ZcD40BeRi2NInQoX92gxvrSCBPlFhTCf8gx0
         xT6opef2XuRNJgtOC3gDs/ME0TfklPuLX2RxmelExe/ivLri2n0+o9HJeq0GjlyC9aXu
         PXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671961; x=1758276761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTRhetdXz/AlDveQ7cC4oIBX48CBF691SylMydPRcTY=;
        b=ag2ylezEuGhqy/I2zaifqwIeVhCcqJI8LSZnWECoppfZlFI1dcrnw7n4YifjvfYosq
         74NHoU8D5ByrxWt4sjcAnUbvXQb/CJjJNNMqYw1ZRDiXg6j8n7F4c7geNKa/US+DkBSY
         3lvx3//sELztVet4dQelsM++Zp83n0kRb21ighMMI0XX0Z/wESTX5SOfohBNd+nAo7XI
         rZLzbodZa4okWnuJfc7QLJE8eMo5VraTDh0mW0lsRg0RMNSbByD/vM/+nKdI7csiiRob
         gLhqfmOS96CKgJfP00UNiXjetu+r1gaBLop+FcJzLMniemUmgd1Qi3flPabxcxuJUA5S
         IJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLMgRqvLEVKPt/WobogLGajzu6B/j6R33xkZIzxbchEuXl7uJFCUSfv/EIEOOBrhdV+Amz@lists.linux.dev
X-Gm-Message-State: AOJu0YyXxE+kaGb69wv+QRgn2pym1VbNJTF+d0tCniW+5AdDYE/diOoz
	0qbf6kz+5RYlkZwvPdcl9DPFTK57e+QKmfzEOnG5qvUeUcPTtB59MyaP
X-Gm-Gg: ASbGncuFmRk/6PF5tEsHmQnc4PHKNtzVUjkbGjH4TYbIp7igoGw3IVD0oPusDya9QEa
	g23XHwJOmb7usHY7XjYDugA6lZU+twsTzRLUC2mxXLvo68wJdCg/KPwBqA7KQhBsvU4QJ6mD3Wq
	kD110quWjphtiLlg0jRokxjo2nt60dQqhhA2h9C6FSSEbYKHPi0BpqPzhP784VW2cAOaR5Z8bI1
	LlAjlVgE5YgnYKWJ4cX56NiHPReFXKQA6xtvAwBFUp9tXzoUTWptgwFe1Sd0gRq0isHb4ELT2pc
	Kui4uljO5/jpLAzWrqCj0uzSbIKS3m4tQJsMxoLZX+zwyeA91rmP+/+52xgUiUGeQR1FdUeaI/M
	42WMyx9rySdaArMhj4Kc+faX2fLzjkLrGuCTkLynxPgj5Wal1Zw==
X-Google-Smtp-Source: AGHT+IGqTkU62M75KR/OKOWzeX1g5EGPCOAXf7ry0VUZE+EZFf5kPwKsv6/nCCnQmnFIPNz9rUR8cw==
X-Received: by 2002:a17:903:3884:b0:24c:d0b3:3b20 with SMTP id d9443c01a7336-25d2675c1fdmr26411195ad.37.1757671960988;
        Fri, 12 Sep 2025 03:12:40 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a398cfbasm4325375a12.39.2025.09.12.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:40 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v4 09/21] mm/ksw: support CPU hotplug
Date: Fri, 12 Sep 2025 18:11:19 +0800
Message-ID: <20250912101145.465708-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register CPU online/offline callbacks via cpuhp_setup_state_nocalls()
so stack watches are installed/removed dynamically as CPUs come online
or go offline.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 14549e02faf1..795e779792da 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/perf_event.h>
@@ -61,6 +62,32 @@ static void ksw_watch_on_local_cpu(void *data)
 	}
 }
 
+static int ksw_cpu_online(unsigned int cpu)
+{
+	struct perf_event *bp;
+
+	bp = perf_event_create_kernel_counter(&watch_attr, cpu, NULL,
+					      ksw_watch_handler, NULL);
+	if (IS_ERR(bp)) {
+		pr_err("Failed to create watch on CPU %d: %ld\n", cpu,
+		       PTR_ERR(bp));
+		return PTR_ERR(bp);
+	}
+
+	per_cpu(*watch_events, cpu) = bp;
+	per_cpu(watch_csd, cpu) = CSD_INIT(ksw_watch_on_local_cpu, NULL);
+	return 0;
+}
+
+static int ksw_cpu_offline(unsigned int cpu)
+{
+	struct perf_event *bp = per_cpu(*watch_events, cpu);
+
+	if (bp)
+		unregister_hw_breakpoint(bp);
+	return 0;
+}
+
 static void __ksw_watch_target(ulong addr, u16 len)
 {
 	int cpu;
@@ -117,6 +144,15 @@ int ksw_watch_init(void)
 		return ret;
 	}
 
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"kstackwatch:online", ksw_cpu_online,
+					ksw_cpu_offline);
+	if (ret < 0) {
+		unregister_wide_hw_breakpoint(watch_events);
+		pr_err("Failed to register CPU hotplug notifier\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

