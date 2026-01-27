Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE723372C;
	Tue, 27 Jan 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507913; cv=none; b=JUvd23TDIZfl4Be+3E5uMeLFcJRB1ZeCN6JWvwVEIuO2Q8XgFgmPwf1vEsQ4H2MMOSiIYeH/eoQ0EnjVj4YaELPMBm1Vbk6Xr2xhEi2GDv1bjSyoWLMCIIBy+Lu7HX+QKS3ZrxlTExBVRdCkxUWpMGYK/NsNyo6DfXlWod5jBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507913; c=relaxed/simple;
	bh=mF/EKCZfOpPZ+pc/uCv6chQCHA0BchDmBBa1SRsz3Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIQXJyIK00rc0XLzdVfveB22DDcY/IHV14wgwkUJklaiGxp6wRWplVRjGoEscETEbiJs9wHr3KU+VD1G9eODdAuWe1RVd6cNUNWG6/PtyWMQgFlehlBzv11heBRx9iXJoxlraEXkSJuJgYG4NbVBWRYLY0K566PTVxNQeeJ1ULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=VcqD7oAv; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="VcqD7oAv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=9Ul1XrFjRQvLqHhLuhePbfbA8WYs/pNkCMhU+IPYaWo=; b=VcqD7oAv5hnnF/HhyEby4/of+r
	4ib0rUFA6YXd/IYzMXm22A+4iv9TihaKLcpNk31d+MlTuPyY0myAukrtzLEFdNzC4IhY00VI2pcSH
	tcHOvUl9vQal7Hr1fJJXfgbT8lAp1SzLewhsdcu9Wze0rV8EeYmOXlpBkBUSJcs1jgCesVVGxEcL0
	tyITXnsTVqbs3xEOB/hcLGeUz5HWW0I87HwGD4RqUgtJsUrg4hiuzFpHnSr2FRpDZH8IkKrv4o6pU
	eShMGWfaphDU5bjhn54DGCI7aY4lXBzqoZH7tEwRtQDoPIGmDVSRr6i/9aA8SWDXvV30nuxOQvGAK
	Q6ujIURA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkfq9-00GuDy-KF; Tue, 27 Jan 2026 09:58:29 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 27 Jan 2026 01:57:59 -0800
Subject: [PATCH] ipmi: Fix use-after-free and list corruption on sender
 error
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-ipmi-v1-1-ba5cc90f516f@debian.org>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
In-Reply-To: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
To: Corey Minyard <corey@minyard.net>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-deb6e
X-Developer-Signature: v=1; a=openpgp-sha256; l=3294; i=leitao@debian.org;
 h=from:subject:message-id; bh=mF/EKCZfOpPZ+pc/uCv6chQCHA0BchDmBBa1SRsz3Ic=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpeIw8WzNnfGL4QhhTnu+4ka6bdh19XifhbuAp1
 +2c/Hn9gT6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaXiMPAAKCRA1o5Of/Hh3
 bcnFD/456XvLJgLX9FCKtqHcnOqePTojY5FksArhtzYsCbJug0jw6049I4xuVC52eMivxNeOUm1
 WDmp5kpcV3t94+brE/gesD1Ul9p4gv9BIa/cHOBa4/6+Rgdg5AsIgekzj5HNUH+LgGlaByZyCuC
 l155AiyqZoDpcIBKuhMQevhNxn9wMESLKhGX/pD44X2v4Z0fZlrBzuAEuP1lkkrsAWG/EkyMTZg
 meIMXm6qcWKEZic4beSwC5CruHUV4SPurdcERWptIktP4h8SFxx7szhvLLJHAPQ9OXyk7Bh2eAt
 aXSqC9Bt0pkcxvIRKKoKNcbVAHqdtIA4rlp1LWYkmtzuo+OXPPjFeEFIvDkoGK1QUnXOgAjDo8b
 EPvP79aohdr/kCb0EJRWsDUn5kRX3JfHjQevosjMG5zC5zzweeQmI9VyVA3sQ19axKzvPr6AySv
 kTedCPYxhQAvaEmtcuu+snkkGq/+w1kyd98TpOkoXKokYkyed0OxL6yVRPmxXf2SdMyr+LlgcRg
 KCrfWWCkD05CKQGpch/6FiW83nVH+/AXYdQLa/IM1yB4St/sSCslzuugncxvwRA6FsJ+sXJ/NME
 SZjWQ000qb2Ov0RZVzQe9RxUcUiLYzm0CRKxqWN0HhiZsDVKCoX4V5++BrS1nolZsid9jc0BLaG
 BFaiYXUazH/0DWg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

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

Fix by introducing a send_failed flag that signals when sender()
returns an error. At the restart label, inside the existing spinlock
critical section, check this flag and clear curr_msg if set. This
ensures:

- The smi_msg is always freed after sender error
- curr_msg is cleared so the next iteration pulls a new message
- No stale pointers remain that could cause use-after-free
- Only one lock acquisition per iteration (avoids extra lock/unlock
  in the error path)

Fixes: 9cf93a8fa9513 ("ipmi: Allow an SMI sender to return an error")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/char/ipmi/ipmi_msghandler.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 3f48fc6ab596d..81259c93261fb 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -4816,6 +4816,7 @@ static void smi_work(struct work_struct *t)
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	struct ipmi_smi_msg *newmsg = NULL;
 	struct ipmi_recv_msg *msg, *msg2;
+	bool send_failed = false;
 	int cc;
 
 	/*
@@ -4828,6 +4829,16 @@ static void smi_work(struct work_struct *t)
 restart:
 	if (!run_to_completion)
 		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
+	if (send_failed) {
+		/*
+		 * Sender failed, clear curr_msg so we can pull a new
+		 * message. Do not clear it unconditionally as a message
+		 * may be in flight from a previous run.
+		 */
+		intf->curr_msg = NULL;
+		send_failed = false;
+	}
+	newmsg = NULL;
 	if (intf->curr_msg == NULL && !intf->in_shutdown) {
 		struct list_head *entry = NULL;
 
@@ -4852,8 +4863,14 @@ static void smi_work(struct work_struct *t)
 			if (newmsg->recv_msg)
 				deliver_err_response(intf,
 						     newmsg->recv_msg, cc);
-			else
-				ipmi_free_smi_msg(newmsg);
+			/*
+			 * Sender returned error, the lower layer did not
+			 * take ownership of the message. The transaction
+			 * is abandoned - the user has been notified via
+			 * deliver_err_response() above.
+			 */
+			ipmi_free_smi_msg(newmsg);
+			send_failed = true;
 			goto restart;
 		}
 	}

-- 
2.47.3

