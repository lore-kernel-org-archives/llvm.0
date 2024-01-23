Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0BF1A27C
	for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706053659; cv=none; b=BGtl0xhrkD0EwxkCJfIvZpPGujRDMIhhif7jJzYDIhwBSZXS0J4d1XQ9BoFDQ0VnY23y6sjs/BoZr+/j3xt3vmrMUQjMaqeQO5ouuiHybe87c/wEmBbXZH1k0po00tyOONZjspCzbSm5ogq6nvKJIEv2j5ARx7Y03IUEYIrjvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706053659; c=relaxed/simple;
	bh=IeM0NmFIQcW0aOz8Y2fNy6aqOUIg9hjVHd/pk89b+u4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tSCG3icHxsGEG9dkXERLwH8dNHrNFBWNQ2CDCs3e3axQynbW94aztZFI9RgzW0jhpKRS6ht0MCrert+/EWlZxYnq3AfIYzWmDcXJyvlCuxGqF67d9HkUQqggdggtYhTr8aZdYnTZMSki+va/R3KD+cpAJ+aOpxlcjW0+vXxw9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nKuA+PEK; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nKuA+PEK"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5986d902ae6so2728160eaf.3
        for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 15:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706053657; x=1706658457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Byey+oL1IfCOxjCaYQp1J8nG8dIGW6Zh+MZe1d2CaXE=;
        b=nKuA+PEK+laobHztb2W/YmKB5vmUd+lD9swW683bPG5tKss2HWCaWfmDWFN3uMvLFs
         WgKlwbcziaMN0T2Y3VmME1RdKS+S+uJFjkUZAJPDg1c/eMhAl81Bmar0cPPmFci8OQLR
         fqSFfg3ULbk89iqK60Hag6HzQUKWcvLMw1rqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706053657; x=1706658457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Byey+oL1IfCOxjCaYQp1J8nG8dIGW6Zh+MZe1d2CaXE=;
        b=vkYZSguJSqw9gFUxB+M6Jg7U4q8VH/2Vg9mYObxjy4QyyJsQ25j9dHvnHg6C/d+Zy2
         bvaj48crOVIMNYiG55EWgiQsoe8KBPRMqe3m4dCK+7c3ODGI3bSTqx0xHf2MPlEXwk8y
         ViRQUKaUHw2ZTe+T0bMu6O+obsgVdQhWx2h9Q47qX4wyVdYNpflHVCz14GhW/rL5yjmZ
         y4P+nF+b3IwK8+BzoD4/COAH1E+oR5dwHH6SfGmdaCcLNdJWTj1waRpAnJa3u0KCm5tu
         W0pnCJbZE187BldYWa1PRW1Wzf0bQWjT/X7VcY4oqmph7b9WAiBMY/5FDMTLNxyZ5H2j
         YxOw==
X-Gm-Message-State: AOJu0YzhgtSnNLQwUMEw0uujTI5RCSnjAKNIpvA1ITYe9yCoeyXMWiM4
	V5pUTWUc4ZR/6fIC++ecMDIvmRRUjLvnzJEhcaPMqJ9fJ5egh/F4cdBUxhfWhw==
X-Google-Smtp-Source: AGHT+IFwLyO9rJaJWRj5fpagu/7UQJb6PJH1NhmnvMhw7EfYEMCFG/DBTGnWIv8q3a/IL8/3KNMsvw==
X-Received: by 2002:a05:6359:45a4:b0:176:4aae:5fe8 with SMTP id no36-20020a05635945a400b001764aae5fe8mr4864506rwb.27.1706053657198;
        Tue, 23 Jan 2024 15:47:37 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a0021d300b006d9be753ac7sm12184383pfj.108.2024.01.23.15.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 15:47:36 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Steve French <sfrench@samba.org>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org,
	llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] smb: Work around Clang __bdos() type confusion
Date: Tue, 23 Jan 2024 15:47:34 -0800
Message-Id: <20240123234731.work.358-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=keescook@chromium.org;
 h=from:subject:message-id; bh=IeM0NmFIQcW0aOz8Y2fNy6aqOUIg9hjVHd/pk89b+u4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlsFAWkLxmekOiD6JMUP2NjwIMzfRNEuzHrOIKn
 KJgVAqyQBOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbBQFgAKCRCJcvTf3G3A
 JuU0D/4r8yMRZ45F/ySlkdZZlrkq438nNjdyWMLfNMt2htoNEKNPRn09MNQuqxbSnbnts/ZfNIo
 cnmUeq9KPtd5hVOfp5tt9k4XQgSxWmUcJ6ppjbpqthGZ3qgrSmPnbUKc6yT/t8sotWOsK/dCR45
 Uoq9+7rgk0/Wtnak25xEEuyDhKkzg/BZ7PKc1fDE7H0FH2pURSFLHct+1Wxaw8ITTSj8IVMFM+L
 rbtW75C4011Nx4ud1zOiqO01n9qloHWomiAWrLdtCh29hKW4WWIjaJAmrhr8sWSGlTU+303dByG
 xjQxfD9VxFZcjkPgQjXtu2WNp5Rw53ZsDc71Z0v5/4JS6JNYb3lbTjxuM4sX7QQzjIGUCYtVcEp
 iTrN73BalurOaP6BHceFb/h7fgzpxiYHeez+wUx2KceNnSJKZHe9cxVl450EKObYhXCe0mz252V
 kgVlZcH00bBKy5uW3uamI1O0Yjd1z3P8wabDNB5ftOkMdoO3Bl8w494D1dMWZyw9JHlI8QpikH4
 pEAPi3np3UmHkcO/FRCFYOXmxWVG2eGht4qL39RAcfG3r2e1MFR+rMi5zgEBr+uf6WXVWFwPDCT
 XnpVxywkBgftxAv4RcanaHhm7gbn1w3TW3ZIAr4LvzM8eFuVQ8UOXLHbEnaOX0f/nPrYZjJQ/uf
 DC9OTKa J6Kyq2pA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Recent versions of Clang gets confused about the possible size of the
"user" allocation, and CONFIG_FORTIFY_SOURCE ends up emitting a
warning[1]:

repro.c:126:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
  126 |                         __write_overflow_field(p_size_field, size);
      |                         ^

for this memset():

        int len;
        __le16 *user;
	...
        len = ses->user_name ? strlen(ses->user_name) : 0;
        user = kmalloc(2 + (len * 2), GFP_KERNEL);
	...
	if (len) {
		...
	} else {
		memset(user, '\0', 2);
	}

While Clang works on this bug[2], switch to using a direct assignment,
which avoids memset() entirely which both simplifies the code and silences
the false positive warning. (Making "len" size_t also silences the
warning, but the direct assignment seems better.)

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/1966 [1]
Link: https://github.com/llvm/llvm-project/issues/77813 [2]
Cc: Steve French <sfrench@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
Cc: Shyam Prasad N <sprasad@microsoft.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/smb/client/cifsencrypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
index ef4c2e3c9fa6..6322f0f68a17 100644
--- a/fs/smb/client/cifsencrypt.c
+++ b/fs/smb/client/cifsencrypt.c
@@ -572,7 +572,7 @@ static int calc_ntlmv2_hash(struct cifs_ses *ses, char *ntlmv2_hash,
 		len = cifs_strtoUTF16(user, ses->user_name, len, nls_cp);
 		UniStrupr(user);
 	} else {
-		memset(user, '\0', 2);
+		*(u16 *)user = 0;
 	}
 
 	rc = crypto_shash_update(ses->server->secmech.hmacmd5,
-- 
2.34.1

