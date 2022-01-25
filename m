Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BA2C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:14:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r10so32139826edt.1
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 06:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k+CgfQJbyed6dtUDLhZo4uiteDWSo0FQKuqRzl0IeVw=;
        b=bYATyVvaBSeEE52mObJNrtCyRpMGqOMNkUxMHfHFsdMbJx+GFlcDZFawVTpRb2M6jd
         QqfkVSweYUIfdBzBjJ8nEemJGbV9to/5C0YnLh75J0TrV0ebCuo44+s9sg6gIEVmhDCA
         LNG5kq7ZMCCjeie8XRa0m4CTegkPxlw4sj7pe/XZbnV2/Hl+qsKTSwlzlJz7UnOL4VSE
         L/V4K5WqXQ4z/QUTmpOzSHauq6rS7JO+Btez9ZMmxTONP6XxEW864IixNECdXo9+BMwv
         VjB8IU/iZHiQkMYruhiU73gwKcryJb7It7J5ay/KEt+MNhu44YtTmXHgJI8EuxXzWkNZ
         H11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k+CgfQJbyed6dtUDLhZo4uiteDWSo0FQKuqRzl0IeVw=;
        b=kRA28wOinls8/q3uNHmWQBLfn15eUZ/z1L8L/RjF4hHAI30r/9VYZxiqzsHEpTEoY4
         M6s0ZhrY48lQHp0AT0W6AliqdQaquc3B7dItmHLUdN5brGODJVi0KtZXvM0n8CTyrEiG
         NNv7s6gkMvp/hxOZ8sO/lBD118g2RsmHpu72S45d1Fso0qjviXuFxon3TxWlpepRFYX0
         fZJ6BxFxDx3SVBWlrkyj+U5RoyPrmtFhvNKd6pdA0SKChFYChsNAow70a4IPEk+dHbUM
         snTGuph6alMQ24px9wa8v33oHQaTqSVV542JqfFk2l5ibj42JW/zKteDB23LZTACuGSm
         pJWA==
X-Gm-Message-State: AOAM530l/DBTSmbrjl8h15Ijx+vRkYHM4Dr2Db3RVPHWM9F48lsCcTqd
	kg+4HAL5N/6r70b4rkplAxo=
X-Google-Smtp-Source: ABdhPJxR4z1J9aUIgzhuPP3EwJYNQiMKrZpekbZb9uwX2w62yIB0i7WedFAVwCDGuJXWuIi7OqrJsg==
X-Received: by 2002:a17:907:9495:: with SMTP id dm21mr16065429ejc.467.1643120094730;
        Tue, 25 Jan 2022 06:14:54 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-010-144-044.77.10.pool.telefonica.de. [77.10.144.44])
        by smtp.gmail.com with ESMTPSA id lu44sm6292929ejb.145.2022.01.25.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 06:14:54 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Xiong Zhenwu <xiong.zhenwu@zte.com.cn>,
	Tyler Hicks <tyhicks@linux.microsoft.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/9] selinux: enclose macro arguments in parenthesis
Date: Tue, 25 Jan 2022 15:14:14 +0100
Message-Id: <20220125141422.32655-3-cgzones@googlemail.com>
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

Enclose the macro arguments in parenthesis to avoid potential evaluation
order issues.

Note the xperm and ebitmap macros are still not side-effect safe due to
double evaluation.

Reported by clang-tidy [bugprone-macro-parentheses]

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/include/security.h | 4 ++--
 security/selinux/ss/ebitmap.h       | 6 +++---
 security/selinux/ss/sidtab.c        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index 6482e0efb368..d91a5672de99 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -254,8 +254,8 @@ struct av_decision {
 #define XPERMS_AUDITALLOW 2
 #define XPERMS_DONTAUDIT 4
 
-#define security_xperm_set(perms, x) (perms[x >> 5] |= 1 << (x & 0x1f))
-#define security_xperm_test(perms, x) (1 & (perms[x >> 5] >> (x & 0x1f)))
+#define security_xperm_set(perms, x) ((perms)[(x) >> 5] |= 1 << ((x) & 0x1f))
+#define security_xperm_test(perms, x) (1 & ((perms)[(x) >> 5] >> ((x) & 0x1f)))
 struct extended_perms_data {
 	u32 p[8];
 };
diff --git a/security/selinux/ss/ebitmap.h b/security/selinux/ss/ebitmap.h
index 9eb2d0af2805..58eb822f11ee 100644
--- a/security/selinux/ss/ebitmap.h
+++ b/security/selinux/ss/ebitmap.h
@@ -118,9 +118,9 @@ static inline void ebitmap_node_clr_bit(struct ebitmap_node *n,
 }
 
 #define ebitmap_for_each_positive_bit(e, n, bit)	\
-	for (bit = ebitmap_start_positive(e, &n);	\
-	     bit < ebitmap_length(e);			\
-	     bit = ebitmap_next_positive(e, &n, bit))	\
+	for ((bit) = ebitmap_start_positive(e, &(n));	\
+	     (bit) < ebitmap_length(e);			\
+	     (bit) = ebitmap_next_positive(e, &(n), bit))	\
 
 int ebitmap_cmp(struct ebitmap *e1, struct ebitmap *e2);
 int ebitmap_cpy(struct ebitmap *dst, struct ebitmap *src);
diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
index 293ec048af08..a54b8652bfb5 100644
--- a/security/selinux/ss/sidtab.c
+++ b/security/selinux/ss/sidtab.c
@@ -27,8 +27,8 @@ struct sidtab_str_cache {
 	char str[];
 };
 
-#define index_to_sid(index) (index + SECINITSID_NUM + 1)
-#define sid_to_index(sid) (sid - (SECINITSID_NUM + 1))
+#define index_to_sid(index) ((index) + SECINITSID_NUM + 1)
+#define sid_to_index(sid) ((sid) - (SECINITSID_NUM + 1))
 
 int sidtab_init(struct sidtab *s)
 {
-- 
2.34.1

