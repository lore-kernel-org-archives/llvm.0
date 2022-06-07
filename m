Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76003320E
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 22:20:52 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so8614931pjb.1
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OAR2/RmOjZbYj98rO6ac1mg+RH5GE5HBqimT+k5kjhE=;
        b=M3MPEpZWkUQnUQtZkqtKjHgTaFJPCuP8yD6txsdbih3NMKLrTcEvP0q/avKLCBU41/
         /3puSqoegNDh7Vw58ZqTAqzFQvXNZo4vjupzMO9x6vGIuef2mPLe7QDoK12FQf8TRNCU
         QXDScL4D3ps9PbPDGeE2keSpUqUtL0+rZ+N+gpkGis57IM+IWoIh39TagtQ/5ncRsRFB
         rUvPu3HI3WC7nwKIGFJgWkBm9tDiJ/IAkD64f5OZO24Fdg3LlE9AH/BANr5RyATboyZA
         RGUeSYZ4GkusZ++xgV7AaoVhJFjcoyb3Xlm3XaDEUfvY6itgyXI7eYERZqVVaMGoHmtS
         VyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OAR2/RmOjZbYj98rO6ac1mg+RH5GE5HBqimT+k5kjhE=;
        b=3eELfMxNyYQxATiPmnGNvrKVCAGV8pljzuparolOaULaWTJWIIgTslWTkOIrkbSrap
         WhGC3WFEUc8kQDfm+KchvM1WlzkJn0K73pBGf4ZuHmmlSjRlfjXiD2eHHDTY5a9i2Nw5
         fZ69RwgG3fbxHUB+jfhWOSYpy0KHy+hO9MKtsPZbOmsSOGAEmOwIWAHxgSit+u+SD2/i
         V3krcE75uST3uy5FolVtgWtYi8DZtW8NPebh6dwEMR1H3XPrtonRKaxtm3Ck6fb8kPtm
         uDlCBNszJR0nsc1fxrd59RzjsQtc+wEZcMVLaKrsaUSn6JY7rjHZfIid6hgNklpizTke
         MoYw==
X-Gm-Message-State: AOAM532DwTTv0IOoT/cVOhiK1wKuGJDw0cXIuqc5BtPWjpqtrroGGYSk
	EEKKZ0em+Bda+KPaAOyxH2+4k1riL3f0jOLu
X-Google-Smtp-Source: ABdhPJwXcISX0IOahOjg2aruo+uAMtXRJD494uIGO8TUrweujgZqug76VqTpGVNJXoGSOVg1tSYsMA==
X-Received: by 2002:a17:903:1247:b0:156:25b4:4206 with SMTP id u7-20020a170903124700b0015625b44206mr31259117plh.146.1654640450835;
        Tue, 07 Jun 2022 15:20:50 -0700 (PDT)
Received: from penguin.lxd ([2620:0:1000:2514:216:3eff:fe31:a1ca])
        by smtp.googlemail.com with ESMTPSA id p10-20020a170902780a00b001640aad2f71sm13286969pll.180.2022.06.07.15.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 15:20:50 -0700 (PDT)
From: Justin Stitt <jstitt007@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Justin Stitt <jstitt007@gmail.com>
Subject: [PATCH] include/uapi/linux/swab.h: add __u16 cast to __swab16 conditional
Date: Tue,  7 Jun 2022 15:20:06 -0700
Message-Id: <20220607222006.22719-1-jstitt007@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

if __HAVE_BUILTIN_BSWAP16__ is defined then __swab16 utilizes a __u16 cast.
This same cast should be used if __HAVE_BUILTIN_BSWAP16__ is not defined as
well. This should fix loads (at least a few) clang -Wformat warnings
specifically with `ntohs()`

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <jstitt007@gmail.com>
---
 include/uapi/linux/swab.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 7272f85d6d6a..f6be3f2e6fee 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -102,7 +102,7 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
 #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
 #else
 #define __swab16(x)				\
-	(__builtin_constant_p((__u16)(x)) ?	\
+	(__u16)(__builtin_constant_p((__u16)(x)) ?	\
 	___constant_swab16(x) :			\
 	__fswab16(x))
 #endif
-- 
2.30.2

