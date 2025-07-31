Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661318A6B0;
	Thu, 31 Jul 2025 02:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753929593; cv=none; b=SLp7VOqzXqhWCwp1dUevMrLrzyd6lfOcuHfinZnDx+Ni7LGIyZNxhoJSmOgi23c2I0bzIno/0bxKBIfQK2xhwoWYUAL6/OvyD/vkpL3F2IxNAeuh7t6fEMvizVzTD4mV1CFezY5hT6LPKFo4/KpupeXTqOKgQhai4tTM+B9GzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753929593; c=relaxed/simple;
	bh=UPzp/q7Mz8XPWkGyCALE3/7QRVB7MCNqXo24pcKoEZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bp8YfEO80O4BveHXpO0kC21cb8JYQT4ZhjGEd33a+sq55upcqI+4Hs8+9MZQyvAmP/0+lgau2e3+rsrwDRkTAyis0r3tVr+PW/LlbwsSZy3cVx0sO5A+HmQ0LiqT54LiKGJQ08PSIyAbQxNUYe5luRTcwTX3dsxYkxz2ILyAiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4229326f89so287081a12.1;
        Wed, 30 Jul 2025 19:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753929590; x=1754534390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7jN2YE5JP4mLObDIRMobwxfNHhfU6bO2oAy29bLEJ4=;
        b=Ils7U7nL7yhQPQDRbMeOppRTwBHhkdWF3zbvv+jZ7308oOCrn1Cw3W3D1PlsNZLPbO
         HvLhdU3HPwxUEJS7fAbyqi2x3WCSNbreA4t2eQNCOkjOPhfj0TxCHeSRC+HXgqNFE+eH
         vtlA1VyEKk2vZ3xUQal46gDnvskvI76GLmhJTBibqGEGX0K04peqFoX0VBTnyB/gv+83
         cI+vqww0rAhfP/8l21KpDapFh0nE3k2GeNrOUUK/SNKexYLnD1fQwNNgXF74VFu3HnUD
         R2QbADWkN2EbBS8J+J1O6JIFwIkAy/bksjmEM/jcgPE4tjXSH0pw6SO7II88NaXUnVz1
         e9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUH6+CLoA6RcAEtDhCMLX5ESrlcO3pAgRDLzH0yhtM2dd0/Y+e2+mDcL10ElQQ7lYLQgkcG@lists.linux.dev, AJvYcCV8bmIkWKcjpQsVJ1cZg6SznXqNMQQxw+LBjiHfeRqtRcBdSDbJx5uaF86+jMKGT8NxCqJbMka3oB86qxT7uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyepN6J3BTNsoxilkcjoptKLPsOoB/HtOdndEydGAJ8LJMIghaS
	lt38ugifhE1lqb6zXA6hjvMNlR6klD5O07KUbh3D4iL5bVFukMJJyios09I6sg==
X-Gm-Gg: ASbGnctu7gmiuXOJlShpqiOZj3cLhiLCxor9PxANmPPDN5XMK95gv62lluo2O0DQz/W
	XQZGcfNGkDSuO+ZzyoF3YOLbhvrrUjyfFREe4B5Z3cuLzWNVewyz0/WKRXg3coGr/Nz0Zv/Nped
	nzFg2c+7KudfAonwLBnxh1Rz8FOZHzDhV2xa9mbkVecKSFIgt4qxOuDvV9T8Rb0MRSKeJh8ocxZ
	uNcyTFi64X+fIiF3lGfKiCLLWH5OiRUG2t8fB8J47XLnI1QYnyRJfLtuKlDrfqplgNwM7tBwNCu
	M/+5JS2R3JzgiPhsmFFdcTZYCVVx15z9D1DLWb1eWrSpPc+9OHi7m8UT0oTl//7BcSvadtOkhhM
	KtgVzd4TSfg==
X-Google-Smtp-Source: AGHT+IGJYoXamiSK3UMRABpBDymWLB22QGyVIj3h4J0cubndd7Ogqfor7En8zlIeuIq5sl0KMtasXg==
X-Received: by 2002:a17:903:1a67:b0:240:86b2:ae9c with SMTP id d9443c01a7336-24200acb882mr8264155ad.14.1753929589674;
        Wed, 30 Jul 2025 19:39:49 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2403:2c80:6::3075])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e84bsm4277315ad.51.2025.07.30.19.39.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Jul 2025 19:39:49 -0700 (PDT)
From: Lance Yang <lance.yang@linux.dev>
To: lkp@intel.com,
	akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	llvm@lists.linux.dev,
	mhiramat@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] hung_task: fix objtool sibling call warning in watchdog()
Date: Thu, 31 Jul 2025 10:39:34 +0800
Message-ID: <20250731023934.48840-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

The kernel test robot reported an objtool warning on the loongarch
architecture with clang:

        vmlinux.o: warning: objtool: watchdog+0x418: sibling call from
callable instruction with modified stack frame

To resolve this, explicitly prevent the compiler from inlining or
performing a tail call on check_hung_uninterruptible_tasks() by marking
it with the noinline attribute. This ensures a standard function call
with a proper stack frame, satisfying objtool's validation requirements.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507301256.cZlxQ10s-lkp@intel.com/
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 kernel/hung_task.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index 8708a1205f82..a5b5a0a2c262 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -283,7 +283,7 @@ static bool rcu_lock_break(struct task_struct *g, struct task_struct *t)
  * a really long time (120 seconds). If that happens, print out
  * a warning.
  */
-static void check_hung_uninterruptible_tasks(unsigned long timeout)
+static noinline void check_hung_uninterruptible_tasks(unsigned long timeout)
 {
 	int max_count = sysctl_hung_task_check_count;
 	unsigned long last_break = jiffies;
-- 
2.49.0

