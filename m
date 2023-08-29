Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39626AAC
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 22:54:19 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-58c8b2d6784so69882957b3.3
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 15:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693349658; x=1693954458; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e68xEwQWGIFsiEZ8Cc18gaSHIqDjDEmFKH1LZa2ZSZk=;
        b=Q30dRK4a3NUgA0LtkQaH5VMu4U0/FZ+NNCxNLOKEVRGg2UX1UqHRHJXiyeyTe5Mvuj
         /o/VQ06MbdU7KQcdZxAwVkCZxQGplpU80dgSb9eQE+t45w4tRg1ede7+S403vH724+91
         Hq1A5wexwVrPZr9AthGIiQ36mXOT/qOlRRAP2vD5UTvS8epBh+0J3tTSdzOHzpMWIMn0
         bJLvWx4QXFn88peot59dFNRfxW4eWXMsrliA2KXBZX/HSByiF2xsY7PkJp7G3wnNJ+4X
         kvsVWVfZN89CwwVRR/P26KptEDublT0+TlZ6To85raQIH+/+m2yBO0rSqATUhOlFTlDz
         uwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693349658; x=1693954458;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e68xEwQWGIFsiEZ8Cc18gaSHIqDjDEmFKH1LZa2ZSZk=;
        b=VvIaOTr+Ey1VE++25JwsomH0Ijq8b8gWYXSnB0cgRvs6AwD7RM7nePX3OIPOT5i5wX
         kJQyapyAD5Bd05GNiowglc3fx6YlemEH9J7RYbKDj0YBMF4UUt2psoJ2HsltytVRP6Z3
         1dDh/gs1HsMWizCJMx6YdEIGkd1cMs91oqtKYWu8qZcKprOMV2wGzXkRlLQ2Ea9I6Fzq
         sHdsH7CsP+3pOQNptnFzIaD/e2fp9KjMlQo7jwE1eBtt4RQ8SfVkUacXw8d2x2BYwizB
         HOU1jIKHDXTJ07siVm1stwYQEidHLHGIqfeNF8KQYQLX+RGOBfYXNJ0M73+ktPj3WWAU
         clQQ==
X-Gm-Message-State: AOJu0Yx/n4XnipXLI2hzFLkqPFQh48gMJXMJlTspRI7TS6hF4g69fUuQ
	essi+j+WbfLIgELx7xxW3EVh/iaxFs6MwxBXCQ==
X-Google-Smtp-Source: AGHT+IG/JIrnHjdG28jE/M62PyLf+scrBP+H4c2KrzTOPNHnnRHb6xVVEKCTM9KuJkGySrjntjf5/M6KKpZKR4Sjmg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:690c:721:b0:595:39a:5473 with SMTP
 id bt1-20020a05690c072100b00595039a5473mr13848ywb.10.1693349658701; Tue, 29
 Aug 2023 15:54:18 -0700 (PDT)
Date: Tue, 29 Aug 2023 22:54:17 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABh37mQC/x2MWwqAIBAArxL73YLZg+wq0YfoZgtl4YIE0d2TP
 mdg5gGhxCQwVQ8kyix8xgJNXYHbbAyE7AuDVrpVozZ4sAjHkG3y5HaklbE3rRqsdSv5Dkp4pWL vfzov7/sBicZr7GQAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693349657; l=2922;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=OwC+B+GNgc9dhPSD7pJZ0/IoryKIdNOlxgB9hvNA1Tg=; b=y+s/2YgZbeoG08PUHIP1YN0Ma9GbAgDoVRah9YuVOgWjsco0/r1VPASpue1GBJylwhBYK1v3k
 DJnXIKRALdPBSCuRD/76EzkmwuuF9V0bo5UhsDkBD+oDpflhrzjIaqJ
X-Mailer: b4 0.12.3
Message-ID: <20230829-missingvardecl-efi-v1-1-13d055a55176@google.com>
Subject: [PATCH] efi: fix -Wmissing-variable-declarations warning
From: Justin Stitt <justinstitt@google.com>
To: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building x86/defconfig with Clang-18 I encounter the following warnings:
| arch/x86/platform/efi/efi.c:934:23: warning: no previous extern declaration for non-static variable 'efi_attr_fw_vendor' [-Wmissing-variable-declarations]
|   934 | struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
| arch/x86/platform/efi/efi.c:935:23: warning: no previous extern declaration for non-static variable 'efi_attr_runtime' [-Wmissing-variable-declarations]
|   935 | struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
| arch/x86/platform/efi/efi.c:936:23: warning: no previous extern declaration for non-static variable 'efi_attr_config_table' [-Wmissing-variable-declarations]
|   936 | struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);

These variables are not externally declared anywhere (AFAIK) so let's
add the static keyword and ensure we follow the ODR.

Link: https://github.com/ClangBuiltLinux/linux/issues/1920
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
When building x86/defconfig with Clang-18 I encounter the following warnings:
| arch/x86/platform/efi/efi.c:934:23: warning: no previous extern declaration for non-static variable 'efi_attr_fw_vendor' [-Wmissing-variable-declarations]
|   934 | struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
| arch/x86/platform/efi/efi.c:935:23: warning: no previous extern declaration for non-static variable 'efi_attr_runtime' [-Wmissing-variable-declarations]
|   935 | struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
| arch/x86/platform/efi/efi.c:936:23: warning: no previous extern declaration for non-static variable 'efi_attr_config_table' [-Wmissing-variable-declarations]
|   936 | struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
---
Note: build-tested.
---
 arch/x86/platform/efi/efi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index e9f99c56f3ce..30c354c52ad4 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -931,9 +931,9 @@ EFI_ATTR_SHOW(fw_vendor);
 EFI_ATTR_SHOW(runtime);
 EFI_ATTR_SHOW(config_table);
 
-struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
-struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
-struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
+static struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
+static struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
+static struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
 
 umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {

---
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230829-missingvardecl-efi-59306aacfed4

Best regards,
--
Justin Stitt <justinstitt@google.com>

