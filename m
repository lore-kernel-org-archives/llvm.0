Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FF16A94A
	for <llvm@lists.linux.dev>; Mon, 19 May 2025 22:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694812; cv=none; b=b748l1g86YAEDdRWEue4AfOz/lfI78ozs08btgzf87usUC0Ti7VNfQ+86EmhM4x6J1+raOAORCCqouJRfrMs1R13xuNmRyOYNNeYDVM/r1XgYkQCIECdhjuzoJcNYmN1zFQ2AhZdXb9NfTSDYxYmUP/6ApHH6Eq2KNR/UrsdAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694812; c=relaxed/simple;
	bh=I7I2sRbvItFxCmQj4vPhU9oUJu99f14BP1WCs3BzVNA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=I1qoLTectT7ds7ABuo86RhaWJ1FasGP0bUx+d8aGlf0kZ9Xv8VU4bamjcnazx2z87Do2GPKOzJgAhm789vq04lvR5AbIYvZusxTS5vczuQBrZIL4WXwpJY4drgosAHn0FeGStXGf49uaCZIlXY+a36dZE70yd/FHrkvrfo4trnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4YUndpP; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4YUndpP"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742b6705a52so3905607b3a.1
        for <llvm@lists.linux.dev>; Mon, 19 May 2025 15:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747694810; x=1748299610; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=drkhaIiLDTSEyMyeVkIjGYcSDU5tMRWddFy401r3wfM=;
        b=U4YUndpPvxQ6y2ZLV7UdH+0Pm63divy2fA10SWue2ms6hnvv5tou4QJQRQPs5iss7K
         CKSSsp7PYRnDdP5mYVKIKhekyV8gYkoim0jwMnYap9z3ckK+BAd2uwrwGR0ZGP3EEp8B
         KwVth2x98bP7x07RTD5GHkCWc3O4OXq72cfdUOtX8teJuJptRLP75m+MjPLm5825yN9R
         w1lflpGKW3J2Zu+W3OLA+nkWK8pvNonyQgELD+sBRbqOlOPEi+6dPzqRe3BuomueoiHb
         PwZF8ZrQPEIg+g+6ZF2jBBFSf7NxMVLZNzlWwGJ1MEv/pHWlK6sYmJqlTuDRjMh1RN8l
         UDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694810; x=1748299610;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drkhaIiLDTSEyMyeVkIjGYcSDU5tMRWddFy401r3wfM=;
        b=XA4XvcZG/paDulhYkLdMMeyNoQXBI2g0ukggMI9PtXSdUf74g5nqlxcaLrNO+wS5ok
         Z2B9b/7hmegEi8yhH7rdrU2YbB06DWe17wzX8mkajPcsDxGm0yExPpI3m/P3g7GZTe0M
         U12BbPz109jMk2fGiyoV9LPp33mSJa9T0pMxO89o2u1G9RB4Zvz4k/uTAl/jEiBUfPm2
         BajwQTP1sBhqJsH+7tQWO3b0qQqU7mHV150FUtYBaU+AkQZSCoGfR9c9tYcKAzUSBOae
         mQn+eiRER09QPPVulqPcRlgr8nmZKvneFzEv8XbnusnQuHAu1L5FfMy4a0mQG8MSKxKH
         Ck2w==
X-Forwarded-Encrypted: i=1; AJvYcCUSoIxHKPqBbhfzqTmT/bbxzwTlGX8sgyzVg7gtV0+3ctyA6iVJxP/3f6YId4NAQdbR8XjN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3EqeCcsRBn42o3SczyQBZXoZOFDvL2wTPSMZ4ubVd9Kqob88g
	VaQBD9mYtAWuXTIJQ/pVwZ7oZRfGXd58C/YjEtYON4nzV6iElnc411aOQFLQWlNdrUpdG/Bh38N
	0mh+7iBiYgA==
X-Google-Smtp-Source: AGHT+IFS2B4zNJvVlte18uhhB7AZ/JaHnQshp/6/xrgjD5y92JvbJ4A+a3mLnC79I8+y1spNu0RRK9FLDfz7
X-Received: from pfij19.prod.google.com ([2002:aa7:8013:0:b0:742:a97f:55eb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e0b:b0:736:34a2:8a18
 with SMTP id d2e1a72fcca58-742acd75e6amr22243628b3a.24.1747694810372; Mon, 19
 May 2025 15:46:50 -0700 (PDT)
Date: Mon, 19 May 2025 15:46:43 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519224645.1810891-1-irogers@google.com>
Subject: [PATCH v1 1/3] perf dso: Minor refactor to allow Wthread-safety analysis
From: Ian Rogers <irogers@google.com>
To: langfei@huawei.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@linaro.org>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The pattern:
```
if (x) {
   lock(...)
}
block1;
if (x) {
   unlock(...)
}
```
defeats clang's -Wthread-safety analysis where it complains of locks
held on one path and not another. Add helper functions for "block1"
then restructure as:
```
if (x) {
   lock(...);
   block1();
   unlock(...);
} else {
   block1();
}
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 45 +++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 8619b6eea62d..057fcf4225ac 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1349,6 +1349,16 @@ struct dso *machine__findnew_kernel(struct machine *machine, const char *name,
 	return dso;
 }
 
+static void __dso__set_long_name_id(struct dso *dso, const char *name, bool name_allocated)
+{
+	if (dso__long_name_allocated(dso))
+		free((char *)dso__long_name(dso));
+
+	RC_CHK_ACCESS(dso)->long_name = name;
+	RC_CHK_ACCESS(dso)->long_name_len = strlen(name);
+	dso__set_long_name_allocated(dso, name_allocated);
+}
+
 static void dso__set_long_name_id(struct dso *dso, const char *name, bool name_allocated)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1362,18 +1372,11 @@ static void dso__set_long_name_id(struct dso *dso, const char *name, bool name_a
 		 * renaming the dso.
 		 */
 		down_write(&dsos->lock);
-	}
-
-	if (dso__long_name_allocated(dso))
-		free((char *)dso__long_name(dso));
-
-	RC_CHK_ACCESS(dso)->long_name = name;
-	RC_CHK_ACCESS(dso)->long_name_len = strlen(name);
-	dso__set_long_name_allocated(dso, name_allocated);
-
-	if (dsos) {
+		__dso__set_long_name_id(dso, name, name_allocated);
 		dsos->sorted = false;
 		up_write(&dsos->lock);
+	} else {
+		__dso__set_long_name_id(dso, name, name_allocated);
 	}
 }
 
@@ -1451,6 +1454,16 @@ void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated)
 	dso__set_long_name_id(dso, name, name_allocated);
 }
 
+static void __dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
+{
+	if (dso__short_name_allocated(dso))
+		free((char *)dso__short_name(dso));
+
+	RC_CHK_ACCESS(dso)->short_name		  = name;
+	RC_CHK_ACCESS(dso)->short_name_len	  = strlen(name);
+	dso__set_short_name_allocated(dso, name_allocated);
+}
+
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1464,17 +1477,11 @@ void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
 		 * renaming the dso.
 		 */
 		down_write(&dsos->lock);
-	}
-	if (dso__short_name_allocated(dso))
-		free((char *)dso__short_name(dso));
-
-	RC_CHK_ACCESS(dso)->short_name		  = name;
-	RC_CHK_ACCESS(dso)->short_name_len	  = strlen(name);
-	dso__set_short_name_allocated(dso, name_allocated);
-
-	if (dsos) {
+		__dso__set_short_name(dso, name, name_allocated);
 		dsos->sorted = false;
 		up_write(&dsos->lock);
+	} else {
+		__dso__set_short_name(dso, name, name_allocated);
 	}
 }
 
-- 
2.49.0.1101.gccaa498523-goog

