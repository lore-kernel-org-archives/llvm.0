Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D821D599
	for <llvm@lists.linux.dev>; Sun,  8 Mar 2026 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772968419; cv=none; b=CF1vSKf3VQP9EEZn2NuFKVpmiGIq7JDeyc9i+HO/MqJbH+etrTW15dNaYMUUUymWoaydNfMrA11aZV2eHGBLHrbE6SqbWC+R8nMW0nqnMdbljADjfZhOeSr6Dhk/j7vFyyVLv8Rs7Iyg1mt8Jurt1Q6YVvdlTSLVbsNPjwMv9qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772968419; c=relaxed/simple;
	bh=rUIInd5K6kOACS1tWqup7nK+dUyf7CQRanumz9cLbow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEQJXbbpkOqj1E4mfvh14QYHZDvVs/B2hCKdJiQliBmVHkSJWta76P0UY3vU4DkiBym4UY5Jv3EE1yHPeYsAibhbLag6ZzI/cTkaQOfopicme0oZHqVZElH4PidiTkw1187U8u+KVR67hbJ9cxpaeP9c1z2BOUAxGsqayoOwRao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neVQOxZI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neVQOxZI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824c9da9928so6070205b3a.3
        for <llvm@lists.linux.dev>; Sun, 08 Mar 2026 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772968416; x=1773573216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9z7EGgDIs51XBH02ZmG5zUVGonDeGX7qmX1TqKhzyE=;
        b=neVQOxZIUY7qmsXwZ0alBszjqXI7db4IeGluOqaW14Vg9tpgObF3MOTEVfjB0JPQtf
         bmYgLsrHxh3/LmPXOCv/IekoYtu8vcz8vga672Q6yxfcP5KzvuFZPBeWAYnQw3xyryTh
         nXCT5XG/x/njqQ8p31WA1FJETdjp70UmMbG3NJ/cDqwgJdblbIsGdzoQkbhkQJb6kiIs
         7sxyPjARy8KKu+1BjlTh6mXT2y4GWwWYsU8UUoYrmnaGAa087lgJOwlPSruwuIBBD91h
         FuXZBZHis493p1vhDsda9QH3re6qxSmXchiAsKlK0cZ6MP3kQRWSufcNM3j4nTuFje1h
         lSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772968416; x=1773573216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9z7EGgDIs51XBH02ZmG5zUVGonDeGX7qmX1TqKhzyE=;
        b=fDBXJH1pIFZyWS8BhagqdaCtnydYIpro3W7bWvncT6Argz79wtKjsFfqDRVnjM/sRO
         YSS5o+tKVajsLqL9UhIx1SgP2ZTqzPKcZbIsSNC7CIZCppctmvzvcqWMPlWnuwxGsnmd
         yIYqmQk3qSr1vxYHC1LPaxd9GwmtFGyRETCOtqbgihiXiuqSO7q6pTDZHPjm1b9PIc/Y
         8sSUq+r/E3dMkaX+jShODNixk9WT8jNaVDt9SZL3T5waSQ8nE4zLjhuNOh2sXKUfXqQ5
         gkYEMR8c6YtdFCehKhN08YqyQnaYixH4LzQ+I7Q0WGT0ZS5TOpVMwIOf/diDKy1mXyhe
         dRqA==
X-Forwarded-Encrypted: i=1; AJvYcCVYkRBiB3t56T6yxVmu6PDbLqnmbhUuS+62R76a5Iy13UTWXj7+fncSupSFKF3srS4Ki32u@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/EnAEyRCfs/x47HgOJ0GKa5uRnfp+MvozamnzR2OkzFX+hTes
	vOudmMv8maP6BQEqo4bWXy/SU4qcMbH9E0HNECeC1I/mYWujXGSN4Dr8
X-Gm-Gg: ATEYQzzDoA2lv3qekIrhCgeg837nsqx8qsQSD619wubx27tc5BOil2yBk9j+1/3MWSv
	/xDufQqct6086vJRrdo6W3ycgo9Rkon386yqBlfR1KBM5m1mJC8fjtVo4Koy9LpZGZRth2eVGgj
	pOHt0NjVwDVdxYUgvmUTq3+OaAGoCY0at5o0JGsvEQw6RakfcqyS2bi1kWn5e8rekaKiehFQUii
	SeO+W/xAPxqE9YspEDNClOYk9OxxkUgFYDhL8RSZ2P5xaEL3Y5ezjSpH7Invn/Pov3AYC+sskxs
	wQegKixkTjEcFy86wqQf7psMpF9u1OH4DS251rJDONPYOKHiVwekoTmOOr2jhdHtS00kJ1rJ8AN
	qD4zfp5ELkIgHNWzfoCUASxKE6KgcMyX/pcteY4KMg+ayLPca6qfB8YSt+3rRdaNCdYXxftVZSO
	QHEoW/wUwtAKMlthEZxyvtMq5usIbHcqjMoeutpH+4
X-Received: by 2002:a05:6a00:7444:b0:827:3c74:e6a6 with SMTP id d2e1a72fcca58-829a30b9fd6mr5378887b3a.58.1772968415956;
        Sun, 08 Mar 2026 04:13:35 -0700 (PDT)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm6923755b3a.2.2026.03.08.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 04:13:35 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Haoyang LIU <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] tools/docs/checktransupdate.py: add support for scanning directory
Date: Sun,  8 Mar 2026 19:13:13 +0800
Message-ID: <20260308111314.27333-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
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

And it will output something like:
"""
[1772967203.351603] Documentation/translations/zh_CN/dev-tools/kmemleak.rst
[1772967205.074201] commit 7591c127f3b1 ("kmemleak: iommu/iova: fix transient kmemleak false positive")
[1772967205.074337] 1 commits needs resolving in total

[1772967205.301705] Documentation/translations/zh_CN/dev-tools/index.rst
[1772967206.912395] commit a592a36e4937 ("Documentation: use a source-read extension for the index link boilerplate")
[1772967206.921424] commit 6eac13c87680 ("Documentation: dev-tools: add container.rst page")
[1772967206.930220] commit 8f32441d7a53 ("Documentation: Add documentation for Compiler-Based Context Analysis")
[1772967206.939002] commit 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
[1772967206.948636] commit d5af79c05e93 ("Documentation: move dev-tools debugging files to process/debugging/")
[1772967206.957562] commit d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")
[1772967206.966255] commit 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
[1772967206.966410] 7 commits needs resolving in total
"""

Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
---
 tools/docs/checktransupdate.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index bf735562aeeb..b0bc61f958cf 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -13,6 +13,8 @@ The usage is as follows:
 This will print all the files that need to be updated or translated in the zh_CN locale.
 - tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst
 This will only print the status of the specified file.
+- tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools
+This will print the status of all files under the directory.
 
 The output is something like:
 Documentation/dev-tools/kfence.rst
@@ -262,7 +264,7 @@ def main():
         help='Set the logging file (default: checktransupdate.log)')
 
     parser.add_argument(
-        "files", nargs="*", help="Files to check, if not specified, check all files"
+        "files", nargs="*", help="Files or directories to check, if not specified, check all files"
     )
     args = parser.parse_args()
 
@@ -293,6 +295,17 @@ def main():
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
2.53.0

