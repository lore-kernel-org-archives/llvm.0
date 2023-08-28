Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5711C15
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 22:25:52 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-58d428d4956so53283447b3.0
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693261551; x=1693866351;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=whuv4S/qXJ8VQLIk5LEoFSmpFljXlYmrEoJuQBk2GD4=;
        b=aEdfAKE2aENnO6tvTzasPUqknc7wJ6diEIJLvmUQxxJpKywDYrFsVaCYoE3h51sd7c
         H+oNWaX4aq3A9uIj9bL7KrPvklouBN4OyA/O+XRgrZAULDLLXXawVpiMY5oabbtF/wrO
         T4Y17/d+q5j7Mm+T/22mbRuV9bHjI2eqFaVVdQSE7hMYmEMWSjjjJb5MbTTUnpKCk0Xu
         7xk5D3xPPMOUz/9r1kmavYv+JGeABhxJbcya7t+GEsGBOZ0ciJaeoY4ZWJy299oj0ESY
         qDYS3ugO2ay3oFwjN3PzQ/KJQjiYf+YEkyAwmBnSaJWMkXK+sjdejHWq2+Umb4RQ3ZHZ
         Q89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693261551; x=1693866351;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whuv4S/qXJ8VQLIk5LEoFSmpFljXlYmrEoJuQBk2GD4=;
        b=Xs1RS8ovQIR663s2u+UfANzmFKhagGdUTMEh2OFdu8+Ks0ijfeh+K1oEvCzBtSi7ZG
         PlRnOa2AdN8PK3vE76HFODBiPAmTQWY2/Y8bqkRb9QaIxzG6EMKZeHZnicHbbKJNIR4q
         Xq8MCEutLgbEZ9tySUjxpQOgC16ny10fkl+25+lZ77EXWPhujrRg7av5ZGqyVfb8NGxn
         UaNOIlLcM0ZhLBg9da/jc2bF4u3BQWxo6Gf2yppsQTIxaZbRwCkCnFRd4bWRYMN4BK7c
         UW1tH0jPv1lfK9vlBQDNs+L6h72IBaEggXuFEYlzIDH67OBHd362/0K+G2HGQR/OFNAc
         a/FQ==
X-Gm-Message-State: AOJu0Yx5qi8GZav0XpX8PLtAh+Ji7WyjyJWiJmyEzHiezSzz+2c2cz5V
	P3NQDSfE2So8nmzUmDt0hyIqfvBjamtkm8z3q9Q=
X-Google-Smtp-Source: AGHT+IE7Nhcb/ZUZVQuQ5+u99sOJ9CdIHBMpQ83N0Fim/iD9z8v4Zjz9mkQBdpgoc9W3GrUHfZjMtDEsE8i0aeHVjQI=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
 (user=ndesaulniers job=sendgmr) by 2002:a81:7653:0:b0:586:5d03:67c8 with SMTP
 id j19-20020a817653000000b005865d0367c8mr899523ywk.3.1693261550964; Mon, 28
 Aug 2023 15:25:50 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:25:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOoe7WQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCyML3eLk4sz4tPyiksy0Sl3LNIsUI3PLpDTLxEQloJaCotS0zAqwcdG xtbUAr2FdoF4AAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693261549; l=1211;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=TGWROu4XNrgfx+3UVHqDnOnYYRlkH/LvjbNZAKHZcUI=; b=XYoq8WEHFYZk0OilZBxoZZDH9/jZiqs7gMqgs5QyaYYkDOElw0g9B4HqjTu1AEVRVmw6fBvvf
 Ta1Q02qYmpODS2FmJeLM2eUD1tbl9vpZGTd9Fq02p9gFPekMg5OCxXH
X-Mailer: b4 0.12.3
Message-ID: <20230828-scsi_fortify-v1-0-8dde624a3b2c@google.com>
Subject: [PATCH 0/2] scsi: fix 2 cases of -Wfortify-source
From: Nick Desaulniers <ndesaulniers@google.com>
To: Hannes Reinecke <hare@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Tom Rix <trix@redhat.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

clang-18 has improved its support for detecting operations that will
truncate values at runtime via -wfortify-source resulting in two new
warnings (or errors with CONFIG_WERROR=y):

  drivers/scsi/myrb.c:1906:10: warning: 'snprintf' will always be
  truncated; specified size is 32, but format string expands to at least
  34 [-Wfortify-source]

  drivers/scsi/myrs.c:1089:10: warning: 'snprintf' will always be
  truncated; specified size is 32, but format string expands to at least
  34 [-Wfortify-source]

When we have a string literal that does not contain any format flags,
rather than use snprintf (sometimes with a size that's too small), let's
use sprintf.

This is pattern is cleaned up throughout two files.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Nick Desaulniers (2):
      scsi: myrb: fix -Wfortify-source
      scsi: myrs: fix -Wfortify-source

 drivers/scsi/myrb.c |  8 ++++----
 drivers/scsi/myrs.c | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
change-id: 20230828-scsi_fortify-9f8d279bf9aa

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

