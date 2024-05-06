Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1B515B0FC
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 22:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032914; cv=none; b=jXiG91actrWH6eNkobl1XDl5HmDlZssOZjVd5Bw1V2a2roC+8mIHsrPtwVybg5R1msqbUn/yR+D2C8eCLtS8Uh7OCIYM3NTcuIL2rGp7K8oyI7q91KJW30zwCSHF1/Mf6jpuF0DTgdutOZVIIaw1lQ09tHtdn6gi1ip1Tk1RCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032914; c=relaxed/simple;
	bh=kU+lR0DZxbMgV2U5VQ8NM4JNmcX1yW8z7z808SQVXeA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GJMMb7a4Xg/gukvzJfPUbKv4CuYe5TS0rYEr0nfPd+tPC1mwzxHtSHKI8XI+J2JXH0Pf7lnoxoA0sgkXnNb5G7AUDQ+o62UlKqpScQgjUxMSifSladrq+44iiju5zGMnCnLgZh7zlTiST2ArngRMVCpZYuJ3Mxv1pb7AX1OR+wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KECa8L7E; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KECa8L7E"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de74a2635e2so4231725276.3
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715032911; x=1715637711; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rb3i10L3xKZPeP1XLskDlTmmT9UurHHEcsyeuqrFshw=;
        b=KECa8L7EHWvbjO+PzDRNU+Sh/GP/tHIK7wb2QdRTW8cF5CSZcS1d5R0uCakMVvelk8
         2VPVK3i3bgdoXPWCLQCabDP8zLt9koFGLtu/gd780CjLVQXVJuLFvAiO+CwbMeCmHzZr
         0qV5bwINKXGIVj9i4dqq8cEgYIQBeMn18ovWO8rEN6v8kQb1iRneN7E/jO+RomFssu9L
         ndlNtiprwLGX0Yjq6bnvf7LQdcnjX4ZvIcyH7OZVl91zhcHMRa/pZYJc9Z0etuGt0w8B
         47Op23tCXNDmBT+ztJah8bG2GSdI71Vw/PZFG5OoVwXEd/QyxJ7iJWD2p0HkOvKgLR5F
         wI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715032911; x=1715637711;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rb3i10L3xKZPeP1XLskDlTmmT9UurHHEcsyeuqrFshw=;
        b=m1g3rS1bpDbthsG7OOjqx5bUcNL6PIlD/CCODLRCqiEbOtKkoLBgTN9eczrGxxuTHj
         VKk6AJExj5AiNZIpAghsvwJILUMNVHegwDnOpZhMxBcdF8VQq1L1kFvBjTWxZskc/bg1
         RjFRWa0LPiXCa+FckatGrd4PCP/zb21lD6nPHeTkx/Id1jtYCNro0MuvLUiGdXnxAlay
         JDH7uBPiwvWbU94bFta6OUObqAyy9JglO0ei9HFdJgr40olJd8l4Lwd+i2oJPm2Fx92D
         07pdx5nPO+Rjr2xeT6eAFaSeHb2Fq6FfEeaE8ZPV8/Bjuq0dcSAQS/z8g6lRbdtjnZoe
         vdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7y0XDvJReMLV0kjP+irNrkiOPb5KotKabU+OoRagL8YVEWVvw5s9F9AH0YL1cq6dDLeRRMJQUQLbGTaLr3xrvaENDSA==
X-Gm-Message-State: AOJu0YzmN+fhdsksAMlGJCZIOKDAnM9V2ipJTsZhZAzfyICeGYFitmgA
	vl6sOC97BntLRoU9Q6Kf01kSQlLBhOcnYi/0H4hGCrDc0yOfircb+DXQzDDnY6sGjBfOWoA0voh
	3CGjd+Vk1O/FiIushcqi6kA==
X-Google-Smtp-Source: AGHT+IEpM/CW+IzpKI5pf6ejLDz2njnnlv8Mrc79gzUU3S+tN2TrJQIB2lfcoknZBNABtKf8zhOPaLVb79fdbF/q0g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1890:b0:dc2:2ace:860 with
 SMTP id cj16-20020a056902189000b00dc22ace0860mr1575545ybb.2.1715032911019;
 Mon, 06 May 2024 15:01:51 -0700 (PDT)
Date: Mon, 06 May 2024 22:01:49 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE1TOWYC/x2MQQqAIBAAvxJ7bsG2NOgr0SFtq72YaEQg/j3pO
 DAzGRJH4QRTkyHyI0kuX6FrG3Dn6g9G2SoDKRqUVgbtgNVBfwd06IhGq8gZvfZQkxB5l/ffzUs pH+sGDF1eAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715032910; l=3660;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=kU+lR0DZxbMgV2U5VQ8NM4JNmcX1yW8z7z808SQVXeA=; b=5LJ5JRaXRTpCfLkE6q9ThlsokKd4Xq4NFewh4JQ57yRS0YwafGLYbECgD1T4SsmFrS/6mzt04
 yQOfOeWaBkHDEOGoCnJ4f0E3ZPr5i7HU5lVTG7KogefgIeP/XkVtQnl
X-Mailer: b4 0.12.3
Message-ID: <20240506-b4-sio-ntp-c-v1-1-a01281aa01ba@google.com>
Subject: [PATCH] ntp: safeguard against time_constant overflow case
From: Justin Stitt <justinstitt@google.com>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Using syzkaller with the recently reintroduced signed integer overflow
sanitizer produces this UBSAN report:

[   46.809326] ------------[ cut here ]------------
[   46.812882] UBSAN: signed-integer-overflow in ../kernel/time/ntp.c:738:18
[   46.817676] 9223372036854775806 + 4 cannot be represented in type 'long'
[   46.822346] CPU: 1 PID: 685 Comm: syz-executor.0 Not tainted 6.8.0-rc2-00036-g679ee73ec453 #2
[   46.828270] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   46.834836] Call Trace:
[   46.836625]  <TASK>
[   46.838147]  dump_stack_lvl+0x93/0xd0
[   46.840771]  handle_overflow+0x171/0x1b0
[   46.843516]  __do_adjtimex+0x1236/0x1440
[   46.846275]  do_adjtimex+0x2be/0x740
[   46.848864]  __x64_sys_clock_adjtime+0x154/0x1d0
[   46.852164]  do_syscall_64+0xd7/0x1b0
[   46.854783]  ? arch_exit_to_user_mode_prepare+0x11/0x60
[   46.858426]  entry_SYSCALL_64_after_hwframe+0x6f/0x77
[   46.861914] RIP: 0033:0x7fde90aaf539
[   46.864500] Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 8
[   46.877151] RSP: 002b:00007ffebfe63358 EFLAGS: 00000246 ORIG_RAX: 0000000000000131
[   46.882279] RAX: ffffffffffffffda RBX: 00007fde90be3f80 RCX: 00007fde90aaf539
[   46.887270] RDX: 0000000000000000 RSI: 0000000020000280 RDI: 0000000000000000
[   46.892174] RBP: 00007fde90b0e496 R08: 0000000000000000 R09: 0000000000000000
[   46.897061] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[   46.902020] R13: 0000000000000095 R14: 00007fde90be3f80 R15: 00007fde90be3f80
[   46.906946]  </TASK>
[   46.908537] ---[ end trace ]---

Historically, the signed integer overflow sanitizer did not work in the
kernel due to its interaction with `-fwrapv` but this has since been
changed [1] in the newest version of Clang; It being re-enabled in the
kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
sanitizer").

Nonetheless, let's slightly rework the logic surrounding time_constant
and how it is incremented such that we avoid unintentional wrap-around
(even though it is extremely unlikely to be hit in non-fuzzing scenarios).

[1]: https://github.com/llvm/llvm-project/pull/82432

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 kernel/time/ntp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index 406dccb79c2b..a9f039601968 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -65,6 +65,9 @@ static s64			time_offset;
 /* pll time constant:							*/
 static long			time_constant = 2;
 
+/* pll time constant increment:						*/
+static long			time_constant_inc = 4;
+
 /* maximum error (usecs):						*/
 static long			time_maxerror = NTP_PHASE_LIMIT;
 
@@ -734,10 +737,10 @@ static inline void process_adjtimex_modes(const struct __kernel_timex *txc,
 
 	if (txc->modes & ADJ_TIMECONST) {
 		time_constant = txc->constant;
-		if (!(time_status & STA_NANO))
-			time_constant += 4;
-		time_constant = min(time_constant, (long)MAXTC);
-		time_constant = max(time_constant, 0l);
+		if (!(time_status & STA_NANO) &&
+		    unlikely(LONG_MAX - time_constant_inc >= time_constant))
+			time_constant += time_constant_inc;
+		time_constant = clamp_t(long, time_constant, 0, MAXTC);
 	}
 
 	if (txc->modes & ADJ_TAI &&

---
base-commit: 0106679839f7c69632b3b9833c3268c316c0a9fc
change-id: 20240506-b4-sio-ntp-c-c227b02c65a3

Best regards,
--
Justin Stitt <justinstitt@google.com>

