Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012A610E
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 21:55:29 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id h9-20020a256c09000000b0069671af62ecso25892ybc.4
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=koezPCxm32fHAwZgdGqKK7XqmRXL9JxASzrYTVD4m+E=;
        b=JSacEPUoej5v/XIN7Hsi8+T5GHAejPEIXTMi6W7AKQLC5hVqZnvtkNAu5BK6krzUQx
         fctP5X9cs9aaG7Slukq3widQl5Sz3Cg4B2+9Ms/40HHHiPhW+ORwgrMpQFg4g2DD6vyP
         nsbocmqQcPUoKOu9GBsszyWW5Y/9pcHmD1tong6jGdtvxt1q98M9IMk9vq27vD9xYIlm
         X5YII9Nz1tn+CVFWxqczzbj3f8cmmHd52JOITZuOclM3trrztiE9Anovjz5avPkqa+tl
         mNVIYYwqwAqyxAbBXm25Fyh9l2MDmpgRTRoUJ5NAd2cCa7cVJSAWyrMN3tEzDgFbbiIe
         6TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=koezPCxm32fHAwZgdGqKK7XqmRXL9JxASzrYTVD4m+E=;
        b=2U8rt1oo5jMdn4zDhfa85kzrETutstuGQJPHMHIn8N+2j9a6ThEj3FfgsNLVDXLBDS
         c/46jBDrAjkAHAHCdGZIYJ6R4t2gsjzHeTxP4SNXIqaxpnL36bFLrhq+N9hBwHKF4SzQ
         HyXzp/xy/dz4Ixp5hvqYdH6hGkBkTmxhlGMeAjK/7jnTviEJHfDICT+NT5nuSf/o8Ttm
         Kg1zQMrr05fQ+u8SKR8Gq6Y9tOD7hvMevqwSslmu0YfpgwHKuoRb8AWrcUiWR72eaXyL
         2+Ac/pgmgVQOsnDxDltPeci9DUpqAY0+xWOqe1LWNPebPLP8HNARVVx7YD4av03GHfY6
         HBsQ==
X-Gm-Message-State: ACgBeo0nWKglk9H48RkvTr0A7AoeLBIYqCdL9l4J8UYZQQ4pUliEpUnL
	EA1KceRQtf7SdM94DZj+6/mZyn5Zfp5VrUqmqeU=
X-Google-Smtp-Source: AA6agR4f3SYEc+Bp0TdIuCv586ybfdJDVN30qGCNPGKAFJMjsSrHsBG3kNu8QkrrVyppevzh+B3tK1Z4CU58zsMdLI0=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:a4e4:e6ec:9fdd:1bdd])
 (user=samitolvanen job=sendgmr) by 2002:a25:3486:0:b0:6a1:881a:5d86 with SMTP
 id b128-20020a253486000000b006a1881a5d86mr8937712yba.323.1662674128390; Thu,
 08 Sep 2022 14:55:28 -0700 (PDT)
Date: Thu,  8 Sep 2022 14:54:50 -0700
In-Reply-To: <20220908215504.3686827-1-samitolvanen@google.com>
Message-Id: <20220908215504.3686827-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220908215504.3686827-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=samitolvanen@google.com;
 h=from:subject; bh=jyM+rGxWUU219XYY5/O2nBNl+QplLQ4hASchurrzdpo=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjGmS0202vID3CXZ0XLmebB+d9NIzgSUGtOWGy99hv
 ue7C0ruJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYxpktAAKCRBMtfaEi7xW7lPxC/
 9lKOPhgsglfXR1fj5L/0qgYqxVBFIG9R2MnXno1UwVmdTTRPq0bkQzscG3ZpD7ATu2TIr53T1Edqxa
 yuQxpw1bh5TSssxhwO6IU7t5pOMBdP86oaYB2aEUoAFRLV16cwaX3ei3GpZl9y/mD9QGlDzconUw2f
 JaNKLMZshc/LblHCMDbxS8I8wIe8AEjCb5QEIxM7P9I2wAPAxx4/4mDDj8ivfGS3tzIMF1EXYYFkv0
 wHyzUefM39JrhnAXhKtJ+5JSsakAbxyGBuFX31X5YeQhoOvbR/eqylaRbt7Tej1510BlgG+zIxM4go
 U3JlUJiPPvWfW/rych3iQYkqRHFcpJLtgshmb3HaA64wvo2hwTTFK82MJeP2qDRxZJPY8gDK0dR0v2
 UxktEOG6eZ4oLvqy4bI1mp5dfETqiJ16qfIZ7BPnnCOG71n04ZjUltD6AAhj6pPHqMNHNYVnnUdFS7
 OThfxGxDoCPjO+/PYXGv9Mn7QoeBz+hDGxY9/SQR8lC+c=
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Subject: [PATCH v5 08/22] psci: Fix the function type for psci_initcall_t
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Functions called through a psci_initcall_t pointer all have
non-const arguments. Fix the type definition to avoid tripping
indirect call checks with CFI_CLANG.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/firmware/psci/psci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index cfb448eabdaa..75ef784a3789 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -274,7 +274,7 @@ static void set_conduit(enum arm_smccc_conduit conduit)
 	psci_conduit = conduit;
 }
 
-static int get_set_conduit_method(struct device_node *np)
+static int get_set_conduit_method(const struct device_node *np)
 {
 	const char *method;
 
@@ -528,7 +528,7 @@ typedef int (*psci_initcall_t)(const struct device_node *);
  *
  * Probe based on PSCI PSCI_VERSION function
  */
-static int __init psci_0_2_init(struct device_node *np)
+static int __init psci_0_2_init(const struct device_node *np)
 {
 	int err;
 
@@ -549,7 +549,7 @@ static int __init psci_0_2_init(struct device_node *np)
 /*
  * PSCI < v0.2 get PSCI Function IDs via DT.
  */
-static int __init psci_0_1_init(struct device_node *np)
+static int __init psci_0_1_init(const struct device_node *np)
 {
 	u32 id;
 	int err;
@@ -585,7 +585,7 @@ static int __init psci_0_1_init(struct device_node *np)
 	return 0;
 }
 
-static int __init psci_1_0_init(struct device_node *np)
+static int __init psci_1_0_init(const struct device_node *np)
 {
 	int err;
 
-- 
2.37.2.789.g6183377224-goog

