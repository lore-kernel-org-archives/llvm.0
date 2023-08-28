Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1031C15
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 22:25:54 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d78452de9cbso3928667276.2
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693261553; x=1693866353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4UULv7dEfmxkqrWSwHKGjuNFOLz/KrJvgWNb6lbuCs=;
        b=2kejcxIi3hXJKdZ1GkMysAMauwtVpiO3wB0YJXxm7YLfO/aBFv5JnmffdBZJEtO1n4
         vYy3Nj/ny3dFOO26EZvSSF7ssb/5RCa1/gNfHjWztYGwYMST20i5OgA4xd0Q9ZSLTEZe
         8E05Pcd2zETrYDm76HD4gD/UW+wi0++6YhbZkcC/WK9cY5tbs1gwSyk6qlJ/v+jXbGGu
         23sfZf9CyO1lVUYs5JUujdvX0fLdYXcDqwDu0VPZFbs0UiAaPzba4FXw59jipxriO6bp
         aurqy2AcFS9uSKPfYLzJs0CXRpTAiBQWRDczqiBKps2GMFGa6eVLlGmKJN4I+0pV2Ywu
         HErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693261553; x=1693866353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4UULv7dEfmxkqrWSwHKGjuNFOLz/KrJvgWNb6lbuCs=;
        b=Z2xnvDwbjLlBt561AZIGEBmONK0JmjK/176H6DuBep63wcUMzGQSOIwHas/GAf2P04
         D2ChMmSzGQQt1QQstaWOCwT6jSLxqZ6IdkEb9eA/+xWugmYtM5xphR4iQaiDiGPQOiNU
         ojRwJ7+rhAfPczMCL25s/6TJiKQ8qIxKu4dQ1DlQEHMXBb6AV8TW7khuyeT4isU2PXBW
         nAlUSqEqXRaxZblAeXlpIz0m90geIpdEl9yiYUFq3TTuOe+c/xlVDDgebjkPznGvDHBY
         liPTwSiXPntnfN98Ek2BkkdeFUMVrUtEnut9DYpyWr9rKqjZ/qX7dJ/tuVzlh1CrXw0E
         rWmQ==
X-Gm-Message-State: AOJu0YypZDKbhqGtYKnFpuvUcHHjkhWlpCf4JcFGUNuKM7z8PtJJQ+1q
	g8gRAjybYZU0cO+B4nUAmndfysO9nJjwcos+9UA=
X-Google-Smtp-Source: AGHT+IHebjexSi29sxNXIEYT2we/AIAJmtzB8YnCDOBzFlC85j7fdHzaoXP6O7kQ+CL4Fb+jcj+UYQmnlgWna+E5nYI=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ce44:0:b0:d72:8661:ee25 with SMTP
 id x65-20020a25ce44000000b00d728661ee25mr835131ybe.2.1693261553140; Mon, 28
 Aug 2023 15:25:53 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:25:47 -0700
In-Reply-To: <20230828-scsi_fortify-v1-0-8dde624a3b2c@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230828-scsi_fortify-v1-0-8dde624a3b2c@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693261549; l=2310;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=Ftz8IPZZMe52YKzLHVvnEUhXYdkgyGJWBaj7UgdHpqk=; b=iH/FxqmBBcMZZaaHpoka8f2O5LUsN1gUPcfI94im4BVVB2bk2tNsg449r71D9h0uE967DIv+l
 StL9iHKe4jeDQkraBppk0fVa0b2INXDjY9hVIKt4WfTZ/GlkIPGiKOW
X-Mailer: b4 0.12.3
Message-ID: <20230828-scsi_fortify-v1-1-8dde624a3b2c@google.com>
Subject: [PATCH 1/2] scsi: myrb: fix -Wfortify-source
From: Nick Desaulniers <ndesaulniers@google.com>
To: Hannes Reinecke <hare@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Tom Rix <trix@redhat.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

clang-18 has improved its support for detecting operations that will
truncate values at runtime via -Wfortify-source.

Fixes the warning:
  drivers/scsi/myrb.c:1906:10: warning: 'snprintf' will always be
  truncated; specified size is 32, but format string expands to at least
  34 [-Wfortify-source]

In particular, the string literal "physical device - not rebuilding\n"
is indeed 34B by my count.

When we have a string literal that does not contain any format flags,
rather than use snprintf (sometimes with a size that's too small), let's
use sprintf.

This is pattern is cleaned up throughout the file.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/1923
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 drivers/scsi/myrb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/myrb.c b/drivers/scsi/myrb.c
index ca2e932dd9b7..c2bdff36a6f1 100644
--- a/drivers/scsi/myrb.c
+++ b/drivers/scsi/myrb.c
@@ -1767,7 +1767,7 @@ static ssize_t raid_state_show(struct device *dev,
 	int ret;
 
 	if (!sdev->hostdata)
-		return snprintf(buf, 16, "Unknown\n");
+		return sprintf(buf, "Unknown\n");
 
 	if (sdev->channel == myrb_logical_channel(sdev->host)) {
 		struct myrb_ldev_info *ldev_info = sdev->hostdata;
@@ -1890,7 +1890,7 @@ static ssize_t raid_level_show(struct device *dev,
 					ldev_info->state);
 		return snprintf(buf, 32, "%s\n", name);
 	}
-	return snprintf(buf, 32, "Physical Drive\n");
+	return sprintf(buf, "Physical Drive\n");
 }
 static DEVICE_ATTR_RO(raid_level);
 
@@ -1903,13 +1903,13 @@ static ssize_t rebuild_show(struct device *dev,
 	unsigned char status;
 
 	if (sdev->channel < myrb_logical_channel(sdev->host))
-		return snprintf(buf, 32, "physical device - not rebuilding\n");
+		return sprintf(buf, "physical device - not rebuilding\n");
 
 	status = myrb_get_rbld_progress(cb, &rbld_buf);
 
 	if (rbld_buf.ldev_num != sdev->id ||
 	    status != MYRB_STATUS_SUCCESS)
-		return snprintf(buf, 32, "not rebuilding\n");
+		return sprintf(buf, "not rebuilding\n");
 
 	return snprintf(buf, 32, "rebuilding block %u of %u\n",
 			rbld_buf.ldev_size - rbld_buf.blocks_left,

-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

