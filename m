Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF828643D
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792725; cv=none; b=SC2wbUzfnHCb9vA+RIMLbUF9+6BBuTzHlGIO9Are6fuguZyKMGar5lXzNUuqO8WF4zzn1IGpdKWl2fMoHyED2tdAXj6ND3/u0DtFBJ1qE3ZkIzaMCXDTRu7+RojyEpBp8ub943oY7Ed38o4EfpZ5UdCIH0OxH6iY/l81rJIH9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792725; c=relaxed/simple;
	bh=a5MAKHVYkyHwEXpHGaXuZpG+FT9ZL54Tfmjo5gUuPh8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/jij/2rBw/IqoPdLNH8VcrfNiymfU8DO2LTSCMTscMDArfn+MlPb3bjCyyWEe4EOiUhSlYdDn0TqauYZFQ9tDbT8fY5VMDhDdhqVQIwJVuSWIrCKdHsV9Ip4afKpv/ABNIlZqwscyJYyYnq4A3YFSsln/1O2IWfpdQjxLqKafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6ih9CVl; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6ih9CVl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so1934891a91.3
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792723; x=1763397523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UfdW5vQJBbw1wKbWsFdhhHcBKlPZrTKHywEKgKhNPc=;
        b=O6ih9CVl//xjWGxYGYTgYGLpy8xoslh9jRylIANR/C6RBGFWcMUwYfKcqbCCOI1Rz3
         Hyc/rTNR53sBbPV8q8hq6+e/qV+A1MMHj5jScQpEAVX8Pagen40q5908eIdrm81aVcfL
         B38S6prGLdRaA6xbnkX/6HCTGxoqgmHO4WhprPP3S3CYIISFTXXP9Vf5+vwnwVWzuhY1
         CsXkoyTCS+56hyJcMU82t7We+UuNdSnqGoj1AxzDmcrig6kvcm5LvrzZ0BKLUF+V/i79
         U/nihso8x0GkiVBZYCwtxluFutgUpvwAwqXuMpmkLAah3RW0aIF/08FOmkusStssNNjm
         uMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792723; x=1763397523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UfdW5vQJBbw1wKbWsFdhhHcBKlPZrTKHywEKgKhNPc=;
        b=gBaAMX6TOKkhrmHMqozAvFkGVPPdd+hfwqYzFfWwPt2d6HCfluO6bstbnovdcYgz50
         msQ+s7cYwR32v7FHupgzd1sP96wy8L83os5Ow5XK9uBUYENREbXR6f+2aOWUKq8Gb72b
         E+wNsUASKKx5MS7mBbSeQETHIzmTUd0AwAnGRokBKm15YwXp8qw7LRFR6m9Eqr5w2G80
         X0QN855wKufanfgl76zjJORyMPUvPxJp/MjXZVYWmJY9ukuRWWR6Qb+MzMIlmu3B333B
         ubpLubcaHeEK6rJAnDbBXFV+rI2hlVvDWum6ZDw1o6/KKqnICl1f9PmkEHWbuVTOsAiQ
         Nr4g==
X-Forwarded-Encrypted: i=1; AJvYcCXgJFcbXxgHrsryrBBEFrEJERSLVFUvRFT1zKM+T/dVwE2IqDQqrKnR8hxLhcu4ozuGSdYN@lists.linux.dev
X-Gm-Message-State: AOJu0YyZf/IyFpazKpm6xzoqPuvzBW5DcuoSZ0RuefkfdlPGbCZIiSFg
	OXi/TqK5yHVCECkJJ8VNMD/YHO60K1jWR7YDxjVFTbVYUxqbrAHwQrVW
X-Gm-Gg: ASbGncsz+5tSo5MBSidEqBzmGuj+37BSJUPED1jUx8wfStDYY2ZHa7zAtnzEbrNJstD
	EbnF5ieObNoHxrThPUKDUewIcWHJgJ/DeZBG/Y0auhzIyUngSk/WPjoKhttaSAr82Du+mAYeCbX
	62rZIzuNpRDfenlivrjT6q+M2Cm0ufsVtWSqtzDHC0pDgK3Hu30iKm03ILaX7prI+26N3ld4Gyv
	i0XODasJfS6qL5eLF2YH3XcN6AGAOjRDudsPvAhOjlPREPWABjwFltzNO/SUBNPQSftWJMIKiue
	xR+j+1LfO24izN7RmVkQeS32TQMWAL3pfrXPvYpqM64CdWf+ndob71pd30l5BEAbpWfdNJ5s3+C
	1jcVhY1d5phRThFbM5RDz/nX1P+GdCu1SofLbwtwQuAujIQAZRUqfc2tvGXDR4smeDHSY5L5xE3
	/ZiThIeUbtT+sCsXD4JaBDmw==
X-Google-Smtp-Source: AGHT+IFEhL+ivOL3mJYmk2GKHVq/7v95YCugColCvVCwbEtQDJoAIyDrMPXTzpn3mUDrpnLozW3jrA==
X-Received: by 2002:a17:90b:42:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-3436cb91daamr9486479a91.15.1762792722638;
        Mon, 10 Nov 2025 08:38:42 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c963613esm12684061b3a.1.2025.11.10.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:42 -0800 (PST)
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
Subject: [PATCH v8 27/27] MAINTAINERS: add entry for KStackWatch
Date: Tue, 11 Nov 2025 00:36:22 +0800
Message-ID: <20251110163634.3686676-28-wangjinchao600@gmail.com>
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

Add a maintainer entry for Kernel Stack Watch.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..9757775de515 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13615,6 +13615,15 @@ F:	Documentation/filesystems/smb/ksmbd.rst
 F:	fs/smb/common/
 F:	fs/smb/server/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch.h
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendan.higgins@linux.dev>
 M:	David Gow <davidgow@google.com>
-- 
2.43.0

