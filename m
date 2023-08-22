Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70832B545
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 17:49:04 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-56a55c0f8b1so1739051a12.0
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692726544; x=1693331344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjhjUhDDffkOIUaZDJIu5PrTOrHAFrTP4TrU/Wpefq0=;
        b=IljsDgrISbgSERcWxlAwIMfYZ/0cSg9rQLJSpMlXud+ssJK7urVfIOeX92KgfkqQ9+
         Qro/WVUCsjbbScLCXco5FhRWVuxOGVaKeT07QM4JO09n60XuHx1Q391GnnRwbMEhY48u
         pRXHgQxT9vNRyMSTHvVjm1eJqkpj/V5KdH8Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692726544; x=1693331344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjhjUhDDffkOIUaZDJIu5PrTOrHAFrTP4TrU/Wpefq0=;
        b=LaTSNd1+IVzF4pcCv2xoIO+v85pWLuJW2boEGSPt0FM6gDlzldjekvAofpAeMmeV2h
         dOQKQeYECvve2XeR+zHIx93Bi2iOjVJuZdY/JXH2NAwds8E5ShjuHrz3JJPkRevDHswZ
         CQoxsV4ir7aj6kDlDdiYrcxEV6717PAOcGwEQ9V0F7MQQ/1c6H5Gt2R22frfO5xDn5SV
         kAYKXTjirr52llGb5Pxi1ohr9lMbf0Hvwj4v4Hjz5aNfQLUtBC+Sfmkb5uGdJGltS8hc
         umttNUCh28djUyBFNUEnyB4HaKOq0tA+W+OdSqWWIB6NXM4kioUsjUF19ntwfm7hCUVD
         W74A==
X-Gm-Message-State: AOJu0YyBLuhKpXQ+mprPRpv7NSH1qneBUeDah1jP/w5UALkZVqL8J3sR
	ZjMG7VytHlAJv6baRxMsKpX6fQ==
X-Google-Smtp-Source: AGHT+IHdnPPtB09/YhHDM1CEZhegP+sfv2Vtsp194uiz+xZX2iHZXkAcgQ1rKhQ26Db+dyAQ9YbnTQ==
X-Received: by 2002:a17:90a:db08:b0:26b:3f10:820f with SMTP id g8-20020a17090adb0800b0026b3f10820fmr7055221pjv.36.1692726544092;
        Tue, 22 Aug 2023 10:49:04 -0700 (PDT)
Received: from localhost ([2620:15c:2d3:205:cd6c:a3a2:6d96:d21a])
        by smtp.gmail.com with UTF8SMTPSA id a17-20020a17090abe1100b0026b76edd607sm8222696pjs.15.2023.08.22.10.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 10:49:03 -0700 (PDT)
From: Denis Nikitin <denik@chromium.org>
To: linux-kbuild@vger.kernel.org
Cc: denik@chromium.org,
	Fangrui Song <maskray@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
Date: Tue, 22 Aug 2023 10:48:34 -0700
Message-ID: <20230822174835.253469-1-denik@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
References: <20230822065256.163660-1-denik@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.llvm.call-graph-profile section is added by clang when the kernel is
built with profiles (e.g. -fprofile-sample-use= or -fprofile-use=).

The section contains edge information derived from text sections,
so .llvm.call-graph-profile itself doesn't need more analysis as
the text sections have been analyzed.

This change fixes the kernel build with clang and a sample profile
which currently fails with:

"FATAL: modpost: Please add code to calculate addend for this architecture"

Signed-off-by: Denis Nikitin <denik@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/mod/modpost.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b29b29707f10..64bd13f7199c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -761,6 +761,7 @@ static const char *const section_white_list[] =
 	".fmt_slot*",			/* EZchip */
 	".gnu.lto*",
 	".discard.*",
+	".llvm.call-graph-profile",	/* call graph */
 	NULL
 };
 
-- 
2.42.0.rc1.204.g551eb34607-goog

