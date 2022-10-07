Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6707E1
	for <llvm@lists.linux.dev>; Fri,  7 Oct 2022 20:32:41 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id f9-20020a25b089000000b006be298e2a8dso5619275ybj.20
        for <llvm@lists.linux.dev>; Fri, 07 Oct 2022 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H5PXFuGO6LsvTkGWSyH4IIntX/pmrPgQBzEpfjypKsw=;
        b=kNHjn6x5hUfuwCtRtaf+cYbg52QTq7S6GaEZitIAjgKwdSB3u0cm0l4Z6cQKD87jUI
         7G35Df2pOwo9gMegtlSck62AyJCe/hQYv41mG0jr5PlAfqmsxJ6cNbn41KEX8eK0jdAk
         x00IK7IRfBlhy98VPZbjK0kKoaNqW/+apqS1HiT9CgaBtWfZpXvHBTNzCCO71Xgtsxwz
         tJcPDlCgmP2sGYhAzqtCk0MkIyVJN8Oe7CbnUo8EpzgQYIM63Z2IbcoSqN3r/6cIXyS8
         YVq7TDHTpzUCi016DXCol0Sa1pUcq5lk7P3ZalJgZxc6tcDSo29XOspe2BLCNt1a5pXn
         FQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5PXFuGO6LsvTkGWSyH4IIntX/pmrPgQBzEpfjypKsw=;
        b=7JI1GAuro58vx1jyREt+sJiUm0t35CVbn0gE5l5CYr3Y6OD1oXc36SzAU+B1FnZ+yP
         qZBw/q5xkXvTFCrdtJV1agUbqhKJBr74EkkbOJ60Pphk8DIWmC3dXheOp/04HmUiEoMB
         6lx/1042vSmTAmfZvWHBeTmwrtR1tccnKU+Sh0ovWNQ+BX9Z8mX/T9n72LKXNrkuYKrB
         YGbe5KclT64XfL/XcUzi/L3ZwwVCPK3hOvPrQDvYAnWwUWj5dhI+F1Tf3fl2drWio9QI
         yRr56dl8xc9TErust6j+woBwemueZ46L8hQe12uNb/MTdXpb5R2W0yB8lXfpXqxfmvFO
         8m9A==
X-Gm-Message-State: ACrzQf3rpMYvC9H5kbxXLGPlXROB4Mj1FvbxrcPh2EFi1DPxN/MaicD3
	9luPmRH1ImwJabc1IG7zMTKO7NUw3IOXfU+liVc=
X-Google-Smtp-Source: AMsMyM5xkodeESX8Qe1smo5uI+0KcKPVRF8fNmAe7oJoszCv7gYXUaxSXjbqe03Q4+THi22jagWiUXAdbj+BsGqXHJA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:35a0:96d6:8c4e:f207])
 (user=ndesaulniers job=sendgmr) by 2002:a25:8a8a:0:b0:6bc:e04a:d340 with SMTP
 id h10-20020a258a8a000000b006bce04ad340mr6415762ybl.549.1665174760237; Fri,
 07 Oct 2022 13:32:40 -0700 (PDT)
Date: Fri,  7 Oct 2022 13:32:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665174756; l=1716;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=TzGJay1lXQMdgQA/ZyjvCG6BrJE34h1xkzf3M2zsIDQ=;
 b=GirJqyZImL21fWOg762M3V4qsRhWN8goTG9W87OS1Xjtj8APnccjbNLrKgsb+Bz7D+7np/E1o89C
 EmDaEm5BA81mqRB58hnAPO8IdaObGngDH2RIkMQBUmPcBnuRdCgk
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221007203236.1750890-1-ndesaulniers@google.com>
Subject: [PATCH] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

When debugging LLVM IR, it can be handy for clang to not discard value
names used for local variables and parameters. Compare the generated IR.

Implicit Default (-fdiscard-value-names):
  define i32 @core_sys_select(i32 %0, ptr %1, ptr %2, ptr %3, ptr %4) {
    %6 = alloca i64
    %7 = alloca %struct.poll_wqueues
    %8 = alloca [64 x i32]

Explicit -fno-discard-value-names:
  define i32 @core_sys_select(i32 %n, ptr %inp, ptr %outp, ptr %exp,
                              ptr %end_time) {
    %expire.i = alloca i64
    %table.i = alloca %struct.poll_wqueues
    %stack_fds = alloca [64 x i32]

The rule for generating human readable LLVM IR (.ll) is only useful as a
debugging feature:

$ make LLVM=1 fs/select.ll

Clang defaults to -fdiscard-value-names to save memory when generating
LLVM IR. For debugging purposes, the improvement in readability at a
cost of more verbose IR is a cost we're happy to pay.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 27be77c0d6d8..d0e4f476dfee 100644
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

base-commit: 93ed07a23fd08b8613f64cf0a15d7fbdaca010fd
-- 
2.38.0.rc2.412.g84df46c1b4-goog

