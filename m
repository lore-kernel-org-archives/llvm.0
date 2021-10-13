Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A972
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:18 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id z130-20020a256588000000b005b6b4594129so4077341ybb.15
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=d0myA17I+7bzLvfYc8WHo0j2jMBEdMbw8i8TN5wyosE=;
        b=IU3puBL85zj6Lx8k4sxk1Vw+UZ6n0eSMGWYdDv1HWpAXtehTLImiKTIqNI8ZzKWioc
         xbaEb9HE2+3N/olyHG5DVJLiXbVoy0RO2zUjcSarVnPNKEcgdKzM3cDxTPJFmh4PlC+b
         ldsZU8MjooW18ndQoHH87+8/Nuo6wlM6oH2aome4v3bBD7Edom65JnzvsVOTp8a7nAed
         Rp4Sm+0/cvPA3aDMSFrMaDfOBHSEzhGzJClJCQmvjBAtPBZ7jRWoXXyBRk8YvF9hOw7O
         oZ3k2eNIWusXbwJ8H2QpYVeDxQT4vRxeLHjR7/djcxp/tjqb4McdBXKezl/BNfwDYy2/
         wfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=d0myA17I+7bzLvfYc8WHo0j2jMBEdMbw8i8TN5wyosE=;
        b=04Y1Xr6LLTUwNW1FvpMcbasq4PDoJ1xli3TbgP+Y/WntglSk2I9upENYZbk0pnIM/L
         w3JIc+g8OD/M/G2PFCphdrZQknv23mVUgq/+MIDOq/o0x5tWlRVISymZ2uvMKgaSeotE
         qmDAYkqtm5v8t37cMX9g4HGbL3iXmWhJTK8ZxXJOSLrFFRqBNCnz05vamYVAWWLj+u+w
         HRHf8ZJlamh8N29Gg4gIud8Etn8vugoj6mOYFAah05nE9vMxW1PdmFbOJQgW5zsBzJnI
         OXS1ilru9harRy+fLVsrbWLC+/fh66L6UEGMYGRkBRswpvTmbU4vnvnB+LL99mpqfR+3
         j+IQ==
X-Gm-Message-State: AOAM530tEg4ugfHFqCRquP3XYXfKVChocz3TAZmMhsQONg1PHTGApNKn
	kWlgWW8WVTEUY+8ItNB5AJYW+2e/dpzvUuWXbMU=
X-Google-Smtp-Source: ABdhPJxLofLw24b6KvMkb6/9IfjRE3ce7HS8wD/+pToqpEp8bcshKcziZt+D/7ShfGQQfccqAkKGNoZFIxuIjeB6ZBA=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:2456:: with SMTP id
 k83mr938311ybk.415.1634149037711; Wed, 13 Oct 2021 11:17:17 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:50 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; h=from:subject;
 bh=O+PaBODm9kG+zFsWMVfjJTxNTAynccnVKijauL7nZZs=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKZHb4In89UMhF2olHlFGx0ZeS0I2mAiB4jtqJV
 2JFSlHeJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimQAKCRBMtfaEi7xW7lC7C/
 0Sbg2PtH7Pl511XtaTsCmo5QTlsiT11zPMwNMKZFjvfs+Zwl6eRCQuD+xiyyk4trIYyM5GQb3uQlSS
 YnvMpRVXK36rC1oommRCtB/94BDa2DvfQy7i86807BVBUH79CfVaGYHXckT8OP3tqaGnOxOvzVaT3F
 +X8RB8thB49j+gL4DjOODm5pzIlh+3OH+WjaLeHgY9sKjHM2uANWABcTHnJa094vL6CBoGx449aNZ6
 +EUTS9HaqcL+t+8APLql7yjP6gR57DmzDAAskjz6gGv/64g/N3622JQ4XMV6bcgzohUIK5hIBTHUSJ
 11VyzFRULvgWkc96JEQHHf942vLVMciwgiEz9vIOlbNQC7L75gwmLoWE+pPRfmpA6NvwAjy5e8sv8y
 ACaTfL6pG86uCqQortI9EWay8zCj2FyTcZdH8dpOnRoSmGTodcqdcBmADYh2a+dWKP5YoZKhNHm0g3
 oL0rNliTUkp3ZAktvtEh3ZsFC7VZUML8ePWx6zPhnDZho=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 07/15] lkdtm: Disable UNSET_SMEP with CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Disable the UNSET_SMEP test when CONFIG_CFI_CLANG is enabled as
jumping to a call gadget would always trip CFI instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 drivers/misc/lkdtm/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 4282b625200f..6e8677852262 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -367,7 +367,7 @@ void lkdtm_STACK_GUARD_PAGE_TRAILING(void)
 
 void lkdtm_UNSET_SMEP(void)
 {
-#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML)
+#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML) && !IS_ENABLED(CONFIG_CFI_CLANG)
 #define MOV_CR4_DEPTH	64
 	void (*direct_write_cr4)(unsigned long val);
 	unsigned char *insn;
-- 
2.33.0.1079.g6e70778dc9-goog

