Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6AA29A2
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 21:29:51 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j6-20020a25ec06000000b00633c6f3e072so14285700ybh.12
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=P5TBHdIxT5bdh0NQZGvXp/Hfim7NoVNfBg9iw+ca+K0=;
        b=HhFAIZ94MLVFsWOVvsIkSSweYvqqN7xSSA9KtgRCmq6gyQYdJcs84SZvkqEErXkn4N
         AY4Lj7CDJATk0JC6zrjsWvQM6UbBQP35+WfovgmHaNZpWv1WXg0yLavRhl61cUxUosxW
         3lQQYaQvGKKqLMGg8HTrDTuLafjWzbfoqZ8Y337ObvoVkaW37P5REd2ug6dvF80uJWk6
         ZNe4aZw/fHGI4nRJU9UJdnFAK4IxBknkxdXelWlWcJCmuLDWTx/xAHMzIOXN6dHAZF+U
         NYkP6Mjtr7VyEzVdtDyzQb63BphW2zQ0uDgT0YsaMvQQIAn/LPdsqra5wy/tVPwWk/5o
         1v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=P5TBHdIxT5bdh0NQZGvXp/Hfim7NoVNfBg9iw+ca+K0=;
        b=wgz1AQctHhbVu3Y4i6NluZc04gU68BylCXkXjf8OJsx2QraCNJQLzUb79MsXf+dUKa
         UpZOcB5gKQeCulXmO2hsHkWAgwhuwTB8IK7XwoTr3BHYH3PPwMvem/ZsZNfrsSb5J163
         nNfK1WyI/HcXhzQuiujoEj1y1d9tKTNa2m6SA6sW6DyxWrO2O3+YHDcHTzDIjjVsRiKi
         QDpMWwtwrQOtvawRdJbWkpQQNeqnSlg/qUaLUMKN4L+dpdgOXUuosc6Ko1RiOcXcz3W/
         TlcYzGEjrUCvHSkvypc3OBsg6VGlX4xPXTbAfhsCrf5tiVJAnwj8ICuyK3739LfpGKov
         fJrQ==
X-Gm-Message-State: AOAM530iEi3IJxaRkJ2gllEI0vbppCfAomrB210SM+jol/DMjdG5rZIi
	AumpAnMbHnWO4p9ATXxEp7fOKYpeUm4eyhbeHWc=
X-Google-Smtp-Source: ABdhPJx4DYVDNRXhsBzxHfrEovi5p3Dz+VcZ+tQlnV4+qvZtjYsgBZ0ChGWdDjIZbZ39iVvA8dGCAKJfLmz/zc877NU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:75a:7c26:987c:fd71])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:f105:0:b0:2d1:1f59:80fc with SMTP
 id a5-20020a0df105000000b002d11f5980fcmr32641683ywf.77.1648589390535; Tue, 29
 Mar 2022 14:29:50 -0700 (PDT)
Date: Tue, 29 Mar 2022 14:29:45 -0700
Message-Id: <20220329212946.2861648-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648589385; l=1718;
 s=20211004; h=from:subject; bh=puW+jMxS7VYBp0FC4lUNV4G4u9ugxnkqCqfUK1sNtjs=;
 b=jIFU9u0n6sVPD4xJZbyKcG1HWfk8Dgm8nGXkyfCihVlwRmUDpE+ROWm/SVRbyxBzNH7gVNDk+B+C
 H5Y8OtyfB/NaAG6tx1rXNaNl064F2W4jrX3a+pOoJjoXXtFJEIg5
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [PATCH] net, uapi: remove inclusion of arpa/inet.h
From: Nick Desaulniers <ndesaulniers@google.com>
To: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Testing out CONFIG_UAPI_HEADER_TEST=y with a prebuilt Bionic sysroot
from Android's SDK, I encountered an error:

  HDRTEST usr/include/linux/fsi.h
In file included from <built-in>:1:
In file included from ./usr/include/linux/tipc_config.h:46:
prebuilts/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/arpa/inet.h:39:1:
error: unknown type name 'in_addr_t'
in_addr_t inet_addr(const char* __s);
^

This is because Bionic has a bug in its inclusion chain. I sent a patch
to fix that, but looking closer at include/uapi/linux/tipc_config.h,
there's a comment that it includes arpa/inet.h for ntohs; but ntohs is
already defined in include/linux/byteorder/generic.h which is already
included in include/uapi/linux/tipc_config.h. There are no __KERNEL__
guards on include/linux/byteorder/generic.h's definition of ntohs. So
besides fixing Bionic, it looks like we can additionally remove this
unnecessary header inclusion.

Link: https://android-review.googlesource.com/c/platform/bionic/+/2048127
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/uapi/linux/tipc_config.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/uapi/linux/tipc_config.h b/include/uapi/linux/tipc_config.h
index 4dfc05651c98..b38374d5f192 100644
--- a/include/uapi/linux/tipc_config.h
+++ b/include/uapi/linux/tipc_config.h
@@ -43,10 +43,6 @@
 #include <linux/tipc.h>
 #include <asm/byteorder.h>
 
-#ifndef __KERNEL__
-#include <arpa/inet.h> /* for ntohs etc. */
-#endif
-
 /*
  * Configuration
  *

base-commit: 5efabdadcf4a5b9a37847ecc85ba71cf2eff0fcf
prerequisite-patch-id: 0c2abf2af8051f4b37a70ef11b7d2fc2a3ec7181
-- 
2.35.1.1021.g381101b075-goog

