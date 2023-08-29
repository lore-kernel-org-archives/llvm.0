Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E929AF
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 22:33:17 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d71f505d21dso5526696276.3
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693348397; x=1693953197; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f3Uqaf7Xdq87QJbcbsD/JQ7WkpbbghInYeZHjvSLa7c=;
        b=N03NyCX2otB6LxC1Xni607SvVGKjZ31BQNZBpe+Z65vu2TCpT3Jcbv3N483EoRVoco
         XDqauHuUsceWG5PrrNDxV0eMLWYRnoqDyXrXu7TClxHkNDtXGp+GgovysDI6oHlwt985
         wdDEKPGzpwn7CvCjCIvs2jI6tlyBhlEaSpvbrrf0Tm3XJnn96qsAiuIovbn2hHvuYnTk
         /ZQddnvul+VO2aJPMJkDlZ068QnSISQjTbpTD1oTuOEXUWaG9zES8irq61gY7qaHoH1V
         LSVvVgzkSfCHh4Fm5CmCeJb2uafqS2Q7oY9tZm3zYfU1WiYcghF+Ut0erBdBNVVZ8nNs
         nqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693348397; x=1693953197;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3Uqaf7Xdq87QJbcbsD/JQ7WkpbbghInYeZHjvSLa7c=;
        b=ZdVC7EEPL5ndfTkx6ywM7/FtsskM/b1olJeddfta57mH6f8S3Q2O9rQc25XKvsvN87
         /wkayAEXMvGfIOuAudciZBOotWZUs3ZYCg7kYQEUWWmW22x1wqSIWuPdV9EolpTshCcE
         oCnwyLXnIIR+aHNejfbY1joy2HGjiKgn6sggVTEv8dqqDgr/tXRZb1Yi690/fnuOzaZo
         TUT2tIUsExjlV6dhbDm7TjJWEBGtFQA9vrNfnx8A9Ewr/6r82Lh+61ctrK/Ad8bpb/64
         VwP0BGdUGh6m0MZ4LkhJxIqBQdxphmp0Xm33S+9IRfqSurz3sOi+nHuMRzfyUHSSZIN8
         XE1A==
X-Gm-Message-State: AOJu0YzKiWuxb0GSv+xxnqFUOA0eK/ww5Ej51ZA1YfA0fTPzVA1HdNXS
	hQ+gf/8Np92oh0TgryQe7FUTwCIAFpvWyaJgkw==
X-Google-Smtp-Source: AGHT+IEnfzD+T0cSW0V5H/fYq8A8EMdVkEk5E9ar2uRElbuG6NqrXLM/mxkK9EzS5UFAl3pyzFAQF002k+XpiAhb7A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:d715:0:b0:d78:f45:d7bd with SMTP
 id o21-20020a25d715000000b00d780f45d7bdmr15471ybg.4.1693348396843; Tue, 29
 Aug 2023 15:33:16 -0700 (PDT)
Date: Tue, 29 Aug 2023 22:33:16 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACty7mQC/x3MQQqAIBBA0avErBNKJaqrRItBpxooC6ckiO6et
 HyL/x8QikwCffFApMTCe8ioywLcgmEmxT4bdKVN1epObSzCYU4YPblV4eX5VLYzZJpJI7YWcnp Emvj+t8P4vh85eJw6ZgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693348395; l=4211;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=I6F2fIqIlcJQToBelI//6sVIGj+Aum8oPdtHBUFjRxQ=; b=rjOSrqB2U5F2u8lAtMC2Qg2CpVmhLlXSkx6nb9JEFKFF0b45aBQrNBeJPPwIV3pzvKtRreEOw
 GG6MfzJyn/oBouokVCrykZ/PgcUOdXswkEaqTW33dlTU+ihrtbXHhDs
X-Mailer: b4 0.12.3
Message-ID: <20230829-missingvardecl-audit-v1-1-34efeb7f3539@google.com>
Subject: [PATCH] x86/audit: fix -Wmissing-variable-declarations warning for ia32_xyz_class
From: Justin Stitt <justinstitt@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building x86 defconfig with Clang-18 I get the following warnings:
| arch/x86/ia32/audit.c:6:10: warning: no previous extern declaration for non-static variable 'ia32_dir_class' [-Wmissing-variable-declarations]
|     6 | unsigned ia32_dir_class[] = {
| arch/x86/ia32/audit.c:11:10: warning: no previous extern declaration for non-static variable 'ia32_chattr_class' [-Wmissing-variable-declarations]
|    11 | unsigned ia32_chattr_class[] = {
| arch/x86/ia32/audit.c:16:10: warning: no previous extern declaration for non-static variable 'ia32_write_class' [-Wmissing-variable-declarations]
|    16 | unsigned ia32_write_class[] = {
| arch/x86/ia32/audit.c:21:10: warning: no previous extern declaration for non-static variable 'ia32_read_class' [-Wmissing-variable-declarations]
|    21 | unsigned ia32_read_class[] = {
| arch/x86/ia32/audit.c:26:10: warning: no previous extern declaration for non-static variable 'ia32_signal_class' [-Wmissing-variable-declarations]
|    26 | unsigned ia32_signal_class[] = {

These warnings occur due to their respective extern declarations being
scoped inside of audit_classes_init as well as only being enabled with
`CONFIG_IA32_EMULATION=y`:
| static int __init audit_classes_init(void)
| {
| #ifdef CONFIG_IA32_EMULATION
| 	extern __u32 ia32_dir_class[];
| 	extern __u32 ia32_write_class[];
| 	extern __u32 ia32_read_class[];
| 	extern __u32 ia32_chattr_class[];
| 	audit_register_class(AUDIT_CLASS_WRITE_32, ia32_write_class);
| 	audit_register_class(AUDIT_CLASS_READ_32, ia32_read_class);
| 	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ia32_dir_class);
| 	audit_register_class(AUDIT_CLASS_CHATTR_32, ia32_chattr_class);
| #endif
| 	audit_register_class(AUDIT_CLASS_WRITE, write_class);
| 	audit_register_class(AUDIT_CLASS_READ, read_class);
| 	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
| 	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
| 	return 0;
| }

Lift the extern declarations to their own header and resolve scoping
issues (and thus fix the warnings).

Moreover, change __u32 to unsigned so that we match the definitions:
| unsigned ia32_dir_class[] = {
| #include <asm-generic/audit_dir_write.h>
| ~0U
| };
|
| unsigned ia32_chattr_class[] = {
| #include <asm-generic/audit_change_attr.h>
| ~0U
| };
| ...

This patch is similar to commit:
0e5e3d4461a22d73 ("x86/audit: Fix a -Wmissing-prototypes warning for ia32_classify_syscall()") [1]

Link: https://lore.kernel.org/all/20200516123816.2680-1-b.thiel@posteo.de/ [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/1920
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested.
---
 arch/x86/include/asm/audit.h | 7 +++++++
 arch/x86/kernel/audit_64.c   | 5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/audit.h b/arch/x86/include/asm/audit.h
index 36aec57ea7a3..fa918f01333e 100644
--- a/arch/x86/include/asm/audit.h
+++ b/arch/x86/include/asm/audit.h
@@ -4,4 +4,11 @@
 
 int ia32_classify_syscall(unsigned int syscall);
 
+extern unsigned ia32_dir_class[];
+extern unsigned ia32_write_class[];
+extern unsigned ia32_read_class[];
+extern unsigned ia32_chattr_class[];
+extern unsigned ia32_signal_class[];
+
+
 #endif /* _ASM_X86_AUDIT_H */
diff --git a/arch/x86/kernel/audit_64.c b/arch/x86/kernel/audit_64.c
index 44c3601cfdc4..190c120f4285 100644
--- a/arch/x86/kernel/audit_64.c
+++ b/arch/x86/kernel/audit_64.c
@@ -63,11 +63,6 @@ int audit_classify_syscall(int abi, unsigned syscall)
 static int __init audit_classes_init(void)
 {
 #ifdef CONFIG_IA32_EMULATION
-	extern __u32 ia32_dir_class[];
-	extern __u32 ia32_write_class[];
-	extern __u32 ia32_read_class[];
-	extern __u32 ia32_chattr_class[];
-	extern __u32 ia32_signal_class[];
 	audit_register_class(AUDIT_CLASS_WRITE_32, ia32_write_class);
 	audit_register_class(AUDIT_CLASS_READ_32, ia32_read_class);
 	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ia32_dir_class);

---
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230829-missingvardecl-audit-493e36f2aa84

Best regards,
--
Justin Stitt <justinstitt@google.com>

