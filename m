Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5761840
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 07:27:53 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bf3a2f4528so5760035ad.2
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692948473; x=1693553273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlXlLHBoW4dTZ8FthLBS8Kn5SzBMbKV4fH/qmyBs2dA=;
        b=GuK8FTdQFStQBrc/+UrZlObuHDLb/Z8HolfK7+I4/Rz8Cj9OtCekENJ7pG3OpGAlIb
         IRPgrHuLapXBWD0Rems1twDE6slppU1VDXMdMgWBeASnEeZXpzW1NrCUckmmp2WNmos9
         JaJRtKhaR554bCf3Cpx+Jfml+7fx91n2y3TAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948473; x=1693553273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlXlLHBoW4dTZ8FthLBS8Kn5SzBMbKV4fH/qmyBs2dA=;
        b=FWIcaSwQxlpbnBdTGM+tUQhYvj5IMowD5SAxgWLefuQdzxOBrsW3kI2QztnVl8Gpsv
         fiLgQdALQPO4PlPUHkHe9Fl7hF/Lp5pRCZuVbACb8r5Fo+KKxUS6EqzYtccL3p6OLuPQ
         0szFn42cIBbwGxHb/Pbe7advL1JhLuKhDk6c3r6w+BIWCbenn3Jbd1eLCDLqF9wlmTGc
         eg+N4Scq0m2AmXoFooJlm63SwDQonP5Y7zfLnAUlhrtB58MZ14cUsFjMhmHR7e0OqDRq
         1b7+gPt67X+s0keJjO/ENsFtOO806ySuh5Mjrp4++tc1rSnHn0N6updGuW34vnX2tZOS
         RK5Q==
X-Gm-Message-State: AOJu0YzbY+ReJgygSFe0So6SaKLmJVY0fuOCIDCrZB6ykPCMGnWjQRMm
	Heyy39SQdQnAxX/V+Mf7qPb07A==
X-Google-Smtp-Source: AGHT+IHDwVITh4CP16FgpTedCa7AJLG3VbgEE5V/d8qOuRFFHo7iLtE66cCg3HNHXSdYwFnDkZi6VQ==
X-Received: by 2002:a17:902:a587:b0:1c0:9abb:4873 with SMTP id az7-20020a170902a58700b001c09abb4873mr7736874plb.64.1692948472928;
        Fri, 25 Aug 2023 00:27:52 -0700 (PDT)
Received: from localhost ([2620:15c:2d3:205:b8fe:79ca:c6d4:645f])
        by smtp.gmail.com with UTF8SMTPSA id t8-20020a1709027fc800b001bdcafcf8d3sm948242plb.69.2023.08.25.00.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:27:52 -0700 (PDT)
From: Denis Nikitin <denik@chromium.org>
To: linux-kbuild@vger.kernel.org
Cc: denik@chromium.org,
	Fangrui Song <maskray@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3] modpost: Skip .llvm.call-graph-profile section check
Date: Fri, 25 Aug 2023 00:27:43 -0700
Message-ID: <20230825072744.1322656-1-denik@chromium.org>
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
Note that .llvm.call-graph-profile intentionally uses REL relocations
to decrease the object size, for more details see
https://reviews.llvm.org/D104080.

The section contains edge information derived from text sections,
so .llvm.call-graph-profile itself doesn't need more analysis as
the text sections have been analyzed.

This change fixes the kernel build with clang and a sample profile
which currently fails with:

"FATAL: modpost: Please add code to calculate addend for this architecture"

Signed-off-by: Denis Nikitin <denik@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Fangrui Song <maskray@google.com>
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

