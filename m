Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032E2C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:15:04 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id p12so63192695edq.9
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 06:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9/P79kiby3ifcGF4ip7/7rtet6erkFjsvjE42zBKRU=;
        b=g0ZB4NrYFVrd/WYH7ctuevAirrvpwDP6WewyqP8iLA5TJZ9S32T7sJEVeC1/2V/0vm
         ZXp6ee9KLS6q5LnOkK6DBhFx+CkeABY+t3sR9oTFcpGFD2vxqMJ/rSGJk4YHIhby5yWs
         +z93ue/wXHT11wg9ngrDU4xe5EMEynkRR3YECFkG5vQPnhdLVET9YL3Xblt8E+Y+Rsl9
         J9k8ZyfhARU3vnoqXl4f27OOmRiQswqZOLIC0fem2Lw2lIh3kgmwgV0k/o/YfDZ8327a
         tvoQLu7L4tMUeTlTVWGkBe4NxIj7TCWkkU2LUS0L7rMyHwCdtMjS2w9ABY4AWqf7HUOx
         iZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9/P79kiby3ifcGF4ip7/7rtet6erkFjsvjE42zBKRU=;
        b=QcDL9v9ynTTgb8EcGRB/mbE2QlG2cs8YL2wKMBR2A8mjI8XZsd2Af41kdXKUix2rhk
         bvezRqx2nmKRPOuFLAAv3XM8Oe04tNiDUYsyr/DGLks/XDyrb8zRIBX+Askd56/5ndyc
         DtKNB0fUJM2BZEsEdgQtk7zBWFJxL6W0HTZxP3D8oaEVV0KSA6PKI+6KLtoAwrSGD+DO
         elVvvhDfV2Y62O8b3gy6jtItyfsRcOZlEnpq7Gq2TDnsBHNmfmQgdlo0Qtnx3risQHiI
         RHAPZe7Ex/CdL/sOuaau+cfXs0t0LJJJc5rrT+sVrf4vJhuWd7mlNsBX6//SOm6Krbrx
         Ai6A==
X-Gm-Message-State: AOAM530dDcIc4JE842abrJBj1Lx3CW1DGAEgqfIaOda2oTS8mL9YNrq0
	BAFr0FQisUIfroGUSYYENoU=
X-Google-Smtp-Source: ABdhPJw63jKmaufKwl+6xsqdHxA1qMi+zig//jba8c/9KgLYXmArZdqp6VLdgUybsiJ4IxiYK6ceMg==
X-Received: by 2002:a17:906:7953:: with SMTP id l19mr16763178ejo.36.1643120102557;
        Tue, 25 Jan 2022 06:15:02 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-010-144-044.77.10.pool.telefonica.de. [77.10.144.44])
        by smtp.gmail.com with ESMTPSA id lu44sm6292929ejb.145.2022.01.25.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 06:15:02 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 9/9] selinux: drop unused macro
Date: Tue, 25 Jan 2022 15:14:19 +0100
Message-Id: <20220125141422.32655-8-cgzones@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141422.32655-1-cgzones@googlemail.com>
References: <20220125141422.32655-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The macro _DEBUG_HASHES is nowhere used. The configuration DEBUG_HASHES
enables debugging of the SELinux hash tables, but the with an underscore
prefixed macro definition has no direct impact or any documentation.

Reported by clang [-Wunused-macros]

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/ss/policydb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 67e03f6e8966..d036e1238e77 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -41,8 +41,6 @@
 #include "mls.h"
 #include "services.h"
 
-#define _DEBUG_HASHES
-
 #ifdef DEBUG_HASHES
 static const char *symtab_name[SYM_NUM] = {
 	"common prefixes",
-- 
2.34.1

