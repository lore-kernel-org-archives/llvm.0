Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881635280
	for <llvm@lists.linux.dev>; Sun, 10 Aug 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754842659; cv=none; b=VUTffmT43mB6KQDR3pr0s9RLCcyODbeJDVxn2sw9PweTa2yrpAsA+SLuh0c/VRfQNISXwX88MZCp1PPM49hhsph+UPJp562o0dOEv4Tdy+Qa48yjJlR/MIG6djqaYYpn7J5qGLAy9Q22zRNfuVeFxdxRWbuwJZSdNaqMLO2C9r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754842659; c=relaxed/simple;
	bh=r+/tz4wOk7S63KAYEOx9vULkKR8ZDVGPGskKkBYlZWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hqy/g8sZYInMlhm+VxA+hRAAMuoLY70NeqD7KcpSaUB0JbnS91UGsuZEMor5WAeP4d9HRuv98z1fCBggxtIWV1xxCW3f2eCdePOEev2eMiMacZweGtrS8PxL/FKAPA22QB+aZ28H6WO+CY2h/qZoQNIEgZbGv5rqM5Lp4vmWKJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9A2PRmO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9A2PRmO"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bd041c431so3134112b3a.2
        for <llvm@lists.linux.dev>; Sun, 10 Aug 2025 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754842656; x=1755447456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEAJER69/NfwAiGupTfaKK2jAZ45McqgSZlh8HSXymw=;
        b=P9A2PRmOaIzHzIzbKOoKgmwA4Ay6NLdhB3yGjMURopuPlJxYZjwmC1mCupOEHWew2v
         1pj1hgAQtxYO57SQgh3+WjiW8adrp0rFmnK3HD2L1cgTw4BDcHW2jaykPdjDgv2JsvLz
         ysNDqJG/HoLHfMhm/T60EX4I342mkD6pQrp3nyWdNEQGJnK8Ost4ujK3SVeBE284vTFZ
         69pDE+uRX4m6zWXYw8qNYzI7CVeqjYlCIw63zHp9kv6YETDFJ6QdcvMeXnNV5j761e5X
         tzqpoNbwokALKxEZnJWBNOeeLAA3UvYyGDZG9b51B+plhTofpYWDNBFPGfwK0gwHWUa2
         N9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754842656; x=1755447456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEAJER69/NfwAiGupTfaKK2jAZ45McqgSZlh8HSXymw=;
        b=pMzQjdM0vvQ5MI+CuR2EOvy6/NRahzUBZmP2t4r21WYseWXmUMqwo4UQAXQJ5nIks+
         9bZnyDv3WNs+dDWnTLt4rHod3w/AQiECggiWr4o1nX1daktObkSnh2cEP20jDjZIPoMb
         JBUTe9icmqlrv1OnxrvOjoaCd/bPDfvjwZ/YjWZ2df8Yzdq1Fo2+U9JuhmF+FN2lImm5
         RvxRN0kFLP3T9idhoo2logMjofOsd50iqZcsFBqu41y18qdT0C6l30egi5FEuZ6dQyhV
         MMQQpjgk1TBd3EO7v7yFhijYe3KD65btwsRP3vjtc/2sS8qpYyqH7YTCVuvvDGdXhRT+
         g76w==
X-Forwarded-Encrypted: i=1; AJvYcCWv9Z3c4WEc45DB4ineNrxR/PjB/Kww01+OBOY2kAraxqUGEPX41m5wW+0vOSKoEfArFcWs@lists.linux.dev
X-Gm-Message-State: AOJu0YzdNRWTUk6iZ61rPLCGKwwHp4EKlqUlkHVzkQlj6w0yDxwn75Il
	e2zNDvqiERgDOLjsqEx5+KkQFHYpVMxnVfL9J+JcxYaKzPFvgJKv6VvK
X-Gm-Gg: ASbGnctSDkdetXQqjjVYlbIk8ybJIlLM0u43A4sApRz90dhTxZMj9ZRBb3zUcFWwf5D
	d7HPsQ/U82FWq2aAB9zlv98Z4rCbl4qwj2IiuR3J+HeIn9JyJEqYljAMqUpe7ObsZ9Q3KhrzWhz
	kS2vh5OzoElTLgoogyHWgViIuAom4/J5k2GYZ96RxiR7h3CVWpuGfRFDN05aQA5ZWQiiOQBprKd
	VHiwXmWpGEGKm2d4OrIWbAX+0s9uIfaBuwWTKLE/MTXgYHpRtc0eytX8bpWr+zxR4Owt0aQEyqF
	soSiogYOPCHa2wZRsl28XnKkTxgvqtK08R8Ghr0CYzWBC09wU6rb1OpgbrqsPMAoHJrIVpx9hr3
	Kk/UHM8O6s5wl5/DVV7ECRC05n5TU7FrNRC8WAlwu/4v/b47lYAWQEgnQQwjGyCKtdgT8OVnoUf
	Ti
X-Google-Smtp-Source: AGHT+IGaneADRRWLQHrxVro1KG5pLemoUIgsHzCDalyypmDxM0LYn3Wt757/XYCwlglY3qEq1dRvcQ==
X-Received: by 2002:a05:6a00:b44:b0:746:2ae9:fc42 with SMTP id d2e1a72fcca58-76c461784fcmr14689584b3a.19.1754842656447;
        Sun, 10 Aug 2025 09:17:36 -0700 (PDT)
Received: from localhost.localdomain (wf122-104.ust.hk. [175.159.122.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdd2725c9sm22495944b3a.6.2025.08.10.09.17.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 10 Aug 2025 09:17:36 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com,
	Haoyang LIU <tttturtleruss@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] scripts/checktransupdate.py: add support for scanning directory
Date: Mon, 11 Aug 2025 00:17:30 +0800
Message-ID: <20250810161730.6530-1-tttturtleruss@gmail.com>
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
 scripts/checktransupdate.py | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/scripts/checktransupdate.py b/scripts/checktransupdate.py
index e39529e46c3d..0d197d036650 100755
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
@@ -131,7 +144,7 @@ def check_per_file(file_path):
     opath = get_origin_path(file_path)
 
     if not os.path.isfile(opath):
-        logging.error("Cannot find the origin path for {file_path}")
+        logging.error(f"Cannot find the origin path for {file_path}")
         return
 
     o_from_head = get_latest_commit_from(opath, "HEAD")
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

