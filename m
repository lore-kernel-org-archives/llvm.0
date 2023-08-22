Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343EEA8
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 06:54:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c06f6f98c0so12872605ad.3
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692687250; x=1693292050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve676d4JygpyiEcrPI+SQ2vixWRAfUQkdAIluX+ykhQ=;
        b=ebGYjVszLeF1umCyRN8bue0FD0Em8Za2f27t/3K0loeow5Jr/tJ/vfHVqXCOxPas/i
         zK0DIDUsshJfYNZKsHiE6XhuT2GvkXFW01Ah4Jgkh5gxu9taufca8BsoEnZSxNwRjMPo
         DKDA98HbHpWgAYP2Heckvb4ngKpcFbgYrr+FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692687250; x=1693292050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve676d4JygpyiEcrPI+SQ2vixWRAfUQkdAIluX+ykhQ=;
        b=RMGVdkrProVMQu68wf41b3gxme2SGIAdpudnRXDnAAd9NG1ZsWHOQnoh6CRXigbMXc
         cKehZOXOr9WXjEf2OILjbZs8nV37Q/rZrE8wMzcX9qUkWULaImlxetpTMKqLRi1o5cNM
         u43OpduPyI9deHpt8MaG+hdjU20l7HH4XNicKaaNQFCy6vaLtyw9fysajpNYSmYGAVpD
         LRlfgIL5++PZ4WVZoz8LvtcP1DfnrZYiJItmYRavha/EuOZjNu+F2fC7ka5uADojtjFf
         m8XI7b9VRaTynyFmHBVpdFCz8u95vRqkeCuHENnWXHoPp/QPuT0I0VTQGLPaVO6/IXSO
         8jDA==
X-Gm-Message-State: AOJu0YxvAnERmf+82PhogNY9CPZLeOPWA/OSsf8MhfUs3xr7NM2HHIvR
	0dLF1hNGX0f07PV9UIIahndtFw==
X-Google-Smtp-Source: AGHT+IHyoDY2eU7axzNzBSKrXJY9J7Jjb+Z+v7SE8quHZ+O9dYs3Fz6aKcjheAS9j0V1v5qFdeJknQ==
X-Received: by 2002:a17:903:44c:b0:1b9:e81f:fb08 with SMTP id iw12-20020a170903044c00b001b9e81ffb08mr8315927plb.55.1692687249792;
        Mon, 21 Aug 2023 23:54:09 -0700 (PDT)
Received: from localhost ([2620:15c:2d3:205:c79b:9f4c:f1d8:4659])
        by smtp.gmail.com with UTF8SMTPSA id u7-20020a170902e80700b001bdd512df9csm8219663plg.74.2023.08.21.23.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:54:09 -0700 (PDT)
From: Denis Nikitin <denik@chromium.org>
To: linux-kbuild@vger.kernel.org
Cc: denik@chromium.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] modpost: Skip .llvm.call-graph-profile section check
Date: Mon, 21 Aug 2023 23:52:55 -0700
Message-ID: <20230822065256.163660-1-denik@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.llvm.call-graph-profile section is added when the kernel is built with
profiles (e.g. -fprofile-sample-use=<llvm.profile>). The section holds
metadata for symbols beloning to other sections and hence doesn't need
modpost checks.

This change fixes the kernel build with sample profiles which fails
with:
"FATAL: modpost: Please add code to calculate addend for this architecture"

Signed-off-by: Denis Nikitin <denik@chromium.org>
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

