Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04889362148
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651631; cv=none; b=So6rPnnL6C0NYdbJSM8BVeAVQ/pi91iaE6ZXGVK5vMuB4aWnVonHMG4dlVbqGgn2sgCOv7J6r3KcOuICb3RqDZs/xKPJf0By5edBYpBm3NKUuu9X+IWvveXaJlTIk6xp2e4rif3tn0osG0uYdpLVEqyFxGG1OE5WPkIEaRVmrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651631; c=relaxed/simple;
	bh=JCnKk5smTgE5T0ItBQ90SmrKCWmUzu/R/X44B8ZE77w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lCf+xfRG82rQIJJBfrNU8whhmR04yRa6eGdyC6uIbSZ/O4zdD1ndZMLfnVckjtXRI18V+tcu7dYPeyrDeyqceWEbYrhH/6xaBsiLfmEcMezkrCC0Uhpizi+fhYgKP+NlyCUVc938FUqjkM0Ciy2ufJNUK0g25sgFIKviIhGcgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TntQRC+U; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TntQRC+U"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c7b0ae36so658571f8f.0
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651604; x=1764256404; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0QY5sCjABQs82s4Ju3ZdPJK85+Pyg+eamRrTOstnfs=;
        b=TntQRC+USlA8ucsSJauLoPG5CixTfcFP2xQtI+wJxbniTbVGOCVMc2MZ/9EHOHPFFe
         KW+9ufxHvtS5xIzgHdlg5cJcseGWutzLhQWS8kkkKT2K6NAKk6YyAbt15tI/LASo/VOL
         qOmWcojyDiBAQNgIafrbFkR5kDYVOzq5PE9OSOa1ve+mwEgiobTCY+3QLejhIrjZl9bp
         +rhqwkJ8dFuj/MKxttC8eqCW7rVcsPFolgbD1zoFfrAxinWGnv2vYLGNKLB2BHQx0nlR
         fFhZJ1Xzo1hNMyqk1/sYOHlnDX4Eo4ojdXdnhf9t6/AhLYdwaUm1o6nnK53LTuJXGB+k
         VUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651604; x=1764256404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0QY5sCjABQs82s4Ju3ZdPJK85+Pyg+eamRrTOstnfs=;
        b=tMGlDe6NOVhsK5jGfUvFkyrol+vtxRYzccjRsM63JubiLCgtTlODGPSExIiOGqXqCL
         ibywCK0vsnv45E9XKG7MZkXiDwSiBWu+WpmNFiVwc2m4rNuWGt91Cnmp0uZdJQJ5XaB0
         Ynri13yA84XuboTr3Rtk48dCDBGIStWRns/4yn/RYcLVF/V2JIV6UK4w2zeHGKLPx912
         S42vuNPx4WAYbtR3mj8bBn/b5QmwWx75nlRo+M8T0tN3LFp8c53QKEqD7SpsRgTLeErE
         xxFIHysFLFj2XhaROjj79p63yc9JWA3MnbC2jLxoe8aQ6caYbgCIky2e1TYmLURDG2On
         WLHg==
X-Forwarded-Encrypted: i=1; AJvYcCXsh1T7D2BOG+vU0m9dHrUsse/fUshxuQ2+AgI1tiuKkFW85YtCWMeldKa8BgfWTpPIWX7K@lists.linux.dev
X-Gm-Message-State: AOJu0YzBBQI6GwheVIoBXuLKLOL8AB5ZAI4hBA3YPXNW1/abPKUphMRB
	cIlGt0m+7b/QQC0+HZU0mewToHzd23Aa+1v2VMmPT+xlrB3XjkJSNjJbHva0IyLWMugkGGG9Db7
	u7A==
X-Google-Smtp-Source: AGHT+IEwTiVA/c7ivK4PcZYzQTIU6yfpqSY2nHpvc3eMP1mZxx+HGAMnAzVRYoTvuPwgEuO1vhoD29fTuQ==
X-Received: from wrbfq12.prod.google.com ([2002:a05:6000:2a0c:b0:425:6f4f:8f67])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f8cc:0:b0:429:b8c7:1848
 with SMTP id ffacd0b85a97d-42cba767dd8mr2702228f8f.19.1763651604278; Thu, 20
 Nov 2025 07:13:24 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:49 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-25-elver@google.com>
Subject: [PATCH v4 24/35] compiler-context-analysis: Introduce header suppressions
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While we can opt in individual subsystems which add the required
annotations, such subsystems inevitably include headers from other
subsystems which may not yet have the right annotations, which then
result in false positive warnings.

Making compatible by adding annotations across all common headers
currently requires an excessive number of __no_context_analysis
annotations, or carefully analyzing non-trivial cases to add the correct
annotations. While this is desirable long-term, providing an incremental
path causes less churn and headaches for maintainers not yet interested
in dealing with such warnings.

Rather than clutter headers unnecessary and mandate all subsystem
maintainers to keep their headers working with context analysis,
suppress all -Wthread-safety warnings in headers. Explicitly opt in
headers with context-enabled primitives.

With this in place, we can start enabling the analysis on more complex
subsystems in subsequent changes.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.
---
 scripts/Makefile.context-analysis        |  4 +++
 scripts/context-analysis-suppression.txt | 32 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 scripts/context-analysis-suppression.txt

diff --git a/scripts/Makefile.context-analysis b/scripts/Makefile.context-analysis
index 70549f7fae1a..cd3bb49d3f09 100644
--- a/scripts/Makefile.context-analysis
+++ b/scripts/Makefile.context-analysis
@@ -4,4 +4,8 @@ context-analysis-cflags := -DWARN_CONTEXT_ANALYSIS		\
 	-fexperimental-late-parse-attributes -Wthread-safety	\
 	-Wthread-safety-pointer -Wthread-safety-beta
 
+ifndef CONFIG_WARN_CONTEXT_ANALYSIS_ALL
+context-analysis-cflags += --warning-suppression-mappings=$(srctree)/scripts/context-analysis-suppression.txt
+endif
+
 export CFLAGS_CONTEXT_ANALYSIS := $(context-analysis-cflags)
diff --git a/scripts/context-analysis-suppression.txt b/scripts/context-analysis-suppression.txt
new file mode 100644
index 000000000000..df25c3d07a5b
--- /dev/null
+++ b/scripts/context-analysis-suppression.txt
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# The suppressions file should only match common paths such as header files.
+# For individual subsytems use Makefile directive CONTEXT_ANALYSIS := [yn].
+#
+# The suppressions are ignored when CONFIG_WARN_CONTEXT_ANALYSIS_ALL is
+# selected.
+
+[thread-safety]
+src:*arch/*/include/*
+src:*include/acpi/*
+src:*include/asm-generic/*
+src:*include/linux/*
+src:*include/net/*
+
+# Opt-in headers:
+src:*include/linux/bit_spinlock.h=emit
+src:*include/linux/cleanup.h=emit
+src:*include/linux/kref.h=emit
+src:*include/linux/list*.h=emit
+src:*include/linux/local_lock*.h=emit
+src:*include/linux/lockdep.h=emit
+src:*include/linux/mutex*.h=emit
+src:*include/linux/rcupdate.h=emit
+src:*include/linux/refcount.h=emit
+src:*include/linux/rhashtable.h=emit
+src:*include/linux/rwlock*.h=emit
+src:*include/linux/rwsem.h=emit
+src:*include/linux/seqlock*.h=emit
+src:*include/linux/spinlock*.h=emit
+src:*include/linux/srcu*.h=emit
+src:*include/linux/ww_mutex.h=emit
-- 
2.52.0.rc1.455.g30608eb744-goog

