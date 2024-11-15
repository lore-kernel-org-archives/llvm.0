Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06B1CDFC0
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731677818; cv=none; b=FgkrIUij1rJz7qEoEXCuAjjBKsltSgo3v5a8dNDDnfFQkmbL4TDjU+GZsWFGPBRIHl3VAbCqw58HSRvrfbYAg1wUZFafDX8j4nDojen6YiFn0j/gccoXXfKzyJ4tSsqVAVRLvvrb5ECM3r8i3Ng3jD8PKizVr0JiI5e7cru//7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731677818; c=relaxed/simple;
	bh=oZPobkORwo+/HRRLRucyVNiplKGWixvyOKvZqcp02No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k3pYMgBeaIrqB+ABOi8SkYzGuJFqXJsRF5S80rbjJRfjYAF+x9gqLGFX52i+LTJLfUPJsV/jTciQGUa4G1BWDsDyL8hJ8whpVnmUAxa9kn63cQOLrUVY7gm8ut7mcHt7JNWpxbItl+SBVbHIvCoW8gpJYD3GXhfnyWpxpD45s4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=JsGIA7iv; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="JsGIA7iv"
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1731677806;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=QtoaQcYfTrLpqRWaDjsaLs+uKe0TRDoWf7UyCJsOHd0=;
	b=JsGIA7ivnnmzNjIA6EPCFitbvcGApew2OLvOsfWre5KPaMzEfE7MEA74FqkCWSFxrX24NA
	PuTXGjYyXqs5n4QCn/j1pPzxNlDixDOisIRKsvVRsy/6NNKsPtFq44nCQF0zHUXy6WxHML
	QCdKRfbtwU4KD7M11UOWTr9Uv1Yp87rCQRZddMaHm0cqCeVRtKNbuBEsIdms66i4sMtPZ6
	ULsbnMsvOymp7dphliJcsiWCV+Phh4A+8Qen0ASIFexRvLZWPGyktyPmeB5en3Fg+cbTf5
	daVYbXYXXy+Z9d3uQ2KY4KB7X3f+yDrZYf4ZbqYfvwYHwXlzDqJddU+4vIONKQ==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>,
	=?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 01/22] selinux: supply missing field initializers
Date: Fri, 15 Nov 2024 14:35:20 +0100
Message-ID: <20241115133619.114393-1-cgoettsche@seltendoof.de>
Reply-To: cgzones@googlemail.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Göttsche <cgzones@googlemail.com>

Please clang by supplying the missing field initializes:

    security/selinux/selinuxfs.c:2004:21: warning: missing field 'ops' initializer [-Wmissing-field-initializers]
     2004 |                 /* last one */ {""}
          |                                   ^
    ./security/selinux/include/classmap.h:182:9: warning: missing field 'perms' initializer [-Wmissing-field-initializers]
      182 |         { NULL }
          |                ^

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/include/classmap.h | 2 +-
 security/selinux/selinuxfs.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 2bc20135324a..03e82477dce9 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -179,7 +179,7 @@ const struct security_class_mapping secclass_map[] = {
 	{ "anon_inode", { COMMON_FILE_PERMS, NULL } },
 	{ "io_uring", { "override_creds", "sqpoll", "cmd", NULL } },
 	{ "user_namespace", { "create", NULL } },
-	{ NULL }
+	/* last one */ { NULL, {} }
 };
 
 #ifdef __KERNEL__ /* avoid this check when building host programs */
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 234f4789b787..c3e9627f1283 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -2001,7 +2001,7 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
 		[SEL_POLICY] = {"policy", &sel_policy_ops, S_IRUGO},
 		[SEL_VALIDATE_TRANS] = {"validatetrans", &sel_transition_ops,
 					S_IWUGO},
-		/* last one */ {""}
+		/* last one */ {"", NULL, 0}
 	};
 
 	ret = selinux_fs_info_create(sb);
-- 
2.45.2

