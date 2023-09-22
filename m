Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590344460
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:47 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c465d59719so21047635ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405167; x=1696009967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ6jwPkyyUPUihDFvg8XivaDrAIcNkn4eIr05k1aNqo=;
        b=jFUs3rLD7sYEg/f+GZ28Q+oioHggK3bNbtyvdkxDY6UufqLPcBtrqhbx8XUSRoJTRF
         0ZGBgJHlccTOugF9jzFC+k0MB/+hvguP6rZZMYftSTioYpoKBDR+3Z/RWtvLystksDD1
         iFUfqWj2jl6aKu9XvDn0H1bxJBcU1SP6u0Tjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405167; x=1696009967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ6jwPkyyUPUihDFvg8XivaDrAIcNkn4eIr05k1aNqo=;
        b=QmE2mfcFsIMhqLSeJhAFqoVAxCYtH4+KCHepNe7W7ziFI2FluNaD0XJe0oB3pbflGM
         spePb0Vw4BefbXm0psZx2Nu/gXT12tlyi3srog/m05RwtSK6s9eYwrpUka23fEqOB3mM
         o8sDw9ldMQkkwW8KRb7vg52kZMdgFYW1ZWuyXPG0/HQ40HYf/UfW4+k0E8L4K+bnF6YJ
         y8SuAag92AqlYvi97xTDeTSROg6xTi6vnO+JdiGyZM6g0SPLRIyV+1VflzBV28KMsURa
         i9mqyZwjoncLek2cS2DmAyFQEEttl24cW28nEtbMtfDBRCGL45t6RKqPlzJAb6guAUqp
         WJcA==
X-Gm-Message-State: AOJu0YzLcEMRHHgWXsY5abr5MEJOmxKJpd8Uullpr4EZc6cXcfOQQYbb
	25LfhKmYLHbIC+gxgLN72Dus8Q==
X-Google-Smtp-Source: AGHT+IHK3gRykvqfXJ9KPG1xk8JjWYE+L3KukDHCn22hNF6awNX8UG77Va89x7qeOpxognyckL1BPw==
X-Received: by 2002:a17:903:2281:b0:1c3:bc2a:f6b4 with SMTP id b1-20020a170903228100b001c3bc2af6b4mr225525plh.42.1695405167472;
        Fri, 22 Sep 2023 10:52:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001c582de968dsm3780689plb.72.2023.09.22.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mxser: Annotate struct mxser_board with __counted_by
Date: Fri, 22 Sep 2023 10:52:45 -0700
Message-Id: <20230922175245.work.196-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=keescook@chromium.org;
 h=from:subject:message-id; bh=EF4J3adktVfobyY2g9VoH112mQT3HIJCM8AoszQv0eY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdRtJNIux5LoCOcVzIv6wUz7ihnbHZEwbcqTg
 pn+/5MuR9mJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UbQAKCRCJcvTf3G3A
 JonqD/sGsiP5krTXtLdtu/hVDGnXK5tfys6LaoqTOjcqrYNSjPh/NIuv/rqHb+YzfzFOJIQRSZ0
 HZAnHwpvjK7E2pSIcUYN0JqqA4DzASGV/MHa6BwsIMeTdsKJuFRECHikDcLVx+bs34ca1C8mVVE
 kGTNZuXBQ5aaYQm2sfBxZeBkBCUeVOOIeoNJMpJe65rhDFGCsiyMfu6y+sLoMI3sx3R03MkpxfG
 ++mCJQEsSjZl+mWB2yZq5aIKwat6HBhE1RQcHfOStLO6M+/0+Q3J89z2MCgj5ds4ZfO3wdXARz5
 kd0TniAInQZRMzjvnFE22IJQk98TOdrKyQtGcKcorlVdFL/Dq+5KbSvICHOCy5L7jgZ/ZPML2B6
 ByKmLs7DzdruyUsPiTvLRK+N0dPZ2QKEYUD/f7HO0gxKU+Uk8ItuJSliYo2ELn5I0D0IrtyiUpS
 /3ie1n/5nWYxVLyqLUYX303LNZSlfOUfn7CMZ0JhOpwZGk1SSpnJnve5oUmjbecse5GZydC8wPG
 5x3YoHeS4t9E6EP3AGmNMq5o2OdQlTdVHNnAHbH6G/9QnTwPvxrnhrKf2wnHO0mHnPsLJB5Wyoh
 qHR9Y99dUyU8+LW0meomOlfg6B6zRuWDbWedOl0gYjzaAI9s6SG9AhW3ZrAHIegVz3nFw/0wv/j
 GwhUkPI DqtPoZzQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mxser_board.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/tty/mxser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index 10aa4ed38793..6ce7f259968f 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -288,7 +288,7 @@ struct mxser_board {
 	enum mxser_must_hwid must_hwid;
 	speed_t max_baud;
 
-	struct mxser_port ports[];
+	struct mxser_port ports[] __counted_by(nports);
 };
 
 static DECLARE_BITMAP(mxser_boards, MXSER_BOARDS);
-- 
2.34.1

