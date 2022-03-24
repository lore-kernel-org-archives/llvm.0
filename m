Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C97E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 22:39:37 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2e644c76556so47126847b3.15
        for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YffvJKmqGnNOFrJNUBozqcvaEBhfok9GG307YN+iOis=;
        b=rJBaV6pGwEOAZ5/DKw9WgYD8sOUIGzatpRwyLoMMfvhusF5BeyvsRwUwZWCNGuIDQ1
         nQB8oCdC9bv1EZ+2GtysbZIqyvqAenpHbQez/WxBwBE3CGVb3xXwPXtQKDi9eaWQ6y7j
         ZKrHVPDblW1plXoohNvFqYI+YSZ7lUzU+JDZLa+az53ILzpYvrYIYeB4+yyJZ67EEn+X
         fen1X83tGjPFdNkCIFZgPgVXkkcmBf7dBg8tE2ndTF7IzTTWpZI4Ahz8CtlYV5thWf5L
         xduypsO2tFYJpKt92zfyi3vjDV+lUkUnpditqzgfS6Zi5K3l63GEjp2/MNklpuAspxgA
         4uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YffvJKmqGnNOFrJNUBozqcvaEBhfok9GG307YN+iOis=;
        b=R9UbQ/0Tb1bW0w+mWO3vVV1l2+78Lp1Ewrh4FV5rqogZM2GO8FO2cuM6ZGHjN575oi
         MDZCakRrM31lOCmXDsdGrYgssUsCwQN/BcYBykV29QOQX+oTf+LPgxnSSzz6yMmSpWnd
         TX74lJbc5sJb9d8kIKga42KdHqKP7cM0z5nrDkyyWklBGXRyZDrO6MPe7+yN3g4kYtFo
         sU5I8OMHb3lubFKoC/0ri5i41tWFQOOy6n/RV2WNnptywfIyD2sCd1jEDS1+ce7ZYRn1
         x+lOW6rhJp8kWqcxhCvBN48E6cJQxJznKcpHe3bhGBFkFt9q+K5poEDt8RnutOvnZd9S
         JU6Q==
X-Gm-Message-State: AOAM531ZcbuFNho70ceN8RxPgiXSRC1obqN4D4xMmGckTsKsq2n3THJj
	dftNZ6Q6ZiWSu7WKIeIIMRpkPBvvSAIg1buXr7MT
X-Google-Smtp-Source: ABdhPJzQniIe8bkEpjEUmGcF7TUYcFhdcZfxtrsrsS9hsTOunibTFJjXrnGim1HZIuwmtVj5ERBh+6ALOnRpNeXOLmhR
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2cd:203:9892:9f7f:2c27:2968])
 (user=axelrasmussen job=sendgmr) by 2002:a25:3f87:0:b0:633:bbe5:c9d9 with
 SMTP id m129-20020a253f87000000b00633bbe5c9d9mr6992182yba.115.1648161576861;
 Thu, 24 Mar 2022 15:39:36 -0700 (PDT)
Date: Thu, 24 Mar 2022 15:39:29 -0700
In-Reply-To: <20220324223929.1893741-1-axelrasmussen@google.com>
Message-Id: <20220324223929.1893741-2-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220324223929.1893741-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [PATCH 2/2] selftests: fix an unused variable warning in pidfd selftest
From: Axel Rasmussen <axelrasmussen@google.com>
To: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"

I fixed a few warnings like this in commit e2aa5e650b07
("selftests: fixup build warnings in pidfd / clone3 tests"), but I
missed this one by mistake. Since this variable is unused, remove it.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/pidfd/pidfd_wait.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_wait.c b/tools/testing/selftests/pidfd/pidfd_wait.c
index 17999e082aa7..070c1c876df1 100644
--- a/tools/testing/selftests/pidfd/pidfd_wait.c
+++ b/tools/testing/selftests/pidfd/pidfd_wait.c
@@ -95,7 +95,6 @@ TEST(wait_states)
 		.flags = CLONE_PIDFD | CLONE_PARENT_SETTID,
 		.exit_signal = SIGCHLD,
 	};
-	int ret;
 	pid_t pid;
 	siginfo_t info = {
 		.si_signo = 0,
-- 
2.35.1.1021.g381101b075-goog

