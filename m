Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8CA1B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:14:07 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-573f722b86eso1924265a12.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808847; x=1695413647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oicgvy8ZQsJ/H+s8ny1gZL4bTkfKVCg2IoVNijyvIg8=;
        b=kJn7dTV8+mybcZmx4niDEZdrYFanHl47dfh/gvRJ2lXUlIIhjahIXhCXubAtOvWa4W
         XocF09hvM3T1J4x/EmiwP1UkjTLdY+KZLYvchTl2j1lLG7o2KcU4o7LWHBRPOER9WDiD
         SLv6us6gtXpWtf4+GJ47FIeieudmYjyE7lnR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808847; x=1695413647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oicgvy8ZQsJ/H+s8ny1gZL4bTkfKVCg2IoVNijyvIg8=;
        b=MNRkTg+6egUW4fgKgFDzYu7xICUzYUcc0uUs4isflBKogYYnOsDGHCY7WNL03OXE99
         hH28O6W/ewCPJ3+VPY6zzVIvk7jja2/amGCTxS5MO8V0nAre+bgM2+wefAZMwqwtaiPn
         fuY/MgV4dnC3R19stAm3/+PRb6IJz8SjdpDN7xInBRIsVHfMPtHEpovbU4CS2tFmH1Bb
         aiT1kyDz4eU4b/KcXDe7xnhlN347gRcvgyQEW45nf8wmXNgGF6Umxj/PSdENWTpNrDn7
         P30woCZBaCoKsT+wo18habGjaOn1ZOUqjnVo8V/FRNVEln8wvfjDzOIyOSYWIoAAkryw
         ljWA==
X-Gm-Message-State: AOJu0YwiOxSwxfyjUfhNuMVWBe4dLXxeP7OKf2PRmfFYmc9N0ufO0+cV
	IIBsWPofeZxGdvOtGXSZ4arIjg==
X-Google-Smtp-Source: AGHT+IEfYZ/UgYfdCyr2ODsTNvO+DYWeLrEHu+ivgaehYmkWlq+ooFcHoKRvAx82GGQF2u3fKgu+EA==
X-Received: by 2002:a17:90a:5305:b0:268:81c6:a01f with SMTP id x5-20020a17090a530500b0026881c6a01fmr2702511pjh.26.1694808847113;
        Fri, 15 Sep 2023 13:14:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fu17-20020a17090ad19100b0027498485107sm1706587pjb.12.2023.09.15.13.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:14:06 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jan Kara <jack@suse.com>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] udf: Annotate struct udf_bitmap with __counted_by
Date: Fri, 15 Sep 2023 13:14:05 -0700
Message-Id: <20230915201404.never.574-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040; i=keescook@chromium.org;
 h=from:subject:message-id; bh=BUpk+NqQMMN0qmYWwrmO8FxGwWxEGEYVaPG+zJ06MRo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLsMQJt2qp7TQ1LA96Hxy7q1jthVYf/zpnN+m
 6CUfAwnwb6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS7DAAKCRCJcvTf3G3A
 Jr7/D/9yErTRxAzHaDFDOzE/kRrbYmZ7UQLL6OxblKmIJk2ZNjhDFMvjmBuH9qGGUyuKFVZVNty
 jkmndMLGM7tb6dm0iw8UMVFvNrkZFV0EiHGODAYvPBU7d1oHnykVINhpUzNaHe2LWH0zwnZDAcS
 zzBQJCty+384+FztuKlLv1hAopQ2XSb88RAjjuL6wRs4oVX29cxtUqK6JkdH0e2KjD3Z0RIIZsb
 8lEhJvCrXURb2xbk7wdfEZeYsoWtd2kVxRttuQHckbzpEUrm/MqdGT37LjfEpy74ca3xowvkNwV
 th0vm7VJkATIKsol5ZUnOlFiFNB4V7ebcoUB9Hh+XDdhVYK+eViNiim52AkJC41M069BDtSOENy
 QcyBtVXwG3dmdYqNt0vrYsFo2S2zC/qYY9c9HteiiwN44m8KcoB5XNojWp71FcecOT94VokbyWe
 mY3azzMBACSTYM4iIRfqBG7n5R3/R0OPwzoCQ3O963ohrgUMyl7/pwO9JV0nDDbAUCz9eFwG8h7
 zDVEbAMoYP1fqBqOaTvjGufri6IfzxzoFPUeRgqAgI2CWN226XpMfy6f8cGM6TqN5GkoRqJuHZU
 oTojGtvqPoo8XXIMtTfHBugsyIejsxCebBBoBonJ0yApGKcfrj4Q4zKG+6oXquYnMXA2yRrXosN
 eJT3+x/ OJ9Ye6Jg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct udf_bitmap.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jan Kara <jack@suse.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/udf/udf_sb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/udf/udf_sb.h b/fs/udf/udf_sb.h
index 9af6ff7f9747..f9a60bc1abcf 100644
--- a/fs/udf/udf_sb.h
+++ b/fs/udf/udf_sb.h
@@ -86,7 +86,7 @@ struct udf_virtual_data {
 struct udf_bitmap {
 	__u32			s_extPosition;
 	int			s_nr_groups;
-	struct buffer_head	*s_block_bitmap[];
+	struct buffer_head	*s_block_bitmap[] __counted_by(s_nr_groups);
 };
 
 struct udf_part_map {
-- 
2.34.1

