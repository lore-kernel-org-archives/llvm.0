Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263496;
	b=j9oXj7bvxUewpBy+mU8wGu17giw9m9qbAmzwkzUKUxVS3g88lFcBTANpgSl1YG1sWuK/
	 ZvxenDQ3IWzulX9xktzkMbcJWPybqMCdns91pc5HDMEf9rS5nIqm+8XUg+HLDw5PfGk4w
	 W8xn7ep/2lh4lFwsop/jUSvj+ZBM+SUL1F76QTLAj59o4P75z/MagIPh8+4l16d+uUS76
	 khi9kGB7otAd82dUgCeYjva/VCUH/SdZEH5TJbL3Ua6Qot/fVyABxiXKjHH5U+7MChnS6
	 MmcHOn/JGFcs2vHISC3/XeicZI9+tXG3C61Uhjr9Udf3c0JdChe9nYf42l+LPNEkntw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lFsOXZPVg55OToMCBlhdUR7p0rTf9s8fzuXbbNMm4lg=;
	b=H68YEmhGE/iLoe8tRP4Q9jTtylfk0zdLjiOsRiiQLnY+Kw4yDCEpJsSvfBTQJrVxpOgY
	 IWksBWbqEQPsqr2tBjAJ729B10W7GVuJka3yn4fZPJJQPehcx9OXfJBE4NAYsnaSRxQYx
	 nWiAIJtwkqeHpTIwOqsvsJ2TYqOH0owEgDa7G9IPyBmB20ry4OQxY5DYIEPHnhu3Qyb6e
	 SRsZgdzTEwfNcZqEtveoCt1uFBfckzqzlfkB4epb3oWylZicXq6r9k5pmRPyMTofughF6
	 vDhiGMfrUcQ5Nek6H1w6LmWo/2FTtuaO1CAgDUW386lfHETi3mhgukj1TsZr98YdeSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=e+8AMWoT;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27768606A31C
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 08:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27768606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=e+8AMWoT
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so1035763b3a.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793263495; x=1793868295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFsOXZPVg55OToMCBlhdUR7p0rTf9s8fzuXbbNMm4lg=;
        b=e+8AMWoTfMigjli4FWiLGHCYBzioB9LFbVUIopWWR8lNW+Yd3moLbWB7tLFaCCWxy4
         F4uX4hp+Ta3e3Na2TpYs9L0m0WQccmdmmBMv+m2LAfKUqs6OaY0t/D4SpcGZvjg5g/MN
         is7ubZbiF24LAlRXj7gVa3ZDGZlsAQjbewjIQwiYuQmWSclusZFUKW6JPSGE2E06y379
         4AVOjJpKFbL7go66m0sb9C2LsK2DfCJYDAZYx16nEiTUEHEyp21K1P+WwZOaDaAg+MfR
         jXk0LXbb1J8OlUfjRdH4wsx67MXTQwMfjlP7mP6cHlx1yysxdGRf6+aUYlJiqJJEONB8
         xL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263495; x=1793868295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFsOXZPVg55OToMCBlhdUR7p0rTf9s8fzuXbbNMm4lg=;
        b=dx4IJsb+hdw8BipU1YWpvW1Yaq+26DaR95IGvVHl5m8z/nr0xDZSnMNMtTH0MTOx9I
         I1sMU/61CyD2CPrTMmL/DrY7PnjEEibL70ggmOxjWwC1twhS3Nh07XIVUkBf7KAXrMfP
         WFhcN1CKNlsymMnV1IR7MLz5AgBfMgl9NoFwu02+ds9KRjicT2b5FK7b16RIke2dStin
         wmUgajXH4hZGbD6moDL6s7kPd10Q0OmXCc4Gw9J9ithp2BwCBloV9Yqk8xiapx7rKcwz
         PISNIOJctN2XEpZ7DqPuOCg6AFOgOafyRhh3plgKfo+4R5hDjTJfO/kA2R0k8hO9SGkv
         e8dg==
X-Forwarded-Encrypted: i=1; AKwUvBzR6FA5DJXCSmhb9ip/w3qAh1F9Nb1IvAu8KzgR6dlpzRsCpyM32wQf1nF147vdwS17yIkO@lists.linux.dev
X-Gm-Message-State: AFq9FYLq9vKQkv8UsUwyIJCIYMVJEc4cY3u249NFlDNkgVcaP9xuqqNN
	fs5bP8mild0lI0JlM7/LWnf2bxy0WKo/LcLKvj14rZ3qxDPM1NXHR/78dwXuz80uYaZR
X-Gm-Gg: AYBFou091KqUeWFPXBl8QIgrf4A/2OnOJZuASWHme0UC1KI3R/Qmg9wx4HEZkavqJCN
	3oBlTb5owAz6BbJ7EqKAYRSRBLmP/jNkFp/KLO8UCMKAkoxuyZLhp8sK7Zb1JozxKK7EU62vjQ8
	hqQkmdONtFIq186oN0GVIh0gdK5Zcxk+uZMBayCbPzOyL+OKi8L2q1qFtUoRRWRWsLSV2gPxN4A
	aF0Y+szewAAHfCDPEuyEPSB2KEvNuKzrtYR1Dfu2L+IgflmBD0wEWVJOrSN0LknjUw3mY3ert7q
	Tui9aJkHDuWEAHJR3a/9oS1kkV6EkNnoZaE+YFBMxjyJdfmul54sXnhSjjE8Znwd2FZgCWluOf4
	slpldsHv+K/9cUwKhHL3JU1syL8giloCopJm1P4TVSjw89rrEBp0/TnPRNTd+SulX6yi/hhUD0F
	CAjzAamMXFuqARpoWLIrPyDu/LCZAfWN4wDvWalgB/BiJMpZrtmvymvWBv19Gz9vJvAjoLTcOv4
	/KEz0knwbZ46Ew2WAy0ZRZhsm2UxKcEuvE94d39qwnPhyHqTzABaOtlpkXhRZ1H4GAIEdrqcy9r
	oNPTlnMJJLwpQ/cof5VFgkMj5aevCpke54cFDaGU4q2WiTX1eOVXiGX3TRHS
X-Received: by 2002:a05:6a20:e390:b0:3e2:6f90:b544 with SMTP id adf61e73a8af0-3e901e78e5bmr4175756637.0.1793263495268;
        Thu, 29 Oct 2026 01:44:55 -0700 (PDT)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad33b99b2sm3083915a12.26.2026.10.29.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:44:54 -0700 (PDT)
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
Subject: [PATCH net v3 2/3] can: j1939: stop TX sends after session shutdown
Date: Thu, 29 Oct 2026 08:43:25 +0000
Message-ID: <a683b6afb2c21e0d05be0ebe18c4f60b98152d25.1793259424.git.zihanx@nebusec.ai>
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

Serialize session data and control frame transmission with transitions
that shut down a session. This prevents a timer callback from sending
after the session is deactivated or an incoming ABORT starts draining
its timers.

Also suppress the callback-generated XTP ABORT frame once RX ABORT has
closed the session send gate.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org

Link: https://bugtracker.nebusec.ai/f/11143
Link: https://lore.kernel.org/all/cover.1793012287.git.zihanx@nebusec.ai/
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/can/j1939/j1939-priv.h | 10 ++++--
 net/can/j1939/transport.c  | 68 +++++++++++++++++++++++++++++++++-----
 2 files changed, 66 insertions(+), 12 deletions(-)

diff --git a/net/can/j1939/j1939-priv.h b/net/can/j1939/j1939-priv.h
index c0a4c1478240..6bf55b7dfffc 100644
--- a/net/can/j1939/j1939-priv.h
+++ b/net/can/j1939/j1939-priv.h
@@ -238,6 +238,10 @@ struct j1939_session {
 	struct list_head sk_session_queue_entry;
 	struct kref kref;
 	struct sock *sk;
+	/* Serializes session TX sends against transition to DONE. */
+	spinlock_t tx_send_lock;
+	bool tx_send_shutdown;
+
 	/* ifindex, src, dst, pgn define the session block
 	 * the are _never_ modified after insertion in the list
 	 * this decreases locking problems a _lot_
@@ -289,22 +293,22 @@ struct j1939_session {
 		/* dpo - ETP.CM_DPO, Data Packet Offset */
 		unsigned int dpo;
 	} pkt;
+	/* Protects TX timer rearming and cancellation. */
+	spinlock_t txtimer_lock;
 	/*
 	 * qref pins the queued timer; cbref pins a running callback. A
 	 * concurrent rearm can leave both references outstanding.
 	 */
-	/* Protects TX timer rearming and cancellation. */
-	spinlock_t txtimer_lock;
 	struct hrtimer txtimer;
 	bool txtimer_qref;
 	bool txtimer_cbref;
 	bool txtimer_cb_running;
 	bool txtimer_shutdown;
-	/* RX timer state and refs below use active_session_list_lock. */
 	struct hrtimer rxtimer;
 	bool rxtimer_qref;
 	bool rxtimer_cbref;
 	bool rxtimer_cb_running;
+	/* RX timer state and refs below use active_session_list_lock. */
 	/* Temporary drains defer rearming; the last drain installs the pending timeout. */
 	unsigned int rxtimer_cancelers;
 	bool rxtimer_pending;
diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 0dd08d1b8f75..570e2b8d0826 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -763,6 +763,29 @@ sk_buff *j1939_tp_tx_dat_new(struct j1939_priv *priv,
 	return skb;
 }
 
+static int j1939_session_tx_send(struct j1939_session *session,
+				 struct sk_buff *skb)
+{
+	enum j1939_session_state state;
+	int ret;
+
+	spin_lock_bh(&session->tx_send_lock);
+	j1939_session_list_lock(session->priv);
+	state = session->state;
+	j1939_session_list_unlock(session->priv);
+	if (session->tx_send_shutdown || state != J1939_SESSION_ACTIVE) {
+		kfree_skb(skb);
+		ret = -ESHUTDOWN;
+		goto out_unlock;
+	}
+
+	ret = j1939_send_one(session->priv, skb);
+
+out_unlock:
+	spin_unlock_bh(&session->tx_send_lock);
+	return ret;
+}
+
 /* TP transmit packet functions */
 static int j1939_tp_tx_dat(struct j1939_session *session,
 			   const u8 *dat, int len)
@@ -779,10 +802,11 @@ static int j1939_tp_tx_dat(struct j1939_session *session,
 	if (j1939_tp_padding && len < 8)
 		memset(skb_put(skb, 8 - len), 0xff, 8 - len);
 
-	return j1939_send_one(priv, skb);
+	return j1939_session_tx_send(session, skb);
 }
 
-static int j1939_xtp_do_tx_ctl(struct j1939_priv *priv,
+static int j1939_xtp_do_tx_ctl(struct j1939_session *session,
+			       struct j1939_priv *priv,
 			       const struct j1939_sk_buff_cb *re_skcb,
 			       bool swap_src_dst, pgn_t pgn, const u8 *dat)
 {
@@ -802,6 +826,9 @@ static int j1939_xtp_do_tx_ctl(struct j1939_priv *priv,
 	skdat[6] = (pgn >> 8);
 	skdat[7] = (pgn >> 16);
 
+	if (session)
+		return j1939_session_tx_send(session, skb);
+
 	return j1939_send_one(priv, skb);
 }
 
@@ -810,7 +837,7 @@ static inline int j1939_tp_tx_ctl(struct j1939_session *session,
 {
 	struct j1939_priv *priv = session->priv;
 
-	return j1939_xtp_do_tx_ctl(priv, &session->skcb,
+	return j1939_xtp_do_tx_ctl(session, priv, &session->skcb,
 				   swap_src_dst,
 				   session->skcb.addr.pgn, dat);
 }
@@ -829,7 +856,7 @@ static int j1939_xtp_tx_abort(struct j1939_priv *priv,
 	memset(dat, 0xff, sizeof(dat));
 	dat[0] = J1939_TP_CMD_ABORT;
 	dat[1] = err;
-	return j1939_xtp_do_tx_ctl(priv, re_skcb, swap_src_dst, pgn, dat);
+	return j1939_xtp_do_tx_ctl(NULL, priv, re_skcb, swap_src_dst, pgn, dat);
 }
 
 static void j1939_tp_schedule_txtimer_locked(struct j1939_session *session,
@@ -842,7 +869,6 @@ static void j1939_tp_schedule_txtimer_locked(struct j1939_session *session,
 	if (session->txtimer_shutdown)
 		return;
 
-	/* Replace the queued pin; a running callback retains its separate pin. */
 	ret = hrtimer_try_to_cancel(&session->txtimer);
 	if (ret == 1) {
 		/* Reuse the pin owned by the removed queued timer. */
@@ -1269,7 +1295,6 @@ static int j1939_xtp_txnext_receiver(struct j1939_session *session)
 
 static int j1939_simple_txnext(struct j1939_session *session)
 {
-	struct j1939_priv *priv = session->priv;
 	struct sk_buff *se_skb = j1939_session_skb_get(session);
 	struct sk_buff *skb;
 	int ret;
@@ -1298,7 +1323,7 @@ static int j1939_simple_txnext(struct j1939_session *session)
 
 	j1939_tp_set_rxtimeout(session, J1939_SIMPLE_ECHO_TIMEOUT_MS);
 
-	ret = j1939_send_one(priv, skb);
+	ret = j1939_session_tx_send(session, skb);
 	if (ret)
 		goto out_free;
 
@@ -1318,6 +1343,7 @@ static bool j1939_session_deactivate_locked(struct j1939_session *session)
 {
 	bool active = false;
 
+	lockdep_assert_held(&session->tx_send_lock);
 	lockdep_assert_held(&session->priv->active_session_list_lock);
 
 	if (session->state >= J1939_SESSION_ACTIVE &&
@@ -1333,14 +1359,23 @@ static bool j1939_session_deactivate_locked(struct j1939_session *session)
 	return active;
 }
 
+static void j1939_session_tx_send_shutdown(struct j1939_session *session)
+{
+	spin_lock_bh(&session->tx_send_lock);
+	session->tx_send_shutdown = true;
+	spin_unlock_bh(&session->tx_send_lock);
+}
+
 static bool j1939_session_deactivate(struct j1939_session *session)
 {
 	struct j1939_priv *priv = session->priv;
 	bool active;
 
+	spin_lock_bh(&session->tx_send_lock);
 	j1939_session_list_lock(priv);
 	active = j1939_session_deactivate_locked(session);
 	j1939_session_list_unlock(priv);
+	spin_unlock_bh(&session->tx_send_lock);
 
 	if (active) {
 		j1939_session_txtimer_cancel_async(session);
@@ -1363,12 +1398,14 @@ static void __j1939_session_cancel(struct j1939_session *session,
 	struct j1939_priv *priv = session->priv;
 
 	WARN_ON_ONCE(!err);
+	lockdep_assert_held(&session->tx_send_lock);
 	lockdep_assert_held(&session->priv->active_session_list_lock);
 
 	session->err = j1939_xtp_abort_to_errno(priv, err);
 	session->state = J1939_SESSION_WAITING_ABORT;
 	/* do not send aborts on incoming broadcasts */
-	if (!j1939_cb_is_broadcast(&session->skcb)) {
+	if (!session->tx_send_shutdown &&
+	    !j1939_cb_is_broadcast(&session->skcb)) {
 		j1939_xtp_tx_abort(priv, &session->skcb,
 				   !session->transmission,
 				   err, session->skcb.addr.pgn);
@@ -1381,6 +1418,7 @@ static void __j1939_session_cancel(struct j1939_session *session,
 static void j1939_session_cancel(struct j1939_session *session,
 				 enum j1939_xtp_abort err)
 {
+	spin_lock_bh(&session->tx_send_lock);
 	j1939_session_list_lock(session->priv);
 
 	if (session->state >= J1939_SESSION_ACTIVE &&
@@ -1391,6 +1429,7 @@ static void j1939_session_cancel(struct j1939_session *session,
 	}
 
 	j1939_session_list_unlock(session->priv);
+	spin_unlock_bh(&session->tx_send_lock);
 
 	if (!session->sk)
 		j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
@@ -1408,7 +1447,6 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 	int ret = 0;
 
 	spin_lock_bh(&session->txtimer_lock);
-	/* A concurrent rearm may already have recorded the callback pin. */
 	if (!session->txtimer_cbref) {
 		WARN_ON_ONCE(session->txtimer_cb_running);
 		WARN_ON_ONCE(!session->txtimer_qref);
@@ -1460,6 +1498,9 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 		 * propagation of the error to user space.
 		 */
 		break;
+	case -ESHUTDOWN:
+		/* A terminal path won before this packet could be sent. */
+		break;
 	case -EOVERFLOW:
 		j1939_session_cancel(session, J1939_XTP_ABORT_ECTS_TOO_BIG);
 		break;
@@ -1558,6 +1599,7 @@ static enum hrtimer_restart j1939_tp_rxtimer(struct hrtimer *hrtimer)
 		/* The message is probably stuck in the CAN controller and can
 		 * be send as soon as CAN bus is in working state again.
 		 */
+		spin_lock_bh(&session->tx_send_lock);
 		j1939_session_list_lock(priv);
 		if (session->state >= J1939_SESSION_ACTIVE &&
 		    session->state < J1939_SESSION_ACTIVE_MAX) {
@@ -1565,9 +1607,11 @@ static enum hrtimer_restart j1939_tp_rxtimer(struct hrtimer *hrtimer)
 			j1939_session_deactivate_locked(session);
 		}
 		j1939_session_list_unlock(priv);
+		spin_unlock_bh(&session->tx_send_lock);
 		j1939_session_txtimer_cancel_async(session);
 		j1939_session_rxtimer_cancel(session);
 	} else {
+		spin_lock_bh(&session->tx_send_lock);
 		j1939_session_list_lock(session->priv);
 		if (!session->rxtimer_cancelers &&
 		    session->state >= J1939_SESSION_ACTIVE &&
@@ -1579,6 +1623,7 @@ static enum hrtimer_restart j1939_tp_rxtimer(struct hrtimer *hrtimer)
 			__j1939_session_cancel(session, J1939_XTP_ABORT_TIMEOUT);
 		}
 		j1939_session_list_unlock(session->priv);
+		spin_unlock_bh(&session->tx_send_lock);
 
 		if (!session->sk)
 			j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
@@ -1671,6 +1716,8 @@ static void j1939_xtp_rx_abort_one(struct j1939_priv *priv, struct sk_buff *skb,
 		    session, j1939_xtp_ctl_to_pgn(skb->data), abort,
 		    j1939_xtp_abort_to_str(abort));
 
+	/* Stop TX callbacks before waiting for the timer callbacks to drain. */
+	j1939_session_tx_send_shutdown(session);
 	j1939_session_timers_cancel(session);
 	j1939_session_list_lock(priv);
 	if (session->state >= J1939_SESSION_ACTIVE &&
@@ -1843,6 +1890,7 @@ static struct j1939_session *j1939_session_new(struct j1939_priv *priv,
 	skcb = j1939_skb_to_cb(skb);
 	memcpy(&session->skcb, skcb, sizeof(session->skcb));
 
+	spin_lock_init(&session->tx_send_lock);
 	scoped_guard(spinlock_init, &session->txtimer_lock) {
 		hrtimer_setup(&session->txtimer, j1939_tp_txtimer,
 			      CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
@@ -2561,6 +2609,7 @@ int j1939_cancel_active_session(struct j1939_priv *priv, struct sock *sk)
 		if (!session)
 			break;
 
+		spin_lock_bh(&session->tx_send_lock);
 		j1939_session_list_lock(priv);
 		if (session->state >= J1939_SESSION_ACTIVE &&
 		    session->state < J1939_SESSION_ACTIVE_MAX) {
@@ -2568,6 +2617,7 @@ int j1939_cancel_active_session(struct j1939_priv *priv, struct sock *sk)
 			j1939_session_deactivate_locked(session);
 		}
 		j1939_session_list_unlock(priv);
+		spin_unlock_bh(&session->tx_send_lock);
 
 		/* No state lock is held while waiting for either softirq timer. */
 		j1939_session_txtimer_cancel(session);
-- 
2.43.0

