Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBED6AA3
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 17:51:34 +0000 (UTC)
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-1c8d4a5224eso6956461fac.1
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693417893; x=1694022693; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EYjQFc4xOJMLhqSY/15Eo/bkP9OF+XNV2qczMiBYtL4=;
        b=35XAeSmo3b08eoNjYBiaohcfMzwr9UG19lpp4kaJif/52AwYcenZOnbMKUuU9Kekd8
         QxYZdTDXrtCPU2FU6bE7NNUZQI8MiwXsBrPoAqEr6k7tS+oPbxl8h5qRW21LMsMugfF+
         jNLFpZW72gN0g7461RJMARPlEXK8MU6Yb0J0NF+gTX6VHyLrtaBQR9cVfsFFy1eEyJDl
         GFkLj8iuprqcwNGcFxuUTyYis1/mEwIly+deRM/xkP+X9C84IIY99CLAyynrhF6RcFbO
         Ys6ka4mM2EUaaTvMS2NXHmEkqb53Zob7jEBytMnhQls0+JU5jLU3/kwo8OgHjg0tn/kg
         /xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417893; x=1694022693;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYjQFc4xOJMLhqSY/15Eo/bkP9OF+XNV2qczMiBYtL4=;
        b=crtx4BGSve2R+fuHyy5AelGck27AS4Ou1jBb3sLu43G7QvWPexTJcghPZTsJFfofpH
         g6MHOBL6rkSQdi0unVTTZv42tCdXZgT2arLAXnPKGJavDEcVTe71dAAYV6+dznnlXO35
         SkYYqpJFRvkcA3gvK+TiRggVkIB7Xsh1lHRVlOYEU8xwVTh0FkTGoSdCilXA9EcZpAvd
         WvJtr7eYqiaQtCiS+PnvSXR8k/9vF3PwgRGG6QcNdwcbLpua7SME0iI5QFNtnU6ll65B
         JlwXzH66o9q2+pAhT/5QlQ6kzGQiopQLuX3UmmKmjNdXTIs7biJXAz9ENOdS/5Y0EaPo
         mjQw==
X-Gm-Message-State: AOJu0YynKgW+MlyeIC895rl3qvYccgF4uKWXNL7UR/APh7fRuJd0w+J0
	mLnJlYY64rPci6FzCfaoTligantHrPRXB9gMag==
X-Google-Smtp-Source: AGHT+IGL/3lcQ6hwMvsl4p1gk/LCm0paBP0RD6v6Kz3Tt1iisx7fE8BgSUyT/0wksBkGcJvZoAMVnrwDfWF9o8Lg1w==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:5b1b:b0:1c0:e9e9:ae91 with
 SMTP id ds27-20020a0568705b1b00b001c0e9e9ae91mr137879oab.3.1693417893238;
 Wed, 30 Aug 2023 10:51:33 -0700 (PDT)
Date: Wed, 30 Aug 2023 17:51:29 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKCB72QC/32NTQrCMBSEr1Le2kh+TLWuvId0EZLX9EGblESCU
 nJ3Yw8gs/oG5psdMibCDPduh4SFMsXQQJ46sLMJHhm5xiC5VPwmB7ZSzhR8McmhXRhOxPSgeG+
 MndBdoA231Nr3IX2OjWfKr5g+x0cRv/avrgjWohzX2mgtrv3Dx+gXPNu4wlhr/QIVCrnRtQAAA A==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693417892; l=3644;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=+vRGVRwlIjkmcXJXBfhvIJnVrDxDHX9+bhatyE7XQZE=; b=tEmNmV0Gd9vM2MDL3PKKkeIiRgAoxL8apKcKfw1CvhU6tPKZlGnans1x4nL4cCT6uVZeVgfd6
 lVCgmhdzg/wB7MReF69x2zwkmSByyHgiMvfwCsafFz90SSsJqUm4woN
X-Mailer: b4 0.12.3
Message-ID: <20230830-missingvardecl-efi-v2-1-818081a204d2@google.com>
Subject: [PATCH v2] efi: fix -Wmissing-variable-declarations warning
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

These symbols are declared extern in drivers/firmware/efi/efi.c. Move
the declarations to linux/efi.h to resolve these warnings.

Also, trim a trailing space from efi_set_variable_t typedef.

Link: https://github.com/ClangBuiltLinux/linux/issues/1920
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Don't use static. Instead move symbols to header file (thanks Ard)
- Remove duplicated warnings output from b4 (thanks Ard)
- Link to v1: https://lore.kernel.org/r/20230829-missingvardecl-efi-v1-1-13d055a55176@google.com
---
Note: build-tested.

Also, a question: Why does the compiler warn at all? The extern
declarations _do_ exist as Ard points out [1].

[1]: https://lore.kernel.org/all/CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et5=W=ZRrQatWnQ@mail.gmail.com/
---
 drivers/firmware/efi/efi.c | 3 ---
 include/linux/efi.h        | 6 +++++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1599f1176842..7b4e59ccf09e 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -161,9 +161,6 @@ static ssize_t fw_platform_size_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", efi_enabled(EFI_64BIT) ? 64 : 32);
 }
 
-extern __weak struct kobj_attribute efi_attr_fw_vendor;
-extern __weak struct kobj_attribute efi_attr_runtime;
-extern __weak struct kobj_attribute efi_attr_config_table;
 static struct kobj_attribute efi_attr_fw_platform_size =
 	__ATTR_RO(fw_platform_size);
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index ab088c662e88..32f7ca60b0e9 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -287,7 +287,7 @@ typedef efi_status_t efi_get_variable_t (efi_char16_t *name, efi_guid_t *vendor,
 					 unsigned long *data_size, void *data);
 typedef efi_status_t efi_get_next_variable_t (unsigned long *name_size, efi_char16_t *name,
 					      efi_guid_t *vendor);
-typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_t *vendor, 
+typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_t *vendor,
 					 u32 attr, unsigned long data_size,
 					 void *data);
 typedef efi_status_t efi_get_next_high_mono_count_t (u32 *count);
@@ -632,6 +632,10 @@ typedef struct {
 
 extern unsigned long __ro_after_init efi_rng_seed;		/* RNG Seed table */
 
+extern __weak struct kobj_attribute efi_attr_fw_vendor;
+extern __weak struct kobj_attribute efi_attr_runtime;
+extern __weak struct kobj_attribute efi_attr_config_table;
+
 /*
  * All runtime access to EFI goes through this structure:
  */

---
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230829-missingvardecl-efi-59306aacfed4

Best regards,
--
Justin Stitt <justinstitt@google.com>

