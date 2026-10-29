Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263502;
	b=2LFbRqXxLmJ0+a+Mhdl3DfhhbKxnIFZV1gniZ6ZHt4u1N7hQoAoCL/O9eweA4/1JiBzn
	 9xC287yV0ExK+Wy88tEYc2SCmfzARlcMM3s5ztjNS0kSXxhtuaxdbiWTW1MW8rhZpkmkF
	 4H+Oj1niZTbdwSWfQL5NpHfakadFehuL2LhA7ep/nLQskxXv9bzmhDO6xJzp2bdeBFVoN
	 Inb/aUMWydLY6NUjr1Z+IMANzpjZYe9cv36KBmYSEzxiYW+bPJnMinIz2q7as6hEP6p23
	 6NDsrFkruMhmf0DyLf64x2mDc52ohGL25Anui4TqWEoXqqEMNPiVw8dzS3Jdb3/kYfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SoQZ6Rn/231FVhlbAImWqe7u6be9TgKTmZprNFAFk2s=;
	b=t4KjikJEJGLIMEr6oxpkCnWoF7c2zPFP9cLs1HN6xpEHEnxvNE7QlJo+pyCB3SGWZR4w
	 PP+Qir7/desyG3cM1oAiBBKmRFWiNeCz7WbD/fc10y1nK3nllsi3ohr6d7qeFKZ0qM4St
	 vf9kfkxKNVxZG10eVZ4nldlQaOPxLPbcrAVzMsVutfjlMy4421NUnc+5Mn77IGnxOjt5C
	 SSBpF6kw8UpCflh7IJp4Nrx+sci5eW4knPtDu8GKccrSKCvNsTxsmZ5qxEeT/1Ziqond8
	 uJbK4KpNURha9uJ1Hn/HUYa/m7idzWx2htKcZHVkSWQnxsg22OO34OgDL5D+Zls50Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Q5E1EEVh;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E5606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 08:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Q5E1EEVh
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058315c79so953007b3a.3
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793263501; x=1793868301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoQZ6Rn/231FVhlbAImWqe7u6be9TgKTmZprNFAFk2s=;
        b=Q5E1EEVh1MWrV+0C5kTBYOzSopdPITn/y6tkECVYmH/y4G3GoeVKU0pOutjeen7dLE
         if5BKTzEW1YnHlFcmLrQXJtgPAIU7hQFVE38Lwe3dOqE4H58jRmRkrizIzbYrN7qMnvF
         +kJcfKp9wFrBlKp8/SRGOfZwheXqI5auJVskBxpzGCEHPYI8p5jum0/y/NjsRJN05mfO
         uYCydaQbxVl2o3y5JDQ607THltWP3xSQAdbib1T665v27IUJGp9HV47YY0q5KxWsymeh
         nS/QnZFe45gPzUkGuBxsrkHEQmA+AmPmU9oVaktG53y236lAaI7J3gh6Bdf5JDA3DTy0
         f4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263501; x=1793868301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoQZ6Rn/231FVhlbAImWqe7u6be9TgKTmZprNFAFk2s=;
        b=OQPDgV9bw+Xap+2HUnwm9SPyJZGhB/zV7EZmGHafBARcJcxc3fwlgHiQheUfVJtgKM
         0MgC2ifgh/v30qyPxk+AzPNBTaJtiuF0jBW+ocFg4S8oNhyj5vda9VeZVYWcCCPF/2cR
         bKfIntV+JX60OITbMfiQXXf9wcmu9mbjFAto1HUvCY2uNNxpHH56Rt0kwT85WZfNA+Ps
         LhVox5LYRFAX0ws+YxTjuKqm06CW/KuVN+QBcK5DdxN5FznGGTH0mdFAML80oF889na6
         Fp+0AvhkhkdypOSRzU/LSCkD18Bym9iL4yB3MDf6IQ1+dg395JBIZrO/xLdNKRZy4UlP
         MNzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbZE58GYhEkJfV53RxPU7Haerun2fK6bjf4KETnIavhKpJr+RiBkT78OaNYtl6cUFYFSj9@lists.linux.dev
X-Gm-Message-State: AFq9FYL16A180w0BCx3odYmiAelp+hj5qsE+rQHr7y2dictBzD7KTX8q
	XG30srh1/7OkoIeY14h7aaPElttCTK1fSau/ZMM82lV9ZvW/7SmMI3/ZoIizz5ZtjV7B
X-Gm-Gg: AYBFou1XOsIECC/DsmNk9Vj1G8y/XN10PtrRs9WL+3sov2g9jBs4uNlr1NibRD9KqNZ
	JndvLNVWll4e5vHjDPcu8Lwf0Ntsi8WMkwf7N3XVjhk3BA7orazBYjWnL6FxwOaAqEE8kvCETcI
	64N8pdH9WLfQMghsYZghCLg8mJJfpAc6rhZ4FvlXnfiykTwrWMRAT23wxNOy9iCZWA4KyJx/V6x
	lXaQyXaYrfo5QxVL3Vs6zTKJc+AUkprAE18ZxlwNmNQkIq4bkyUCRc2VvYbXm3knAbOCQRDqpap
	nhftQNF6n8EfMYBFgHIqFGPtM7wWR1chnPvRJI3maheQALj9p87ySu07/VMeNT/6LFMzlr8yeFO
	eQlQwue8SrNVNzH9eLakPzBvTKnWRat8rnFqcrMoINTFUreyY/0lQyP1FHq9eAUPe3yCIDlTr5i
	wyk2PUZrLol+hEfsrxgzmsK1i+mxnYjq4jBk4azg6RpPQrSjv2Gtc72Z6jOfgay1+8sdPXiwg6M
	PEz9Zj0klm2v1esqYR3z4t4rql4Tzjx13lbujKB08wGocQ4RONQ35J7Sm5f6OW1RjDuIjiOTJix
	+c+cSd7eodHAy4TdV7n79DWLNJbP6s8xOPEt2TYcQy1bz1NvtDJcXWn+D5lO
X-Received: by 2002:a05:6a20:5482:b0:3e4:bc73:8d60 with SMTP id adf61e73a8af0-3e9023f494cmr3826874637.55.1793263501341;
        Thu, 29 Oct 2026 01:45:01 -0700 (PDT)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad33b99b2sm3083915a12.26.2026.10.29.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:45:00 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: linux-can@vger.kernel.org,
	llvm@lists.linux.dev
Cc: robin@protonic.nl,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	socketcan@hartkopp.net,
	mkl@pengutronix.de,
	ecathinds@gmail.com,
	dev.kurt@vandijck-laurijssen.be,
	maxime.jayat@mobile-devices.fr,
	bst@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net v3 3/3] can: j1939: enable context analysis
Date: Thu, 29 Oct 2026 08:43:26 +0000
Message-ID: <0d7b3745c8d8f3d7bf4b91ca3690f5ff1ab52f59.1793259424.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793259424.git.zihanx@nebusec.ai>
References: <cover.1793259424.git.zihanx@nebusec.ai>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Clang context analysis for transport.o and annotate the TX timer,
TX-send shutdown flag, and session-list lock wrappers.

Keep the analysis opt-in and its annotations separate from the J1939
timer and send synchronization fixes.

Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/can/j1939/Makefile     |  2 ++
 net/can/j1939/j1939-priv.h | 18 +++++++++---------
 net/can/j1939/transport.c  |  5 +++++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/can/j1939/Makefile b/net/can/j1939/Makefile
index 19181bdae173..67462b271252 100644
--- a/net/can/j1939/Makefile
+++ b/net/can/j1939/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS_transport.o := y
+
 obj-$(CONFIG_CAN_J1939) += can-j1939.o
 
 can-j1939-objs := \
diff --git a/net/can/j1939/j1939-priv.h b/net/can/j1939/j1939-priv.h
index 6bf55b7dfffc..d664f32bbb8f 100644
--- a/net/can/j1939/j1939-priv.h
+++ b/net/can/j1939/j1939-priv.h
@@ -240,7 +240,7 @@ struct j1939_session {
 	struct sock *sk;
 	/* Serializes session TX sends against transition to DONE. */
 	spinlock_t tx_send_lock;
-	bool tx_send_shutdown;
+	bool tx_send_shutdown __guarded_by(&tx_send_lock);
 
 	/* ifindex, src, dst, pgn define the session block
 	 * the are _never_ modified after insertion in the list
@@ -293,22 +293,22 @@ struct j1939_session {
 		/* dpo - ETP.CM_DPO, Data Packet Offset */
 		unsigned int dpo;
 	} pkt;
-	/* Protects TX timer rearming and cancellation. */
-	spinlock_t txtimer_lock;
 	/*
 	 * qref pins the queued timer; cbref pins a running callback. A
 	 * concurrent rearm can leave both references outstanding.
 	 */
-	struct hrtimer txtimer;
-	bool txtimer_qref;
-	bool txtimer_cbref;
-	bool txtimer_cb_running;
-	bool txtimer_shutdown;
+	/* Protects TX timer rearming and cancellation. */
+	spinlock_t txtimer_lock;
+	struct hrtimer txtimer __guarded_by(&txtimer_lock);
+	bool txtimer_qref __guarded_by(&txtimer_lock);
+	bool txtimer_cbref __guarded_by(&txtimer_lock);
+	bool txtimer_cb_running __guarded_by(&txtimer_lock);
+	bool txtimer_shutdown __guarded_by(&txtimer_lock);
+	/* RX timer state and refs below use active_session_list_lock. */
 	struct hrtimer rxtimer;
 	bool rxtimer_qref;
 	bool rxtimer_cbref;
 	bool rxtimer_cb_running;
-	/* RX timer state and refs below use active_session_list_lock. */
 	/* Temporary drains defer rearming; the last drain installs the pending timeout. */
 	unsigned int rxtimer_cancelers;
 	bool rxtimer_pending;
diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 570e2b8d0826..7fcf66e93afd 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -236,11 +236,13 @@ static int j1939_xtp_abort_to_errno(struct j1939_priv *priv,
 }
 
 static inline void j1939_session_list_lock(struct j1939_priv *priv)
+	__acquires(&priv->active_session_list_lock)
 {
 	spin_lock_bh(&priv->active_session_list_lock);
 }
 
 static inline void j1939_session_list_unlock(struct j1939_priv *priv)
+	__releases(&priv->active_session_list_lock)
 {
 	spin_unlock_bh(&priv->active_session_list_lock);
 }
@@ -331,6 +333,7 @@ static void j1939_session_txtimer_cancel(struct j1939_session *session)
 	session->txtimer_shutdown = true;
 	timer = &session->txtimer;
 	/* Keep this alias across unlock; blocking cancel must run outside the lock. */
+	context_unsafe_alias(timer);
 	ret = hrtimer_try_to_cancel(timer);
 	if (ret == 1) {
 		WARN_ON_ONCE(!session->txtimer_qref);
@@ -869,6 +872,7 @@ static void j1939_tp_schedule_txtimer_locked(struct j1939_session *session,
 	if (session->txtimer_shutdown)
 		return;
 
+	/* Replace the queued pin; a running callback retains its separate pin. */
 	ret = hrtimer_try_to_cancel(&session->txtimer);
 	if (ret == 1) {
 		/* Reuse the pin owned by the removed queued timer. */
@@ -1447,6 +1451,7 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 	int ret = 0;
 
 	spin_lock_bh(&session->txtimer_lock);
+	/* A concurrent rearm may already have recorded the callback pin. */
 	if (!session->txtimer_cbref) {
 		WARN_ON_ONCE(session->txtimer_cb_running);
 		WARN_ON_ONCE(!session->txtimer_qref);
-- 
2.43.0

