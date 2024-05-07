Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CC79CF
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715056456; cv=none; b=E0XANG7Aq8d0HQ4s12bWqXWHnytUbEBg4tKxVIc1nNeW7mobSkql6piLrDRILYaPjxIiCV+y01KL2w07ZI2beJ3sMvdq/2LeI02eOVBE6C3FOyZNaZt+gToC8L/a6uyIr+tPuF7FlyfF8deMjjBuBqcN7JDndK/PvRg+2dnyADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715056456; c=relaxed/simple;
	bh=VoLUIrz/OU6msMrgeqVOJYoI9HwcHFS/vVFRyCpgzQA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TLRpI27Hq18J07H6hFFRzEEoHPjRunNoisTmeYg4f8IyyCyitnNh+Onsbbw29i18zngeiBWVIGu9euUgu78Nt1BhutMZA/SArZ2a73HQ0Jua9IKxv8Z92NedmV5bpQjB1ynPhi15nCby503WvIT2WhgIgEAOjmOa0kE3KrCtidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gAsf3ylA; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gAsf3ylA"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-7dea5889eb7so279164539f.1
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 21:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715056453; x=1715661253; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+ig3H9HcjFVWhM4GpWFctrqstrntznWN1owqzDtN7o=;
        b=gAsf3ylAHn90f5Lp0IYr4heR9NWqEp9Y62oF9ze/CiSRetJ0ByOmf027qNpMwYium7
         +qcVE6mghxdr9Tc6il46tNISDZX1q1sA2i4vwpB0TLZE+KazsHdmE9N2/MrPKFQXBUT4
         /I7ny97VPT9uHpJiIM3LfNvBVWQzVl3Z0Ldf6i+QVC32EzQg1bVllZDEfxebtZqaNUsO
         Zs5C519KLO7nsoBkbWc0BRonQM1zJVz8Kcy535j/7jMx+SefGrj66VmChc1QJH0fNjTT
         ZoH3gUi4eJmfJSJyUswHiMvzVal7RR2TA0ecdiuGlGZTunRgqZYNkTgtoWcmV9CgHf6M
         7viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715056453; x=1715661253;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+ig3H9HcjFVWhM4GpWFctrqstrntznWN1owqzDtN7o=;
        b=HHmsSML0KGn+trQOwDb+GPFo8E5XmRLc9cjrDZ6qh5bGxXQfRLsKaTgLf1cW/lOHF7
         Ete8Ji31vcN4FhuhVM/sjkjb+zIhtKp2SrdPTaPPdxZ4Z+DhWBUR/Rk1O6gnJKnqPwaa
         oA5/jIb0xHBV3aF3qLHivGAbr30RFyfjqGKyatZmN3LPVGEpx7Ecx0oP5dLbGvxR+au6
         goMBXIpbhfpcA+jVe0OE2YzYMnmAQS8wRAWgePXAFZCrYvArwQ/6k5EOrGSm5t7MejNg
         tkldiXnKGPmNSyDKhyOy7KhFGUmafY8rpuOtnadxv4BBwrnexSGbDfUWFQNE37pfSlQs
         T/xw==
X-Forwarded-Encrypted: i=1; AJvYcCXfOFGyg2JOtEyHF8kLjd9y7THAokWHbAxjkXPbKiWnsZLXkZm2HGMepPlnholYCwDstQLHOPudeprH2sIY8jdnKUs0vw==
X-Gm-Message-State: AOJu0YzUy9V/SOmFUj6VghXUSLEGtvEXYWZi0BSsHIf5zCfwbm7udcQo
	EGpoKHP3PyHyQ8PmhgFystV/ANgvPaiTsqNqIWcA8NOOTv+AURIeXrHAKFW+RaMvXSMuFGyXQoT
	LBZ16/XRtttqqiSrfhiujFw==
X-Google-Smtp-Source: AGHT+IGTILHjt43TXCxmtYxcfmS+4MJev84ovtenP1+KQDd/DVDEtEeUQDg3yhroMHs6a9dHyrDWNkWaDI7ujZB31A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6638:4c85:b0:488:59cc:eb42 with
 SMTP id do5-20020a0566384c8500b0048859cceb42mr378207jab.3.1715056453627; Mon,
 06 May 2024 21:34:13 -0700 (PDT)
Date: Tue, 07 May 2024 04:34:13 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAESvOWYC/x2MQQqAIBAAvxJ7bkHLEvpKdFDbai8mWhGIf086D
 sxMhkSRKcHUZIj0cOLTV5BtA+4wfifktTJ0olNiEBqtwuqgvwLeiRxK0xs7ars6klCrEGnj9z/ OSykfpVeGvmEAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715056452; l=3068;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=VoLUIrz/OU6msMrgeqVOJYoI9HwcHFS/vVFRyCpgzQA=; b=H9gQ5PFH0w23ZB7xRv9INspYuKzIhVH014LQHjdeRlKZw/sFAHK0God3LCBXOJwShjxnVIZ4K
 uAen7JztfIyB7uoeFaR18jV7cx8FJGVE/vhjSfsSgKurk0StUR1Unf3
X-Mailer: b4 0.12.3
Message-ID: <20240507-b4-sio-ntp-usec-v1-1-15003fc9c2b4@google.com>
Subject: [PATCH] ntp: remove accidental integer wrap-around
From: Justin Stitt <justinstitt@google.com>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Using syzkaller alongside the newly reintroduced signed integer overflow
sanitizer spits out this report:

[  138.454979] ------------[ cut here ]------------
[  138.458089] UBSAN: signed-integer-overflow in ../kernel/time/ntp.c:461:16
[  138.462134] 9223372036854775807 + 500 cannot be represented in type 'long'
[  138.466234] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc2-00038-gc0a509640e93-dirty #10
[  138.471498] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  138.477110] Call Trace:
[  138.478657]  <IRQ>
[  138.479964]  dump_stack_lvl+0x93/0xd0
[  138.482276]  handle_overflow+0x171/0x1b0
[  138.484699]  second_overflow+0x2d6/0x500
[  138.487133]  accumulate_nsecs_to_secs+0x60/0x160
[  138.489931]  timekeeping_advance+0x1fe/0x890
[  138.492535]  update_wall_time+0x10/0x30
...

Historically, the signed integer overflow sanitizer did not work in the
kernel due to its interaction with `-fwrapv` but this has since been
changed [1] in the newest version of Clang. It was re-enabled in the
kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
sanitizer").

Let's introduce a new macro and use that against NTP_PHASE_LIMIT to
properly limit the max size of time_maxerror without overflowing during
the check itself.

Link: https://github.com/llvm/llvm-project/pull/82432 [1]
Closes: https://github.com/KSPP/linux/issues/354
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 include/linux/timex.h | 1 +
 kernel/time/ntp.c     | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/timex.h b/include/linux/timex.h
index 3871b06bd302..976490a06915 100644
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -138,6 +138,7 @@ unsigned long random_get_entropy_fallback(void);
 #define MINSEC 256		/* min interval between updates (s) */
 #define MAXSEC 2048		/* max interval between updates (s) */
 #define NTP_PHASE_LIMIT ((MAXPHASE / NSEC_PER_USEC) << 5) /* beyond max. dispersion */
+#define NTP_MAXFREQ_USEC (MAXFREQ / NSEC_PER_USEC) /* scaled to microseconds */
 
 /*
  * kernel variables
diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index 406dccb79c2b..19027b6d0827 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -454,12 +454,12 @@ int second_overflow(time64_t secs)
 	}
 
 
-	/* Bump the maxerror field */
-	time_maxerror += MAXFREQ / NSEC_PER_USEC;
-	if (time_maxerror > NTP_PHASE_LIMIT) {
+	/* Bump the maxerror field, making sure not to exceed NTP_PHASE_LIMIT */
+	if (NTP_PHASE_LIMIT - NTP_MAXFREQ_USEC < time_maxerror) {
 		time_maxerror = NTP_PHASE_LIMIT;
 		time_status |= STA_UNSYNC;
-	}
+	} else
+		time_maxerror += NTP_MAXFREQ_USEC;
 
 	/* Compute the phase adjustment for the next second */
 	tick_length	 = tick_length_base;

---
base-commit: 0106679839f7c69632b3b9833c3268c316c0a9fc
change-id: 20240507-b4-sio-ntp-usec-1a3ab67bdce1

Best regards,
--
Justin Stitt <justinstitt@google.com>

