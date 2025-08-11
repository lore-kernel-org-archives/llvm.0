Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E82E1A9FB1
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931660; cv=none; b=kxtpn+IzFxitrpt2Lwl6lkFGQN6X1lBnH+T0g6B2tW1KVp20SP2hqXP+mfsEHpK3aCumCGfSkBTeyhOTmqcv6j3jzedCLe0WCqilOy6YQ0wsFTbh31bib4RWdKJ8yKw6thW3Ko2/tmKAe/ORcAoYWN/ZaoM6sLB7N73szujGi5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931660; c=relaxed/simple;
	bh=YYBsOSZTzGmwlXVdHceQeByVSwLLZRBjF7Okwkt++fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FORTpqCSIA/jer419+pRO416P103ywsLsbQsOjO+m0MfWetXyym5FJ8m/luL3jun6qkmIA/ruqMBiKzdtoeWBtIIUK2u4y6kLcM1bpilXLw+5PDpLjJWg/ZXn5ebU0bkv5qyuYsqaFq+gCGxprWrXDm8b4JhS5XP233fr2NR3PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDRfRWyO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDRfRWyO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so3517795a91.2
        for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931658; x=1755536458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPhhmdVj2zt9+8pHoVZ1ejD+Bo3wE8/FwKPpnpZx/DE=;
        b=cDRfRWyOBYIJBkKtfr7BiB263Sm6m6ZUocKJL+GIjz8cae7JWYVmukmKjbD2xUy2pN
         cBWrwQO3/KbiIRF+keuZ4Nls1hjcP0mLDv7FJMNpphHT1AwOd1ti+/oCwqyM4mjoBO1u
         Wm9sWOUb4gEz8TLkSNDz3BosHBPWqMgwnzPrChkzrNXuPakgscJ8G4gH75nebo0wfh/L
         m1rn8pZmEeV+mwd6L3My4jZC8B8C6Z3UBMI8X5LF3CuHqdLlv4EVYpbQ25qKaBfk3Iwt
         1PmTYTI9tC66ytMrlz6MykUUPjT5fBKTj5++VQ9nk/NMzxs38/H7Hd3VNEn7CfAsAt/W
         hP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931658; x=1755536458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPhhmdVj2zt9+8pHoVZ1ejD+Bo3wE8/FwKPpnpZx/DE=;
        b=YnlIskoDnJ4F+MGX/h1rGdIp4+5Q251bcc+GlyJHtlSzsrET5080iUibPBdDsRCtvr
         YbYStpFPx0dIRQ3Fa2cNXVyWvNWNdJpgrdEJg9qkPbpZ1UUbDVBx28lWqvZYpSnf5kWA
         D09mJVe0Q+ibGDjuros66g8fgIWuIwvL5tR6bk/ThThiQH5WTXEAmOCCUFm7zGb59Hhj
         JqoiRrb2rfyn7Gzp7ruJfGBdURr+uWXfn2XUqFrHz0/v00Ofv34LNHlabZQ0YDRIwMQQ
         FWJTYKTyGFDRzR2zoMb15GATedlR0lSBOte0Xeck4Au1AkvoUPB6vzRo7446sYMLb1Qw
         PYaA==
X-Forwarded-Encrypted: i=1; AJvYcCUSWLs9xAOMetx0HSF6t4oy+x/faDNtA7UoF36k3Ix66onZkQ1sfWrM1YfwtxDWvEO2Qi4w@lists.linux.dev
X-Gm-Message-State: AOJu0Yw48i3PrddEmtyaH3KBWCVTnR3rC5StusqlnK6BfmTjOzvXihRf
	/v/lgsttYHWfT1zlTKBFqNyZIimj8fy/pK7spDTvXrshvmKemYy9iBFw
X-Gm-Gg: ASbGncvH5D0g69GqttOfB4GLD4vFIm3SqvutsJlLhQUk8yhzKfqaMRA1I5/uSgHth2f
	dD3KFCLfQ7BavBAiHdZR9AD6A6lYCDsoWLgpHT6tRUZiJ6cJf5Xcgm8hGvKn3B0jZ/kBFn+fSp2
	6oRPa1Zs/54dx87qapN3JSVmNO0ixTMzaWEbr0a44nvLtsrhEMexXagn1dry6dEV81yLHGQ1sAf
	8gCKQDOxNvlee0ttoMSAGubVBi4qVu7/b9VrljNMhP8VD7bOzzHoHHh6svWYS0/hmRVeQxZSwh4
	RwsQfmWick89IfySeE1plQ3myqKBM5cQCWbR4awylauHyk+xhLDhqYqSf1ccjYFbZW7nDTvUH+N
	WmJf7MJaV82QbEdMZfdiNOZTBw75OFWI/Y78K5rnuhTUyqSd6v8Yn4neFAkcswU7y1w==
X-Google-Smtp-Source: AGHT+IFlUtkPL3MkM6BSJoR+uUdCcN1ck0aR8fv6x5sWJaoPa/EPzL9HUlQRBpUgrYZzO2RxqQELng==
X-Received: by 2002:a17:90b:3a91:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-321c0b7e35cmr428564a91.33.1754931657951;
        Mon, 11 Aug 2025 10:00:57 -0700 (PDT)
Received: from localhost.localdomain (wf122-104.ust.hk. [175.159.122.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321612815b9sm15502255a91.24.2025.08.11.10.00.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Aug 2025 10:00:56 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com,
	Haoyang LIU <tttturtleruss@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V2] scripts/checktransupdate.py: add support for scanning directory
Date: Tue, 12 Aug 2025 01:00:50 +0800
Message-ID: <20250811170050.94997-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Origin script can only accept a file as parameter, this commit enables
it to scan a directory.

Usage example:
./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools

Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
---
V1 -> V2: remove the fix of missing "f" in f-string and make it a new patch

 scripts/checktransupdate.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checktransupdate.py b/scripts/checktransupdate.py
index e39529e46c3d..01271fb30cbe 100755
--- a/scripts/checktransupdate.py
+++ b/scripts/checktransupdate.py
@@ -13,6 +13,8 @@ The usage is as follows:
 This will print all the files that need to be updated or translated in the zh_CN locale.
 - ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst
 This will only print the status of the specified file.
+- ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
+This will print all the files in the specified folder and its subfolders.
 
 The output is something like:
 Documentation/dev-tools/kfence.rst
@@ -21,6 +23,17 @@ No translation in the locale of zh_CN
 Documentation/translations/zh_CN/dev-tools/testing-overview.rst
 commit 42fb9cfd5b18 ("Documentation: dev-tools: Add link to RV docs")
 1 commits needs resolving in total
+
+Documentation/translations/zh_CN/dev-tools/index.rst
+commit d5af79c05e93 ("Documentation: move dev-tools debugging files to process/debugging/")
+commit d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")
+commit 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
+3 commits needs resolving in total
+
+Documentation/translations/zh_CN/dev-tools/kcsan.rst
+commit b37221cc861d ("Documentation: kcsan: fix "Plain Accesses and Data Races" URL in kcsan.rst")
+commit 72ffee678f6f ("docs: update dev-tools/kcsan.rst url about KTSAN")
+2 commits needs resolving in total
 """
 
 import os
@@ -293,6 +306,17 @@ def main():
                 if args.print_missing_translations:
                     logging.info(os.path.relpath(os.path.abspath(file), linux_path))
                     logging.info("No translation in the locale of %s\n", args.locale)
+    else:
+        # check if the files are directories or files
+        new_files = []
+        for file in files:
+            if os.path.isfile(file):
+                new_files.append(file)
+            elif os.path.isdir(file):
+                # for directories, list all files in the directory and its subfolders
+                new_files.extend(list_files_with_excluding_folders(
+                    file, [], "rst"))
+        files = new_files
 
     files = list(map(lambda x: os.path.relpath(os.path.abspath(x), linux_path), files))
 
-- 
2.50.1

