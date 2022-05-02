Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06228E0
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 14:10:57 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k27so16747908edk.4
        for <llvm@lists.linux.dev>; Mon, 02 May 2022 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=joK5j7ew5SKN/cHxslItBx63j5PdrPIBK5veE/G0SHQ=;
        b=HoTx0fI9k/wNi8rf31TR+bf9CBgvi+XlcN26lQIR2oH50DFX3uY8EjYs8+G9Ly2AX6
         VPiXuWl7g1L+R+0+J1tpVhf4zprGMtz4C9LDN/Qc721rO0peoxWUrcKYLl0kciA4tqxQ
         1KowbweQSYEX5KdI3o8/+qh+R7PyJ3OccMWbBK10okckN8R3Q0gY6c3EkRMJegBaKMZI
         936Msgv+6Au0TlDpcEAoY7o80jMmf/3NxXozY4m+iJ2RyuL0MOCa1VWtSr08jqiE4A6L
         C73Sp9OLZalQdJcEQEHzDVNfcQs9a/u0xbXkxTGFvEY5Oul2MsuNymLbIj8SGyfqGbeK
         T0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=joK5j7ew5SKN/cHxslItBx63j5PdrPIBK5veE/G0SHQ=;
        b=QFkiBPupR8yg+jLQz3mE9AOF3fTcGXwecd9cfbD9f+L5LEitpZ+ITsK/YBQ8zFx6qj
         2PUQX3ZKRFZhCeKF4fGCVS/lNpN4/CULlTh8o2Ng8ESiiTnOYhvzci/W9w5AAgowA0bt
         hNX80GhD/+H07iSIrRIzt93XbSbDC9LUku86irK9Lgp1kk6Q+S4Wsgzb0MeO0e6SJloe
         TadMs74hRI7WjuVReTryvz/VdCBreOHrlIo5zZNKZ2GycBgudc4QWZ0hHLU8RVkAVyN/
         xgNqHvp46iHBadGAnX883CK1IyIvy1eaBRi7kvyZClczuCNqwKYQeYjUeGYC5oj+coDI
         wjzA==
X-Gm-Message-State: AOAM533cew3AWdUV+yzK8BloE8t1mhb3gXI0uwGItVdmFCCk59+J3x6C
	tXEiYVxCjAwGPKABRiMye4bln/V8q7g=
X-Google-Smtp-Source: ABdhPJz6NFDvTejbV7HnVzqZN55zXR3cWNJXtPu/IPMmkDmCdKUEg/L8wi7+Q3qw3YfQxCG1r7+jBA==
X-Received: by 2002:aa7:dd91:0:b0:427:b2c4:1c7a with SMTP id g17-20020aa7dd91000000b00427b2c41c7amr9825791edv.91.1651500655633;
        Mon, 02 May 2022 07:10:55 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-001-135-067.77.1.pool.telefonica.de. [77.1.135.67])
        by smtp.gmail.com with ESMTPSA id s23-20020a056402037700b0042617ba639bsm6732338edw.37.2022.05.02.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:10:55 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] selinux: avoid extra semicolon
Date: Mon,  2 May 2022 16:10:51 +0200
Message-Id: <20220502141052.34413-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Wrap macro into `do { } while (0)` to avoid Clang emitting warnings
about extra semicolons.
Similar to userspace commit
https://github.com/SELinuxProject/selinux/commit/9d85aa60d12e468e7fd510c2b5475b5299b71622

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/ss/avtab.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
index cfdae20792e1..6178af5fedbe 100644
--- a/security/selinux/ss/avtab.c
+++ b/security/selinux/ss/avtab.c
@@ -40,7 +40,7 @@ static inline int avtab_hash(const struct avtab_key *keyp, u32 mask)
 
 	u32 hash = 0;
 
-#define mix(input) { \
+#define mix(input) do { \
 	u32 v = input; \
 	v *= c1; \
 	v = (v << r1) | (v >> (32 - r1)); \
@@ -48,7 +48,7 @@ static inline int avtab_hash(const struct avtab_key *keyp, u32 mask)
 	hash ^= v; \
 	hash = (hash << r2) | (hash >> (32 - r2)); \
 	hash = hash * m + n; \
-}
+} while (0)
 
 	mix(keyp->target_class);
 	mix(keyp->target_type);
-- 
2.36.0

