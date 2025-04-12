Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5191922C4;
	Sat, 12 Apr 2025 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744496902; cv=none; b=i//fHs19ZlcvNvsqNBRSv39bddFhwBl3gPhIfyWfT+EIRru16p0Ln6tX5Zr02zAbpQzVDkwmROOy31YBhuAsD7Yu1sF30y/LG5fb7Je74i2Lia7bIDvJ1pJrGHaroaIVJIqtR3Yo9S6+Z3dQqqRy9DAehoT0/LWlC8G8Vtrxtgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744496902; c=relaxed/simple;
	bh=r2pJ9ECQtCo3FvrB2D7ogVBONNlppbZSTFqZGpwzXl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kMAHyRB3tXW4seQnbC3djn9zvoqftHO1hRH0oy6PFOg6lU4qAcvyz2kdt/YQraOhISd+IEaGEg19VElHoiMq+lpVpnyQH0F7eXfnoxE7jonzLlJQ9oRodvpRaBFvH1WxxJtDrdfHn2jkQow1ppf/8QaeZEYfsjsI3yXDpA8tj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHnL8cqP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHnL8cqP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1780888f8f.1;
        Sat, 12 Apr 2025 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744496899; x=1745101699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNS6Km7it7tBhxBj7WjrNGwGk7u4QM9jaHaHQcsfxXw=;
        b=FHnL8cqPYPE+ToOJvrPHGrZ6BlxL1v/veVrVGqfNP8O+tdBW3DZLoL2xnXM8QL5pp5
         xEtvorF+mBkCLEZ3ti4yyT2IIuY81ZOL185LHyUT6Fsq07easHo0saJX3qULxZY+N8MH
         zAGQo08yyL/2EMQT+QVnINPRw3VExf3/YVUCm5YrtIJ07fatruAtVNw8SHNj5RNqkAsR
         VxF9P4raibxRO1EyNYA7NoHPxipw2Ni8wXOYQ8HoNoTkioLDn8zUH2z6mwPwKt33v2SF
         WX0v+DUjKZAB6u1c/XLpiB2GvSzeDecNDV61QsYMTtCe+NUUE36iv5aJwlNsNmCq6Dco
         4bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744496899; x=1745101699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNS6Km7it7tBhxBj7WjrNGwGk7u4QM9jaHaHQcsfxXw=;
        b=GjViFiG47bExgHNcBrHVzYFlO1uIE9u7Y+FtIoUZv55YM7qCz36HdvVnIOFdpkPCJc
         QHQQRTkRmikllPP7gdt8BawwfaYnZuQGIYIOzkIz/4akQEWD5+/v77JO95X6yYrwIC/9
         vpNrMVxAN7ka4DEb9xErt5L/n1C80m9MrEApDvEPqjP7oHBZ9EuJWIo9EWl26MDO/qWm
         F4AKmLe3CXVJA82ZXzLz46T9nmUmv/gKqv8EQAB3kKrNh04VtvLvfTTgbyw145tHAD1F
         AZAvaijXhQYzWhlc97BasdzYSgu0B90MIr1yIkhIpgPyVwxUAAGcd0+JWGP1mU2MvPKH
         H9NA==
X-Forwarded-Encrypted: i=1; AJvYcCXJlRDg4e/zjBrVJ/01vCS4HwgmV+bT2vJFeY6ywIUEs6pFSRYVcGLE1STnAyzmjm5ScfAq1neJtXIuC8wB@lists.linux.dev
X-Gm-Message-State: AOJu0YzfPbNYPDJUuCmTntaL42mzOjYjKZx31HfcjMrEu1sGA7WmXc74
	XJaoPvoYeKsp/u69G7aOCXz1BHgqc8+DBj0GCb96vSCYbAX95tIu
X-Gm-Gg: ASbGncvpeVR9keZIOeHgloY5n9gxk6EzOxvhrAGfC99pidlhrXVF3cAH0LjEX7KbMBc
	3MGM/rwuepmhj6P96Dp3UVUzND6QhCe4FovkWgpxCK+txlPjhZ8sfLZBKCM5Z0EQXTr0bmOZZ5A
	e6BabUEC5KMFo/BW/ZBv3UtKyBY9supSvk1sQcFbcSWv3oBwlpOmvZs90LUUdCzF8zdiv4i3mZj
	nbpDV4mwEHV41wHB++fBv9ktSPVDc5++h/cD7vR0w9uPmy2AOJDdia70EvjiZlz5k6ljhr/qBM1
	bnPzVts4OttmIdHPOmxBgoTDto4WC+qMVIc1p+0=
X-Google-Smtp-Source: AGHT+IGXIrxkJ8nKaisNDDAp5cgBKkEtUUgaMk8r2LuFdsV/EADhHJUGeS0JND0WARPR5ri1DSf5wA==
X-Received: by 2002:a5d:648a:0:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39ea52124fcmr5724512f8f.29.1744496899192;
        Sat, 12 Apr 2025 15:28:19 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:2ee:4c6:5dc7:f715])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977513sm6079017f8f.42.2025.04.12.15.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 15:28:17 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jlayton@kernel.org,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ref_tracker: use %ld format specifier for PTR_ERR() during directory creation failure
Date: Sat, 12 Apr 2025 23:27:44 +0100
Message-Id: <20250412222744.9459-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PTR_ERR yields type long, so use %ld format specifier in pr_warn.

Fixes: ada5a12aae58 ("ref_tracker: add a top level debugfs directory for ref_tracker")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504130520.rX5EVbVq-lkp@intel.com/ 
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com> 
---
 lib/ref_tracker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 4064154252a6..02e9f0c3dd82 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -283,7 +283,7 @@ static int __init ref_tracker_debug_init(void)
 {
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
 	if (IS_ERR(ref_tracker_debug_dir)) {
-		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
+		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %ld\n",
 			PTR_ERR(ref_tracker_debug_dir));
 		ref_tracker_debug_dir = NULL;
 	}
-- 
2.39.5

