Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEF2C9D
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 13:17:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id o12so11657963lfg.12
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AYl20x8f64eY3Q6M51ieJFRc3attF791Qq3pPAooZU0=;
        b=cLb3S0ykwzyVoc8708XHRRYPgYryU5bGWXLkbayh8hQ+Un/CO5sfcMm3146Kk16CAx
         pHgU4SayyKOs+aagwTRyJTNcVzBZmRdx8bUfxUTjOy6Mm5C7QTVQb+FFKm73ykHWqwTo
         KxiiB/x5ZJ/i1jLRnvShGi37yl1tKPAtIH54w19tg7LbMVty6y9NceGKve3GxZV6oN97
         fEEWbewRQC2Og7Y1JzJu8CNuxaTzaeaDln6H1U+u9W1M//EYsAQxRd06ccuk0Sy0OR+L
         wVKeTQUtotZs/kL7WO7a8kLIld8P6g+1/YwN//75AxYd0UNZNhiFWaSyqzD0KXyuGv9k
         Hqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AYl20x8f64eY3Q6M51ieJFRc3attF791Qq3pPAooZU0=;
        b=5Y5MkUDZb56L5naPepgCTSHuPlk2VVkP7UYI1MFlASGMWOKftoaIc+Ubeayc2svDD7
         vWTEYlL03mo8w8DwJwrdzknECxpMyfu8EFWQmz+rVFckPMtm1LD+uWi/GJqRxV3QkYH6
         xXb95x0uA3AMaFRHky5SLYrGK2jYeB1hv9dtKXeBCb+QQwhVFFkHzW+wgO7lu2JfaLnf
         SQT3Vl/tD9tRUygm3MXEhw6H8YfTMkccrAlj+wDgx14VejVBKKfkXQpxO2TSp7rWGNjK
         ZTIBhdNuZGjVE01O9zi5k1YF/J+r6HDZXwc6o2sNHnsnTGYdwParUP3c/S8zaWQBm57B
         +uDw==
X-Gm-Message-State: AOAM532HaulBhV2e2/fdUfh0tWLWqRZfbqG6hJzbxo9iKe22h5O5Nore
	hGvojjfLT1cl+fjAqdUjd5GbRg==
X-Google-Smtp-Source: ABdhPJwAZ2Q1WGxi7/NXG6VtAjneijeqYVZkjzKgZBOzUxzKZ4f5lAR7n+3sy+lC9puoYXvODnO40w==
X-Received: by 2002:a05:6512:3256:: with SMTP id c22mr6175723lfr.574.1643375847828;
        Fri, 28 Jan 2022 05:17:27 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id f8sm705480ljn.16.2022.01.28.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 05:17:27 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	christophe.leroy@csgroup.eu,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv3] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Fri, 28 Jan 2022 14:17:13 +0100
Message-Id: <20220128131713.299198-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                  ^~~~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
                unsigned long hstart, hend;
                                    ^
                                     = 0
arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                          ^~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
                unsigned long hstart, hend;
                                          ^
                                           = 0
2 errors generated.

Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
always gets initialized, this will silence the warnings. That will also
simplify the 'else' path. Clang is getting confused with these warnings,
but the warnings is a false-positive.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..5172d5cec2c0 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1171,15 +1171,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			}
 		}
 	} else {
-		bool hflush = false;
+		bool hflush;
 		unsigned long hstart, hend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
-			hend = end & PMD_MASK;
-			if (hstart < hend)
-				hflush = true;
-		}
+		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
+		hend = end & PMD_MASK;
+		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
-- 
2.34.1

