Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FAF1B7C3
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 16:43:13 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d4b1c8f2d91so3709496276.0
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691512992; x=1692117792;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OBiU5cpEymtSFa0lJKPFUvBh/2b8Gf4WF5QO44qLmLU=;
        b=5p7S+cLnEHd/fXCmhE+uQ/kiLmkMXjGinO6FUB18zkN6dfsuuG1McKRj3ZAg6NxW66
         jDjHe/hPVjGqq+EZGuFhiMF/oL6bFNJAqmaEMLy2KgxcdEobwXBl7MTwj4MYqUCtCnuO
         kBAQoPTu7rsyD9UsNRnK4elMl73GZldAivfgdXvmrDH0UUhjwHzZuehUhryIccUswFoq
         rtFN9pQMWqLZVAM3RGmuoYM5SYGYK92g8IaDPahxvKehy/aHRz0CD9MGlQPBYpUPaWYI
         wcXKWYXO3MIMv6KrigQwwzVR7rxwYzWhdJG+d7/Y6SLxjgoWpvVa+++K5zHdf1FOG33V
         4oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512992; x=1692117792;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBiU5cpEymtSFa0lJKPFUvBh/2b8Gf4WF5QO44qLmLU=;
        b=def9NH8OJwPqRn9JZ1BkzL0iUP0vI+Lr/kVVFavZiD5Wc0QzHCdfkZ78Aj+lZIwcoG
         6WHoqzJr27YbhEBh21IfOxasYJ5Nx/5Ti1i66j3PW0eJ3Wrc07P2/H20+TwzDcCFvtyE
         5B9J2//3hM4KoI9Z0cx2ZjqFQnc/aKsHqUIJfzYFrN13UA4e8NnUr4yvdE2BdCJL3I83
         /GK+BBMKiOVwaS1VTelt7/t1RfLWtt7cdgk5EgvaCRJ3PWzX6mCQSndtEhL37d3x801L
         NXoJREyzNek0yTgm43msB6Mg1MlrJHOUhIbfe+mjYlrlcOgyuBxujtr0QKFbAy9jIAnQ
         EWqg==
X-Gm-Message-State: AOJu0YyxsOt/uIzmC+pZ3eJLsS5taUWg15q/8zH5w4E3bzG4125pT7Xw
	SHVbsky8/MYcBdSL2DheaJxmExABVx7Ufjg2DFQ=
X-Google-Smtp-Source: AGHT+IGjuJqezd5qjQwP0YWEA1rZcmYCDvPAP6MuVBFDZpSKoy0gNLyehpvsSCwku5oYFzZCna0CwimGyjH3LDhA6Ik=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a25:6884:0:b0:d18:73fc:40af with SMTP
 id d126-20020a256884000000b00d1873fc40afmr1538ybc.5.1691512992070; Tue, 08
 Aug 2023 09:43:12 -0700 (PDT)
Date: Tue, 08 Aug 2023 09:43:09 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJxw0mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwML3Zyc5PjiksSSzGTdlFSTlJSU5GQzkyQTJaCGgqLUtMwKsGHRsbW 1AMp0+6FcAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691512990; l=3123;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=ULYFBK9Xx9ov9cv3SaccplqC+dWtT9P4vNAPt+juZOk=; b=x3UcI6Ljs8gOpumBOkSLWbhNNjNfVFpG3MxM6+CcDUZTVSmRzfTmK5ZgiH48jbyCoaoSfPddQ
 sZe5t5A5r1TA2xyN5chFck1l3DgqFYfntxS8aG4Ao5mKH4wSurIR0ad
X-Mailer: b4 0.12.3
Message-ID: <20230808-llc_static-v1-1-c140c4c297e4@google.com>
Subject: [PATCH] net/llc/llc_conn.c: fix 4 instances of -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instances:

  net/llc/llc_conn.c:44:5: warning: no previous extern declaration for
  non-static variable 'sysctl_llc2_ack_timeout'
  [-Wmissing-variable-declarations]
  44 | int sysctl_llc2_ack_timeout = LLC2_ACK_TIME * HZ;
     |     ^
  net/llc/llc_conn.c:44:1: note: declare 'static' if the variable is not
  intended to be used outside of this translation unit
  44 | int sysctl_llc2_ack_timeout = LLC2_ACK_TIME * HZ;
     | ^
  net/llc/llc_conn.c:45:5: warning: no previous extern declaration for
  non-static variable 'sysctl_llc2_p_timeout'
  [-Wmissing-variable-declarations]
  45 | int sysctl_llc2_p_timeout = LLC2_P_TIME * HZ;
     |     ^
  net/llc/llc_conn.c:45:1: note: declare 'static' if the variable is not
  intended to be used outside of this translation unit
  45 | int sysctl_llc2_p_timeout = LLC2_P_TIME * HZ;
     | ^
  net/llc/llc_conn.c:46:5: warning: no previous extern declaration for
  non-static variable 'sysctl_llc2_rej_timeout'
  [-Wmissing-variable-declarations]
  46 | int sysctl_llc2_rej_timeout = LLC2_REJ_TIME * HZ;
     |     ^
  net/llc/llc_conn.c:46:1: note: declare 'static' if the variable is not
  intended to be used outside of this translation unit
  46 | int sysctl_llc2_rej_timeout = LLC2_REJ_TIME * HZ;
     | ^
  net/llc/llc_conn.c:47:5: warning: no previous extern declaration for
  non-static variable 'sysctl_llc2_busy_timeout'
  [-Wmissing-variable-declarations]
  47 | int sysctl_llc2_busy_timeout = LLC2_BUSY_TIME * HZ;
     |     ^
  net/llc/llc_conn.c:47:1: note: declare 'static' if the variable is not
  intended to be used outside of this translation unit
  47 | int sysctl_llc2_busy_timeout = LLC2_BUSY_TIME * HZ;
     | ^

These symbols are referenced by more than one translation unit, so make
include the correct header for their declarations. Finally, sort the
list of includes to help keep them tidy.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 net/llc/llc_conn.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index d037009ee10f..0a3f5e0bec00 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -14,14 +14,15 @@
 
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <net/llc_sap.h>
-#include <net/llc_conn.h>
-#include <net/sock.h>
-#include <net/tcp_states.h>
-#include <net/llc_c_ev.h>
+#include <net/llc.h>
 #include <net/llc_c_ac.h>
+#include <net/llc_c_ev.h>
 #include <net/llc_c_st.h>
+#include <net/llc_conn.h>
 #include <net/llc_pdu.h>
+#include <net/llc_sap.h>
+#include <net/sock.h>
+#include <net/tcp_states.h>
 
 #if 0
 #define dprintk(args...) printk(KERN_DEBUG args)

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-llc_static-de4dddcc64b4

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

