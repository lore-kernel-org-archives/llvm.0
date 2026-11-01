Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514972;
	b=nOvHwzvus/WRZA44nDOlc2mOMLeeea+LvNblPUHnvyoKGDQL0RcOjVmh9IrBi4i93vGc
	 c2iArvCpLmHvfC/B2p3mOoj6hqOMKiK7qY5hwub84KzzHn+MHK7s/MEjGvtsQjuFuGn4/
	 ZUxZP9hn4WgI1DGnFODesIlsnemMaL+/5Fhu1jRAYIs5Kb5Q2uhPzoTrWYUdptpRv0QoM
	 +FIMrd+lv0TcarFX5lSC16OJmmvr5FmglroVOsi1mO/nMq/QVLHiEbAPzwxGn8rlGEmn9
	 fVmUnyC4zX0Ed1e02BxBmUJhShgarYCyVyyFE6Hl2ZQOACs4Cp2DPdua6BWp+KgZdUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z9HT/Oi8sTDYdRC5RzRMiB3sQtxntVsWdlc8duAjBxQ=;
	b=ralmqbNPRix8aaYt25XnaYZWjZ7AnHF1Jm4ox/rXiVSNF/lSUcNT970hXxrHKKPCIslz
	 +zKwicbMdJJPThxqkv4LsEipzJm77cVheZ5JeSSdLu9+t/nfZ2OhVI/ni/VYSemrN0PAe
	 2cyIqfMsJi9wSxxzbm3XWwWK0JXtP5VzCKNjAoEZ7bAqQeUTAT96rsA3iuK/ZyBrA/qld
	 fcvSH6CHy/sDp6Okesm/WuIpnkv/FbY1lwM7W7O+1MkkeS8J+AEWSev/4ze2qPz/+A/pO
	 tIxXngWqNqUxmxgskMlF2vo/TnMSpqq8X8hCa1AGQhnuk1AWyxiOyUIciRCl7MEqfFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=a6xtY8jV;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707D606A324
	for <llvm@lists.linux.dev>; Sun,  1 Nov 2026 06:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8707D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=a6xtY8jV
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1172808a91.1
        for <llvm@lists.linux.dev>; Sat, 31 Oct 2026 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793514972; x=1794119772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9HT/Oi8sTDYdRC5RzRMiB3sQtxntVsWdlc8duAjBxQ=;
        b=a6xtY8jVWeBxmGk9gZ4jupccit9+tiR7JXUJJGgqOrZGKcC/Ol8x6B9G8YdpKvLm0+
         rZ1vltNqI6tx4MciiARSxK/6lEFdo39JEOj1FHxHmlWh04gdlkqb4+5Xgv3dP+o/At0Z
         nu1p1NmMez2bR6sdfqxL7HkD/qEToIh7DHFe7U2urgQ1qXU0hn39RQV23EjfFpTnaqFt
         CZJJUwRdutAD1Axetubt2aDhztdJfBogMFXE2SL2eTpvbEWv01IqBTZiFHO256bqTz0R
         ZlJmAC8Pm3/CtJtWPXwYSvpoj03mDf6mAaZkQMTgkVaAv3uvC9PP8Q3K7NDmSA/2NCbY
         QbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514972; x=1794119772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9HT/Oi8sTDYdRC5RzRMiB3sQtxntVsWdlc8duAjBxQ=;
        b=SAQhBydv9TaxX2DEFYM81gwCW7m+qwRumpa5IkdZz4kgO4qw6DFBEAIS26JTNQ29Yp
         rnsU5DZW2EyPbp0V/Zth8JLFFAQn27TG0ZvhaGd5x7qlX7yXs9oNfwKOXuhwcz2O0Pr8
         Tp4w6wMy/wNeZXnl1Eka6UYuZsafHHvidcp/HKNa3l2e9nthOCqJfDvK3VwuLN9tPDsy
         /zJ2Zrwkcw1V9KBv5E3sTvYdKJwnTOqOW4gLzEBDcRevs8b3gsjOZBaxn89mrAMP67n7
         RlAcPOOG2MSPyhNadL9oBHZwiHFuLgqOJ1Ocrz6y8w96Xk+4PZC+MXHE6ZHJjtXBfaiu
         WvUw==
X-Gm-Message-State: APuU4Z89NRn9De46Z7XOFJ9mHrOlrXT864jKSF/zUdjVph6vg7emD66G
	BUWkF3zIBlsSs75EXHrrwr+P0oa3hslDbZG5htkU5mFhcF03YdhFietXTgZHbeLTvOGWMu0j1I+
	P73eJNmT2
X-Gm-Gg: AYBFou26foxmQjwvlc0NX6dR4iUAFZc3SmyqbKsa2wIE/MLzvEAjntFSr44fPR0PCVa
	TklZuV6c4BWQD3k5dSZnzT9dekYBckC8U3Kuwy6akuJxjWeF/4ni+nN6YosR03hVVKMCesJy7K5
	VUqZvLDbbsFI9vxbi/QN0uNV1NKIq/Sg8afD2d9Wejn/wYHx0lIS7fhX5cqmExPkcA5tQokRIOi
	cvrGTPmVYRRGlUkgxO4ZtJPPBORExWFK8aXaAwCNcvIu00BXnXWs0jwBCyVE1nxSziu3rOwExgY
	RJ4Tsgif1lajW+w+T8dZu60fl/I5BxlM2yajqHz5YQWi42PsRwEOfuciwvr4Z3QKzFLH7G2LDq+
	cWGk25crTD0NvCikuoOf56jO9egIYUoRbA1pQVoIE5piezqfYYqRpUesLLmHcl5Bc44qXwlY2AQ
	PQdqREt0rJqlVVzHEVFjEouUk+7zXhNKFpPevUpij/fsQzqnuLPZY0I7TwAU9Cu/0kNKLEbSCEn
	m2D5tRjyJ+ZadKsCokX7kR7nmWslTVLwUwZr53FVWtYjHk3MqGWxH/vRElG+H3gcVq/Zi0qY/in
	oC1mlo5CCuRVjoR4mjZgsp4cTyt9q/tX4ed7h6/ByX/33Tb4QqR5e+TA/pyeyWueEH9v0amiC0V
	y58Fiiw==
X-Received: by 2002:a17:90b:3f84:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ae897a5c4amr5716199a91.41.1793514971761;
        Sat, 31 Oct 2026 23:36:11 -0700 (PDT)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm14032763a91.9.2026.10.31.23.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:36:10 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: llvm@lists.linux.dev,
	linux-can@vger.kernel.org
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
	zihanx@nebusec.ai,
	lkp@intel.com
Subject: [PATCH net v4 1/1] can: j1939: fix TX timer reference leak
Date: Sun,  1 Nov 2026 06:35:56 +0000
Message-ID: <f28a2c7a6891ea9d8b5a495493986e0b426a9978.1793371075.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793371075.git.zihanx@nebusec.ai>
References: <cover.1793371075.git.zihanx@nebusec.ai>
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

Reuse the session reference owned by a queued TX timer when its expiry is
replaced. Track the queued timer and running callback references separately
so a concurrent rearm does not lose or duplicate the session pin.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Link: https://bugtracker.nebusec.ai/f/11143
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/can/j1939/j1939-priv.h |   7 ++
 net/can/j1939/transport.c  | 173 +++++++++++++++++++++++++++++++++++--
 2 files changed, 172 insertions(+), 8 deletions(-)

diff --git a/net/can/j1939/j1939-priv.h b/net/can/j1939/j1939-priv.h
index cf26352d1d8c..6334192744a6 100644
--- a/net/can/j1939/j1939-priv.h
+++ b/net/can/j1939/j1939-priv.h
@@ -10,6 +10,7 @@
 #define _J1939_PRIV_H_
 
 #include <linux/can/j1939.h>
+#include <linux/spinlock.h>
 #include <net/sock.h>
 
 /* Timeout to receive the abort signal over loop back. In case CAN
@@ -290,6 +291,12 @@ struct j1939_session {
 		unsigned int dpo;
 	} pkt;
 	struct hrtimer txtimer, rxtimer;
+	/* qref pins a queued timer; cbref pins its running callback. */
+	spinlock_t txtimer_lock;
+	bool txtimer_qref;
+	bool txtimer_cbref;
+	unsigned int txtimer_cancelers; /* block starts while a cancel waits */
+	bool txtimer_shutdown;
 };
 
 struct j1939_sock {
diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f..bf9021977d85 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -301,9 +301,74 @@ void j1939_session_put(struct j1939_session *session)
 	kref_put(&session->kref, __j1939_session_release);
 }
 
-static void j1939_session_txtimer_cancel(struct j1939_session *session)
+static void j1939_session_txtimer_cancel(struct j1939_session *session,
+					 bool shutdown)
 {
-	if (hrtimer_cancel(&session->txtimer))
+	bool put_qref = false;
+	int ret;
+
+	spin_lock_bh(&session->txtimer_lock);
+	session->txtimer_cancelers++;
+	if (shutdown)
+		session->txtimer_shutdown = true;
+	ret = hrtimer_try_to_cancel(&session->txtimer);
+	if (ret == 1) {
+		if (!WARN_ON_ONCE(!session->txtimer_qref)) {
+			session->txtimer_qref = false;
+			put_qref = true;
+		}
+	}
+	spin_unlock_bh(&session->txtimer_lock);
+
+	/* Never wait for a softirq callback while holding txtimer_lock. */
+	if (ret < 0) {
+		ret = hrtimer_cancel(&session->txtimer);
+		if (ret == 1) {
+			spin_lock_bh(&session->txtimer_lock);
+			if (!WARN_ON_ONCE(!session->txtimer_qref)) {
+				session->txtimer_qref = false;
+				put_qref = true;
+			}
+			spin_unlock_bh(&session->txtimer_lock);
+		}
+	}
+	spin_lock_bh(&session->txtimer_lock);
+	if (WARN_ON_ONCE(!session->txtimer_cancelers))
+		session->txtimer_cancelers = 0;
+	else
+		session->txtimer_cancelers--;
+	spin_unlock_bh(&session->txtimer_lock);
+
+	if (put_qref)
+		j1939_session_put(session);
+}
+
+static bool
+j1939_session_txtimer_cancel_async_locked(struct j1939_session *session)
+{
+	int ret;
+
+	lockdep_assert_held(&session->txtimer_lock);
+	session->txtimer_shutdown = true;
+	ret = hrtimer_try_to_cancel(&session->txtimer);
+	if (ret != 1)
+		return false;
+
+	if (WARN_ON_ONCE(!session->txtimer_qref))
+		return false;
+	session->txtimer_qref = false;
+	return true;
+}
+
+static void j1939_session_txtimer_cancel_async(struct j1939_session *session)
+{
+	bool put_qref;
+
+	spin_lock_bh(&session->txtimer_lock);
+	put_qref = j1939_session_txtimer_cancel_async_locked(session);
+	spin_unlock_bh(&session->txtimer_lock);
+
+	if (put_qref)
 		j1939_session_put(session);
 }
 
@@ -315,7 +380,7 @@ static void j1939_session_rxtimer_cancel(struct j1939_session *session)
 
 void j1939_session_timers_cancel(struct j1939_session *session)
 {
-	j1939_session_txtimer_cancel(session);
+	j1939_session_txtimer_cancel(session, true);
 	j1939_session_rxtimer_cancel(session);
 }
 
@@ -716,9 +781,51 @@ static int j1939_xtp_tx_abort(struct j1939_priv *priv,
 
 void j1939_tp_schedule_txtimer(struct j1939_session *session, int msec)
 {
-	j1939_session_get(session);
+	bool queued;
+	int ret;
+
+	j1939_session_list_lock(session->priv);
+	if (session->state != J1939_SESSION_ACTIVE) {
+		j1939_session_list_unlock(session->priv);
+		return;
+	}
+
+	spin_lock(&session->txtimer_lock);
+	if (session->txtimer_cancelers || session->txtimer_shutdown) {
+		spin_unlock(&session->txtimer_lock);
+		j1939_session_list_unlock(session->priv);
+		return;
+	}
+
+	/* Replace the queued timer without taking another session reference. */
+	ret = hrtimer_try_to_cancel(&session->txtimer);
+	if (ret == 1) {
+		if (WARN_ON_ONCE(!session->txtimer_qref))
+			j1939_session_get(session);
+		session->txtimer_qref = true;
+	} else if (ret == 0) {
+		if (!session->txtimer_qref) {
+			j1939_session_get(session);
+			session->txtimer_qref = true;
+		}
+	} else {
+		/* The callback is running; preserve its pin and pin the rearm. */
+		queued = hrtimer_is_queued(&session->txtimer);
+		if (!queued && !session->txtimer_cbref &&
+		    session->txtimer_qref) {
+			session->txtimer_qref = false;
+			session->txtimer_cbref = true;
+		}
+		if (!session->txtimer_qref) {
+			j1939_session_get(session);
+			session->txtimer_qref = true;
+		}
+	}
+
 	hrtimer_start(&session->txtimer, ms_to_ktime(msec),
 		      HRTIMER_MODE_REL_SOFT);
+	spin_unlock(&session->txtimer_lock);
+	j1939_session_list_unlock(session->priv);
 }
 
 static inline void j1939_tp_set_rxtimeout(struct j1939_session *session,
@@ -1105,6 +1212,9 @@ static bool j1939_session_deactivate_locked(struct j1939_session *session)
 	bool active = false;
 
 	lockdep_assert_held(&session->priv->active_session_list_lock);
+	spin_lock(&session->txtimer_lock);
+	session->txtimer_shutdown = true;
+	spin_unlock(&session->txtimer_lock);
 
 	if (session->state >= J1939_SESSION_ACTIVE &&
 	    session->state < J1939_SESSION_ACTIVE_MAX) {
@@ -1126,6 +1236,8 @@ static bool j1939_session_deactivate(struct j1939_session *session)
 	j1939_session_list_lock(priv);
 	active = j1939_session_deactivate_locked(session);
 	j1939_session_list_unlock(priv);
+	if (active)
+		j1939_session_txtimer_cancel_async(session);
 
 	return active;
 }
@@ -1161,15 +1273,23 @@ static void __j1939_session_cancel(struct j1939_session *session,
 static void j1939_session_cancel(struct j1939_session *session,
 				 enum j1939_xtp_abort err)
 {
+	bool cancelled = false;
+
 	j1939_session_list_lock(session->priv);
 
 	if (session->state >= J1939_SESSION_ACTIVE &&
 	    session->state < J1939_SESSION_WAITING_ABORT) {
 		j1939_tp_set_rxtimeout(session, J1939_XTP_ABORT_TIMEOUT_MS);
 		__j1939_session_cancel(session, err);
+		spin_lock(&session->txtimer_lock);
+		session->txtimer_shutdown = true;
+		spin_unlock(&session->txtimer_lock);
+		cancelled = true;
 	}
 
 	j1939_session_list_unlock(session->priv);
+	if (cancelled)
+		j1939_session_txtimer_cancel_async(session);
 
 	if (!session->sk)
 		j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
@@ -1180,8 +1300,26 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 	struct j1939_session *session =
 		container_of(hrtimer, struct j1939_session, txtimer);
 	struct j1939_priv *priv = session->priv;
+	bool can_rearm, shutdown;
+	bool put_cbref = false;
 	int ret = 0;
 
+	spin_lock_bh(&session->txtimer_lock);
+	if (!session->txtimer_cbref) {
+		if (WARN_ON_ONCE(!session->txtimer_qref))
+			j1939_session_get(session);
+		session->txtimer_qref = false;
+		session->txtimer_cbref = true;
+	}
+	shutdown = session->txtimer_shutdown;
+	spin_unlock_bh(&session->txtimer_lock);
+
+	j1939_session_list_lock(priv);
+	can_rearm = session->state == J1939_SESSION_ACTIVE;
+	j1939_session_list_unlock(priv);
+	if (shutdown || !can_rearm)
+		goto txtimer_done;
+
 	if (session->skcb.addr.type == J1939_SIMPLE) {
 		ret = j1939_simple_txnext(session);
 	} else {
@@ -1232,7 +1370,20 @@ static enum hrtimer_restart j1939_tp_txtimer(struct hrtimer *hrtimer)
 		}
 	}
 
-	j1939_session_put(session);
+txtimer_done:
+	j1939_session_list_lock(priv);
+	can_rearm = session->state == J1939_SESSION_ACTIVE;
+	j1939_session_list_unlock(priv);
+	spin_lock_bh(&session->txtimer_lock);
+	if (session->txtimer_qref &&
+	    (session->txtimer_shutdown || !can_rearm))
+		hrtimer_start(&session->txtimer, 0, HRTIMER_MODE_REL_SOFT);
+	put_cbref = session->txtimer_cbref;
+	session->txtimer_cbref = false;
+	spin_unlock_bh(&session->txtimer_lock);
+
+	if (put_cbref)
+		j1939_session_put(session);
 
 	return HRTIMER_NORESTART;
 }
@@ -1486,7 +1637,7 @@ j1939_xtp_rx_cts_one(struct j1939_session *session, struct sk_buff *skb)
 			if (session->pkt.tx_acked)
 				j1939_sk_errqueue(session,
 						  J1939_ERRQUEUE_TX_SCHED);
-			j1939_session_txtimer_cancel(session);
+			j1939_session_txtimer_cancel(session, false);
 			j1939_tp_schedule_txtimer(session, 0);
 		}
 	} else {
@@ -1540,6 +1691,7 @@ static struct j1939_session *j1939_session_new(struct j1939_priv *priv,
 	skcb = j1939_skb_to_cb(skb);
 	memcpy(&session->skcb, skcb, sizeof(session->skcb));
 
+	spin_lock_init(&session->txtimer_lock);
 	hrtimer_setup(&session->txtimer, j1939_tp_txtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 	hrtimer_setup(&session->rxtimer, j1939_tp_rxtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 
@@ -1810,7 +1962,7 @@ static void j1939_xtp_rx_rts(struct j1939_priv *priv, struct sk_buff *skb,
 			j1939_tp_set_rxtimeout(session, 750);
 	} else {
 		if (!session->transmission) {
-			j1939_session_txtimer_cancel(session);
+			j1939_session_txtimer_cancel(session, false);
 			j1939_tp_schedule_txtimer(session, 0);
 		}
 		j1939_tp_set_rxtimeout(session, 1250);
@@ -2242,7 +2394,12 @@ int j1939_cancel_active_session(struct j1939_priv *priv, struct sock *sk)
 				 &priv->active_session_list,
 				 active_session_list_entry) {
 		if (!sk || sk == session->sk) {
-			if (hrtimer_try_to_cancel(&session->txtimer) == 1)
+			bool put_qref;
+
+			spin_lock(&session->txtimer_lock);
+			put_qref = j1939_session_txtimer_cancel_async_locked(session);
+			spin_unlock(&session->txtimer_lock);
+			if (put_qref)
 				j1939_session_put(session);
 			if (hrtimer_try_to_cancel(&session->rxtimer) == 1)
 				j1939_session_put(session);
-- 
2.43.0

