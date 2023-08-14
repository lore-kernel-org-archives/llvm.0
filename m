Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE8100AA
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:11:33 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d6411f96b35so3759448276.1
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692051092; x=1692655892;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CMcdRD24atYHQ4ASbvndMrLmRw1xxWMNBnFpR/mRjlk=;
        b=HuqgTRKoklAsdTv01+eJc2nEa8jvomwmVl1Dw8TZU5BWfw9XWQSaI6zrx1ldt1uleL
         DL1DM5ofxEVUFClCMFYhN4S7AHSKFQyDS5c89+UQACDbUfjhjebi8MKjMZT/dqSqLrmp
         r+tKKjojKe4LehRwglg/xrVMe1SR2w04+QM+UkJUsjmylvSbAfmKBsa6F429r2Ot7Cwt
         jjnJPYNk622Xm9zldrGQOd+OHgXNb946EGkZGni8hc4bmcS2ID/VhtdHCosV6NzhmTUp
         83BonW5fwbtL/KkXUrdhF1kOC3rHrU7Nz7fBesTse77Zvxiq6DOQ0zH2lolhnz1vNo2Y
         wonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692051092; x=1692655892;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMcdRD24atYHQ4ASbvndMrLmRw1xxWMNBnFpR/mRjlk=;
        b=bZ82exqylC8vNJmwhZfuSPnsvFh9pN5IBmC7VtStKd3RL0Ie6O8STlzJIag+FhNR6/
         2DPDYOYG0pqYaMLxAIzy7RfMr9vNbqD2GJq77ha1m/QJr6EZvlVD+y4C2cwJel12VnzS
         A7JJsV4ioPL0/4wKAOr5Er5XY3q7QBhJTG8XCHi7faSVnpO0y2ENLVRKEclWtM0l2LWe
         ewybEuByUoiMrbspYfhZrUxd6zmZd39WVRDzzBBfLOW1ogzKA/sdpVNzJnrPbq90mXae
         Plpgf/2j2u0SDliscvrmQdAcF0bmyJhrn73Zzv86wkwcFsamInI5vwM69GIIceet482l
         2Zaw==
X-Gm-Message-State: AOJu0YzmAjpdTfCpSe/eMhxvSjzEYIPBZItstWnNRIH3ESeRzC39NccT
	Kn3/5byZGIrI73bZzbtH/TdV4hy0oAIXii/osg==
X-Google-Smtp-Source: AGHT+IFge6sMjlzuWc91VOTqFOPoOtO9DhwycrLl6JYCuJSnpwiiizAteB6AGo2bWHyHSzmtkYNWoxff+qRYMspZeA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:b190:0:b0:d4d:564d:8fbf with SMTP
 id h16-20020a25b190000000b00d4d564d8fbfmr146274ybj.13.1692051092011; Mon, 14
 Aug 2023 15:11:32 -0700 (PDT)
Date: Mon, 14 Aug 2023 22:11:28 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI+m2mQC/x3NwQqDMAyA4VeRnBdoq6LbqwwPXZq5wNaOBIoiv
 vvKjt/l/w8wVmGDW3eAchWTkhv8pQN6xbwySmqG4ELvZj9gLZIwqVRWQyuEypktGuqnPOTNaLs RXmc/uhjGyRNBa32Vn7L9P/flPH/3xh9OdwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692051090; l=1743;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=wIdErpsOv+ezc2N3195w2EaGkvC3nzErvAaVNhdk/Rs=; b=QvPWejA1W6dyxCS1W8dn15uDJwEG3gwju4x31ItwOpaH9xtSR+GXhgUPir79VMcQJMlD7Z+Vy
 yJZvZwaPECSBBH9pvOyco404PO0xKNU2LexES3A6CKLz0bnRKG54Hp1
X-Mailer: b4 0.12.3
Message-ID: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
Subject: [PATCH] soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast to smaller integer
|               type 'enum pd_types' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|        193 |                 add_special_pd(np, (enum pd_types)id->data);

This is due to the fact that `id->data` is a void* and `enum pd_types`
has the size of an integer. This cast from pointer-width to int-width
causes truncation and possible data loss. Instead, cast to `uintptr_t`
which has the same width as void*.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: It should be noted that there is likely no data loss occurring in
this case since the enum only has a few fields. The narrowing cast from
pointer to int will not lose any data.
---
 drivers/soc/renesas/rmobile-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 912daadaa10d..0b77f37787d5 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -190,7 +190,7 @@ static void __init get_special_pds(void)
 
 	/* PM domains containing other special devices */
 	for_each_matching_node_and_match(np, special_ids, &id)
-		add_special_pd(np, (enum pd_types)id->data);
+		add_special_pd(np, (uintptr_t)id->data);
 }
 
 static void __init put_special_pds(void)

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230814-void-drivers-soc-renesas-rmobile-sysc-98150a2571cc

Best regards,
--
Justin Stitt <justinstitt@google.com>

