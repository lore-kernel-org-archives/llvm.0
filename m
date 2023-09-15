Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740A715487
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:03:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c35ee3b0d2so20314175ad.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808211; x=1695413011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SosbTcKl/5I1PV+lrT9yDJJKNex4T51jnpPA720MDZU=;
        b=KaCB7ynJ1inZjbore3FBM5wWnICRarc+/hbjdNU3/tRyzFmWrueckUCUeSvjoQhDVW
         u+a3Si8NnVCTMZchDiEhP5V0GRqS047ZeXnk18jvpo9wjSAeK9BeA2M3V2iuim3rWyvP
         ziwBDBAJVl/4zf/XzxN63GtH+e9LQNEx9XRoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808211; x=1695413011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SosbTcKl/5I1PV+lrT9yDJJKNex4T51jnpPA720MDZU=;
        b=n82IDJkecBlbGJ0DJEHIn082uYHX9kcP0jYb5gfNDJADphLvyneM1Pe4e6K08rEYlG
         68NSug3TBsD5Ljz3eKW8vMxOas1E7Ud0YKWm2FnTm4L6UvZlu72c0G0lx+Fd03XW4HfD
         svupgJLoQ/EpUCVQQ83kSMY9OFYdOfUKuAK13iOHtRFAXnEcSED2QNENhCSA7+c5Ug6M
         M1nkt0k+N33KkgOjdLeCDELjzzjPn+kXic7FPPXlZ6sxUZKPz6WlIemmI18WAsfuK9zH
         rxL4AU+rDo+dnz1J+/LU4oGHIt67hyf/qUODi6bUWBzGFwjdQJ6Yki+1NA1eY9yJOOCH
         1+uA==
X-Gm-Message-State: AOJu0YzKhSAN2W+G7LmQiCS3JB0FPubpZ6qOYlJ8GWDwoBXlKYCmjle/
	wPPzVoIw2khNbvS8j2p9CypFSA==
X-Google-Smtp-Source: AGHT+IEOQ2lcwtuhw63TPr12BTkAZ2vOLMAc0/d5J0bOWzH8ffo1YR777tngzNTZgKuRYw8HWobCKw==
X-Received: by 2002:a17:902:e5d2:b0:1c2:5db:7f16 with SMTP id u18-20020a170902e5d200b001c205db7f16mr2968709plf.67.1694808210853;
        Fri, 15 Sep 2023 13:03:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z14-20020a170902d54e00b001bd28b9c3ddsm3856917plf.299.2023.09.15.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:03:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Song Liu <song@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	linux-raid@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] md/md-linear: Annotate struct linear_conf with __counted_by
Date: Fri, 15 Sep 2023 13:03:28 -0700
Message-Id: <20230915200328.never.064-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030; i=keescook@chromium.org;
 h=from:subject:message-id; bh=mHf9KJ3h9Dhk5paRlWrtgrLWQTsMLrfhnSPVfMSBb64=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLiQXfFuDkTYwAb1eIwKAUqGWKpMaXqd9cGQi
 R5dxa9UYAaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4kAAKCRCJcvTf3G3A
 JsXqD/wKUnbZHahdgumMZjjArgJmZqnGpwPIzL69Kn3lUZnQrQMt0KfRSnb02kD5OXo3wi9ZEUP
 P3uqJLz4U7jqO1SZzIxMjmYvmepGzlUnahBVWXbXtLqiPQx9u4wdLNaIwSEW4P3WS4POsuFWxYB
 Mrm00qIj8a6q6L+9US0fRnFGnam7yYUyGDRoLMkzVuJvxSe0sh19+nzhn27QC/r4ju6pgMsM2o4
 ewYYPkzumFt/tguEdxFax1AGz3aPpee/LWIUcfYNAZ8oefAQeBDBM8fK3M06zvNPxqThyC5JpNr
 ZF15n2uj89sAv8ZsjayB1c0LwqG4giEz3UEdB0Qxle/Im7aEYQmEPApO6meGHwlmfKravrNj7IS
 8WlL+OBZM5Rby6CcdruSt/mmPOSMIslGI0c/OL+lCtgsBZcs1EfrVAonbI5vqNix3bA9Ojj6Ryb
 N6WVanstIBM6/XABftYGqZw50OF7zw5DBLLlS62L3kGdqCXYB8exgRBmmdINZ3mh/gdCixMmXB/
 pBbWqhBkitswbnGXCwM49Xfo53Bg/dgi9ycKh95Fz2c1hojweBdm5vbOuF4EvzumIeDv/xRGiC1
 GFGKEFccMyCtOyBHGZEyobz1DMg2AHQemK7clDpXKY/tkidK/YsKqf0iy8GJGuxNAmT8HkLMEba
 Lv/anPt ijBf0Fzw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct linear_conf.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Song Liu <song@kernel.org>
Cc: linux-raid@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/md-linear.c | 26 +++++++++++++-------------
 drivers/md/md-linear.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 71ac99646827..ae2826e9645b 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -69,6 +69,19 @@ static struct linear_conf *linear_conf(struct mddev *mddev, int raid_disks)
 	if (!conf)
 		return NULL;
 
+	/*
+	 * conf->raid_disks is copy of mddev->raid_disks. The reason to
+	 * keep a copy of mddev->raid_disks in struct linear_conf is,
+	 * mddev->raid_disks may not be consistent with pointers number of
+	 * conf->disks[] when it is updated in linear_add() and used to
+	 * iterate old conf->disks[] earray in linear_congested().
+	 * Here conf->raid_disks is always consitent with number of
+	 * pointers in conf->disks[] array, and mddev->private is updated
+	 * with rcu_assign_pointer() in linear_addr(), such race can be
+	 * avoided.
+	 */
+	conf->raid_disks = raid_disks;
+
 	cnt = 0;
 	conf->array_sectors = 0;
 
@@ -112,19 +125,6 @@ static struct linear_conf *linear_conf(struct mddev *mddev, int raid_disks)
 			conf->disks[i-1].end_sector +
 			conf->disks[i].rdev->sectors;
 
-	/*
-	 * conf->raid_disks is copy of mddev->raid_disks. The reason to
-	 * keep a copy of mddev->raid_disks in struct linear_conf is,
-	 * mddev->raid_disks may not be consistent with pointers number of
-	 * conf->disks[] when it is updated in linear_add() and used to
-	 * iterate old conf->disks[] earray in linear_congested().
-	 * Here conf->raid_disks is always consitent with number of
-	 * pointers in conf->disks[] array, and mddev->private is updated
-	 * with rcu_assign_pointer() in linear_addr(), such race can be
-	 * avoided.
-	 */
-	conf->raid_disks = raid_disks;
-
 	return conf;
 
 out:
diff --git a/drivers/md/md-linear.h b/drivers/md/md-linear.h
index 24e97db50ebb..5587eeedb882 100644
--- a/drivers/md/md-linear.h
+++ b/drivers/md/md-linear.h
@@ -12,6 +12,6 @@ struct linear_conf
 	struct rcu_head		rcu;
 	sector_t		array_sectors;
 	int			raid_disks; /* a copy of mddev->raid_disks */
-	struct dev_info		disks[];
+	struct dev_info		disks[] __counted_by(raid_disks);
 };
 #endif
-- 
2.34.1

