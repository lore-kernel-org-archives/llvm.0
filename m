Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D133CA
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 16:53:06 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-33dc888dc62so50825567b3.4
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc0BD757OBRsWzCUX9oyngIwjPQp+BAyfWqnsfk61u8=;
        b=ioc3m6C5Fm/7qjEnH220M8dI3J7PTpr2dgi5QH5knbwJSaMVZo3DOqoVftmEFc47uu
         W/XNCfPuCaPU/lK8Ubz8O0FeUc0ZkQyUaEisH2Yj+VAgrBTfdxCDRVLbpuDRxFCap6Qr
         3qOBQ5T3dcWgZuwvW97ingzURD8DirZTk3f/mtLpAUdN3kYgDM5m7SvkNzkicBLv7LVF
         Ps+K0ygARA3b8OW44TOQ0TZrvNby3xXW+dp1QmQ9/ckbd4lgL25p6VBIY5KTthYdNqi5
         yqeKNRiFt8o8zVZaa37WDrhsuD9QD1pslQfcD/7KLv71DzgKqUj0KrdUd5zafiWy3L2U
         yHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc0BD757OBRsWzCUX9oyngIwjPQp+BAyfWqnsfk61u8=;
        b=ilGa0MV3aZVAs/KkkMM49mRn7t7bD8D72u6slaITe2EATdyvrpdJafA+pZavVui411
         zeW3Hvr20zLIC20H+UNju8Xo6Ki7vXvsB+wDgI6nnLbhX6S4N+5wTAnznCH1y84diuzb
         9Yi/QqAD88hRbBKRQCbjyfvH3l3oBy+qqZf9Pkvj/GZmCDpD1UYOsiaSD8LDlIu5v/xm
         sxluOMy5EiOIT2rSPDoTgsupywgHVRPcxnnIz7Ii11IGNj14tTrUJP01JZmCWGq5YQJF
         y7YKMdNy/ejXLVxxqhQLES7hRYQgZTPoH3w1CAnXnovWd3RebWKTJ+bVIA4/IEEMN2aM
         RLeA==
X-Gm-Message-State: ACrzQf25X5gc8n87bAjD9f9bVSApj+gdTFzSYgqrRZG5ZxDPXI0N/x8m
	1JJ+iEsh8CxnmEu9HLg3ASNGVO8rCReyxSzhpP4=
X-Google-Smtp-Source: AMsMyM6R/JyO3K9ikaIzjDtG/9LUjuv/rAAlcjNa1CT0oDMtyliH9swRPu7SzFz8mSGv7Rfu1AQoWBRF9MD8foW7/04=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:ff3e:881c:4c2c:b8c9])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7c41:0:b0:6b4:fa81:9803 with SMTP
 id x62-20020a257c41000000b006b4fa819803mr5331099ybc.592.1665766386031; Fri,
 14 Oct 2022 09:53:06 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:53:02 -0700
In-Reply-To: <20221014164756.843991-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221014164756.843991-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665766382; l=2345;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=8HfLbf4qs/mk/4RV44RQCCc8Q6kO5IPcR6SJl0HTqUI=;
 b=ItISVPZeSrDGVs3uBlS4saLOlHhj6pQ08OLur37IOFyLGVWyNIsnXGAvDmo56prRy6IxulxHD1V/
 AH3DpJIBDLDuLrWr+6cIPVK6SM1+HlS2KyrAeWgFOjin7RDxUMJJ
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221014165302.845203-1-ndesaulniers@google.com>
Subject: [PATCH v3] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

When debugging LLVM IR, it can be handy for clang to not discard value
names used for local variables and parameters. Compare the generated IR.

-fdiscard-value-names:
  define i32 @core_sys_select(i32 %0, ptr %1, ptr %2, ptr %3, ptr %4) {
    %6 = alloca i64
    %7 = alloca %struct.poll_wqueues
    %8 = alloca [64 x i32]

-fno-discard-value-names:
  define i32 @core_sys_select(i32 %n, ptr %inp, ptr %outp, ptr %exp,
                              ptr %end_time) {
    %expire.i = alloca i64
    %table.i = alloca %struct.poll_wqueues
    %stack_fds = alloca [64 x i32]

The rule for generating human readable LLVM IR (.ll) is only useful as a
debugging feature:

$ make LLVM=1 fs/select.ll

As Fangrui notes:
  A LLVM_ENABLE_ASSERTIONS=off build of Clang defaults to
  -fdiscard-value-names.

  A LLVM_ENABLE_ASSERTIONS=on build of Clang defaults to
  -fno-discard-value-names.

Explicitly enable -fno-discard-value-names so that the IR always contains
value names regardless of whether assertions were enabled or not.
Assertions generally are not enabled in releases of clang packaged by
distributions.

Link: https://github.com/ClangBuiltLinux/linux/issues/1467
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v2 -> v3:
* Fix typo in commit message
  "enable -fdiscard-value-names" -> "enable -fno-discard-value-names"

Changes v1 -> v2:
* Only update commit message:
  * Pick up Nathan & Fangrui's RB tags.
  * Add link (I forgot I filed a bug about this a while ago!).
  * Add note from Fangrui.
  * Add final paragraph.
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 22adbf89cb31..41f3602fc8de 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -140,7 +140,7 @@ $(obj)/%.symtypes : $(src)/%.c FORCE
 # LLVM assembly
 # Generate .ll files from .c
 quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
-      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
+      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -fno-discard-value-names -o $@ $<
 
 $(obj)/%.ll: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_ll_c)
-- 
2.38.0.413.g74048e4d9e-goog

