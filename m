Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8210E7
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680211684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rt6EJ3ZeV4qq0asIu+DFVmM346d+zHCFno0fyrsIV8Y=;
	b=d2AWxwJU9Fn+ps6j7X1G5uYjnfFang3+05/j+ZZ2PSdy4mGOxDNa0OpOsX1oAkw7waiVzu
	/5U8NCSdboSyLMiiaT0SOaDtji5bF7Fu4q7uowXnRCvhUgOXx8Px0PS7Uzo30pgJDevJlR
	earN/g/kfaGI6J7QCxwg3XePbceK5+I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-Cksl7vi5PaeteKtRQUd-Mw-1; Thu, 30 Mar 2023 17:28:02 -0400
X-MC-Unique: Cksl7vi5PaeteKtRQUd-Mw-1
Received: by mail-qv1-f71.google.com with SMTP id j15-20020a0cc34f000000b005c824064b10so8923976qvi.17
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 14:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680211682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt6EJ3ZeV4qq0asIu+DFVmM346d+zHCFno0fyrsIV8Y=;
        b=zC+T4S1H+frbh9eYt5NkY4jf5SE/RPDThWUobv9/kGTtnGxAF3uEDpqi+jGNLHHMxK
         6K3j0vxQiYHZsSBBzlITJlMrt82ONf38ulP5SBQueq7fPI1HsgmWzt7jiy2CKIPN2Y7e
         17tGD1ZtXeAyWphkBoDllyicWC6aiUgcee/bVLo5Vne2haxuylIhkEyZAFHxj8DzBT2J
         9Nig1omBVPCzdQY60uVQca50j+9Fbts1LccsL65qJYfw0MHQLIeTTWU55B3P39XgssKc
         FAwLUPxpPBOsKnIfkc05W44pRNfxHVZDKZIOdG/tP44Zi2YmZ6GciOUSevioEp5+k1yk
         PhCQ==
X-Gm-Message-State: AAQBX9dVADRTisaeQ4L+CQriBOFq6VNgi0KnScF9zuhh1mS6pwm5ot8R
	NOIfssr7cTwFJPaKzJpP/jLsFvFvobtFgHYO+JUFObtU/hjz+nfWBCxBN9l4WiAZwNQQ7Jj9j8a
	/IhZU0ByqZlPoYQ==
X-Received: by 2002:ad4:4eaf:0:b0:570:bf43:48c with SMTP id ed15-20020ad44eaf000000b00570bf43048cmr43188301qvb.17.1680211682481;
        Thu, 30 Mar 2023 14:28:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bukr0FcRQMc2nG5KrRM/m8w5YgIIaWjKzHx1vTOdwbnYGxASPxDm2TVeIoaQM48y1CP6Db1g==
X-Received: by 2002:ad4:4eaf:0:b0:570:bf43:48c with SMTP id ed15-20020ad44eaf000000b00570bf43048cmr43188280qvb.17.1680211682193;
        Thu, 30 Mar 2023 14:28:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 18-20020a05620a041200b00746059d9c3fsm172156qkp.35.2023.03.30.14.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:28:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] dm raid: remove unused d variable
Date: Thu, 30 Mar 2023 17:27:53 -0400
Message-Id: <20230330212753.1843266-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/md/dm-raid.c:2212:15: error: variable
  'd' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned int d;
                     ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/md/dm-raid.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 60632b409b80..2dfd51509647 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2209,7 +2209,6 @@ static int super_load(struct md_rdev *rdev, struct md_rdev *refdev)
 static int super_init_validation(struct raid_set *rs, struct md_rdev *rdev)
 {
 	int role;
-	unsigned int d;
 	struct mddev *mddev = &rs->md;
 	uint64_t events_sb;
 	uint64_t failed_devices[DISKS_ARRAY_ELEMS];
@@ -2324,7 +2323,6 @@ static int super_init_validation(struct raid_set *rs, struct md_rdev *rdev)
 	 *    to provide capacity for redundancy or during reshape
 	 *    to add capacity to grow the raid set.
 	 */
-	d = 0;
 	rdev_for_each(r, mddev) {
 		if (test_bit(Journal, &rdev->flags))
 			continue;
@@ -2340,8 +2338,6 @@ static int super_init_validation(struct raid_set *rs, struct md_rdev *rdev)
 			if (test_bit(FirstUse, &r->flags))
 				rebuild_and_new++;
 		}
-
-		d++;
 	}
 
 	if (new_devs == rs->raid_disks || !rebuilds) {
-- 
2.27.0

