Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D71C07C4
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440308; cv=none; b=oaThPC65r14dOC07r8vi8pqM3EUOw8mwYmAIHqJWqp5IvCTmuHw7GCDevoB6/dP/LEVxjSsuXCexz7edA/z2apJSJVk/0u9YNboOFn0xMKAs4DQOEZq7aP7PdnncjDxHnyAoNQ/TBch8J14LqicjR59HshvF1Lzq00f5NsRSDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440308; c=relaxed/simple;
	bh=c/nrBFaGLfezXQZH2euZV5a1DdCCVaNmyxXuHFBzHNo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WhHDqmlykAcTJGQZjJinE6sWx+vtl6gqPCy0slMVb4SLlOtGKiyFPbbGyeKiA/It16TI2XUu+xhGA7ULVqK/HmwKnJw+vKM7P3VDEvULM2UxWPj1FvirnJSvrY0+qmSyjVcBXXFpII2K/hCkKl1A2LfTsBrOC5QDouUO74/xGjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=25K/8UHQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="25K/8UHQ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-216405eea1fso61727955ad.0
        for <llvm@lists.linux.dev>; Sat, 01 Feb 2025 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738440306; x=1739045106; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kOeWKowR+d0FbKqQGkN2JbIsBct6786NOgOb18KCO88=;
        b=25K/8UHQbLThGFq+tYaLGUiyXQoakbbSceYIJBoKn2XFJL2zXXscZ6b0z83R/dQEzH
         dDGzOE6VcWTBKhRBD+d1BATvH2ZJeIwYMpAGAaym0WmWIyLDTVIIn3QecPKJ+nUbS8rF
         u+6tC5mJMnMkiZW1GgDGWJrZu+gC4KDtVCJlIr2zHXQxbVUPgRtTJpi5I2egpCU//KG9
         AJJlA8z/PzgyNH54Sq6+jDgmJhDSuGlO9QKtIqB+v5OkZI1sXIwkwv48nmEtAo6zeXH4
         cLPaDp5J1VViEQqXG8irrs0HpjxYWqemWixM7HBLN6nIdJNuLe9YSIALANytEd38nmB/
         S+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738440306; x=1739045106;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOeWKowR+d0FbKqQGkN2JbIsBct6786NOgOb18KCO88=;
        b=OVAFTmQcTWRP2YWeQCkzWVM80+yGeRxWq6uoS/lucN2isVYISgBvRlDJLAEbCiWBMR
         cpRrY7sYagxP4ya6eihME0l1ZNNm9hwbOE8U+vS/doDwcbLp8nfbqw7zFEFf6HJvrl4K
         rci/7cJC45ea2glMCZP4DHdAjwRNfNAIAwqjVeb0QC2C6hQlPUfc4myMEZhUbJHskVgv
         7N5rztVa8JncdINGZlyhkXI52Xkrv03WGUg1kdzvipoq8RD4MzNZCjfW/iJupFaItWbQ
         81C0/GvU354yOy6cpZzzQxVnU4bBHCTTLA9f0eckVhoaldWxhvweLw9pxs3LmlO9MtuO
         HUrg==
X-Forwarded-Encrypted: i=1; AJvYcCVlFrlcXiDVse6ru5YGHW3tIgF7iGIarptX82WbkKbT/d8MLCy+YVWc5vPa7rWVzdzG3wSL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx07FWQxwY0dHhEKAynNu4Um6Cz8kElTe12XsCWAQ15TqAxv1A0
	/dhRTKUZBhZRqdwa2cLiHRlpcA5UClJ52S8X+u7iFJOi6zRi5n2h+JvWwVf0v3h07mL9CXsqOLh
	BJg==
X-Google-Smtp-Source: AGHT+IHqdKzHVyWuGyopMUEnhACkN2OmWbLgtQLpfJfqFKJyJTBYA4ztrAbi9BbJSb42pSmOE0PPXHviSTA=
X-Received: from plog2.prod.google.com ([2002:a17:902:8682:b0:215:ac55:d3e1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dacb:b0:215:7dbf:f3de
 with SMTP id d9443c01a7336-21dd7d74db1mr277906365ad.28.1738440306355; Sat, 01
 Feb 2025 12:05:06 -0800 (PST)
Date: Sat,  1 Feb 2025 12:05:03 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201200503.2532357-1-surenb@google.com>
Subject: [PATCH 1/1] alloc_tag: work around clang-14 issue with __builtin_object_size()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	keescook@chromium.org, morbo@google.com, justinstitt@google.com, 
	surenb@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Additional condition in the allocation hooks causes Clang version 14
(tested on 14.0.6) to treat the allocated object size as unknown at
compile-time (__builtin_object_size(obj, 1) returns -1) even though
both branches of that condition yield the same result. Other versions
of Clang (tested with 13.0.1, 15.0.7, 16.0.6 and 17.0.6) compile the
same code without issues. Add build-time Clang version check which
removes this condition and effectively restores the unconditional tag
store/restore flow when compiled with clang-14.

Fixes: 07438779313c ("alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp@intel.com/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/alloc_tag.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index a946e0203e6d..df432c2c3483 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -222,10 +222,23 @@ static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
+/* See https://lore.kernel.org/all/202501310832.kiAeOt2z-lkp@intel.com/ */
+#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION >= 140000 && CONFIG_CLANG_VERSION < 150000
+static inline bool store_current_tag(void)
+{
+	return true;
+}
+#else
+static inline bool store_current_tag(void)
+{
+	return mem_alloc_profiling_enabled();
+}
+#endif
+
 #define alloc_hooks_tag(_tag, _do_alloc)				\
 ({									\
 	typeof(_do_alloc) _res;						\
-	if (mem_alloc_profiling_enabled()) {				\
+	if (store_current_tag()) {					\
 		struct alloc_tag * __maybe_unused _old;			\
 		_old = alloc_tag_save(_tag);				\
 		_res = _do_alloc;					\

base-commit: 60c828cf80c07394762a1edfaff63bea55cc8e45
-- 
2.48.1.362.g079036d154-goog

