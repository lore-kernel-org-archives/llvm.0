Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6E2102
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 13:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679923411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ui34VP0V+QC6wWMG4ZdbC0pVVInhui/1SjnIEjUUE7Q=;
	b=AFSETKwrndjWF5jPBWjZM+jz9sRvKE0TiQUeR7/obg/vUtLPucTT6KWKMD3MDDA0tCOL1Z
	9JykrYBdUKL2+s24VCuRG2goFpNPC4AWJPOUQOWNoMcZDeTRD33eGtujj4Kjh2RUejayK1
	s7tcK8tJuKZD0AMk35OjZ3HQR02bUIo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-8oONhmAqORWbB8JKhnbgLA-1; Mon, 27 Mar 2023 09:23:30 -0400
X-MC-Unique: 8oONhmAqORWbB8JKhnbgLA-1
Received: by mail-qv1-f69.google.com with SMTP id e1-20020a0cd641000000b005b47df84f6eso3537163qvj.0
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 06:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui34VP0V+QC6wWMG4ZdbC0pVVInhui/1SjnIEjUUE7Q=;
        b=46m15j4K6Qk26gfHD22gzoDoJ4GFYsteVriWRZ2KFlqptkS8Ee1QxTkaBDq0vR53uI
         1J36KMH/ScA4W5AkMqSUfWOCqtRV7ABhGIiNWzBD4TZC4UugRRYGNUd4uicM8uxoVsi3
         rfYeuSLw1TFTZQAhMWcjwpNSGtWpGyL8olt1Gtb5pb1TfrDOkNVjORbeaEpbNjAm2wef
         XNYhJAluqgHiTwLI/GiIjoSh10vJVDZe7N54ylmzXlJDKUc2qI7qPZLEWYipUOFHz1j/
         lN1WY4zPdUvag86MpQtnCoT9Dj3Uo18RLHUONk+lVWaCIUb/e7IM5r0AchBV9DaRYE+7
         KriQ==
X-Gm-Message-State: AO0yUKUXt8x8vXwLlwvkTY1LzNh7atXKkYGwtKcSAYVniI6bE1dlkaVp
	8qqxhkW2+4a+UNJ/YZOy59n0pI6ylQK380BXFRDgR0YU/eBb6j+tAhNsnjlOYsz9chHVIekJouO
	xJn00rDgPv5LTAA==
X-Received: by 2002:a05:622a:40a:b0:3db:7f42:ab0f with SMTP id n10-20020a05622a040a00b003db7f42ab0fmr19454883qtx.67.1679923409754;
        Mon, 27 Mar 2023 06:23:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set+TKrzjeDXUF1w6E7KXi6Z2D3VUgzjcBgQe8o1XtRAeXO/pT5DBPtMKGbooPmazbkCED5aifw==
X-Received: by 2002:a05:622a:40a:b0:3db:7f42:ab0f with SMTP id n10-20020a05622a040a00b003db7f42ab0fmr19454839qtx.67.1679923409444;
        Mon, 27 Mar 2023 06:23:29 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j23-20020ac86657000000b003e0c29112b6sm10606129qtp.7.2023.03.27.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:29 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: song@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] md/raid5: remove unused working_disks variable
Date: Mon, 27 Mar 2023 09:23:24 -0400
Message-Id: <20230327132324.1769595-1-trix@redhat.com>
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
drivers/md/raid5.c:7719:6: error: variable 'working_disks'
  set but not used [-Werror,-Wunused-but-set-variable]
        int working_disks = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: remove brances
---
 drivers/md/raid5.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 7b820b81d8c2..812a12e3e41a 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7716,7 +7716,6 @@ static void raid5_set_io_opt(struct r5conf *conf)
 static int raid5_run(struct mddev *mddev)
 {
 	struct r5conf *conf;
-	int working_disks = 0;
 	int dirty_parity_disks = 0;
 	struct md_rdev *rdev;
 	struct md_rdev *journal_dev = NULL;
@@ -7912,10 +7911,8 @@ static int raid5_run(struct mddev *mddev)
 			pr_warn("md: cannot handle concurrent replacement and reshape.\n");
 			goto abort;
 		}
-		if (test_bit(In_sync, &rdev->flags)) {
-			working_disks++;
+		if (test_bit(In_sync, &rdev->flags))
 			continue;
-		}
 		/* This disc is not fully in-sync.  However if it
 		 * just stored parity (beyond the recovery_offset),
 		 * when we don't need to be concerned about the
-- 
2.27.0

