Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43023A564
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752923601; cv=none; b=VAzcs2D3fWEWBuznFpf5JiYWheayLZzBLrYqnfkXz/NzHiQHtRa16IGkZHrMjh6A0ufCD3pIwMLgR5+ZZCBVAFrCAINuEfVziEmCkDbsNwHnfgQe2LK4Is1qGfPU6UiLBZN2Y+WyjAZjzo9OVTPHHFrV0hq0Q++vRrApdrpySqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752923601; c=relaxed/simple;
	bh=r8lTNjeNnUfemO2GypZqiyYgLF4NkQp7YFBIugfmea8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6lI/W+HozRG+6B1nKihPqWBWD/LB+8Z5KdMDlCpnpJBH4gCJe2hwBaOusFaPkjxigotKrYc17UImS0Vv4AzYzcPikxF56D7AnKfecYMql4lGV1jHtw6Ic92q6qbf/Ln7aahcKMH7WXDhIa4cqCUAz7T5N/Dot9WUWseaFS8log=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBLfN5o3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBLfN5o3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so23977615ad.1
        for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752923598; x=1753528398; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RTREgjI7+tNhJ+8DPCuoyFAFcZSAMYB6+g1NG2DmPY=;
        b=IBLfN5o3r59PrnjB/HS9GqUwX9pn8mPuJKXki/dp+LiQ0BJiAYUjF1CH3v+fUaT2yl
         Itw2hQvrusQUsA+MS2ZOGjdUTYgYpWEDcKc0XZD7ARWPrXpd9AdnrEvyv8FH8WK+0ua3
         jpt6Jiy2bDWEqBMjTc0Zv+wMo9SPh0lR39SlsRwGuINdvGvGG1tVMO+wNPy1K++GC2cV
         oDFTU4O0ti6kScEN91DW9fHUuaU2Bd2G9cGOycoiPZryXyvBLIZcJVln6r7Z1Q6W1eGw
         jtibpvR3xQdbpY4DHuFL0QOEqfYpCZ5Iuio52K9q5FVbBDJ2aCXfMvhu9Af89B7yI9B8
         vDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752923598; x=1753528398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RTREgjI7+tNhJ+8DPCuoyFAFcZSAMYB6+g1NG2DmPY=;
        b=Gebw9fNQsvPkCJWFTODcF8ha+2HLIg5lRJ5kqNfgn0VNZxHC+2PjTzFsSu4JqpAQs/
         +dKcUD8Yucjrhn8E64uKwA1PQ55XpLB4OSEzFTMUp6EkoHUHHyKcZyIR8hEcjD3pLKWS
         NMrNzuXh4A2mv1jCvpXQmFDIjcRE0eOvg7VoxxFgcDb2bHlpRlgG/4oAqXs04+biUj/F
         +U+bFwohHwzsH2xgcxgo1nzDP3ON9vFpOXN5KgqdG9+1e1pmhmUoDHKK5cLmjzIIcmCr
         kl/2tL7d1P5px8l9owG6ifUFBlZoU2KpfqYCuBmdG70vX2dNBjMKAf6ApfhqP9WNX+Js
         FALQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXRp8sq6s7srethH2gWokoIZwKacMtFD+Ipahmzghll0mtixohlb6h56SJWTuX9Ofm3Ic3@lists.linux.dev
X-Gm-Message-State: AOJu0YzxC5JDEv0td0xDo+jolpMfrTwe8MN29oDCWPhi9fbINZowSg5+
	UJWwBEGXUwtk2nYaORcJoBbdaw04E3qj4ca2+zWzejk2XpezSdOZqUdg
X-Gm-Gg: ASbGncvtvFkd9gnPbcyV9aDa3Gt9zgUWynpMpWKrKc0MLji0QZnN+j6U4fLIHMwT5tb
	k9tkl1n7LOZZCMau5A0GjJcAgTlVlYb2O7P+hLTveR1lCS8xhs5JyzCtzjCpEpmVTbQ/JAcACGO
	V4uDarHbInPSIdBpG8OPqYJzNybDmFrkCtsi3ePaKuaBwRbHIyW/boSHBHxEDn9ljtdf01N2CQn
	6/qlY90pKkgeMU9m2cZXMEeGRxTuEh19SbtQDTj3Rse26ui5/GZyigkk5eCjlyWhnYiSI2INcI9
	O8+e0l5/urE0A/xktoXVLSdGlC/ps2Fvah2Q3y3VeoGji9RDR7snWFKfvXaSAZZHnbIyTmGX2jK
	sd425ghydnlZNtbt/1FVG
X-Google-Smtp-Source: AGHT+IHIGCLWVvv5yalOVOy8WKDgdJNrEc9C/gFLLDdC9BVMS/h/JNjAbdeoYEJ58i9QE8Z26itLxQ==
X-Received: by 2002:a17:903:228d:b0:23c:8f4c:6658 with SMTP id d9443c01a7336-23e2572a0dcmr188760075ad.25.1752923598310;
        Sat, 19 Jul 2025 04:13:18 -0700 (PDT)
Received: from [0.0.5.57] ([136.159.213.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4c81sm27388875ad.114.2025.07.19.04.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 04:13:17 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
Date: Sat, 19 Jul 2025 05:13:13 -0600
Subject: [PATCH RFC 3/4] landlock: add memfd exec LSM hooks and scoping
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-memfd-exec-v1-3-0ef7feba5821@gmail.com>
References: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
In-Reply-To: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 Abhinav Saxena <xandfury@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752923593; l=8635;
 i=xandfury@gmail.com; s=20250614; h=from:subject:message-id;
 bh=r8lTNjeNnUfemO2GypZqiyYgLF4NkQp7YFBIugfmea8=;
 b=8L4KmWE3ZWhZjyUmYKRhVFPDyBVShtvoNJz8LgLdOGrxWWSTRS3sKp+1bAgGYFP//GtdlcEDP
 NNLSFLkuXsQDn6+Pv0ANlAxG745Ahfj+4ht/oU7zkNMyd/AGK4sBf10
X-Developer-Key: i=xandfury@gmail.com; a=ed25519;
 pk=YN6w7WNet8skqvMWxhG5BlAmtd1SQmo8If6Mofh4k44=

Implement LSM hooks to enforce memfd execution restrictions:

- hook_mmap_file: Prevent executable mapping of memfd files
- hook_file_mprotect: Block mprotect() adding PROT_EXEC to memfd
  mappings
- hook_bprm_creds_for_exec: Prevent direct execution via execve()
  family
- hook_file_alloc_security: Initialize memfd files with proper access
  masks

All hooks use domain hierarchy checking to enforce scoped restrictions
with proper audit logging. This prevents multiple attack vectors:
- Direct mmap(PROT_EXEC) on memfd
- Two-stage mmap(PROT_READ) + mprotect(PROT_EXEC) bypass
- execve("/proc/self/fd/N") anonymous execution

Implement memfd execution access control in check_memfd_execute_access()
using hierarchy-aware domain checking

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 security/landlock/cred.c |  14 ----
 security/landlock/fs.c   | 195 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 15 deletions(-)

diff --git a/security/landlock/cred.c b/security/landlock/cred.c
index 0cb3edde4d18..356dad0b7e9b 100644
--- a/security/landlock/cred.c
+++ b/security/landlock/cred.c
@@ -43,25 +43,11 @@ static void hook_cred_free(struct cred *const cred)
 		landlock_put_ruleset_deferred(dom);
 }
 
-#ifdef CONFIG_AUDIT
-
-static int hook_bprm_creds_for_exec(struct linux_binprm *const bprm)
-{
-	/* Resets for each execution. */
-	landlock_cred(bprm->cred)->domain_exec = 0;
-	return 0;
-}
-
-#endif /* CONFIG_AUDIT */
-
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(cred_prepare, hook_cred_prepare),
 	LSM_HOOK_INIT(cred_transfer, hook_cred_transfer),
 	LSM_HOOK_INIT(cred_free, hook_cred_free),
 
-#ifdef CONFIG_AUDIT
-	LSM_HOOK_INIT(bprm_creds_for_exec, hook_bprm_creds_for_exec),
-#endif /* CONFIG_AUDIT */
 };
 
 __init void landlock_add_cred_hooks(void)
diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index d86d21034f4c..e8b58f2fd87e 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -1880,7 +1880,24 @@ static int hook_file_alloc_security(struct file *const file)
 	 * without going through the file_open hook, for example when using
 	 * memfd_create(2).
 	 */
-	landlock_file(file)->allowed_access = LANDLOCK_MASK_ACCESS_FS;
+	access_mask_t allowed_access = LANDLOCK_MASK_ACCESS_FS;
+	const struct landlock_cred_security *subject;
+	size_t layer;
+	static const struct access_masks memfd_scope = {
+		.scope = LANDLOCK_SCOPE_MEMFD_EXEC,
+	};
+
+	/* allow everything by default */
+	landlock_file(file)->allowed_access = allowed_access;
+
+	subject = landlock_get_applicable_subject(current_cred(), memfd_scope,
+						  &layer);
+	if (subject && is_memfd_file(file)) {
+		/* Creator domain restricts memfd execution */
+		allowed_access &= ~LANDLOCK_ACCESS_FS_EXECUTE;
+		landlock_file(file)->allowed_access = allowed_access;
+		/* Store creator and audit... */
+	}
 	return 0;
 }
 
@@ -2107,6 +2124,178 @@ static void hook_file_free_security(struct file *file)
 	landlock_put_ruleset_deferred(landlock_file(file)->fown_subject.domain);
 }
 
+static bool
+check_memfd_execute_access(const struct file *file,
+			   const struct landlock_cred_security **subject,
+			   size_t *layer_plus_one)
+{
+	const struct landlock_ruleset *executor_domain, *creator_domain;
+	const struct landlock_cred_security *creator_subject;
+	static const struct access_masks memfd_scope = {
+		.scope = LANDLOCK_SCOPE_MEMFD_EXEC,
+	};
+	size_t creator_layer_plus_one = 0;
+	bool executor_scoped, creator_scoped, is_scoped;
+
+	*subject = NULL;
+	*layer_plus_one = 0;
+
+	/* Check scoping status for both executor and creator */
+	*subject = landlock_get_applicable_subject(current_cred(), memfd_scope,
+						   layer_plus_one);
+	creator_subject = landlock_get_applicable_subject(
+		file->f_cred, memfd_scope, &creator_layer_plus_one);
+
+	executor_scoped = (*subject != NULL);
+	creator_scoped = (creator_subject != NULL);
+
+	if (!creator_scoped)
+		return true; /* No scoping enabled, allow execution */
+
+	/* Get domains for comparison */
+	executor_domain = executor_scoped ? (*subject)->domain : NULL;
+	creator_domain = creator_scoped ? creator_subject->domain :
+					  landlock_cred(file->f_cred)->domain;
+
+	pr_info("MEMFD_DEBUG: executor_domain=%p, creator_domain=%p\n",
+		executor_domain, creator_domain);
+
+	/*
+	 * Same-domain: deny to prevent read-to-execute bypass
+	 * This prevents processes from bypassing execute restrictions
+	 * by creating memfd in the same domain
+	 */
+	if (executor_domain == creator_domain)
+		return false;
+
+	/*
+	 * Cross-domain: use domain hierarchy checks to see if executor is
+	 * scoped from creator domain_is_scoped() returns true when access
+	 * should be DENIED
+	 */
+	if (executor_scoped || creator_scoped) {
+		is_scoped = domain_is_scoped(executor_domain, creator_domain,
+					     LANDLOCK_SCOPE_MEMFD_EXEC);
+		pr_info("MEMFD_DEBUG: Cross-domain: is_scoped=%d, returning=%d\n",
+			is_scoped, !is_scoped);
+		/* Return true (allow) when NOT scoped, false (deny) when scoped */
+		return !is_scoped;
+	}
+
+	return true;
+}
+
+static int hook_mmap_file(struct file *file, unsigned long reqprot,
+			  unsigned long prot, unsigned long flags)
+{
+	const struct landlock_cred_security *subject;
+	size_t layer_plus_one;
+
+	/* Only check executable mappings */
+	if (!(prot & PROT_EXEC))
+		return 0;
+
+	/* Only restrict memfd files */
+	if (!is_memfd_file(file))
+		return 0;
+
+	/* Check if memfd execution is allowed */
+	if (check_memfd_execute_access(file, &subject, &layer_plus_one))
+		return 0;
+
+	/* Log denial for audit */
+	if (subject) {
+		landlock_log_denial(subject, &(struct landlock_request) {
+			.type = LANDLOCK_REQUEST_SCOPE_MEMFD_EXEC,
+			.audit = {
+				.type = LSM_AUDIT_DATA_ANONINODE,
+				.u.file = file,
+			},
+			.layer_plus_one = layer_plus_one,
+		});
+	}
+
+	return -EACCES;
+}
+
+static int hook_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
+			      unsigned long prot)
+{
+	const struct landlock_cred_security *subject;
+	size_t layer_plus_one;
+
+	/* Only check when adding execute permission */
+	if (!(prot & PROT_EXEC))
+		return 0;
+
+	/* Must have a file backing the VMA */
+	if (!vma || !vma->vm_file)
+		return 0;
+
+	/* Only restrict memfd files */
+	if (!is_memfd_file(vma->vm_file))
+		return 0;
+
+	/* Check if memfd execution is allowed */
+	if (check_memfd_execute_access(vma->vm_file, &subject, &layer_plus_one))
+		return 0;
+
+	/* Log denial for audit */
+	if (subject) {
+		landlock_log_denial(subject, &(struct landlock_request) {
+			.type = LANDLOCK_REQUEST_SCOPE_MEMFD_EXEC,
+			.audit = {
+				.type = LSM_AUDIT_DATA_ANONINODE,
+				.u.file = vma->vm_file,
+			},
+			.layer_plus_one = layer_plus_one,
+		});
+	}
+
+	return -EACCES;
+}
+
+static int hook_bprm_creds_for_exec(struct linux_binprm *bprm)
+{
+#ifdef CONFIG_AUDIT
+	/* Resets for each execution. */
+	landlock_cred(bprm->cred)->domain_exec = 0;
+#endif /* CONFIG_AUDIT */
+
+	const struct landlock_cred_security *subject;
+	size_t layer_plus_one;
+	struct file *file;
+
+	if (!bprm)
+		return 0;
+
+	file = bprm->file;
+	if (!file)
+		return 0;
+
+	/* Only restrict memfd files */
+	if (!is_memfd_file(file))
+		return 0;
+
+	/* Check if memfd execution is allowed */
+	if (check_memfd_execute_access(file, &subject, &layer_plus_one))
+		return 0;
+
+	/* Log denial for audit */
+	if (subject) {
+		landlock_log_denial(subject, &(struct landlock_request) {
+			.type = LANDLOCK_REQUEST_SCOPE_MEMFD_EXEC,
+			.audit = {
+				.type = LSM_AUDIT_DATA_ANONINODE,
+				.u.file = file,
+			},
+			.layer_plus_one = layer_plus_one,
+		});
+	}
+
+	return -EACCES; /* maybe we should return EPERM? */
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_free_security_rcu, hook_inode_free_security_rcu),
 
@@ -2133,6 +2322,10 @@ static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(file_ioctl_compat, hook_file_ioctl_compat),
 	LSM_HOOK_INIT(file_set_fowner, hook_file_set_fowner),
 	LSM_HOOK_INIT(file_free_security, hook_file_free_security),
+
+	LSM_HOOK_INIT(mmap_file, hook_mmap_file),
+	LSM_HOOK_INIT(file_mprotect, hook_file_mprotect),
+	LSM_HOOK_INIT(bprm_creds_for_exec, hook_bprm_creds_for_exec),
 };
 
 __init void landlock_add_fs_hooks(void)

-- 
2.43.0

