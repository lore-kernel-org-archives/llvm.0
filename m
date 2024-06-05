Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268F15FD16
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627013; cv=none; b=YS0AJGoLYiYbjCmJXp1aCzscuPabewRy9lJVVTy/Vp3JbVzQ1maFimBUD1SpBwkN5MrmLK2hOkUAEhH6zYQ72V5eBB3YNuOAUJdtS4Fa/gAEo1SKX6itzg8y7PyhoLhzhb7oTVVeLubxnQKeLt5zJfK5ztNui1RDHRaU1o77XvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627013; c=relaxed/simple;
	bh=YoSBzgIyczq0SKCblGNBogA192bjVxhivYiaa+qfXhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N/WfEXoArW345xoaYXifmAk1RmClKZLnxn4qplS44uaRcyPciKm4uYDoNZH8n9fwLUVMk4I8zMvNBUvDIL0iI00YKnFIre4z1AyG4Bjn5iQQXCn2xN6zS5OGmWf/Db+jgXpBqN3QgwokohWG2Dljg5+B1CEifmuDCLy18rrE++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fA6bd7xe; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fA6bd7xe"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7027e5aab15so267628b3a.2
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 15:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717627011; x=1718231811; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W09wuD4FxLrgIE1KeD5W+uP9/uZWU9NhM8LDAnFpogw=;
        b=fA6bd7xeuhNnBn7D+Zmpwe1VYrQFBOROJaSjPEkP5c0omOEzm2BdReiDzH8+9MCQQQ
         nR73Q/4gFjOuc1+e9Ygr/2TY82QBcA97Y1r7Tp3wIcKBYNOa7Blz646razTopTmDqVTL
         oIVRxA4YZNQ+0CWdt0JUvp13XO1138gT7mttz3Zdl3nZN7/8yzAhISHwGr95sRq5T9u5
         xWc1amB3mhk3Kny34rX6WIxuqbeE8SFRxgDYqnSny8DWDknga79oUI7lSI1c+f0+tNZP
         dMCgnetY1OP0LCcl9mOhDkoYw0iOXMH0JZNcQr7p0yzyfT4F7IqtA440qaYzICqpJGt+
         8B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717627011; x=1718231811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W09wuD4FxLrgIE1KeD5W+uP9/uZWU9NhM8LDAnFpogw=;
        b=UaeN7F531zVIXI0plfE5JduRYzNP8YQIAX8Q/VP432Z6R/u1AklFV2TKMI4aOC7+/h
         jNTA4n6fCj0nhEDNGhLmU9ywx53JIy/aM2K2q4DEGhCcpFfaQi7tl9QSh95v5jug5mIs
         KJe5TGYBHb1/mJugD/EWBXsY4ju85oM9Vcz0x4x0uAGCnScoDzX1v+52jU69CVeEyzLI
         zpKBKDaNMQy0s4y+JGFYYYnd8AO4yhfzgrUEK3Pzjw5sGruA0O5SdwInp4TFIZEQR9/b
         19lCEHEzK+AOM+GTw7RScf6JHCFEg56RhlsiypCqvNy5BCxDBP4AJOcMEfgYxMSIjM3i
         bvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWKuwZZ0AvKs9d+N3fPqyrHGb6PK9+N2bhpRSOwsvtbFlu1OXanu0FvOqPTuRGptw/6JPpAj6zJX1W1juJOjc0kvM/UEw==
X-Gm-Message-State: AOJu0Yyqdfw4bDmXOkVXZhqiKSHuoRYftUOdyNGkp2fFCYcfn6sXZCCy
	pWwEPP3HoC30oZvdlYSRUTMAJ7BuXzo1QGiWXya0mBV1++XlBFRr7bTQRoc9lUytH0sGcYktXzz
	ftw==
X-Google-Smtp-Source: AGHT+IFMIrLdQe45thJUN1W26E8IgQCgCg3jMfWtuEwXZZmX/GxigF7WD+0J3Zd+VqHvwqAm4zpgp44oOeM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:4f85:b0:6f0:b53c:dfa5 with SMTP id
 d2e1a72fcca58-703e5a7f7ecmr58171b3a.5.1717627011007; Wed, 05 Jun 2024
 15:36:51 -0700 (PDT)
Date: Wed,  5 Jun 2024 22:36:34 +0000
In-Reply-To: <20240605223637.1374969-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605223637.1374969-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605223637.1374969-2-edliaw@google.com>
Subject: [PATCH v1 1/2] selftests/mm: Include linux/mman.h
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: cmllamas@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

thuge-gen defines MAP_HUGE_* macros that are provided by linux/mman.h
since 4.15. Removes the macros and includes linux/mman.h instead.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mm/thuge-gen.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index ea7fd8fe2876..034635317935 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -15,6 +15,7 @@
 
 #define _GNU_SOURCE 1
 #include <sys/mman.h>
+#include <linux/mman.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <sys/ipc.h>
@@ -28,10 +29,6 @@
 #include "vm_util.h"
 #include "../kselftest.h"
 
-#define MAP_HUGE_2MB    (21 << MAP_HUGE_SHIFT)
-#define MAP_HUGE_1GB    (30 << MAP_HUGE_SHIFT)
-#define MAP_HUGE_SHIFT  26
-#define MAP_HUGE_MASK   0x3f
 #if !defined(MAP_HUGETLB)
 #define MAP_HUGETLB	0x40000
 #endif
-- 
2.45.1.467.gbab1589fc0-goog

