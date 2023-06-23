Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3361160
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 00:11:48 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1b6681255d6so156505ad.2
        for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 17:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687479108; x=1690071108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vo1O88LBn12GePGGmuhdEP/k87jpAuHnXHVbobu4PRQ=;
        b=QksAuYQ4h9HkiWUUDuUJe286BNS/KxSd9WfVtRDqdPoNN9R3SdorrFx4XiozyaaNG7
         Rb8GIkwqVwR0lMbldf+pOEFtxPakHz9Zizvom7UKdoWLLi5HCtAoIBcbLhEu3x7JI0EF
         q8YmN9W2MVTs0f/67FbgxFfm1i6YOJ+ynwnLsu8VEVI+ARdpUGz0vXwxmVY/DdPJyU4j
         CXoSh0ehZHdwKxkNmjS0wQ/6y+KuhZsG0uXdbaVwWahEY/HgR6pc23egaX89uG1CExlM
         CV0acJV5vk2D9HpYijnsHbuCykfCGu6WCWzCrk7XS0hUlZAy85YXtaRPg8jD8qGp6BRs
         OCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687479108; x=1690071108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo1O88LBn12GePGGmuhdEP/k87jpAuHnXHVbobu4PRQ=;
        b=Z2nDnuTuCbnoFbjdNFWdx0RXrqw49SUXJgy/FC5NLXGtT+PKcEPiiqGZK+UleYRxBA
         Eor5Uvc1/zRkdKB6g7D8G0g6hBEbJOGwHlc+KylQL6iMnu6gsroAAEOrotEdx8hYbzCv
         lF6OC9HiSWE0DF0BLCgqoHKSfd/oK9Nguq9w8Sj+O1+jui/oChU5EKfX0N+Qfw4lykY0
         /9oxNtmMWm4lpbCzdaD4wcBSVBNrerYDhDbV9+DhFCGch0Qw0ejGHAzWBqX6l/sjVb2b
         0Af0ld5RxFzWvqNqUPQOUNtiyZqZe4LJ0JvGbvM+E7JhaUsTvVEEwYZm+hVkq6fHX4t1
         JKkw==
X-Gm-Message-State: AC+VfDyN87KgzLzqyvC8gDjSlFu9vPOW32OAf639+LVviBCTi9lUeKvG
	0zewQiFI0CK9ha/6Q64rgi8sEGKuvx8m66HKhe0=
X-Google-Smtp-Source: ACHHUZ4OnEboURrAFGT5NncSVmStBjl8m7dSDlpD9av6g2qjlhgFEguEOrde8Lesqms2juJvliUkzAJKrOlFaDLLv14=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:f811:b0:1a2:3436:4119 with
 SMTP id ix17-20020a170902f81100b001a234364119mr2901699plb.8.1687479108018;
 Thu, 22 Jun 2023 17:11:48 -0700 (PDT)
Date: Fri, 23 Jun 2023 00:11:43 +0000
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=samitolvanen@google.com;
 h=from:subject; bh=vz8JtYFBMZ6JrswVYldeog2RjlQc50BCAyUkbrZYc88=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBklOM9pyZClW2Hp8UbFrWSquBEPCjWlPQquZ198
 cauUcsQF4CJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJTjPQAKCRBMtfaEi7xW
 7vh7C/42zRx8PHZksPRLtj/W3ew78/fa4rX9uyohW/fQWdFjU353MF0DOlLvB+HMwvd2ScZzNJc
 A2Q59WjNYMQI66abJdyKo53NSJaFpKE9jUguxSMEbg94h+97MmLb+I783T1xWnA9/s5XAyXy2CG
 6vTmjFnSter4GgvRm/1L2a/Xr4xfsfpr2cQSe5moZKEN5w6z2SjKp/xUuvFkd6b+3Uj7t5jf7U9
 Eg/3aV4wP3Ear17oOZ/56pcr7tuFb7RSWTyBcFkaoE6OUSfkk4k40eI1kwyqGaQCMdWB3YxWxjd
 Koe2LaCPMhC+vSRPiwMoRwSntCi02YciGfW+S7XXKUt/CazCfkNcSPcjqtOUt1Jah73z/j8PkSY
 ODqPGiSGUHMVQuUcKK+LHaZkpr+EKJok+pFYvu2LlREZVJeiCL0fg2q6Vro/M2AX1t2XtJH869U +eOKmEGBoBmH2K5IGBMFShQFH5V+Xtj0bo6fwZ45aW3fGOdeffsUXqNzzrS9lRYwBcIzo=
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623001140.1111494-6-samitolvanen@google.com>
Subject: [PATCH 2/2] kbuild: Disable GCOV for *.mod.o
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Joe Fradley <joefradley@google.com>
Content-Type: text/plain; charset="UTF-8"

With GCOV_PROFILE_ALL, Clang injects __llvm_gcov_* functions to each
object file, including the *.mod.o. As we filter out CC_FLAGS_CFI
for *.mod.o, the compiler won't generate type hashes for the
injected functions, and therefore indirectly calling them during
module loading trips indirect call checking.

Enabling CFI for *.mod.o isn't sufficient to fix this issue after
commit 0c3e806ec0f9 ("x86/cfi: Add boot time hash randomization"),
as *.mod.o aren't processed by objtool, which means any hashes
emitted there won't be randomized. Therefore, in addition to
disabling CFI for *.mod.o, also disable GCOV, as the object files
don't otherwise contain any executable code.

Fixes: cf68fffb66d6 ("add support for Clang CFI")
Reported-by: Joe Fradley <joefradley@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Makefile.modfinal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 4703f652c009..fc19f67039bd 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -23,7 +23,7 @@ modname = $(notdir $(@:.mod.o=))
 part-of-module = y
 
 quiet_cmd_cc_o_c = CC [M]  $@
-      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI), $(c_flags)) -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI) $(CFLAGS_GCOV), $(c_flags)) -c -o $@ $<
 
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
-- 
2.41.0.162.gfafddb0af9-goog

