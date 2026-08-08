Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2533F9F5B
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786192782; cv=none; b=b5tEjpT45/5sBreRgyi8/zu3T0EbaqPMRldLErRXUvBUixP0PqDLXy2VLT5/4OdyUyisk8fci/rMOBagQ2gsjL/QMzJC6ZMdxrci3O13OfrzQmP4Ayej+6ro6Q2+4D4BaFRSKGI07QLD6nI8jVmej06J/VFhgLW8x/ILpTw8Lds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786192782; c=relaxed/simple;
	bh=85srkDPeZbBLcEV4biJz4+YbelRQVTtBPqaA0MiBB1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RELZDns3h4/0lvzjbHqdfGxi6u/4UE2/gmkLouXmkjEgm5tVEejv8TIiVu4qj5TW5uRyzyxQIkJlJ6OhKGEDgIGEBK78nBgEdm0YMWTsfSk849AdcpLQAhagj5liRmacZZA1AwuUe/4fLm/w3TFCa3S7r6NDsTgq0KA7bA7Y/DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj6mV0Lu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj6mV0Lu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fde295992so292177f8f.0
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786192765; x=1786797565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hILZct8Q31WMh1Hewr5Ii+nB0Cbikr9Irq+ZzUZUa1E=;
        b=fj6mV0LuY+uUcD5hae0TnuPdCEM6mPC2PTYuCjcowXir/UH5+1k16aavn+NVggxqn0
         iEPlxXwLYqV5nm1NDqFdovCqypmCuTV8I/IA9CiIE5YP1LlyuzkiLCoTpfehp2mc5EZS
         f6GQe2JNKEj/K6KTyDgBN44T+Gpnhpbn50tkehEdqCKNEKvLdbMBHbPIrC20b/p+7oFB
         5Lk0dxQYTD5utw81o92y3FFVDhH5GmD0byYOZzzTiMhOEwXGOz/WWOWTCsiIp4Y6JcUk
         aABVzOTCWThM8KJxH9FhW0pGz2kGmope3UnzC4QYjJdV7wxe5Pyeg90JfX2TGR0OiLhX
         OKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786192765; x=1786797565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hILZct8Q31WMh1Hewr5Ii+nB0Cbikr9Irq+ZzUZUa1E=;
        b=CyupuuYv271LMdS+8AVJEZgLaMTGu1ouE+uswMTHFw1YGKOI85OdgqY0NNZ9Dj5RkF
         Q8ND1+SZB+r45WWsiSCsUlgecrsnC6YF2ck3ofHR/fnlNSJ9eOw4MsOxh5ZbMJG5/wT9
         iptRHF5rmviWJA27AzNe2G9VjQBrHJm2zJYyN1Cgo1ujhL7dIPohaLdgUy75gQfU+BKD
         xwaru0dc/vedGDJFIRC7BDQPsnFtKq8RDBCqNAxGFd20jfVJY+m/8Dj8NhkRrEQoaxc4
         NfEMkFp/dVbT7SGzcfF9EvwFU34wHGsXnbvCWmAwro/fK924074qiytKOu8hFUlxutVJ
         raGQ==
X-Forwarded-Encrypted: i=1; AHgh+RorCx6gSBv07spnGw9/Ocr7vOCW7YtUXKn791DrQ45bP9MSgvNQlvay/MbSPVGH29icRHZQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw0HsxKdYnLDvd+KkNYxtKRSs8P/0f8yPUNZ4wc9YezAPGVi2h
	RtOTxuF1/wS9CEhPpELTW5Cy9YVovLOyd45k7Ft0nWgDVF1HRbBE5ICO
X-Gm-Gg: AR+sD10supdqteO6S6B1JIakaQFGH+Nk/BQ9F0UTgHA5U3I0cNJr1bJo8eJ+3NeMCq4
	bz67Myr1JIcxkxb1emaVotHYaQMr35YQSo0oEJRnyKBwrb6Qbt09Jb+iUheszzCJVAYLzb58wUU
	EtsNoexPrT0ldWXY/3VYutZBTybmlxlJ9/nITYWyc+OfjKwi51sn0j+KsFF/p/tKXpFSMOaofsp
	wsCJUtuYn0tvN9rtUbm4s8ojJF/8mCkKlUhPBpVNVS/+WCpAGimqlaipK0pa14j09koXzK2rBrf
	RzBu5StCTXy14hsxPRjOJL+s13OH1d33dtpltV9BfHVmYJZ0lMKD9fLanrUC95fIYkngnP21HUZ
	QdClyIc7FphsLCUo4YtEHx0tDfpsBmllueq25rMP90lLuJ1gzFjGfw+lk76eeurYKjoOe/XlhTK
	/SLU3T0BCqLrE9+Y2ArEZ9YyE81+xjsL9jbwWxi9c+ghRj8+xZDF2cTpgk8jye3OB8Eqvp4sgXU
	SFD0ti2ijrcujegrg2JXEksb9e/SBEmkF3EXuVcR5q2EfNCPyAtHaJFBuJMlNeelfoHFgICf/u2
	YoTcvgvD/MnwXWXLF8lY
X-Received: by 2002:a05:6000:609:b0:47f:853c:ad7b with SMTP id ffacd0b85a97d-48131962d3emr6810412f8f.9.1786192765075;
        Sat, 08 Aug 2026 05:39:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm16200335f8f.18.2026.08.08.05.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 05:39:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] super: fix dying superblock warning messages
Date: Sat,  8 Aug 2026 14:38:02 +0200
Message-Id: <20260808123802.73687-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WARN_ON_ONCE() takes a condition, not a message. The string literals
are always true, so the warnings still trigger but the messages are
never printed.

Use WARN_ONCE(1, ...) instead to print the messages and keep the
once-only behavior.

Found with a Coccinelle script. Clang's -Wstring-conversion also flags
such calls but is not enabled in kernel builds.

Fixes: f0cd988016f6 ("fs: massage locking helpers")
Assisted-by: Claude:claude-fable-5 coccinelle
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index a8fd61136aaf..56efcf1c31da 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -2012,7 +2012,7 @@ int freeze_super(struct super_block *sb, enum freeze_holder who, const void *fre
 	int ret;
 
 	if (!super_lock_excl(sb)) {
-		WARN_ON_ONCE("Dying superblock while freezing!");
+		WARN_ONCE(1, "Dying superblock while freezing!");
 		return -EINVAL;
 	}
 	atomic_inc(&sb->s_active);
@@ -2176,7 +2176,7 @@ int thaw_super(struct super_block *sb, enum freeze_holder who,
 	       const void *freeze_owner)
 {
 	if (!super_lock_excl(sb)) {
-		WARN_ON_ONCE("Dying superblock while thawing!");
+		WARN_ONCE(1, "Dying superblock while thawing!");
 		return -EINVAL;
 	}
 	return thaw_super_locked(sb, who, freeze_owner);
-- 
2.39.5 (Apple Git-154)

