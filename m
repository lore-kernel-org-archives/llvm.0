Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751E2918
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 20:41:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so7961325ad.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692304911; x=1692909711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ON/HA/SiAC88+rr3DCSUlZBZfTPO/sj9aPfYnbMZ8/I=;
        b=ifRrRqspqYAUIBinX8EYU5JbgtyYEe0y4++wffwIl3rt37oHl/+RgqXM9breR7rX+q
         krMpd1nlz1emlA9qgmA5K/AbEGtrPLxs8quv32j0w09bYPp83eCyD3jEacb9OQlUOGqw
         75KFySlFi9RG5JrdT+xGx+imQzbkm09/bZsSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692304911; x=1692909711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ON/HA/SiAC88+rr3DCSUlZBZfTPO/sj9aPfYnbMZ8/I=;
        b=YAiD77MRm05uSldgd2kzMzV5M9IzOTEpeQQ7OBUQWqrtDj/HVC8jppQpCrM8Y/1U6+
         JHqZVk3T0waB4h1LOH37FiuqNUAEc6l+ejl4Q2qFPe+q0kvdKK6egQJTsglcjC7rcf7d
         veiDZWyvqxe9MHG2nt2CNkkT1ItYRi6zLILghQfsVxm99QxM0OSXTz9MnJGE8tlCKuih
         aszbpBcAaoqWzcBs/3KqLRitebptsF6SSukVxBXqN1gyUqpBQi7u/subd7xpkpfRri5b
         i61yUqVZcaVZiIhYcdF9AktsmO1e5fXzSNmiEVUjJOqOKbaOimfdO2QBQXoInNUNzO2s
         7BXA==
X-Gm-Message-State: AOJu0YzKL9teBeXGOVKe7PS1Nu+dvoazBNiOZ2QMVKlYkCmC1A3mrtkV
	nUmezMMfemzJRSxzSchQJ/hBqw==
X-Google-Smtp-Source: AGHT+IEixP8k42UxWzyK3z3mcCEOHUwHxuIqvnvfev8H2rv7kJis4nPd/Y0Gk5spob+OtZeOX4JsEg==
X-Received: by 2002:a17:903:234f:b0:1b8:a936:1915 with SMTP id c15-20020a170903234f00b001b8a9361915mr489582plh.22.1692304910696;
        Thu, 17 Aug 2023 13:41:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw20-20020a170903045400b001bbb25dd3a7sm183467plb.187.2023.08.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:41:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Georgi Djakov <djakov@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	linux-pm@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] interconnect: Annotate struct icc_path with __counted_by
Date: Thu, 17 Aug 2023 13:41:47 -0700
Message-Id: <20230817204144.never.605-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=keescook@chromium.org;
 h=from:subject:message-id; bh=GhnqOj5xKp4EZEn1rfER9M+dGNFJZhUCFss3oBsydI0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3oYLDqFtQnXUx50zr9QOolW/NLep8d1dsSx0k
 Wckz4fh3piJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6GCwAKCRCJcvTf3G3A
 JoJaD/sFm5t8BZrqSQzCw5/FVGoKyBL5QTsGTijXgA925uS5duD0gXBXcCcTT8aywtqgVBs/ZbZ
 skPWWlbIIWzalIc6snsWyyPwn5ho6fdWArF0Vm66IPXsbaF6UmfLITZm0EqXiMooiq1IxYjYjqA
 ZiF9FqpoHIlMW6fP1miZC3BAHFl6TVquIwXgiOitQn9BUXZEWLg8HfyYWTEn24ieXuQ6SYtaPkQ
 dg2aVGlI8TtexNZ0ELkV5QJymzFRC4MJgq4Z1EHBH/o1B35jE1SikZ5oKgNRCRG5T0lmMOP+UFV
 NI51WZiah10mT0iudsdM5YVGFF57Tddu2kpYvFYt5Oe9k01jzm6xm2yRxDPBK0bT/Hlwyu9ZMfk
 K1JLd3hZZ7cjG5tP2lrtsEd3Rg2Ne/dKeVt0DuA2rC7+NePaMwpD6k3knc4Xx2osA6q2LvzUHx3
 1ma9IcXCzMiW0OUo06nSBHrCBwjZ4c153OaMMQXt58WyyLDM9tIwBcCLAzW5iycKhwHc+BUF3VC
 Xwzts8qtX8jGPnnSctUC+pQ4mX8F9WV29UQQiQxq+FfY5QJXAOtFcGQS6F4zlcqipwCo6huO7ps
 6NKvF40Rvz2A4IOUKKQNDpG6Wd/LqM3gQkZDd7J7JsBpL1/EAKGv6OfI/BTKQGi4lLxIOm6wFf1
 iKBkAU0 rxCThuhQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct icc_path.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/interconnect/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/internal.h b/drivers/interconnect/internal.h
index f5f82a5c939e..b30856db523d 100644
--- a/drivers/interconnect/internal.h
+++ b/drivers/interconnect/internal.h
@@ -38,7 +38,7 @@ struct icc_req {
 struct icc_path {
 	const char *name;
 	size_t num_nodes;
-	struct icc_req reqs[];
+	struct icc_req reqs[] __counted_by(num_nodes);
 };
 
 #endif
-- 
2.34.1

