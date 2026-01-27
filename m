Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497835B628
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522367; cv=none; b=aJZwlTAuDxmJ5+0nGYc0a+KMWd37BIbEGTo+lXCCr56V9utRtR17ctnGwn150GsROMPk1C2mS1lkCDZKy31Dgcaji4Mo9zYG28BmbI4gA6d8nMWhjGzs3E80CWiLT3gDLRbsO2dphnKZUJI0ji9cIChmO/VHyVTFCg6n/Ty5fYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522367; c=relaxed/simple;
	bh=Sosu0g5xuLpMzNuU0oEuEsMP38OOZp79K3ER9Qyx7W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNpa5cUdbOc/xuaBKhXslNy9/r4ye49xXehMgt+M1Oa4/uXdFLeoJDur78yiut4H/P4mYvgisSjqUpLuDdBIg1dRzSWKaUlnFoYParyJMc1IWB8QNM232EBHeJoR8Dro0mrBwJBayHbqpbvq7+btTMJabBkl8n6QxDeyvg2cWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=RSxrH6wB; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="RSxrH6wB"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfccba483eso1750844a34.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 05:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769522365; x=1770127165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzzEevdAZzt1nXO9szlER+ciqn2pWS6swN7VnsinsFo=;
        b=RSxrH6wBONUCWND2oVtc7TsOm9BG7V96jd5h512gmLqgJoPG9OQcslGspktqomxwWO
         lQMJTRtqe2/9g/fP6RBWx2R9S4rUyN43v0LJvm7XsOkCw5AqWBwlrPbwOLVdKRhPcTnx
         MP7O0g1cRWLmoAgEGwsacytJcSir0/ePWsgNBeGUfi/bilcJUMfU0Wv+fLhgOjpxJAld
         UqQyN9eJD+JuPRtLzE8r6kpHMopZ2CIM1EMN8vr2FquwTcNNsK0z4NtEnXph+gSRt+Io
         /NsUwuHOrD/fUfZicMpfl3pEI5uNwcTl3enJ9XlJHQv305iS5nfD62wIDx0oQHtGgwdC
         Zhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522365; x=1770127165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzzEevdAZzt1nXO9szlER+ciqn2pWS6swN7VnsinsFo=;
        b=CstbbJUpLmE6WF4QNbQvsELjIBYGa+DXiAI8TD8wh0A8NaYDJi4dUQHwVopZnS0lls
         IIlRLfY8rN5FwVdnz+UF/rCqkY1Re1k2UffCv9+SPCcJQ4fCK+bIlJ4em+SMwDDYIPxY
         bksQ8fq0yemhJxPKIWAz1aoTlwOL3vye4Q97bLN49vR06Pnr+rV42nNd37NvyCYfZMxX
         /mCDhtiJBR2YH3BfL66J6d85NRGi6vCqmlxhcbrPFFFMvsHdl9/5CLUpZ60MqqeWKm6r
         obvjkPuKDsrCWw/i1KglSAk9Ae2J/2KN+m8s948+Hp8zKxRZOiv+jriDXjbiUOdjCdpQ
         7ekA==
X-Forwarded-Encrypted: i=1; AJvYcCWQK3NV2dh/xbPibz6P0xwWHzF8IiPNO8XPVqBeU+AaRIRTrWAcyyFzxtGtonOU854dV37S@lists.linux.dev
X-Gm-Message-State: AOJu0Yy49CE7TWBnxctklaJA6TQtzMoV0mCXF4TL0pazY5fqPuPiSOkU
	SI60txzaIdFoe0D7aqsf0fAq1it4fGtMmXqC83ierJ+lc9Se4JgZDlCTS8uLsJ/tcnU=
X-Gm-Gg: AZuq6aJggdyzkVvIAJTwNKiWArnHSRSKGuD4Ig2Zp6kIhmU1Sc1GzG5qr0B1UZCijd5
	g4Iq1NQD4+WMZ/m1VhoXW28L6PTcN7YLxLyu2cUrXBNL3ngk1jiwdPea8xn8SmSdE7VgImHJF9U
	d3OzMQgHl1RIUBxBphSTlE/vueLAkhRqSlEp3PfZsPQ0iVwxOOztPgGVCMTMyLxJHczXyvSgL03
	4SUtkevFdpsWKqhpYJIpw7+C2oeSwfhO/WFHzfgDEXriLEIcySpMSBSLyyStsXOpthET26bOGeO
	skV8XQtPENLn2esPwhS+GeyeVfXKQp1XsQRckbg+Lb/p0kYlkEGc2QI4JJEVFpUKjXWK9fBg+Wy
	EbyTApv0BYYrUK1WC8wDMEFTxB5EjBLyy5pAOVKf6gSyhkmXPNpIpGhqvwB/Vr/8WtJuPdNfizR
	DADCRAyEmS1V3F2NDb6BlSm1sUd0W/NcFTqUdya1VkMPoGqMIwDlvpDm81eLxsjn+1MJocyvXxx
	99b
X-Received: by 2002:a05:6830:4184:b0:7c7:6bb4:1197 with SMTP id 46e09a7af769-7d1850e6378mr1117433a34.24.1769522365402;
        Tue, 27 Jan 2026 05:59:25 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7d15b346e03sm9854283a34.1.2026.01.27.05.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:59:24 -0800 (PST)
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
Subject: [PATCH 1/2] ipmi: Fix use-after-free and list corruption on sender error
Date: Tue, 27 Jan 2026 07:54:39 -0600
Message-ID: <20260127135917.1597762-2-corey@minyard.net>
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

The analysis from Breno:

When the SMI sender returns an error, smi_work() delivers an error
response but then jumps back to restart without cleaning up properly:

1. intf->curr_msg is not cleared, so no new message is pulled
2. newmsg still points to the message, causing sender() to be called
   again with the same message
3. If sender() fails again, deliver_err_response() is called with
   the same recv_msg that was already queued for delivery

This causes list_add corruption ("list_add double add") because the
recv_msg is added to the user_msgs list twice. Subsequently, the
corrupted list leads to use-after-free when the memory is freed and
reused, and eventually a NULL pointer dereference when accessing
recv_msg->done.

The buggy sequence:

  sender() fails
    -> deliver_err_response(recv_msg)  // recv_msg queued for delivery
    -> goto restart                    // curr_msg not cleared!
  sender() fails again (same message!)
    -> deliver_err_response(recv_msg)  // tries to queue same recv_msg
    -> LIST CORRUPTION

Fix this by freeing the message and setting it to NULL on a send error.
Also, always free the newmsg on a send error, otherwise it will leak.

Reported-by: Breno Leitao <leitao@debian.org>
Fixes: 9cf93a8fa9513 ("ipmi: Allow an SMI sender to return an error")
Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_msghandler.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 3f48fc6ab596..a590a67294e2 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -4852,8 +4852,15 @@ static void smi_work(struct work_struct *t)
 			if (newmsg->recv_msg)
 				deliver_err_response(intf,
 						     newmsg->recv_msg, cc);
-			else
-				ipmi_free_smi_msg(newmsg);
+			if (!run_to_completion)
+				spin_lock_irqsave(&intf->xmit_msgs_lock,
+						  flags);
+			intf->curr_msg = NULL;
+			if (!run_to_completion)
+				spin_unlock_irqrestore(&intf->xmit_msgs_lock,
+						       flags);
+			ipmi_free_smi_msg(newmsg);
+			newmsg = NULL;
 			goto restart;
 		}
 	}
-- 
2.43.0

