Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F118BE7
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715126565; cv=none; b=rmXhOmhw7aZtCinlkcTDztSD81uZcr8whVerfATu+YMoh1Yg+Px3ii2bkNkPEFGMl9lgdZceEe7euXpk90IJEPtuHGaAyzdr5Axz00ifg0Z9o4ZDAFbM3Y/y4XCiF0YdxXEE+ePbyUJrmDcS4nM54T4Xqab3rnsq3RZA7AcrKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715126565; c=relaxed/simple;
	bh=x8yzkCVk6Wolns38BJznG8F1DF6BmLfscTRYXzWxiFY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JQDmvBQ3GeekqXTpjWavDXhORHr0PoBy+bzO1lzJRO+iWmlCUnWXbv6blQd3iePueFzeEwpcuHLXsYKJ+5HFTp4coRZ/4JC0/5iMzIbZzRMz+bFNNRaqZiaW0ZkK8v9qCqmZEw7m7QURD4cGKbBSGh5OrTeUzillwO+672m2qkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zu15GiAH; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zu15GiAH"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-7decb47ceebso448406139f.2
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 17:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715126549; x=1715731349; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2EzQcPBxS/fsLuAnrDweegMDqFpI++/qb4hh3xWGZ0s=;
        b=zu15GiAH5tpd2OZufPkrulzO6WjzF/8PQDkxOLPpGuyPFAbxrSoxzTXWdyTUdChqsc
         ZQT0hRxLddXb5LfhMnv/o2eclFHNsWMsMDFH7leladz/6jnsadLliFyn/1zCM+B1Yv1O
         eV/iwZGz0qE8hvkiu1AYlW3GpbcUE4rSlXgZ0Ddvm/6xSTL/Dht3XBmZ8GB9MRU+e/FP
         5woe+ZlqahvAhOGMiSfofMgUaoq4B1OpnOSK18mZFfVajSkH0sII3omtMnDENYjma+Gt
         HytC/Ygw0vYbFAoaafBxyPAY6U4jbfA5BI4iEddTnb+qXpb2FmzfL6p2ZJBxff3u7UmZ
         V32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715126549; x=1715731349;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EzQcPBxS/fsLuAnrDweegMDqFpI++/qb4hh3xWGZ0s=;
        b=jDKlJIc/m2nOd72opxWYSKgRHq0b+d2O5Zo02BYayFg+ypP9O/DUXeg3xzLwPkvMzA
         JNLfFG7XKq1J5L6dPISzheb79mWWcyklBMvKoj7im1aiDmFt/mEn5Gz/s4Ltc5/bz21J
         Rk5q5jrLUACVWeqCmJigN74cS4bfZIocd0tbje0k/94PFPFF1b/Ufxg8yHhZzTg7K0wJ
         IkPcMQcn+krYKS8f15F78RU3QZwk9cmA9S8yb8ZnNNprJXhfBUHKFd2C4STZoJ34eaJJ
         gtiijw4VPIpm2oHDi27uM3qF68jAE08FUNkdZtCCSRj15uKMts+2lmRLfsx/lF79xPr+
         CLAA==
X-Forwarded-Encrypted: i=1; AJvYcCXEq7n1NzkkT8mbfqJ6cJ8G1aEuNeyRVWLawBTQDzOglMCoPIFfQcFWL/7/ibqFrHPGrpediy8dyungFvZWLX/K1ep6tg==
X-Gm-Message-State: AOJu0Yw4QlEE7WVpwiT/jhRi1nUOE3P4wr/ORy31G6YVndybtomDHAkS
	1FsNbnWF07XU9SquSl93+uWejyh2gw1FPykj6ZVQor4HWu/0iib+mlETn7yoJ1ZDx4glORb00aT
	alxWulKxFo2C58xfDggn2SQ==
X-Google-Smtp-Source: AGHT+IGw/gpETax6yTNA3i+9Zl+QI37sM3g2h6H0L5ARm9tG/6yPfzStL17AVO5/mFkhkenOKA0hprTVnxl15+f/xA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6638:1648:b0:488:d489:3940 with
 SMTP id 8926c6da1cb9f-488fdb12340mr66133173.3.1715126549481; Tue, 07 May 2024
 17:02:29 -0700 (PDT)
Date: Wed, 08 May 2024 00:02:27 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABLBOmYC/x2MWwqEMBAEryLzbSCG+FivIoto0urAopJZRAje3
 SjUT0F1RxIEhlCbRQo4WHhbkxR5Rm4Z1hmKfXIy2lhd6lqN9iFlSkIv+MH9e9kBr1A1TntrquZ TUNrvAROf73f3va4bRAFkr2sAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715126548; l=2860;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=x8yzkCVk6Wolns38BJznG8F1DF6BmLfscTRYXzWxiFY=; b=Sj99Fwr6AVwgXA4Y1BeQQmQ9JnnNDd7bY5VrSgi54QBOz4VkOqHiWOJ+sI+4TBriRdbf+MPy6
 pOsiE1rtNb6DspdDULYONRJEuLYkienHIofZLsdYrGz2xSOQp0ISZ1m
X-Mailer: b4 0.12.3
Message-ID: <20240508-b4-b4-sio-sr_select_speed-v1-1-968906b908b7@google.com>
Subject: [PATCH] scsi: sr: fix unintentional arithmetic wraparound
From: Justin Stitt <justinstitt@google.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Running syzkaller with the newly reintroduced signed integer overflow
sanitizer produces this report:

[   65.194362] ------------[ cut here ]------------
[   65.197752] UBSAN: signed-integer-overflow in ../drivers/scsi/sr_ioctl.c:436:9
[   65.203607] -2147483648 * 177 cannot be represented in type 'int'
[   65.207911] CPU: 2 PID: 10416 Comm: syz-executor.1 Not tainted 6.8.0-rc2-00035-gb3ef86b5a957 #1
[   65.213585] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   65.219923] Call Trace:
[   65.221556]  <TASK>
[   65.223029]  dump_stack_lvl+0x93/0xd0
[   65.225573]  handle_overflow+0x171/0x1b0
[   65.228219]  sr_select_speed+0xeb/0xf0
[   65.230786]  ? __pm_runtime_resume+0xe6/0x130
[   65.233606]  sr_block_ioctl+0x15d/0x1d0
...

Historically, the signed integer overflow sanitizer did not work in the
kernel due to its interaction with `-fwrapv` but this has since been
changed [1] in the newest version of Clang. It was re-enabled in the
kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
sanitizer").

Let's add an extra check to make sure we don't exceed 0xffff/177 (350)
since 0xffff is the max speed. This has two benefits: 1) we deal with
integer overflow before it happens and 2) we properly respect the max
speed of 0xffff. There are some "magic" numbers here but I did not want
to change more than what was necessary.

Link: https://github.com/llvm/llvm-project/pull/82432 [1]
Closes: https://github.com/KSPP/linux/issues/357
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Here's the syzkaller reproducer:
r0 = openat$cdrom(0xffffffffffffff9c, &(0x7f0000000140), 0x800, 0x0)
ioctl$CDROM_SELECT_SPEED(r0, 0x5322, 0x7ee9f7c1)

... which was used against Kees' tree here (v6.8rc2):
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=wip/v6.9-rc2/unsigned-overflow-sanitizer

... with this config:
https://gist.github.com/JustinStitt/824976568b0f228ccbcbe49f3dee9bf4
---
 drivers/scsi/sr_ioctl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sr_ioctl.c b/drivers/scsi/sr_ioctl.c
index 5b0b35e60e61..2d78bcf68eb3 100644
--- a/drivers/scsi/sr_ioctl.c
+++ b/drivers/scsi/sr_ioctl.c
@@ -430,7 +430,8 @@ int sr_select_speed(struct cdrom_device_info *cdi, int speed)
 	Scsi_CD *cd = cdi->handle;
 	struct packet_command cgc;
 
-	if (speed == 0)
+	/* avoid exceeding the max speed or overflowing integer bounds */
+	if (speed == 0 || speed > 0xffff / 177)
 		speed = 0xffff;	/* set to max */
 	else
 		speed *= 177;	/* Nx to kbyte/s */

---
base-commit: 0106679839f7c69632b3b9833c3268c316c0a9fc
change-id: 20240507-b4-b4-sio-sr_select_speed-e68c0d426891

Best regards,
--
Justin Stitt <justinstitt@google.com>

