Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FBD7E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 18:09:59 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 5so18373390lfp.1
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9m5Rd6cbLT+02hkj1gkPPi+4zyoAG3SHfMbdx9sHaQQ=;
        b=lpZ2SUYFArgTTFpWmMDS0iV0G4tege7cbfpCXfu15B1Gnaq5SS0Ay2VePEdR3uuMYv
         l3rVH0/ihLQ7tVB6GopPEGOjIwy9NLmzsrJbbRs55MLd5bNSoup3bJfVOAxw1wT/Grja
         V3ZwQRdqj1siq1/Lb5yoE1EuEpUvGnSPSNgtUub9ZRaLWoT0wJDp14ypa/vk9lnozu+j
         1gvdo5lLYz+m2Wqq7yZRhHOmjyz3TaNCEosDoJrk2mPJkP4ntOSBw+6KnC/n3FQax1nI
         j8ss++ttpnhGeV8GOkkKhm0XrGO09BusemrSQjN7lCDuc3NU1BT1zi9kh41V4KWQvtNq
         d2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9m5Rd6cbLT+02hkj1gkPPi+4zyoAG3SHfMbdx9sHaQQ=;
        b=rNeyapaNdy+8ZnhJ0t+qTD98fB5W0VdJNm7zJRLk2jRvTmdxZXW1huFXGyFWjm+Vv8
         P62ECWIV0Aomgwh3IWuzpYF6meJLqlHCOI0jIiKJUr3CvkHwn7zS0mnsVChYBd2OdAFk
         bGoSDhTVmzQE/1d08Pq3RTHQJnlroRfFOMQ3CjdjRI7QGfxD4oQUwGcufr5WapREWP62
         Ypc6JZHW2O8a9AN4+4M6geMliSmewiH93Kf5izCssyr3zhv4/H2Nw3zS3+MgqsXdTfQn
         HI4B3OqVXfvrC3SMDx0pzbez6TnZ6iADSQ6bP7jxChrqUBr1r4s7eIfdgqKpW60Bfazh
         wYVw==
X-Gm-Message-State: AOAM533LQtOEs70yhuXJ/aPTvcFcQuInLKG9n6CIh6Sv47Tq7GTGBs+X
	JVrQHarlkKgkyjiO48uyg1U=
X-Google-Smtp-Source: ABdhPJyG52BPqTv2glo4DLEnkeDLYwl5+yRDzvxOMFCaYjOorInwsOcpA8kDs+X4oogvWLNMmL6kVg==
X-Received: by 2002:a05:6512:1382:b0:445:9536:903 with SMTP id p2-20020a056512138200b0044595360903mr12926829lfa.89.1648318197835;
        Sat, 26 Mar 2022 11:09:57 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id h2-20020a05651c124200b002492835aa87sm1107591ljh.118.2022.03.26.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 11:09:57 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Eric Biederman <ebiederm@xmission.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kexec: Remove redundant assignments
Date: Sat, 26 Mar 2022 19:09:47 +0100
Message-Id: <20220326180948.192154-1-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments which end up in values not being
read either because they are overwritten or the function ends.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 kernel/kexec_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 68480f731192..d08904a27362 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -768,7 +768,6 @@ static struct page *kimage_alloc_page(struct kimage *image,
 				kimage_free_pages(old_page);
 				continue;
 			}
-			addr = old_addr;
 			page = old_page;
 			break;
 		}
@@ -788,7 +787,6 @@ static int kimage_load_normal_segment(struct kimage *image,
 	unsigned char __user *buf = NULL;
 	unsigned char *kbuf = NULL;
 
-	result = 0;
 	if (image->file_mode)
 		kbuf = segment->kbuf;
 	else
-- 
2.25.1

