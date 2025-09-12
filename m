Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64C2F49F9
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672026; cv=none; b=OPkK76TGdMUnjFADDwuwI0rcmsL6v2bQH0e+SYDCWm0+uxlviCvMGWjjW/PSg37WpSBWwzclRAIZ1e3m+kc3O/iZuYbhGfvTut0itdBPTOtkvV/EP7uDm2hGhGqTRdixHJVoC/PQGMi6oPS2ezkNCMice6sN1YUDnjgSrZKfE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672026; c=relaxed/simple;
	bh=Y4IVRGt4gY6CeNENuQfFMwDoOjrFFT/8PJdPjuvJ4cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdHTtXk6L70W8PSrD+XAjsr+Yi/iK+IDdmwo0wmjI9rLV0hUBujLmE+OKpUJ+siDcjEtzhmYm6PlC0iASAw+v2su67o5Mwb8rORxw8TWek9wCBb5Esg404R9l3qoQEZVO914M3xugyMjwVgZwU6xSIQgUoD15x3OMfHRC/GHMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFohI98J; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFohI98J"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7728815e639so1359717b3a.1
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672024; x=1758276824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I55bZq7ZFzzpD1DxoyTRdsSYeFKQhRWPVd7TpHbtt7w=;
        b=kFohI98JIlXEQjwrcbN/ivD2Yd+37meWGhSekF4URMBVINJGGzq+YuCCltX2lNZdoC
         9NDYY2OkjeS6WCyyvCMhuL2l/iaOLKQy6JlMYBhD7UMLYm4UxwGn2Hn5TiCqXsrEujl1
         5nc89rEoNyDIJNxw6LA7rCFvdu1E+iVlWYhgtqWR6lL7qNPEnLnZ9Lfvjfkw+UBez4xO
         IrCwROQHTSyiEo9IfUKB70I1JJO1SuE6UX7bphvsxGZtjyDauqVHbHG1VnspWNCDdhIV
         4k41oncIT+UW8qJJF9kTCbBO7aoHZvBjjYDZGdcnzqXu0N4+8wP0OFkZfacEVysIW8eI
         WhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672024; x=1758276824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I55bZq7ZFzzpD1DxoyTRdsSYeFKQhRWPVd7TpHbtt7w=;
        b=q7oQxks00WDtqMrmSXHNgHPq+haljY7ZXR3fcewkU8TXKAR0LQYKPfEEj0eSTMtVci
         JLz4+lY+6LH7LUHGyPlA6ZUZS0ppdsuf4g1cZAMpyb3zPI/mMgconKdOTNcCd3XFZL7Z
         gypyL6Nam+phexPbI1GzndFU+lNUf45fMPGZqcG6SqYQCqyQKyoO+Ke6yuLAhaozCabP
         Lp+TktEy9HsvXseU2qmlt1YL3r3JDHvFjxkBCKdiB7+akv6XUUrrouaR0I1Zdjrf+5nE
         VHhLSOxLXEjYOQ34d0tmsWeqYp+bmC/iqO+JumqEYK/Rl3pRuU7b9KLZUJ2Ccox2NCAA
         N5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX/0jq+0nKA31ozhFz+kRaU6rjigCbt/B8tKRea/NZvDw/uwFTgRjQKKfgCh+6hT2bvrBXM@lists.linux.dev
X-Gm-Message-State: AOJu0YwMwCbRrzyRjk/7MDhjInXUbKiK3HVkerNtncorJ1fFqUrR4QRD
	XrWo6GH/8U2cGK9tlCKNdzexWIYqgYHu3a61VgZA379IYFS9F0MdF3Nt
X-Gm-Gg: ASbGncuEUpCaHpcqeHRkGEgZZ80CsEr9O0ZAopGZFf4e512dYrC/bxHbMY2IAHGz+1F
	6uPSkNieH3DBikkHki95aYhfcvH6LzzTLHb2mwqaS7JbBdsQSzWp3bgu8VtgHJxI6EKFGC6a4GL
	fXzHpHIPM3ssvPu8vxOz10kpNm2vbH7KV7UdBeM6Hj0aSIwBnoz8YZz/b6XWfqyrlxiH6VW4hu4
	Eqsft9V4GAKH53o7fpSv9GcHE8u5LZdGeSYc/QBo5qLE9p9vyH8dMECuhYeC80z/uYg6nABEYcI
	b5Sn4YkeJohEcFHSdmAEcqV67wExHXcgDTa5u/mZq1/gDBjagXX+vir8lqS8/HsmFpDJ/tzM/dE
	PLG69KlycV9SPhgv1tdFX5fy+7svuzfG+9ifapOmrsIH5kQ==
X-Google-Smtp-Source: AGHT+IEmU8/7QYE28ulPnmQWl8v4TOjFN/LND+vjp/ORoshKulgXE7ro2NJTOczUKB1xsXbgHPgJeg==
X-Received: by 2002:a05:6a20:734d:b0:24f:53e8:cca2 with SMTP id adf61e73a8af0-2602cf104d0mr2912224637.60.1757672023846;
        Fri, 12 Sep 2025 03:13:43 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa0f8asm4307035a12.48.2025.09.12.03.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:43 -0700 (PDT)
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
Subject: [PATCH v4 21/21] MAINTAINERS: add entry for KStackWatch
Date: Fri, 12 Sep 2025 18:11:31 +0800
Message-ID: <20250912101145.465708-22-wangjinchao600@gmail.com>
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

Add a maintainer entry for Kernel Stack Watch.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..1baa989abf2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13355,6 +13355,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
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

