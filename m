Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC17BA45
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 21:09:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d3so37166936plr.10
        for <llvm@lists.linux.dev>; Wed, 04 Jan 2023 13:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7e2wI5rOH0TCS8vVnB78L3eDotCSnHcKsvZPx9y4wU=;
        b=C40Gz9QcfmKE0+Yw+ZeeTtIoek8V2TWOtdR4AwnrKaklJs1/LZvWLUeB1itG4Ck7np
         NvAjiGYGr+Bgcu814J00sXqoYVsSICOnjmrhBRtx07jFQtcJ7pQUAVzh3jVRGTt0V192
         8p0dpcIHT8EpUHXJWkMhixUl1sAJWNWU12Q4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7e2wI5rOH0TCS8vVnB78L3eDotCSnHcKsvZPx9y4wU=;
        b=E5R/nL8uNa5/DyCEuNvGH4gQbmqabx5FAZO1oBbegHhFJrzCgjdyPdBfcI+EjDZGE0
         jUSQ4Bj76176ECZrM5XmxQVCA0fHlXdv2LAH54u+pWgSp4XmmmQKEtsUsyvEU/jVAyc+
         MWXQPnvISEuOiog2wbJ5sG1lsBvGVgJdIkSouBi4fsX2GEl4jUkU0OTVZduXydpKNugT
         JL/d0E57lPLWLptliFlqclCeshrTIami+wwSm4xNwBPo+dNZ2F7kYq4pWks0PGd+kJpw
         JNjqNGTzqB/1Iz53S7v54xELrXwN63+3PeNt6XaDFxRxC75JoCpipDOgYFeZq03JrZHU
         GYkg==
X-Gm-Message-State: AFqh2krWBw3gvYT6V2tdbxuc0Dt9mS+dFF17YMsa56cLK0KQpsghmooW
	ketwfAiVg+Wuvh51VdRsFy2k/Q==
X-Google-Smtp-Source: AMrXdXsS+rbrcdC8oxPFmFfnIHZhQwxagm363BI8RJ3ymU5GkpRbqX0sIx+1yKRH2LDDjk/ySqK3IQ==
X-Received: by 2002:a17:903:2682:b0:192:f12a:42de with SMTP id jf2-20020a170903268200b00192f12a42demr2516867plb.42.1672866554980;
        Wed, 04 Jan 2023 13:09:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d19-20020a656b93000000b00476dc914262sm20817436pgw.1.2023.01.04.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 13:09:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Kees Cook <keescook@chromium.org>,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Riccardo Schirone <sirmy15@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] ext4: Fix function prototype mismatch for ext4_feat_ktype
Date: Wed,  4 Jan 2023 13:09:12 -0800
Message-Id: <20230104210908.gonna.388-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; h=from:subject:message-id; bh=rWss1AWpfgN5m5MJ3ZzB8riftLh8uHlWslxcv4hTtPQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjter33m3BUzBmkepopp8BSQH8S0ACYSatzHFDr43m Af3b0nKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY7Xq9wAKCRCJcvTf3G3AJlFJD/ 4lw5d6tzW8szirp5AWtqCSAk2F8btgMJ0kn+otr52eFrv50d4FyF2DrGCrjKHW6TrCV5R1IbGuxzyC cNxeDeUXZ08+2+Z5coqXuQVIKi2ccgbzJXkcpJyBqidP6Q5EE/9jPxv1isYpI8Wx6pUqvFb3JC3JNU TxeGXpu1Etl3gs6tj+WVwfVrf3waEGXNvG7oVLMSK9SY2GMqJdQvBE2m8It9yxubznQVH4FcdUZkge WZiHcQxMTjJJvExrAJQMPCOZTGydwKp4sFIEfuBik8owEqDw+rp0pLWFDykwlB2gQ43H31hlfp5qvD ja0NSNl9ClP3XMtlAddoBVD83OAz5WM5QLRmjfkQZcLpeV4OoEhoLFkkPTOmhrtgYD4QR+oboFL5VJ bR+fyrp9wFy7sabuSYn7UD2SLENbyhyRQJ1Wq+KvK/POkLsr2q2OEyiFD5QxFhuJcQxqQjSu+dusLQ eQAXZxZNr2EY+gc/MsVQo82SCi1QUaYrz9iMWQBmPeUDvdzzPNg9HzV//sljmjTyt/lUfh+txYyN+D kqSNKiD/EKX27Rb/N8+6MRVLavRsCvZInKdmiJRsZ4m9Ht4fJQkF7+V+d+YDJkJHTdvyr2LdZK3GuT iZ9bjmYHTDnQQL+Ry+OxvAHK3To6Qg+N+G8ZLl8PsGiWtfPDv+XCmw+7WWmw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed.

ext4_feat_ktype was setting the "release" handler to "kfree", which
doesn't have a matching function prototype. Add a simple wrapper
with the correct prototype.

This was found as a result of Clang's new -Wcast-function-type-strict
flag, which is more sensitive than the simpler -Wcast-function-type,
which only checks for type width mismatches.

Note that this code is only reached when ext4 is a loadable module and
it is being unloaded:

 CFI failure at kobject_put+0xbb/0x1b0 (target: kfree+0x0/0x180; expected type: 0x7c4aa698)
 ...
 RIP: 0010:kobject_put+0xbb/0x1b0
 ...
 Call Trace:
  <TASK>
  ext4_exit_sysfs+0x14/0x60 [ext4]
  cleanup_module+0x67/0xedb [ext4]

Fixes: b99fee58a20a ("ext4: create ext4_feat kobject dynamically")
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: stable@vger.kernel.org
Build-tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20230103234616.never.915-kees@kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: rename callback, improve commit log (ebiggers)
v1: https://lore.kernel.org/lkml/20230103234616.never.915-kees@kernel.org
---
 fs/ext4/sysfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index d233c24ea342..e2b8b3437c58 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -491,6 +491,11 @@ static void ext4_sb_release(struct kobject *kobj)
 	complete(&sbi->s_kobj_unregister);
 }
 
+static void ext4_feat_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct sysfs_ops ext4_attr_ops = {
 	.show	= ext4_attr_show,
 	.store	= ext4_attr_store,
@@ -505,7 +510,7 @@ static struct kobj_type ext4_sb_ktype = {
 static struct kobj_type ext4_feat_ktype = {
 	.default_groups = ext4_feat_groups,
 	.sysfs_ops	= &ext4_attr_ops,
-	.release	= (void (*)(struct kobject *))kfree,
+	.release	= ext4_feat_release,
 };
 
 void ext4_notify_error_sysfs(struct ext4_sb_info *sbi)
-- 
2.34.1

