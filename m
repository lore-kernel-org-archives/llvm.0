Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A97D2CA2
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 22:53:53 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i186so1123186pfe.0
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+pKKCwBmXwixtezUzkoUFu3Bjm5w2GFf0XFCVfe4NYE=;
        b=BSLBftoM4FBOwJIrrSUvQhhd8q/l6qwpDxC4+lYOdxVS7gE3KTFk0g6cR5VuWlBnI8
         7TGZAWRmC8rxSfM2XxC+GN79gkKAUuW5L8aOoj2P4xwLERLmHJqXkmD0O8xU46wTetlf
         QpY9wNDNQaybTXnJc20cy7ZvREc4seheS5vLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+pKKCwBmXwixtezUzkoUFu3Bjm5w2GFf0XFCVfe4NYE=;
        b=5I2ne1RMjEqUvZDi++nFoxYcRBZX6/1ouadYK4j+T/c0IJ+TbSMYyn7/syBGewku5j
         J6Zgv2gzoFPAsispSX5QqeCnUj642H98Z+5QJMrRLuHLH673BjCLofdob1lUPJGI2kiC
         hCEb4gjBlZngGMKY+5L+Cq7PVTKr79SMtjYrSdBApkp2pHYNbdxY9AnNJ7K/yuYe215w
         nCIFbevXaq7tVK8pV9ZRC+Dh1Fh4SAAN3JXUKm+rSUAKs6mevnDLF1srkQFJrfOvslgn
         CPKe4kVa32HpnpZpyi+mO6s3SSZRq2psRf35jYtPIpefPcVAg9G69gtN0wvI/2hse/7R
         48qA==
X-Gm-Message-State: AOAM530DzR5JQmw+A3ZG4NMjUvJ6cOok0DMeKYlUsLQGm1g6bHhdjynw
	L6WucSNENRpc4HvLNUd7LZfzMw==
X-Google-Smtp-Source: ABdhPJzuyEJSfykyY2X6LvGI8Qwd5njL5RebiT2KjXy8Eg9W36r33e6nxoZ7Rb153vL9teh5S+ytGQ==
X-Received: by 2002:a63:4142:: with SMTP id o63mr4460395pga.425.1644360832858;
        Tue, 08 Feb 2022 14:53:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e13sm81432pfv.3.2022.02.08.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 1/8] fortify: Replace open-coded __gnu_inline attribute
Date: Tue,  8 Feb 2022 14:53:43 -0800
Message-Id: <20220208225350.1331628-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208225350.1331628-1-keescook@chromium.org>
References: <20220208225350.1331628-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; h=from:subject; bh=Eo9tS2UC27BhEc38Fb5maI8Xw9SIbrqr1SdHCXEzltg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiAvR8NbP/P/ugB3o7Sr5ko4fT8kp9TzEABb3gzrl+ Q/TrGw6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYgL0fAAKCRCJcvTf3G3AJjfiD/ 0digkvloRtIZnQP10cJ2S8RI7L9o2TPFJXmVyJMLSBZjHNuQgZ4d8direF5MFpr1mRONoLgReT/oJM Fl4Erd5fiE5dq2FegA0gESQs4dFsZ3DarOG6jhTnGmPCDRJRdZW94bF/rUE29ZwpzU26sV4F7wG6uI BtFX7BKbRxTi5Ff8LtnbIElHKXdfw7ixUribBPDScuVF72Ak2dhGFRpxzPdLgYS+vRws2KRY5uEp1a XdoX9Tq7hNfQopX8ztz1/KAjoaV9NKs7I/Oh4nXpDzlq1rlbKH6UcSDj8PGDcyu2BNCzBcrnOqZzxL rCu+eC/UBXDVUiNanSjqI8f+39MYu1DhVurJwYDoG236GtjBsZKNsbQII4GP9kQDE+GTNECSXZGQSH wGU7eQLu79w5rAdUV+lIU+m2LCHsGN4JdpB1GKiaMvgez0uEA3cQUEQYuLy+Q/OPEL6ssfTlLE8IVY s4dXcLi0wP5DBfnNZUa/VLlLJX/uK9lr8UyayPWR3RUmIz9NhhRVYvdG29HToxlodiLno9RhYNIoXt 9DX9iS5f9/0rdmIu+PsiE+S3vCUJ+P+B+cf5qkrlfkVLLHtdZQMKTadkkWw1JyMFreFZjxGjZlU2UX Ss6ERhyUXgMpzsGBji+TRbqoWD8TtA3DiRjJPNduJzxXZuUiVG+6HOaqYnRA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Replace open-coded gnu_inline attribute with the normal kernel
convention for attributes: __gnu_inline

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 53123712bb3b..439aad24ab3b 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -2,7 +2,7 @@
 #ifndef _LINUX_FORTIFY_STRING_H_
 #define _LINUX_FORTIFY_STRING_H_
 
-#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline))
+#define __FORTIFY_INLINE extern __always_inline __gnu_inline
 #define __RENAME(x) __asm__(#x)
 
 void fortify_panic(const char *name) __noreturn __cold;
-- 
2.30.2

