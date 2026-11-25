Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645019;
	b=ZG/lRXJ59bJGMQ2NZnGOmfIbFTvhmiRSTzvTpNk1GBnl/R7EZBPBmKb5cU1ERzdTrlEo
	 2CiVFKvTlUifDt8CQTNXZ3aQHnR2G3cVl1N3G1th+iiFfSnWWV5caLWHNkQ5z4vylpapZ
	 yyXiim1zmMRla4SQhI2AQBmyoF19+ahSPMFhTrcFq2UZOGEzktEfF0gKAGfNrB8alOKjk
	 uvahPAU39JL5V8434/2J3f7CMhuGLpdBGTZ221SyfjD49LCvQNsWJHC3guZKgSvsZgHJU
	 /vR8QiBjIZGHEVKcRZlqH/bzUt0thqM2UdiqCq+EZbl6m7lcqpNYMJAqL9Hi08RzeTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=81UweMnintdLpa4xhqWOsmoebWo8cnvUdLQSh95F9E8=;
	b=rIHePrlmFuHnlGYMLaWyKImaTeJAlX7N//nOaV8A3dSu8Xo1f3A/0yQoDgpJzRsfXxde
	 p+BTFW1Iyl2SVhRtQp9LnG3l8iAj0015m0S2IAD1WflngRs66psDCGF55Cwt1ieZugQg1
	 sBbhbaYdmLk+Ci0pyeFrmNL0/SZRsytJAS9IHQ5+GpzQJZvL02gUqazVLU/TAgaNvyWCq
	 PnkzsxxfoxjXmcGylmqzpgHYwP5HhKlirdqKntEY3gRzWlcjg/8HE/beBSf9ExAmsLyuC
	 mC180dWibtws9/4dSKIugYX+1KxevUPOtwv8niL8icrS4RWFgyj9x/LNeCJUUvB4OCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QVnPgmLb;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801F606A32E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4801F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QVnPgmLb
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso1825369c88.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645018; x=1796249818; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81UweMnintdLpa4xhqWOsmoebWo8cnvUdLQSh95F9E8=;
        b=QVnPgmLbkQvspk1uxxtaSekWj4LWMcviAijfSBOB4/FG0n74gz2hlvJUDsdeb5mxWu
         dRgYJqoehRepvG5VsLLEz8mdasiMzKZseYgxAny8pI+yjDC9NPgIrrBBMvEZ4uyMCPK1
         ejOFeqDKfYmXyOyIJvP0JGpKiztxfXbHzyGAe679CKgFdalSbpF9UjCQZTnnxUN/n/5b
         fOFwisNrG3DPDrxRHQ/VxTUaEZqbkH+lynBMmwVSXmyI7VBgpt+6DCQJ15JKgp1GeVkZ
         EC3dUDQ8rij1TbG/x5065zlw6arPxXqQ/x+j9cNwU1Z/ol5Ro0/uZpwEOXCOyNiYOh5m
         whJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645018; x=1796249818;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81UweMnintdLpa4xhqWOsmoebWo8cnvUdLQSh95F9E8=;
        b=sYtStfRYxV5DS5z1hTO9BObeZwRTIJbSZ4QNxngebreh/Ftyqu7UkpsxB/0AiYQx3k
         ROF1RsxcYn5s0rYQGWHEKa//ikYSjvcYJv/a5kCdP0pYaPx1wkweASV2/Ew4g1xDegpA
         4n8gkjMn2LVUcHv0dkrPrKBgAwGQafOf/XmAlGtmKHVzAlm4kX1uc9zPlBjmX4SMV/3N
         zP5ZQ41xbqnA4ZKDmGY4A6F/fJN6kwA1Yl2DCf9pFZvgQgbmIJMDl2mEvT9wPrPP0gPh
         AfMEqCRse1sEZ3JzQ38KxhTiTp1YY38v9CyLRJVMnHCbTQIF3KLxuW23Y32S4ofKaktZ
         xKyA==
X-Forwarded-Encrypted: i=1; AL+hErH49v8U4yVJeqdyu2VNSMgCUnDcgiHT8mdnSyNtbTQxcSFcYHbgYOD8QzZ/K9yuedQ0e/ly@lists.linux.dev
X-Gm-Message-State: APuU4Z+v9JlgCOM7dD1AxWArOkRZiX9xmi7lVNJgQwYKXGJIROfCPk/A
	tb/4udsi+qGUFUTeYe+JPgtYK65YvbcrpzxVYukAx3LP2x43+ZKeAzZO0Nr0zUBptxvWIu6ldGa
	Lww==
X-Received: from dlbtx1.prod.google.com ([2002:a05:7022:fc01:b0:1a7:58c6:c957])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:231a:b0:1b3:a927:f17a
 with SMTP id a92af1059eb24-1b5567a950fmr17469563c88.5.1795645017932; Wed, 25
 Nov 2026 14:16:57 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:34 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221635.1419707-1-elkin@google.com>
Subject: [PATCH wireless] rfkill: initialize work items before publishing
 rfkill device
From: Elkin Cruz <elkin@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

rfkill_register() added the device to rfkill_list, called device_add(),
and set rfkill->registered = true before initializing poll_work,
uevent_work, and sync_work. Because rfkill_set_states() and
rfkill_set_hw_state_reason() only serialize on rfkill->lock and schedule
uevent_work once rfkill->registered is true, a concurrent state update
can race with INIT_WORK().

Initialize all three work structs prior to publishing the device.

Fixes: 19d337dff95c ("rfkill: rewrite")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 net/rfkill/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/rfkill/core.c b/net/rfkill/core.c
index 9e143c4bfe6a..071beb249b4c 100644
--- a/net/rfkill/core.c
+++ b/net/rfkill/core.c
@@ -1095,6 +1095,10 @@ int __must_check rfkill_register(struct rfkill *rfkill)
 	dev_set_name(dev, "rfkill%lu", rfkill_no);
 	rfkill_no++;
 
+	INIT_DELAYED_WORK(&rfkill->poll_work, rfkill_poll);
+	INIT_WORK(&rfkill->uevent_work, rfkill_uevent_work);
+	INIT_WORK(&rfkill->sync_work, rfkill_sync_work);
+
 	list_add_tail(&rfkill->node, &rfkill_list);
 
 	error = device_add(dev);
@@ -1107,10 +1111,6 @@ int __must_check rfkill_register(struct rfkill *rfkill)
 
 	rfkill->registered = true;
 
-	INIT_DELAYED_WORK(&rfkill->poll_work, rfkill_poll);
-	INIT_WORK(&rfkill->uevent_work, rfkill_uevent_work);
-	INIT_WORK(&rfkill->sync_work, rfkill_sync_work);
-
 	if (rfkill->ops->poll)
 		queue_delayed_work(system_power_efficient_wq,
 			&rfkill->poll_work,
-- 
2.56.1.839.g22a8290db9-goog

