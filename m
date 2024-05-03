Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912214F9C4
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714729834; cv=none; b=lzN3mKD5ISjtR9soznSl/SgHrrJ4E2FB6hZ6/h/az3VmmRMd/HtBECehNv5ivhnXn3V92rjyunxzDN5xSXbD9SI0WJxXMLYKPSZyQsxct+Mi80G2sACdOE1npXlcLGrhI7ClyTEPraT/4pjhzp2NRjmi/rTAhfauW4eHzYIQKSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714729834; c=relaxed/simple;
	bh=9Di2FkeIFOduQtnDEZw5Cz1U2fbjjAw7LIM/336g1k8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TieZCJj035urvoSgEFI9MCiC5Cj6Qt41aed93zH2r4dC/Dp5A/X7K37Zd4ZR+K8D3ojKpIjNPqCErA+O4uoUOdDrUerH5ON8Lya8ECiLXPMoCWoSQ8zVp5Vh07PnsVSrzTA6Iys1dS63i6ihQTouZdiChta0OHL4aSLTiuMgR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIE/S7MW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIE/S7MW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ec4f928c57so5135985ad.3
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714729832; x=1715334632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbIFWMJbm46ABCEZghwIka4n+0EiK+K27u1UogEz3qM=;
        b=OIE/S7MWqgB6NPjBb2DaFSF1vA04fASThubggvW7zI0G+IEe/ZoYUrL9rYcn3OIfGF
         bZzB8F6d8n/zqo+dT1y7U0pyFQ2h0H99IABp5Nt5nmuDggEz681UiM7UB1Y85e8ywBAS
         TOeGeS2yRWZ1+WBxIxAXXY/AA0sqTPz6s6SEDZb7qyXhj9DbKi/NqsDfg0w/wv0bculh
         prw1MG/WVaPXmvUyy/CRNajJxZ4fCvc/UlD9M0tDLCWrrKLk2p8mgxgfsodsAwcHV425
         ZxsSgfCyG+6BOf77Ue92X8dkZu5t+Uubma/XC/6dXQjeD4+znqku4+eLcB6orUQOzMOd
         qaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714729832; x=1715334632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbIFWMJbm46ABCEZghwIka4n+0EiK+K27u1UogEz3qM=;
        b=Arovr29kwxKbo9rVOXk495cwpXIRz1vCeMrdSwvKaCYQ4G618uTzGqLsHEQiBWKTev
         NLSSVU8prv6cs5LLRA0vE4q+Rx1XgjZhW6FwhmQmnhNi3Zhdp2hkOHnLPIHAdMfaqQEM
         QSyvnlIBAjoDzy4onOWEw5Kng9cU2r12TXJ5r7pinbNm1jQvWYwEBMgknS/QLq9zq4Mg
         XzySOer1+bCXeJWyy7NOmQlHNQPI+tLoUB+8BR3ZZJd8Ra1vEpV+DrUK4fr/zr9Lvt99
         sUHkmGCtvXiG1XpLGf44PJK90D0dd9XebZJQxBMhG/G4ecvfvc5/+Zj8ilfLJ2j+cMwa
         yg7A==
X-Forwarded-Encrypted: i=1; AJvYcCWJpJb452BE+4pjuB7K4kAPYjIm23jpYxQ4DrtlmdX3KbYHSkMVJPE69ZCgSOqipfUtG09skLIq8ht0OJ+rEDeTqYglZA==
X-Gm-Message-State: AOJu0Ywy0wAavuhdta0BesIu052iLkON6z4m8k/Y+M9FimvwXw776STq
	adFfsLV9pPSetKdGzaVPu8Yn3juuFCmiDiOA4IjTX/dW+BsF+D5j
X-Google-Smtp-Source: AGHT+IFrrnUeg1/9tnJoxphrYCutsVqK1aBW2OCIgiOzjy5644o7ZgXkmSsWe6YH7QgSl44ghsAr4Q==
X-Received: by 2002:a05:6a20:914a:b0:1ad:8f18:8621 with SMTP id x10-20020a056a20914a00b001ad8f188621mr2584834pzc.6.1714729832416;
        Fri, 03 May 2024 02:50:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902ec8100b001eb3d459143sm2849758plg.48.2024.05.03.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 02:50:31 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	nathan@kernel.org
Cc: ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] maple_tree: Fix build failure with W=1 and LLVM=1
Date: Fri,  3 May 2024 17:50:27 +0800
Message-Id: <20240503095027.747838-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling library code using "make W=1 LLVM=1 lib/", clang
generated the following compilation errors:

lib/maple_tree.c:351:21: error: unused function 'mte_set_full' [-Werror,-Wunused-function]
static inline void *mte_set_full(const struct maple_enode *node)
                    ^
lib/maple_tree.c:356:21: error: unused function 'mte_clear_full' [-Werror,-Wunused-function]
static inline void *mte_clear_full(const struct maple_enode *node)
                    ^
lib/maple_tree.c:361:20: error: unused function 'mte_has_null' [-Werror,-Wunused-function]
static inline bool mte_has_null(const struct maple_enode *node)
                   ^
3 errors generated.

Remove unused static inline functions to resolve compilation errors
with clang.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/maple_tree.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 55e1b35bf877..cd3f5399f9f3 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -348,21 +348,6 @@ static inline void *mte_safe_root(const struct maple_enode *node)
 	return (void *)((unsigned long)node & ~MAPLE_ROOT_NODE);
 }
 
-static inline void *mte_set_full(const struct maple_enode *node)
-{
-	return (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
-}
-
-static inline void *mte_clear_full(const struct maple_enode *node)
-{
-	return (void *)((unsigned long)node | MAPLE_ENODE_NULL);
-}
-
-static inline bool mte_has_null(const struct maple_enode *node)
-{
-	return (unsigned long)node & MAPLE_ENODE_NULL;
-}
-
 static __always_inline bool ma_is_root(struct maple_node *node)
 {
 	return ((unsigned long)node->parent & MA_ROOT_PARENT);
-- 
2.34.1

