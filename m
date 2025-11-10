Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277EF3081D7
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792702; cv=none; b=ucsFVJGseNpXWJ+8QAifTZEyEITPgJHIHPZnwY3OO5ENPM9rnlyBzgXzQWfIz2VBFj5Q5Z2uMeEZ442xlgcrNBX6fu6b2pxXh57CmM8TgnMbWyx1VrarMTUrijuhtXGsyvXSHf+77xHC2KqcyIoPkC0Eoby8GnuiovQCuuY8SmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792702; c=relaxed/simple;
	bh=aUATb6PPAs1EeoevQLD9YYPgevbnELTf3A5rXZMQrkU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5CJ2vkRlLoCOymGvrAuO9ANWwd059RI63gxc7dMS+DuaW9JYuybjLpix4DEIoiDT3O/ImENZskL1GhuFQl0ypzOsC+ammtH1+csh7Rp+4nBrZncjwCfmAmmLS9GkI7217q7t+5Pb/JV3C9/oJCLzJlhiArY5FWq+46ITFaK4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+8aFayx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+8aFayx"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b4933bc4bbso1075614b3a.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792700; x=1763397500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu+j4Ql3fqr3I/4VuukNZy9fUe1HehKP0k0yDQPRfsM=;
        b=M+8aFayxcpfsA5isHKketOR/XvSPztaBgjlfFfx4XET82i991gab02X/oE6IHOsduh
         VHU0JCmvlVZYCGqlMnRVKUe2nO4lgRyW2F4fV4xh/uFYq1zd/xD/LFzDEKYbPX/Qnkb6
         EJB/IzuBQg4vsXZB87/LwBcEDR+f7fn5h1BtjzAYvW0VamHn/t3sYXQaC/0gC0LCQbLk
         8gvasCbP4Cdmc+cfLRQdLt5RQvO20AAFjiMlKiX23ugq/ERZ0hI7gr7gJlvDHlTApgJG
         Bvu0VvoMZ46e/CezJtOi1ApZmNYYYcpGwZDh5KJ1B/gc3WPr+AELJAPV2UsqPiWNOBn7
         Kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792700; x=1763397500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tu+j4Ql3fqr3I/4VuukNZy9fUe1HehKP0k0yDQPRfsM=;
        b=md77CeT2uH1hsI9hDBarmbuX/JbyISA6TPmorr0UMz2I6Q48ooowPYhD6e9T3/EO4j
         SbSEO3p7rIk/w1UsqsKlvCdj7/INykUiAVOWEFz4U24pJHIRUO6b+lgpw+oWXTpGiHo8
         TIYd0mT4chJnUdBoyOQ8mzPI5bpYTs9q0GiP9vwXypvCR089edSU08/LjHxwkcbTmDnj
         oPuTSwWqdnUj9R/bFSoaBQSZ9RoqW1mQZemKs2Z4ciNUNDNsUzvNkRYFmCD08IEyv6QC
         eVY+xVsFTIepF6eFBm18h2Eahhr9GXiK4K4oTv0HLeQxzs5gyx+Oewuiuo0Dyn5rZsUJ
         xmCg==
X-Forwarded-Encrypted: i=1; AJvYcCXKf0BJH/nZY+BYE0ybBXNmYfrD0aql50hkmyaCiXISMBlXCBsxxMUc7ib+ktRPEELjyrD0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv9rgUMgVW2pOD8kOMSNLoEzuz9Ow3H4mF6uJs+2HXHK9ajzR5
	SRIahW2bd2DxBoseUY8xXD8FPLYx6VlD3lNO7EcrCPyDR1uORxEFjPJM
X-Gm-Gg: ASbGncuKhnwcp1BJoMSgpGGGFYzW8ssWY3/nMlUYbNuoHTAEFMQtUpBf/uUsc081SSc
	VI5tiRvtqs0muE+52ID5Ns7AFBZyu3b+B9/H3bi9GYQFui6UG+0MgaR7zwxcVrrdpPJqyU9sOLc
	32lwKdP+m+u3Ick18T6zEqUB4JHJFvyx/Uokcs8mRD1xMXDxUnuE8tbwazQM10felP7IwuNAvtE
	lugTMlr35EAr+ovHOvso41/B9KWcIf/57Dp+TBbhgJbpQ1LOGgU3J+N05Uedlcl/uS9eCM18LOG
	BLpPvRuWOecNZgDpm9afjnSrJ/X6iYYDuCf09uvvnNOKD2ra5VaG/YiDeT+MjrRJPiUq6s9Mg0l
	1OqfZj+bCx5NaiPpJwVMMCRkckKc4r6t1NknjGEHu8oTdvLZ5W1uQ2G2/bV2GUZxQLySya0aHeF
	jerO1pezi4LMPGbvJxlKP48w==
X-Google-Smtp-Source: AGHT+IGLmwDIGeljEZq6Ek3cMIcpWBuZ761zCA9XCLHpvBlYPJFK2olRS54fuUcN9DoThdB4AXP5Bg==
X-Received: by 2002:a05:6a00:9510:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7b21a285a43mr11992599b3a.16.1762792699318;
        Mon, 10 Nov 2025 08:38:19 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5c823sm12295899b3a.62.2025.11.10.08.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:18 -0800 (PST)
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
Subject: [PATCH v8 22/27] mm/ksw: add stack overflow test
Date: Tue, 11 Nov 2025 00:36:17 +0800
Message-ID: <20251110163634.3686676-23-wangjinchao600@gmail.com>
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

Extend the test module with a new test case (test1) that intentionally
overflows a local u64 buffer to corrupt the stack canary.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>

show addr of buf and watch_addr of test case
---
 mm/kstackwatch/test.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 2969564b1a00..b3f363d9e1e8 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -32,6 +32,22 @@ static void test_watch_fire(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_canary_overflow(void)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s\n", __func__);
+	ksw_watch_show();
+	pr_info("buf: 0x%px\n", buffer);
+
+	/* intentionally overflow */
+	for (int i = BUFFER_SIZE; i < BUFFER_SIZE + 10; i++)
+		buffer[i] = 0xdeadbeefdeadbeef;
+	barrier_data(buffer);
+
+	pr_info("exit of %s\n", __func__);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -54,6 +70,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 0:
 			test_watch_fire();
 			break;
+		case 1:
+			test_canary_overflow();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -74,7 +93,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"============ usage ===============\n"
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
-		" test0 - test watch fire\n";
+		" test0 - test watch fire\n"
+		" test1 - test canary overflow\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0

