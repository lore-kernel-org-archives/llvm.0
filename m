Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1D2E62DC
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007522; cv=none; b=P9uxI0uCzsJ3WETWIup6NTHZRHcX7cJ4fnOFovQi/8we1wTMrmh9BspbG0IjiG+eKzDxZeAR27s5c7Lp/hfqmnf+QFC69+0Kf5jej0013LGTztP35oXHEOBzGZiBomM1ibOE2+lAAlSTJbK6ZaxTDebiRDgs8QvRFz8dzoqroa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007522; c=relaxed/simple;
	bh=JE2O3gXCPzxmYnUAKlXgnSjWi6sqfl5NW64CDq3b/SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TW+z2y/OPSnUaFhC1ldByOoQZ8En7meJMpAOIPXaiiUo2KeiYIAsHSwstK3KNA+D8SKupsURYEdiZxuOXS2E+LNnLtslqqyyLegUB4YfUWriYELy9GG7XoA50QUNBZ6kyXHBuyQHcLkPq4KBLYbIrUf2pSa392go3du1onKRD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+FaVeDe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+FaVeDe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-794f11334adso721937b3a.3
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007520; x=1760612320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=H+FaVeDezqoTAeR7i87JfgO/J+SqZsauqDuvgs66JZSvFp8psW1nIwIdfVwB7DkX2D
         zSoFjFIV7tR7Z3EEhkX0pcDDCe/4bL0OH8MrZFeeAxEwhKTITFxFGhCEz58Xi8cmtXU1
         glLW4vk2tYyr/02CcJb1F07lnqm7mKgoM/hwvAlg+a3VWcqOe9qXd5RxGbbI5WeHOc0N
         aYRiip1LwRwOV20mawUqH0rNCYvK/7VsuA/Bl+Pf1BfM+Z73KurMU6b9Fpo/R4VN9Q0F
         x7rzgdQZYSmjb70/7fBJ6JGT2JUqhCdddGYEBf08N6cpPNUN5xiWUR+o1MX/c3mmfUPB
         fpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007520; x=1760612320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=j9U4JC3+684AkZP/qAzJex3nH9TdtFfijnIl7OpnBU0cOqbmrxlUZRa/EXG5IKjBbX
         UuYaciJc+vmbjafFmMU3I0T3GHaeBQIwLfgcT+pgwOkLPso9OwpSyzgOQK7r0F1JoOvj
         DCI2GgjlWF3U3oWap0RECMIPCi/4C8bpDAIspjxFTNVY0O7lndPSU2URg2RHNLTWaDw1
         Q65M9kvOuk0b1r+JDruvH/kzYiOX9dYTOoplHdRm3pimlq+O4d5j/AphPPOSBS1oKe4m
         RJfQHeLlDhMQdCtSkeVq9XBhzBsCcBGiVhj2eyegda6RUnQMFbhBEaxdxvNdxbGEiIqf
         ko3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvffggB+HuFajyjxRmPi+HZZBXcyShSPuYnttbcUREDWiq3zZJOZYPJKnIyU8tL49ZtYIE@lists.linux.dev
X-Gm-Message-State: AOJu0YzRyu3InP9eERX07Q23jYMt2OvsGt25IHkOfB89UJRnFsQlt9Nq
	Aak/syuNBO38JJn7QqvfC9+BSKF1acpj1oXMpEgS8sQGWiwfAXGAwNhr
X-Gm-Gg: ASbGncvyScQrrls0mHsUzN6PdknmneW0dwWT/5yEXFm01cfCf9AMY+PU0ebIrEo4R8K
	qR0aHPgRTpxtQXWAwg311z1OJtWufmFwl/HmuP+Tjzr0znBf1E3QEJ7EnLAMa+2sNHSf0Uq7irI
	k2fDQGDm6sNCaXWRHH8d74oOcyxwnRVpngJtjitakJVPGdKji9NhqDaWc7JUoBHzOvEQPvGmPjp
	moMHIp/zeyE0EGRmm5dLKFgnTeth2RkJvEyeT/3dPfbgj4a6+7qCcEMLlVMtH2rHXLiC5N2AYZu
	fCp7nUPvPyS3KVaUxGh+X6STslIb3whWpL3bMxbFzCJQiuBjTEcWddwizlgH3jvU3hCQmYTZze9
	b+5vFi0qzjK1ZZIMI1n76qtrFsnTBEjlMEuEWYSS8pQO1WuBMe0JvAxqE4653l1kNiWC6clk=
X-Google-Smtp-Source: AGHT+IFNGlIpEHO7TMNSv14SEeeL37qmV4fa31y9HfqA5Z8RmIIJBkgU1nSNu4enoYA+m8tb63ySAw==
X-Received: by 2002:a05:6a21:6d99:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-32da845e6c6mr9710336637.42.1760007519707;
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4d324sm21591393a12.27.2025.10.09.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
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
Subject: [PATCH v7 23/23] MAINTAINERS: add entry for KStackWatch
Date: Thu,  9 Oct 2025 18:55:59 +0800
Message-ID: <20251009105650.168917-24-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
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
index 3a27901781c2..d5e3b984e709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13596,6 +13596,14 @@ F:	Documentation/filesystems/smb/ksmbd.rst
 F:	fs/smb/common/
 F:	fs/smb/server/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendan.higgins@linux.dev>
 M:	David Gow <davidgow@google.com>
-- 
2.43.0

