Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C513D135A50
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711734198; cv=none; b=sNbUBYnL2LkzabSfH4ZycCvCTZBmfmpnmxoaL/xSZ6AdQ4VuR5kfdnoRTG8U2E7REjrc/sr8/oyOa2/8jX7jk2O5f96CRlbqkvySfwbyo8aXzpWxp4ANzXc1eVNtc7P9O3LdMS4bExvo0TyhynjWIO+eIrdvDG0fpv+tQzgoZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711734198; c=relaxed/simple;
	bh=Db+baHi+o4t0sQoTiWsOVnUn4il6QNvBEK0IZXfUirU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kPzz7jJrLM+vXihFmCu0vCEUyAVV4uRJvah2OGw27DeFi3RlGmsGJVcWlmo+mXFLgiJd2MXnUPJVlo1z8fh4w35OhWOgW2DBEbDsofZmdece9oies0ejcFr51MMRPzVZ9MO2FTtrsjfVO3wN7aWPEObNXsWHvrjVGdHWMNBWVp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQwi9FK4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQwi9FK4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5c5c8ef7d0dso1632855a12.2
        for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711734196; x=1712338996; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y4P2FVE0GZuV8xN0/OHVBz5dTMWkMVwFfht6IsCHyUY=;
        b=WQwi9FK4Ingl5FPjhDF91XRBA5MSZpKQ73ylEd84P9qN18oamQRZ+GQbngoxJ0xFJC
         mtHOODxl3Aszh/zpQ8FIFz6GlGx/sQqqSME6rUBAUJubWqCd8Qj39IJxVTy3djx5h7GL
         H0hwdI+BwMCKctRbjf0D1QG5rm8nq49K1xHE+DYDi4uR042waepEUMakmle01REGjbdO
         WJUxeaZU29EmgqfLdeRtkplhg23WmSVJl4t2h175Wo4lSGWnN1zAhC9bYCfz2hW28LWQ
         gKcv3k1Ff993UAcMQkf9eIPg4Q5gkxZC4TPUCLeW2NoJBfMldNrWFqKzN0l2BTcINc12
         8qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711734196; x=1712338996;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4P2FVE0GZuV8xN0/OHVBz5dTMWkMVwFfht6IsCHyUY=;
        b=FhahXYDQN/EDO/S02Hn7s2g3ZmpFWJHbSHfek/jskO4JhuBlJfq2H5oP1KBaa8G0m2
         BeQF2dHK4oDsR5P6GSN7bWk9o4LVDJt/y4DrTMa+Fc60ooCkMaN1JK1bKGzRyvjJOLvY
         UvYUrA/BoeMphZHBEhNlCldrlh73q/Z0QbRYD0TMi64HKXPHZGWwXVwGSZJise66xnE1
         lTnS0nlOzYP9b3jMWN2KWcdzcInsfSh+yWwQ5i3cuAJP2Wl7H2ZRbzXPRrACFtt5iDSE
         P9r/BwLIdykPCBN7E+OO9aDmbouq/KsdfQSANje2mUK3dhkgWiRimpi7ghaSdHGB+gPS
         INNg==
X-Forwarded-Encrypted: i=1; AJvYcCXOPY0pEehUXsSKHpdR330Sp7y5uxd0B9vlml3umr0rXN93yBBFCJc3MnevPwuPBMhfWTCr68yAiB9XNiqffji/YnBEfQ==
X-Gm-Message-State: AOJu0YwWSmUr2mHZrjx47nQbxzDxXuAnxE0gqtFKlAvu3OKopSpsLaY6
	o3VIT34uJuXloMvSuLDqimExSYnmVlFM2P3QQmQxDqI4moQphZTSjTlsYqH2Me8gEF6TiB7bEbd
	TPA==
X-Google-Smtp-Source: AGHT+IEk3daVAOxTw6ZxgVuNe0bbBjzztiCGBF5zYuViJhnrfrxtU4S3QA/1YszNBdzc0L46hiha467222c=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:4388:0:b0:5dc:8af0:ca81 with SMTP id
 m8-20020a654388000000b005dc8af0ca81mr7467pgp.7.1711734195797; Fri, 29 Mar
 2024 10:43:15 -0700 (PDT)
Date: Fri, 29 Mar 2024 17:42:34 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240329174236.2278217-1-edliaw@google.com>
Subject: [PATCH] selftests/mm: import strings.h for ffsl
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Got a compilation error for ffsl after 91b80cc5b39f ("selftests: mm: fix
map_hugetlb failure on 64K page size systems") imported vm_util.h.

Fixes: af605d26a8f2 ("selftests/mm: merge util.h into vm_util.h")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mm/vm_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index c02990bbd56f..9007c420d52c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -3,7 +3,7 @@
 #include <stdbool.h>
 #include <sys/mman.h>
 #include <err.h>
-#include <string.h> /* ffsl() */
+#include <strings.h> /* ffsl() */
 #include <unistd.h> /* _SC_PAGESIZE */
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
-- 
2.44.0.478.gd926399ef9-goog

