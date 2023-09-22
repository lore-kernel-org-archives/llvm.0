Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747864447D
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:30 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34fdbda09bbso8069735ab.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405209; x=1696010009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7N9zL7GcWxQk4sQJZqxoMP4/Uw63fJhbgd3Z3vvMbM=;
        b=liPVDSd7mCMO4R0T0S+WDi3EhE4+eTya2dwtcjYCDtGrFlvmvlbV+63SOjj+HWHvFi
         qAhiPT3K84qujDdTR2Sw2QS92ZZNH4ZKqpUO4VHHVo1lrA8FWVcgx93JefZbD/XqdNJC
         ezKhR6ruQm9QIQcIi4cB1oZ5apwl5SitBdAjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405209; x=1696010009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7N9zL7GcWxQk4sQJZqxoMP4/Uw63fJhbgd3Z3vvMbM=;
        b=cglHCoQ126P27wBejc5g0XCNwg6Ilqd8S/5/jUx3HQTF96l7mX4WhnvcuGrCrSvZqs
         1MiqX/mrCTyUoNLSI1Fv6zMbTjgEutXEXqWd0GtEMbMllpJwizELTc3wSb0FK/53Pf7t
         OJgeRab4LxkkhCMUTq47ReJ1PT16nzJbSZSippb38Ql5BYTlZmpxAitwwbumrz6xuYzx
         TaeZfU8HGbWxZ2F8/QrC8AG75hvRfiZ60Ol3engsZf+8yrAtb5Lgn/EjmrhOlTmJ2euF
         wkWYdNWwbnW5kxo/JFSU+xoXW71YHRF8P8Fy338QkQxJ4aJftS9wpc6YifQFHTMprlxE
         sfjQ==
X-Gm-Message-State: AOJu0YzKHgUpQPXkilvN0GWslc9crilvhVWt3H1yD//x/yIcc2Ed91R7
	AZVlp7GJ0opnE3BQP1sLzXlvyA==
X-Google-Smtp-Source: AGHT+IFcsVBI4XpXdu09CAhRSEPvj7L8KAU83Z9CrHaDTIyiVJ8tFCIm+4+9IS918fem4DoKo/0vZA==
X-Received: by 2002:a05:6e02:cd2:b0:34f:c996:48e1 with SMTP id c18-20020a056e020cd200b0034fc99648e1mr294450ilj.16.1695405209559;
        Fri, 22 Sep 2023 10:53:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i10-20020a63b30a000000b00577e62e13c5sm3052365pgf.32.2023.09.22.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:29 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Shakeel Butt <shakeelb@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mm/memcg: Annotate struct mem_cgroup_threshold_ary with __counted_by
Date: Fri, 22 Sep 2023 10:53:28 -0700
Message-Id: <20230922175327.work.985-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366; i=keescook@chromium.org;
 h=from:subject:message-id; bh=AoVPdbNKBfdH25pODHoRQQXzdXsjHToILrw6Ygq9UYw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSXi8xZrKuBxnaY/CAFiAsKEpAxUSuI0fKv8
 Aihbo26O82JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UlwAKCRCJcvTf3G3A
 JqknD/0UAAXFhz9wIylqjWR7+KoW9lAQVkKZFkjYdo3rRApozaEbVm5ss1cPuIgk2y9PE1Jfu7D
 yL5pqwseOb6BkFm52CuFR5ox3Wqx38f1QGnGlAMPzzR79pbm7txMeOtRGSelgiAEji0Yd4q13iv
 mxTJ2FOFmqTEBhVKnIYIZxwMVYt+ZTp4851Fwj0V1lmKw0LluTCbr/SlUOFUgXUE9Q55U4fN7p8
 k4gFsHTeCNWC1qC7JNdtpiUzQhNTgkWGSfTTQmmPFW1dfNNQMY/X/hCkrE8lr25us2BGHcXKctV
 sJk2SmX2u1+HQTFkvYAXsZpHnWP8Rjyg/7IoaPDGA8R2HQ4/4vKnGyZffHX5Hxu98q29l93JHk4
 KZ6Q6PNKzWaD2vnZy61iz2J8+6II9JM7suWxBHEYFpxQqgU4k/KF4JknHZfSw7Q72vgEZjbuqt5
 ng+YtQ/zKEe6G07KhIgFWHvb6WDo1C1O0ZsVCxzbgBl2GqL8SYHj2QidGFIwwa5U1fMY0+hkjWo
 fCwHgr6IceHQVw/bDMgUucKCWi/+3mS+16+WoPi7v/wJY28HWX6g0gP/ocwdstYWfGUlwCkP6lW
 DpbIGU7g1KG4QPx/Jh4LPoGLQfE4gdEhQsTKrj56HIvlonjMmG0OVSN5Nh28NTEq9U2NlHeRQaH
 pvv5FKB U1LJHI+w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mem_cgroup_threshold_ary.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/memcontrol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 45d0c10e86cc..e0cfab58ab71 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -143,7 +143,7 @@ struct mem_cgroup_threshold_ary {
 	/* Size of entries[] */
 	unsigned int size;
 	/* Array of thresholds */
-	struct mem_cgroup_threshold entries[];
+	struct mem_cgroup_threshold entries[] __counted_by(size);
 };
 
 struct mem_cgroup_thresholds {
-- 
2.34.1

