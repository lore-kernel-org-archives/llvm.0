Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E033D6DF
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173337; cv=none; b=pAofq7Z0DJ2NzzJ1hcwAeAJwJ7hsSfEkLtaVm29Ty3lVxXGwNzlpLFE4ptYgPGkPIYAeiwqm9tan3SA8gSxieN5E6ICvudvK7E3jMPPMkcA95dv5ozcjD801r92JaqN+RXe0GWhCrKZcRg+Pe26zHOWT1BvrvnUGHI0WTJlCabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173337; c=relaxed/simple;
	bh=7I2EQS/O47z6XkwcLP1Gg8ZRDwtXdZe/P9q5/pdULpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LS6bvBmeMdeIiHtWRZKzDT4/C8StX2KAMRPQaohNFJ4cfgaESvn0vlj8lWnvR7Nq8hph0FhQN9Jr4E9OmICqBadaLchM60yutdLurbDuIvQNmgDp2BGRH+Ys5yo7+WeDcPgjXATU/hHm1PqurYBc3glrDJL1lVF9Dzg6HZGzjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLfFird3; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLfFird3"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7764782b3a.0
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764173330; x=1764778130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0w85V/n6/PltUzl9FbkvTGvY3LknN/8DxQ32r6IxQUM=;
        b=eLfFird3fdLIHzS8gW3IyCIXQPNznTeCIc6c3nP60+BSOEFMe2vc9WNt/YY0nx+BOk
         OiTyDpJ6fOTh7KW1MSZLNDEFXF/3aX1CU5c5lfx5W6k0UZ9wtC1Iz1ncVHf7Dm9Mpx+t
         hQFQuPZgxSI+vHWE6clSbB6BZg9CyWDaTYeEkxuRUmDKLIkrbSdkAChPx9q8a4GEzoDP
         0+JB76enYo3vA/XF95KPEZFlU8hCHck7/diMSjB+s/oof2brO4/lO+kQ3xChL8EGb5Gk
         a+SXNhHRdML/L9Zvw9WTPWiywPn+uh6iiEng/3HKE1pDNPH07yUa8fIswZ8IobfE9W4c
         uTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173330; x=1764778130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0w85V/n6/PltUzl9FbkvTGvY3LknN/8DxQ32r6IxQUM=;
        b=syck3nGKbyAI5r9mGteufKnm7ynI7fbq2c7SFwOHW/cMVZH6se4YSo+ZwSVOvwKGIH
         bAV7M4feNt0CyZLoZli7N5t/O5w5472lk0tzhviiY6ewIjUAwZg1/x5qo0WGqpyImT/0
         dofn4HDXcrONnAQhV6wki5WK7WEjB2uOm/rA5BUZ4Jvb6s9KnmWfGVOAf3/J/yB5CP+7
         bPLR9LYDQXu28dus7fwRH3kNE8sxJu/G6cRH0cs69GeIglzIeJvb0Hia1w4h7N/GYUHF
         wTaM5Tyd4P16GB2jdi3zH3GxrGQIbHO6E3/QFUECqggjBbhRkdMQ5waqBRE/9cvVwKeo
         zYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUc3Na/acaFv+laXff9i735t650XxLohTM0dqK1xzzN+wwFpOLNEuDB//8eEihWACal7aOw@lists.linux.dev
X-Gm-Message-State: AOJu0YwdinIszVuyb3PB1MR4YlgbonwI9slzYXavRjLoEhI19CyCl6Se
	HG9mmqScMU85GEXc+dxOyjeCJgJ36aycen59LHRBQyvrq54nzlG0IFZA
X-Gm-Gg: ASbGnctFj6B/gwVdaGy1s1l0D3Mz9g3vlv6FF2aJ/Si4zaRLrEBBFpmwlBX4Xs7ZhKV
	94GeL7Db7RGVPdNoF/gzUTJiR6K0BK2/dTgRuLwpKEAYAh/V7O4d2Y9/75eP+5h5VtEVT01oUco
	stOWI+/MFC8V0TeTvs+saBI5K6ACs9Od0VpGgfYPkQSsaR6dargEiaX2zCbas6ojb1RkWzgNuoj
	nxkU5pNUJrPk6AE9Q0j9ox4LT39zdiAOL5Iq7wVCbB1J4wvctEFFIM2hWOyeBMSs592yP5b9pZe
	YaAlLFwQhKPenRPuuWWXJE+7Mp3406pb6XMP1kbWM28Jk375R01aOjvKky7bgqqFP57TP017PsF
	KalW+WrhWW66OsQwHPN2c9wFJTAi4UIX/tjq+/u0A5iM8pizVMrS2QV4nisQ9LGHFuUpJTTJ1gx
	Wpl1fo7PjKr12uwaed3nBa5hDA+TFjwQ==
X-Google-Smtp-Source: AGHT+IEebVkUKBP+U1i9Oqi7Ort6BI2gg0wHmeA+Y9t88Utsg2k3h8rxgk1fLNRybEyKRORRW5br6g==
X-Received: by 2002:a05:6a00:2d88:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7c58e50c16emr18224646b3a.23.1764173330206;
        Wed, 26 Nov 2025 08:08:50 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b3csm21831681b3a.36.2025.11.26.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:08:49 -0800 (PST)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] selftests/mm/uffd: initialize char variable to Null
Date: Wed, 26 Nov 2025 21:38:30 +0530
Message-ID: <20251126160830.52124-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "uffd-stress.c" & "uffd-unit-tests.c". address of char variable having
garbage value (uninitialized) is passed to 'write' syscall triggers
warning.

	uffd-stress.c:246:39: warning: variable 'c' is uninitialized when
	passed  as a const pointer argument here
	[-Wuninitialized-const-pointer]

	uffd-unit-tests.c:581:31: warning: variable 'c' is uninitialized
	when passed as a const pointer argument here
	[-Wuninitialized-const-pointer]

so the fix is to assign char variable to '\0' to prevent writing of
garbage value.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
this warning is raised with clang version 21.1.5 (Fedora 21.1.5-1.fc43).
---
 tools/testing/selftests/mm/uffd-stress.c     | 2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index b51c89e1cd1a..700fbaa18d44 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -241,7 +241,7 @@ static int stress(struct uffd_args *args)
 			return 1;

 	for (cpu = 0; cpu < gopts->nr_parallel; cpu++) {
-		char c;
+		char c = '\0';
 		if (bounces & BOUNCE_POLL) {
 			if (write(gopts->pipefd[cpu*2+1], &c, 1) != 1)
 				err("pipefd write error");
diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index f917b4c4c943..f4807242c5b2 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -543,7 +543,7 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 {
 	unsigned long p;
 	pthread_t uffd_mon;
-	char c;
+	char c = '\0';
 	struct uffd_args args = { 0 };
 	args.gopts = gopts;

@@ -759,7 +759,7 @@ static void uffd_sigbus_test_common(uffd_global_test_opts_t *gopts, bool wp)
 	pthread_t uffd_mon;
 	pid_t pid;
 	int err;
-	char c;
+	char c = '\0';
 	struct uffd_args args = { 0 };
 	args.gopts = gopts;

@@ -819,7 +819,7 @@ static void uffd_events_test_common(uffd_global_test_opts_t *gopts, bool wp)
 	pthread_t uffd_mon;
 	pid_t pid;
 	int err;
-	char c;
+	char c = '\0';
 	struct uffd_args args = { 0 };
 	args.gopts = gopts;

@@ -1125,7 +1125,7 @@ uffd_move_test_common(uffd_global_test_opts_t *gopts,
 {
 	unsigned long nr;
 	pthread_t uffd_mon;
-	char c;
+	char c = '\0';
 	unsigned long long count;
 	struct uffd_args args = { 0 };
 	char *orig_area_src = NULL, *orig_area_dst = NULL;
--
2.52.0

