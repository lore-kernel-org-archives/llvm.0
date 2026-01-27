Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564E35C18C
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522372; cv=none; b=hiYuJErawUCHSVZtc5vwNjcUW4C3L/kdPGpIGhkMUNOFY1ZB7GiEmKrXU84T/vACpDd27Vbn1qi0brjG0zUEH+uZvy3xrp5kPioms1w+e369ub2WSgNALMd5Vee586mfiDcj2N495Gij101Hb7QpvXLHDeUey3oxkTIJzIRGslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522372; c=relaxed/simple;
	bh=0HDVlUmXqJZht+Y9T7EqdTkfQ5g8PjMtq9xZD965xOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcJKWnVEQA71m+0WyN86Uu6B6cp+934E7J6tXVK4MW82FX937wr76cuSUXJUhflyq/J0c/PeskRIYCgpbE97jF3uxKhsqPShoRj67MoJgYtP9e9SEdVCXQahQuGCN+cOdYCNgcZeLCVrJfTKuYyPgnSUg+xZOVeCmPnFYFbQHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=h6jhw2Jf; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="h6jhw2Jf"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4094b31a037so187449fac.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769522369; x=1770127169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2LPkniD2Jah+bnHAFdMSt2ma4HBjujXhV2ExysNqRM=;
        b=h6jhw2Jf+4kNMQaXkeLgLxOhXfo1DQ0bC/a5jNRiSyvuAdzqz4EA2zVF1bJ66ru9n9
         c0usY82YE6d21avXkVA5BsSpm9nWneRIMha8XYHfu9wX3ujm/pojVdmalUJHGV6XEAkZ
         wyydqfj428C4y47tTViGNIqiMnq0mfiugNND2KcxfWZXk7RfdwRM1pRc2igKvAjuTzr3
         abL9H2xREfInbXWzcBPqIU/BnEEpcDNPQ3q/70D5Ax/xUmti/12PTZFxlooxC6XsWAIB
         FqYV5NEZkd+NcRPaZTPFGGxyY49Jscn6TASF48AgVJMetEVUDscOGb5DEb+EUwzRPzSK
         j7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522369; x=1770127169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x2LPkniD2Jah+bnHAFdMSt2ma4HBjujXhV2ExysNqRM=;
        b=NuaCfyDkVtE7xIxdJzEPyFAo71a6OQ8GQMkxdtbsQrnx/W7KsMQxZ/eRiG+82a2gaX
         GlN7453g4EC3pN/aU6Dw660XvtEovLVu6rDKkapvJ8B2VZqwBw1IgjpDs+4OK2kW/mrL
         +fT6yYX2N9QyHYHrGFmYyQ8a5PIq/eNorQEIcnKGURmc+S/xrucj8/gv80YktmW4u7yj
         YzAntC1qdsX8grWNydly3r2hDh670RPJJQQPnyBtIGhgHDS6ITeLasAHXmEGTngRcb8P
         QwBzg4iVRrZCtWC/VSjaXmnKoq0dhVX+lmKn2i9H1kYqYj8gsMJBS8dUn7QJ9nzIlxUp
         Vnmw==
X-Forwarded-Encrypted: i=1; AJvYcCXkFTRpT5Yfd12FeLAIvAT5C07AypsdZSj2qqoMGjt3FYAUc3zYw3d5l2wIuCLBsnvZofot@lists.linux.dev
X-Gm-Message-State: AOJu0YyGpRc8RK6M/b3fYSTmXk+wy0PNsw1QEPLm8PFcCZcWUxPTwrnO
	Yp441koTikRoTsxuyLL4dHqA4ZO8lXM9ps5jHlk9GrRRxfIuQg304A8NrWv8ezWu5QsESqzd8PV
	cULoGjfA=
X-Gm-Gg: AZuq6aJFjQlFLSED2NMpCk3MbpQmpIPRo0lZOeFIsTHBwYtk5laFDrRcOXwpIdNA35U
	M2pw70rJKzHzWsHEgGoC74NyonYPeIL7A1MSeMmb0W0r80zRrpYcYV/ayNiHH443jWNqLbcI5t/
	H03H/ElhRbTfiLm7J+lmjyoBvg0xXAyvkRY7KUG9/dSJKtb/a69RI275BW2rZoFs8SkLtDAp0YM
	N4X1fqC8NfWvQibv6Cy/2Kc0pqx70CbaZUwJH7volzVBTTeSYX6SD3z7A+LWvWFEzYTnaJ25UDy
	rsF0CPYcLUt4Ccb5cpzJmAC09oHGqGAN+YgcpuzkWsAc6nPedFYSPENcopq5AABfZv3uhXsseSi
	ZSgbFztNm4B+kOLu7hGvNHUW4cA4C3vktaBFDUXVYP94U281BNCTwodcPiz7M+l5S2/ifyy29OF
	wwEBet1MzKVbmzvv/HwuKpv8j02dWmpD2RE+ax8aF7Bv5re2WZxt/htOwdY6bH4NNHPg==
X-Received: by 2002:a05:6870:b627:b0:3d4:876:34b1 with SMTP id 586e51a60fabf-4093ff09acdmr1047607fac.33.1769522367981;
        Tue, 27 Jan 2026 05:59:27 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-408af88d1c2sm9407794fac.8.2026.01.27.05.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:59:27 -0800 (PST)
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-team@meta.com,
	Corey Minyard <corey@minyard.net>
Subject: [PATCH 2/2] ipmi: Consolidate the run to completion checking for xmit msgs lock
Date: Tue, 27 Jan 2026 07:54:40 -0600
Message-ID: <20260127135917.1597762-3-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127135917.1597762-1-corey@minyard.net>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It made things hard to read, move the check to a function.

Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_msghandler.c | 40 ++++++++++++++++-------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index a590a67294e2..030828cdb778 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -602,6 +602,20 @@ static int __ipmi_bmc_register(struct ipmi_smi *intf,
 static int __scan_channels(struct ipmi_smi *intf,
 				struct ipmi_device_id *id, bool rescan);
 
+static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
+				unsigned long *flags)
+{
+	if (!run_to_completion)
+		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
+}
+
+static void ipmi_unlock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
+				  unsigned long *flags)
+{
+	if (!run_to_completion)
+		spin_unlock_irqrestore(&intf->xmit_msgs_lock, *flags);
+}
+
 static void free_ipmi_user(struct kref *ref)
 {
 	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
@@ -1878,11 +1892,9 @@ static void smi_send(struct ipmi_smi *intf,
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	unsigned long flags = 0;
 
-	if (!run_to_completion)
-		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
+	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
 	smi_msg = smi_add_send_msg(intf, smi_msg, priority);
-	if (!run_to_completion)
-		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
+	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
 
 	if (smi_msg)
 		handlers->sender(intf->send_info, smi_msg);
@@ -4826,8 +4838,7 @@ static void smi_work(struct work_struct *t)
 	 * message delivery.
 	 */
 restart:
-	if (!run_to_completion)
-		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
+	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
 	if (intf->curr_msg == NULL && !intf->in_shutdown) {
 		struct list_head *entry = NULL;
 
@@ -4843,8 +4854,7 @@ static void smi_work(struct work_struct *t)
 			intf->curr_msg = newmsg;
 		}
 	}
-	if (!run_to_completion)
-		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
+	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
 
 	if (newmsg) {
 		cc = intf->handlers->sender(intf->send_info, newmsg);
@@ -4852,13 +4862,9 @@ static void smi_work(struct work_struct *t)
 			if (newmsg->recv_msg)
 				deliver_err_response(intf,
 						     newmsg->recv_msg, cc);
-			if (!run_to_completion)
-				spin_lock_irqsave(&intf->xmit_msgs_lock,
-						  flags);
+			ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
 			intf->curr_msg = NULL;
-			if (!run_to_completion)
-				spin_unlock_irqrestore(&intf->xmit_msgs_lock,
-						       flags);
+			ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
 			ipmi_free_smi_msg(newmsg);
 			newmsg = NULL;
 			goto restart;
@@ -4928,16 +4934,14 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 		spin_unlock_irqrestore(&intf->waiting_rcv_msgs_lock,
 				       flags);
 
-	if (!run_to_completion)
-		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
+	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
 	/*
 	 * We can get an asynchronous event or receive message in addition
 	 * to commands we send.
 	 */
 	if (msg == intf->curr_msg)
 		intf->curr_msg = NULL;
-	if (!run_to_completion)
-		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
+	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
 
 	if (run_to_completion)
 		smi_work(&intf->smi_work);
-- 
2.43.0

