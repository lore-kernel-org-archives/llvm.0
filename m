Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580F02F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:40:59 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id c4-20020a0ce7c4000000b00370a5bb605eso40014402qvo.0
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=38/p5aKRxAN8lvaZDp0zhtUI6Snq8bGJp4KjVNrFxmM=;
        b=ClMvaE/jVFqEicWYTwhAUMg4CT9sQl4FTtk1QCXYfLbxl/z8eHdJIAmCgHm0ALrTgX
         6NNH59sSA/uJQCslchF6+vv2WH3Lg/544Ks+SobQ/+vHBR9uvBUTTPEeS7JNF6PUh4x0
         oji9HFyfLs9jEkCignvCitSoNF0nVGZh5hwNh1AgzHc0OnruJ8CR5gEIeQjyktGD0MzY
         fQKinUWOCv3m1Ei2THDJfEOQz1du+tBXIUkNdScXAFG/FjoQ7YDGmtmvQG6xo8Qwx/bX
         Oc13hWa/cGbAxYbZtXqP2Oj0jLT+5yhsbqbqmBhQeMxDcyxNnCyLb1d/HZCWRSduFFwY
         zLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=38/p5aKRxAN8lvaZDp0zhtUI6Snq8bGJp4KjVNrFxmM=;
        b=JPkRKkv6PaeIg9P7ZFUNdAkmz+FgYX8/K6Q2Y9YuPYH6ei3wau+L1G9oQnNEaGf7uv
         ABE87YZUdov5iChEea/zcwU+CpWq+zzXnAhvrlSGwh1dOsYM5ppTlTZLRhHV28gIdyKI
         LF0Zy0LwMo5C9JIGHBIaImyIDr+UlOxf+v5xxPEHOQafAz1wmM3h0KB9nvcb+GXqNelR
         4gKADQhmyU8mvM/JmR6UDpy3phaSSsjG5kZzqXTWkFA8uZUevNkKh8x1fbEi3AFbm57t
         gXLtfYCbs5feZ92eLVm8ozE2/NozXMauF1pDdEFj+VwpLqZoDHjdXpSLlUbPnyN+FM8C
         UJlw==
X-Gm-Message-State: AOAM530r306ZVAKMurMjMHbkCCZ5tdmhktNYbfBemziXH4YoX/jKLXrY
	PObFJT/5s4TyR25nNRIGLghlXmkoRiyHYmZkdD4=
X-Google-Smtp-Source: ABdhPJyjuPM8sCI8as/3lV6WlUxULncaKeVF02wBX8pFk93JyIjwijJyA1Yv263qUWK+idkJL/zGXVCgBbAeu963iTI=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:104d:: with SMTP id
 l13mr11107802qvr.13.1631317258077; Fri, 10 Sep 2021 16:40:58 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:40 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-4-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 03/10] mm/ksm: remove old GCC 4.9+ check
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

The minimum supported version of GCC has been raised to GCC 5.1.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 mm/ksm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 025338128cd9..a5716fdec1aa 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -651,10 +651,8 @@ static void remove_node_from_stable_tree(struct stable_node *stable_node)
 	 * from &migrate_nodes. This will verify that future list.h changes
 	 * don't break STABLE_NODE_DUP_HEAD. Only recent gcc can handle it.
 	 */
-#if defined(GCC_VERSION) && GCC_VERSION >= 40903
 	BUILD_BUG_ON(STABLE_NODE_DUP_HEAD <= &migrate_nodes);
 	BUILD_BUG_ON(STABLE_NODE_DUP_HEAD >= &migrate_nodes + 1);
-#endif
 
 	if (stable_node->head == &migrate_nodes)
 		list_del(&stable_node->list);
-- 
2.33.0.309.g3052b89438-goog

