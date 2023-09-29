Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C746667E
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:04:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5859b06509cso975459a12.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010676; x=1696615476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1v3O8Y0CLFHcIVug6/xydUDIhYw4BbQ+Ux1bHhPShA=;
        b=AeO0bxklbx6fNifa/B+my1jtB1K8hOMB7KcJu8pmuMYM0H4lEoxnYCA3BdiTKyg9HS
         koev2YJLBqSDOw9586yQr4qQVkq6T1b+KDFDaZ5nzm/ldH8ooLcay2wVP0DjA5sISCSI
         dj1xOyioxMOEBsp9QUF1WxRyDYTOPPFBoxohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010676; x=1696615476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1v3O8Y0CLFHcIVug6/xydUDIhYw4BbQ+Ux1bHhPShA=;
        b=kuQYRk+ClYzM+jvICts7L2fpDBfHBrImy8YF/bt69wecw9gZ6GlhG929dR50PtsM2V
         BK9PA3Z7OT5G5gkYrQybLV5sWjCWwtZeuaHmWoobPLE8O/c5EXoOsjuVMLBcSjFDLfl4
         voheLPTb72JvCOaAmoDpBl6WEWQY9CS0oqxG7a2rtZZqIqrwo9tRTVPi2Ln0zQyisI02
         /gjCEsSSc84nOFvLTCEnLtH9bP27KtBqw2DMu3uRY6Q1WobsIh9/hTecTs3/XOZ91Qno
         E6RBvZPHT8N6pExVDE+2mCEu/rRzkb8vOlpHC2bdMcHoS23w6jiIhjeM5EhHOemh2VEn
         RT6w==
X-Gm-Message-State: AOJu0YyGyWUiyoa6DmGBlfaSUXXzVE2sHL9MjOnNwpTEEoZXTgqhPfHP
	zTzkYMiX5SWEjO+ST1avzzYsJA==
X-Google-Smtp-Source: AGHT+IHKYAnhCdsp9/XUAjoT8AOVwZwLCEjfmC0BrAcjWZiOg0t25ONKgJp0Zm+bImAEicHDnkFA+Q==
X-Received: by 2002:a17:90a:ca90:b0:26d:355a:47e3 with SMTP id y16-20020a17090aca9000b0026d355a47e3mr4692859pjt.38.1696010676160;
        Fri, 29 Sep 2023 11:04:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090ab28900b00279163e52bbsm1786686pjr.17.2023.09.29.11.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:04:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Anand Khoje <anand.a.khoje@oracle.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Christian Benvenuti <benve@cisco.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Patrisious Haddad <phaddad@nvidia.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	wangjianli <wangjianli@cdjrlc.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/7] RDMA: Annotate struct rdma_hw_stats with __counted_by
Date: Fri, 29 Sep 2023 11:04:24 -0700
Message-Id: <20230929180431.3005464-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180305.work.590-kees@kernel.org>
References: <20230929180305.work.590-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=keescook@chromium.org;
 h=from:subject; bh=yQF+4e/aqHGB0srQ03GVNPOtQXH2kpsbv4fi3QGNdHI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxGtgBLXF4g50iVq6EwmS+sUwzqICeThKMiiq
 qjLqq6vT+iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcRrQAKCRCJcvTf3G3A
 JmJbEACVWuoy65M7vBgTJIDcKZPUvKhfzgLipudCYXts5TRyUgUktR6iJw19uk3BoRwPxFocyM3
 ExfOcE8LBavCmfabOcJ39ktmgXtRjV58WqVSvO2/j5sSyvKRz7LGsfWAGZSR/DWCjHEAh+VMZhU
 Z8OPkNfIJj7YTE+E9jOGy/F04iicCdFqr8JQa2ewd1laq1+UWvf7EUi1hHFAZJnsJNQz+mmLi0F
 UzE8KI22713mH9lZvekZjD3P4XWexgfHDNfB5dN9IeQL64dQuNSTgKjXi24c05ztrn/fM5MbpUw
 pADkVjP2pObgLKlNZm2IBCmdiay5gjdGOEF6hVKkM6wctvZFLvaJR+C0hHLALyE8ETpnAlI11Pj
 LPkJY48XnA6eqip5rHG9dSFxp+AMmY3b5JwYyobAjt06jhz7rP84urhSYKpr8Yh6/hLBIGxo23u
 70TdBMtN7JrvnKMZ4f9QVTMo7IA2bg+aTqPN5wpsGB9lnVXPRmROUU/uFp01np3OeFDtkP0klBD
 gZDscuQtcb6PUFOnZ0vTXaWFZ0B/BHfq//tDhTWm4Ld8cgX/z7d5/roVZ5Ff1aWEj5FykucrrJL
 vLwSQDrgsIHWx806Gkwz/89heSeoInGCh1noMh3fU8iXAxEfa7W0Vd8ey3taoQsTzjtgAvWSvWg zv8haP9PfQ1toZA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct rdma_hw_stats.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/rdma/ib_verbs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index e36c0d9aad27..79bcdebbe228 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -607,7 +607,7 @@ struct rdma_hw_stats {
 	const struct rdma_stat_desc *descs;
 	unsigned long	*is_disabled;
 	int		num_counters;
-	u64		value[];
+	u64		value[] __counted_by(num_counters);
 };
 
 #define RDMA_HW_STATS_DEFAULT_LIFESPAN 10
-- 
2.34.1

