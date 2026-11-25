Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640440;
	b=V7lPIdbhrAmpxCzJSlJUFn1X1WA9lXSveScOSTycJD45b+DgN3ynuCLnX6c257WGSd+M
	 3gn0cCWoCyE6WIlkenYCtRRCI2XMktO5dhVC12D6cSWQnEJWion3vL0ySKs6Y3EgTuhle
	 jwAneCaa7c/Fu7WZa82aaDUjbSiTf63GtuIxAH6fTAA09RayO9gsoj6cyfZGEzurqy7XS
	 wNiZVssSj9W1rTgAevg6IaecbnaoDPV/ByxMq5LgL/+gkIufw5V3OzWZpALXp3HfvlQ0l
	 njBp9ApGJ3dgMixD1Igt8ZDE2Y+9GhL3upuNNmzHkg/Xi9E6I2khTz4R+WEV2sqsHkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
	b=J4EirCz2929fCEVlQRuhHV/LyYYCf7rLR1WPXHQji7joP/K2eAiJ4GyfmuaXV8seKeg9
	 GSjn3AajgUzoRhaKzTRV8XhWsiSt+Jq6asUUv+wTfPCsRv94L+8P/D8OsODdIVTobLWDD
	 vPA08v8ffrIUYDB9tFXxLAyM6ZMvzbkwwsOX4l9Jxj4sa1QpZjppqyzjemcfxqWrcQNzT
	 lEQrUD37a818b1Y2TpRhx+mu+OABNLjIqCi/H/RpI+OCPIn3Cwu1ROpAeLfjUB15AGlk0
	 VhWzsN2bAtLEMWh1Tg9mFpDV564kmGQ2kT2LypBLqRAMyS9AIDN3WOqQMzZhLQDu+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PGVwcKyK;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658F606A327
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B658F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PGVwcKyK
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso10265837eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640439; x=1796245239; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
        b=PGVwcKyKNTDMED4W/5yvy0MqjmYrQislQAKXajJ+5VY6QHoOsoj73dxDmj5UO0joRC
         koCcbBd5ifzsByDSQ6A6b3LeV3zRVl/KdVygjjKaGyQmvT8g3LUeaNzIlXZZN8icG7Vn
         Ub13aEB15F8Ww3IDyjAp4fanIYWM3WE4aJlJyJauTQDgYfpIhXtTXgdlGhokfMSbfYma
         N+UWm9aeDnFWG7/IlwVSC1w+pisV9rmRqwSg3pHQIjtwrLFaYflw6kv7qo6Rnq0DRua+
         mmjktmRltRStQqOyoMb9r5j4MPFyzSIeZ8e0GESirrB1WT61zWOiNKvkmnw3tykXfYwX
         D+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640439; x=1796245239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
        b=yPVt2kARftDhWD+AuVPgf2/O6DUENas/lAnIbYte5L0ygpsy96DNLfjmcOPbHhkmZ4
         KyCs2OW182KfIehbH0rv/lqE/pLfcYvtTOpjTxMOTvhUve+WHKqfAmNBj5GcY4hfHnka
         iIjiHIyyboCZXo0RJ2VwcKa+tkDrrrVGprfZgN6pSkRw2SZLC5FoF7Bpt7V7oUR/gvA2
         nGAO9PSia9l26eV/h2SzwhoLk0F4Wzda+JGgTkknbW30Y+XUvPKjMMxiIraq/E+lJeFq
         +8rCYQH1ZmqS5wBHv+A5FQVEaKlkb2fEV+oRvAUHwCenKheWEGwlDPtKYUhevKTg/FQk
         0AjQ==
X-Forwarded-Encrypted: i=1; AL+hErEbZLRxfgJ6x4l6djTtB0oTzI8NE1g3zaMi6nvwOA0dZ6FsG88AKaRzYy3aCNHVp4PR4O/d@lists.linux.dev
X-Gm-Message-State: APuU4Z93BxMoEridER6rOLvE3bw55fZo7o0z3vvbBu3UUWCQvpcrsdl0
	cK1pRL9pC5bQOEKSOtnRRPFJU7lGsYZEdYwXIJ5LKMbiIFP5pcN6JVlnxIrOvRg0VUDQ9IiElBe
	1sw==
X-Received: from dycnh14.prod.google.com ([2002:a05:7300:ce8e:b0:36a:17c6:6824])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4143:10b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-386b1067bf5mr11917557eec.20.1795640438289; Wed, 25
 Nov 2026 13:00:38 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:25 +0000
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
Message-ID: <20261125210025.1277771-1-elkin@google.com>
Subject: [PATCH] smb: client: unlock reconnect_mutex before putting session on terminate
From: Elkin Cruz <elkin@google.com>
To: Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In smb2_reconnect_server(), when server->terminate is set, the early
exit path calls cifs_put_tcp_session(server, true) while still holding
pserver->reconnect_mutex and unlocks pserver->reconnect_mutex
afterwards. Dropping the last session reference can free server (which
equals pserver for primary channels), causing mutex_unlock() to touch
freed memory; the normal done: label at the end of the same function
explicitly unlocks reconnect_mutex before calling cifs_put_tcp_session().

Unlock pserver->reconnect_mutex before calling cifs_put_tcp_session() in
the server->terminate branch as well.

Fixes: ee1d21794e55 ("cifs: handle when server stops supporting multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/smb/client/smb2pdu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 7b7d25364e20..2fc212593fa9 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4390,8 +4390,8 @@ void smb2_reconnect_server(struct work_struct *work)
 
 	/* if the server is marked for termination, drop the ref count here */
 	if (server->terminate) {
-		cifs_put_tcp_session(server, true);
 		mutex_unlock(&pserver->reconnect_mutex);
+		cifs_put_tcp_session(server, true);
 		return;
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

