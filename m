Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F1364
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 16:48:02 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 189-20020a2516c6000000b006bbbcc3dd9bso4777438ybw.15
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZK2Ju4zSJK/cFpoidH2hzfPFGWx+ElmNubQLi9yMXQ=;
        b=ODM98BgJ/cKX1b/UZJZWr5JmMNrGuznQCVCMo06L5Ss1vTUP23ycGuGpUMPjwuSDKp
         j36q2FVyfTmyxl+/RJbca7QQ40v9VCiLGiqDQWeo0Bd4LUDepGc88Zcert4lHdJPfpDR
         COKUqItbECqRdReNDe0V2UqnP+u+g9lUME5ch1ulxh1KicqbP01tRq5wJrc/231XyPa7
         R9+jLT5Nnk1UHImgA8Fe1p5k6y0qOQc8REE136O/uD1KeJIdGHsylPzXJjfnSEBpavnV
         odxcZndY4511ArXjpnT+W+mbaAjUwnQbV0dYgkPK6uLnG+L2O4SdXweCgGu41fPagJsI
         B76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZK2Ju4zSJK/cFpoidH2hzfPFGWx+ElmNubQLi9yMXQ=;
        b=umh23DPXcmfRaZGSa1Lju6hzfnZw8EnGDnDCTvPnkZ58419uIlcNDlHS1McWVuUOsM
         7MkddxcYBSNjOt4vm6JV2xG4PfQvakpeckzKA6LlbOJaOXpfWitLMkd8bdEF2zO+RMI8
         LdUsHhR7XZ9S4FqSEND9jTRgeEN7pUGSdtERhVi7KllHR9/J0QFOXDnzqzSNKs3e1hmq
         rOqGNyVxhlWqFoZZPFNV6hSgo/vPsyFr4Wb1/9NZQCQnmwdFv+4MMCWRCb8+R0fqKaVY
         RSUVkfAuiEWNZVl8cs+zsI4hbJmFamO3OmmNlV+6IcCCH8cAfDXmELwnFDiNWKGjxV+h
         VEmg==
X-Gm-Message-State: ACrzQf3Q6zvfNi8tH132P38QxXP00FDBvqC1sX2HhEId6DZet39ypvnu
	8WtKjozPiFMapGW0ZESnWMDDogloN/S65NpK11Q=
X-Google-Smtp-Source: AMsMyM5v9kUJtiJrQNAYWu6hHLvOpX+vIujvu+NwJcpv1H+JJe66wf45HAi7nkt9Ldh+JszCV15k0iGrMXtD83KH7fk=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:ff3e:881c:4c2c:b8c9])
 (user=ndesaulniers job=sendgmr) by 2002:a81:468b:0:b0:364:8aa:8196 with SMTP
 id t133-20020a81468b000000b0036408aa8196mr4253949ywa.468.1665766082016; Fri,
 14 Oct 2022 09:48:02 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:47:56 -0700
In-Reply-To: <CAK7LNAT7yY3VL=so0+h=fsefT2QXsKHn4KjCFJ5VtGGkvSRjLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAK7LNAT7yY3VL=so0+h=fsefT2QXsKHn4KjCFJ5VtGGkvSRjLg@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665766076; l=2224;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=8DTYldYpKZ2G8xj/84VezeBfD7KI9kJfAVZPcDwBDkg=;
 b=+Ngjjr5PZ7w9Yvg5XA7ztowz8vknz4VbMPJYWfMddmK/y0ivoHQAWynJyc9xe1DztL5gowdoj2P1
 BW8svoFJCzo84gyAnzQnjhXR+4Up0E0cV9bvMqJhVip6S+oas4Ro
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221014164756.843991-1-ndesaulniers@google.com>
Subject: [PATCH v2] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
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

Explicitly enable -fdiscard-value-names so that the IR always contains
value names regardless of whether assertions were enabled or not.
Assertions generally are not enabled in releases of clang packaged by
distributions.

Link: https://github.com/ClangBuiltLinux/linux/issues/1467
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
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

