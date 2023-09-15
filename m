Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB115487
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:03:55 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c1ff5b741cso23405855ad.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808235; x=1695413035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl8emKrmc/KfUuXy2E3tRAOG2iLFA4b4JMVH2AzKln0=;
        b=JM/3qYd0X9xm1K9ErLvLNP4HxulheviBkroWb1Y6N9xQAICMxJQjLzSY9ww9+XxAUo
         mHWNA04kFqBJ/6Q/vlFfS7tX9dR3ImW38FpWs4iY6+k2KeEs2vjVVfszkgY1iOZMygwx
         mYYwZqUX2G9q3x2Gu0N77o5ZiUQwTMQyeVf6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808235; x=1695413035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl8emKrmc/KfUuXy2E3tRAOG2iLFA4b4JMVH2AzKln0=;
        b=apkmafRxk84Us0gdcGpgGJz1TsnI3Xx5q+QkR39o86pYPcISvVeIiD3iucjCiEnlUr
         oFcOj4J1UDTy/G1eRtjN8NlRs6X20R+cnxUB+F6nwDAQ4x76GUB3z2XAY2Cm1eeCifis
         +Kg4CWOwnuWKualYh0aJSrBR32mqEC1dIzcepGQvgfrsVO2xDjqPC59n5XL3zloDoYNG
         VrrW4yQO9xriumpFPFmc/HJSIYDQHWVq48wQlfqZZ0zINYQvpKQQz1r/rnVu7RO9qyj8
         1pzOsWl4K6h45d3k05Vt3P7XedSK32w963968F8/3HaOpiMevBiY9p9xPcUTaRqhwXq5
         z0kQ==
X-Gm-Message-State: AOJu0Ywgp355Ci3BNRygyicgdGmIwzl+SXPJsh77DqYDwxC+q6c+ygC8
	mYUHxt+PFVhSUcllXD/SuRAdyA==
X-Google-Smtp-Source: AGHT+IF2oW6I05JFC4LbqC0C/xSZFuoVK2mMBPB/lgVhfx8bqpQ8L6rQW3zyLUX7mUdezD2I/Z5UzA==
X-Received: by 2002:a17:903:24e:b0:1bc:6799:3f6c with SMTP id j14-20020a170903024e00b001bc67993f6cmr2435450plh.35.1694808234867;
        Fri, 15 Sep 2023 13:03:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jc19-20020a17090325d300b001c4247300adsm2521123plb.276.2023.09.15.13.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:03:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dm: Annotate struct stripe_c with __counted_by
Date: Fri, 15 Sep 2023 13:03:53 -0700
Message-Id: <20230915200352.never.118-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=keescook@chromium.org;
 h=from:subject:message-id; bh=vOEysGbU/jyBebBE5nHunAiTa99HsxKjPw7GE7dUesk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLip2KpsBUO/hCQjlCTSWf2rc87i8jMHzNeSE
 Q8UaPFCOvWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4qQAKCRCJcvTf3G3A
 JpnJD/44Xz/i8BNUv0MMMNLHpqKkkGXhsnX3/oK7sG9t5GcOmsd2TGoGmk+Mi0lfFizMo1Wu4rd
 D1aP5qTGM3Ufj8/4nIvQUnuJ3fTsDiuJGvyZidtO2mhY4z0sDqDFwq0iWQQEec4kD+wxSGPnSd3
 s+RmtXzI2BuE5DXDc1Y9jCZbMi9sQqJJq3Dp+l+vOGr+ovc/TSK4hL5tLKy3x4pyR+OL9xZbp5S
 OcnrtzlmHhv/+gzQh1TdQXFXKiZP0JpGye/uLGzm/JLBBh4O6BUf1WqE+JuZJXdyxm9IzsWyi6m
 VpTxDakDYjz3OY5vNgdASvDfGeA4tlf0faus+ogRlMXiyFWCpYxfiPCgLjLKd8j/qDY6fNFrfn2
 fMopN7jzzjuDuQKwLvwo0WreafHn/87Npf0vrNSgxxVSIDcn1xagASs2Dc+tzhrhaovAV0vg/b2
 /1k2Oi2JiXX6i+wNfGmUIBmUJC+5EggoLK9bSp8Krg5X9TWkzK5BWxIsEIFy4fChFtGDfPx/zrl
 6RE1NFzGHIuHI/9gkAs+Pd7SzewGh/0sFbi7aEB4mh9lO+nc4NikCrdZsu9L1BNxFCjwPsGL/D0
 CMh9MqgB/q+43pEGchjFoK3DQp3hz1cSDRUDWidEdAIjizb1sw6N5ohw8hOyYZ7YWMl6Jk/Zdfv
 1L0V1+E HhwIYZFg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct stripe_c.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>
Cc: dm-devel@redhat.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/dm-stripe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index e2854a3cbd28..5e70f5ae394d 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -44,7 +44,7 @@ struct stripe_c {
 	/* Work struct used for triggering events*/
 	struct work_struct trigger_event;
 
-	struct stripe stripe[];
+	struct stripe stripe[] __counted_by(stripes);
 };
 
 /*
-- 
2.34.1

