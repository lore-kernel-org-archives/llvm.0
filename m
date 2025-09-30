Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1640271470
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200372; cv=none; b=N+MFGbv5/uIYQirq3pO6/J4yRgt4Phc2a6Io3GStX+v2i8n8DuUV/XqtWKQnjWLbzLnGiqrDzDTc+tBZNFNtKchr1phtCM5Vg9BRYVwKz26IsYtvBZi0u8qM+btu/3fL5Y3+6LnBTPOPb97RITb2f6LByexn6JfL7gZJRiNbzhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200372; c=relaxed/simple;
	bh=1x1tZkclSlUAFkeAbCTbg9ur9vKYhrQAjAn0c+iWPHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvHO6j9Ubu6fLCvhDULQMONFkLsMJqe3IK7c4giUz1iyJ8G4qe/WNQAsg80p1TXZoLujf9Pbecou/iO5FCBHvbq5GG69u+0fA6vSx9pzsgLo/EG+2pYDIBT9vm7uQTH6CiaNdQbjYkdQgIdO5P/w/UWtr2W8TVaoJ/AgQ1hGpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiYtxjGY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiYtxjGY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5516ee0b0bso3856312a12.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200370; x=1759805170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dXdR7Vr7GvNxroOAYy+aBhMqtIGh2YpUvjEzBf0MIg=;
        b=IiYtxjGYxDCYyv3w1Svd4swd1buJ16vA8X8DkUTO8uRCcyy4LvvFkhxIgVaAKGEgqx
         RmoU0JDxBbALyAWWAGWSCkIkv1rWh0s16YaCIOCswRQ1F0Ynae8tWuT1R2sh50bZPKQH
         nt0hoHS5+3/S8+J0WqcA18IvJLOoaurfwFXVCuw7gDpZ7GupLvRceD2tW3W+/GtN6KwM
         VPVbbHVxCvCQvpd12VJxfsQZjPHHrykAd0+33/EOuXWWkMczMMnT4R/PE22snbAKq+bw
         qc3bcbk5IdL9EjJWgd7GAmEKG0xypatewsufXuLJzF47Dg2zVVor38iVWnVNd/Vabwa7
         m3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200370; x=1759805170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dXdR7Vr7GvNxroOAYy+aBhMqtIGh2YpUvjEzBf0MIg=;
        b=ZOMH/Or98mw+qjXeffWeuwsifLOjyY7bpGt8wEh5ovQHQFQ7ean3GPG2Bqc9LzOmFC
         TjaSzvxdoB8Z/JEvNrI7QewH4P0CQUx9RpglOLKbyFznTZ0bhy6rPR9Ld5UJA4jDb51p
         Ge/IhYc2md91veEaTBU5cvjc72wGxleKpSF14ZjPqAlqphzO7NlP9JbqOYvJ8y+1wP3e
         XasJ1IROpbvrg7AEmF14xxJkYFi17XB+nSZUsPotCuE7qeKLUwKTTmuzmNA20kC8QXII
         nPO6bGYdSwsn12KXQ7LUzicjWKk6vVRC57zB6eqXhbtUx7fHoi61xxpSBEq6+SralWgq
         8lIw==
X-Forwarded-Encrypted: i=1; AJvYcCXM/n2KSru9zpKtl0prVSpHCL2infeI5Y8ysz3VRZUPIp51DG4DZyOTiSpMC1OUMMzijRFs@lists.linux.dev
X-Gm-Message-State: AOJu0Yww4UfXOUnIUA6IX3VxYKXy/FwWz0me7zok9y4eCvkrGJVweyfV
	H/SniDITC2MUUgs7TwA7nCWyd81pxfbmfOY1mnUB3IQPkqZUVmWLpCTB
X-Gm-Gg: ASbGnctR79xvluOMVxptx9oFClje1hES/YR9FnMMGbhE0nNyuTjMMkA0J6QKkFzdGmY
	Hv2BcNCIW8//hV0xpNDoP06DiVzY0d0NdM2VIk6MG9k2v7Y5r/ITZoKGl8x8Pywz1B1h8AMEw2y
	CCJre0ek5ISsxlxxCgql5bHYCalUV9tI45h8CbIPz4vctGz0BOpoHbZPidHgxElEi8OYVAQbSKz
	RbZYcy9bAJBpAxR58RR1QjQWTgVvWf/aRSIH3BO+E+yM+ZbdnNLMDqeD/bATSC9/XoQrHTkNfqn
	ZZ0OC/8IjlSJEE2nehNXTK+RwI9KbAc1ws0Gj67JEAC5tWHNHWe7JhFJwZDQA6Ul6d6aYNVeHNa
	8pEyOGER2r7nv1MDm37jH4rLvw0kucP0Uo9pm2EQ3wTnLBn33LT9Ibgc+kM77wiuVpw==
X-Google-Smtp-Source: AGHT+IEoEe43JjNKdWndUwta+OzzU/8noer3nQDRA4tPEoZN9FB7in6q7dddTrTKlJfmrNdEMUXFZw==
X-Received: by 2002:a17:902:f9c6:b0:275:2aac:fef8 with SMTP id d9443c01a7336-27ed4a78d81mr138634555ad.38.1759200370200;
        Mon, 29 Sep 2025 19:46:10 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm144277015ad.52.2025.09.29.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:46:09 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
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
Subject: [PATCH v6 23/23] MAINTAINERS: add entry for KStackWatch
Date: Tue, 30 Sep 2025 10:43:44 +0800
Message-ID: <20250930024402.1043776-24-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a maintainer entry for Kernel Stack Watch.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3..3d4811ff3631 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13362,6 +13362,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
 F:	Documentation/dev-tools/kselftest*
 F:	tools/testing/selftests/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL SMB3 SERVER (KSMBD)
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Namjae Jeon <linkinjeon@samba.org>
-- 
2.43.0

