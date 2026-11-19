Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107827;
	b=iyJ7nZOLLxLYgEwQdEc4bEWR0Ql0M8+kYFWjbafYXn+XROW4HyRILXn7UEJ2Jg1Ybi1k
	 ARFasswm9UL1iYTdDwDsyIcRZTNTT/4hg0PAPjCmdRNXmwsVA9+IwTRgdnHyDBBhg8tRd
	 KGxPh+oQc203DZ0HwMW1KHLUPcQtFoYz+I+N03nlKrTcaEBRN1u5JIKLENihVaosP/cN+
	 tA78Z+hMTs2Na9lS35RSt3DGGUx5qr+5AeJ8QHwlA4thWq1QfohV6Ezd8M5Q0eUCeH9Qe
	 A2ee9jJc8iGZ5/BbL+L6RCY8q1InVl39ACzk3XxKzY66Z50EFEfjN9r3ExciwN0N41A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RoORXzLb277Rdk0jDhn23CA3scGInU/7CE/j8ILPC2U=;
	b=qhp2VSmPadV/JCKlXh3/hc9HqjnfMa57V+l63oK/siAa6rNyucZYHiJISN4w6Cphbq63
	 cWI5Q/dGSa+1IBnFnWJS3Qf4ZqrDJ/hLuvH5QvzgOPc3dPVueow2u2WBcha9SAMmm+4+N
	 TRke+d7ZIDGFHhSMK2Ei2krc5Sx6K526WEM4Yrgtyb1vRxkfamgFAsCb8QMi19zMbwp3f
	 bz7QhdfbPFgApvfB4Fgumypz1nwHmX6veq4qb+x7QgnWkrk45tWngj+7oCRo/D34m2QM9
	 WV8vbX89pBNK2xNLtZpThwxAVfut8Askat+jo8M2PPz2oRJ0AwiEyuYrv8RuKt7TLcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lIaqNmAI;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A10606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lIaqNmAI
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b29df78132so2585006c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107826; x=1795712626; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoORXzLb277Rdk0jDhn23CA3scGInU/7CE/j8ILPC2U=;
        b=lIaqNmAIK+gIEJCMe7kzOpqUcyvWCRqczlfb9ySqMwlNTLufU0QkQDc+dTugLSSK7G
         3KzN142GJZI0CAFsXgFd286s7ObIez9X9y1QY6A63j8X8TRG3JuyJE/NUxb7Q+7XbJgv
         U/On2b1ww0klzcH+JH3dTPD0UuKbUJqkANR/Zzg/34thl0mdaCssCgpptg2ie6juSzTr
         4SkQO+6VCo3uI0ejPgMI0PaYT4mWXg+rdzkou3bR1zvo2vuWYCtEqf10tXBCIutO01O/
         dZ/uYcIuQULnScOo8MYOq2XJZMe/vYllbZEFJvyLFx0qtid4mknTGbWijUb+QwPF2SpY
         zUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107826; x=1795712626;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoORXzLb277Rdk0jDhn23CA3scGInU/7CE/j8ILPC2U=;
        b=zgPHy9l7g339y2tbde7TuJlrtXP0PYZ9buOCqTyDNoY8ovhFHJPAyk+PiwM/xrVnyk
         lfgVZAvtsMN7ZzUj8TUtJz3QN83YbaDSiztKtRqWM9M4cc5lKoXOKt4r+mBusW26Cuy0
         NQn+UsGDCyVeTIyLdx2Kdu5n4DlJ6vvyanVZQMCy4r9Y8Fg1VNe5bSWwbImMmmTUqrnS
         0l0QeWoKl8MJG/n/5X/s71L3PYCUZgs49an1vheUZUDenBc7cG8TCgUfDnMeObAAi1Wc
         s5FomDMm3xRbA81NvEo8TKpZZHCdhrp/aqhkR4auvkTaOz1e7aiW9CoZTIKymLi7ORit
         x8Mg==
X-Forwarded-Encrypted: i=1; AL+hErGtZ4eMU3UIVOqGBOwgWdAlKJY3X4aYysKuwDlghEsJGxo1tF2NCJjQdgcn8EpOpmQDqlwA@lists.linux.dev
X-Gm-Message-State: APuU4Z/lX6WfTpZBUGuNt0N75ea5WJeKjR+XXM43Cp+Ff40XRIoXlO5U
	D+m04bVp0CxveidSnNsBMklMiOijIWXVlY31eHblYHu649GwREL2TKmMfbM4IUtIpGqOeErwSq/
	sp7rZqPMWZw==
X-Received: from dldyq18-n1.prod.google.com ([2002:a05:701b:4552:10b0:195:d59a:94bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2083:10b0:164:4e36:f956
 with SMTP id a92af1059eb24-1b5568b47a4mr238242c88.16.1795107825531; Thu, 19
 Nov 2026 09:03:45 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:42 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170342.1508789-1-irogers@google.com>
Subject: [PATCH net] sctp: initialize new_value in custom proc_dointvec sysctl handlers
From: Ian Rogers <irogers@google.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

proc_sctp_do_rto_min(), proc_sctp_do_rto_max(), proc_sctp_do_auth(),
proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() point
tbl.data at an uninitialized stack variable new_value on writes before
calling proc_dointvec().

proc_dointvec() can return 0 without writing to tbl.data, for example on
a zero-length write (*lenp == 0) or on a write at a non-zero file offset
ignored by proc_first_pos_non_zero_ignore() (such as pwrite(fd, "1\n",
2, 1) or a split write where the trailing newline is written separately).

When that happens:
- proc_sctp_do_auth() unconditionally stores the uninitialized stack int
  into net->sctp.auth_enable and sctp_sk(sk)->ep->auth_enable, both
  corrupting SCTP authentication state and leaking 4 bytes of kernel
  stack memory back on subsequent sysctl reads.
- proc_sctp_do_rto_min(), proc_sctp_do_rto_max(),
  proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() validate
  the uninitialized value and overwrite the netns setting whenever stack
  bytes happen to fall within range.
- proc_sctp_do_udp_port() also stops and restarts the UDP encapsulation
  socket even when the port number did not change.

Initialize new_value to the current netns setting before calling
proc_dointvec() (matching proc_dobool()), and skip tearing down and
restarting the UDP encapsulation socket in proc_sctp_do_udp_port() when
new_value equals net->sctp.udp_port.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested.

Fixes: 4f3fdf3bc59c ("sctp: add check rto_min and rto_max in sysctl")
Fixes: b14878ccb7fa ("net: sctp: cache auth_enable per endpoint")
Fixes: 046c052b475e ("sctp: enable udp tunneling socks")
Fixes: d1e462a7a5f3 ("sctp: add probe_interval in sysctl and sock/asoc/transport")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/sctp/sysctl.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/net/sctp/sysctl.c b/net/sctp/sysctl.c
index 2b94c211427d..0c33f05fa532 100644
--- a/net/sctp/sysctl.c
+++ b/net/sctp/sysctl.c
@@ -425,8 +425,9 @@ static int proc_sctp_do_rto_min(const struct ctl_table *ctl, int write,
 	struct net *net = container_of(ctl->data, struct net, sctp.rto_min);
 	unsigned int min = *(unsigned int *) ctl->extra1;
 	unsigned int max = *(unsigned int *) ctl->extra2;
+	int new_value = net->sctp.rto_min;
 	struct ctl_table tbl;
-	int ret, new_value;
+	int ret;
 
 	memset(&tbl, 0, sizeof(struct ctl_table));
 	tbl.maxlen = sizeof(unsigned int);
@@ -453,8 +454,9 @@ static int proc_sctp_do_rto_max(const struct ctl_table *ctl, int write,
 	struct net *net = container_of(ctl->data, struct net, sctp.rto_max);
 	unsigned int min = *(unsigned int *) ctl->extra1;
 	unsigned int max = *(unsigned int *) ctl->extra2;
+	int new_value = net->sctp.rto_max;
 	struct ctl_table tbl;
-	int ret, new_value;
+	int ret;
 
 	memset(&tbl, 0, sizeof(struct ctl_table));
 	tbl.maxlen = sizeof(unsigned int);
@@ -489,8 +491,9 @@ static int proc_sctp_do_auth(const struct ctl_table *ctl, int write,
 			     void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct net *net = container_of(ctl->data, struct net, sctp.auth_enable);
+	int new_value = net->sctp.auth_enable;
 	struct ctl_table tbl;
-	int new_value, ret;
+	int ret;
 
 	memset(&tbl, 0, sizeof(struct ctl_table));
 	tbl.maxlen = sizeof(unsigned int);
@@ -522,8 +525,9 @@ static int proc_sctp_do_udp_port(const struct ctl_table *ctl, int write,
 	struct net *net = container_of(ctl->data, struct net, sctp.udp_port);
 	unsigned int min = *(unsigned int *)ctl->extra1;
 	unsigned int max = *(unsigned int *)ctl->extra2;
+	int new_value = net->sctp.udp_port;
 	struct ctl_table tbl;
-	int ret, new_value;
+	int ret;
 
 	memset(&tbl, 0, sizeof(struct ctl_table));
 	tbl.maxlen = sizeof(unsigned int);
@@ -541,18 +545,20 @@ static int proc_sctp_do_udp_port(const struct ctl_table *ctl, int write,
 			return -EINVAL;
 
 		mutex_lock(&sctp_sysctl_mutex);
-		net->sctp.udp_port = new_value;
-		sctp_udp_sock_stop(net);
-		if (new_value) {
-			ret = sctp_udp_sock_start(net);
-			if (ret)
-				net->sctp.udp_port = 0;
+		if (new_value != net->sctp.udp_port) {
+			net->sctp.udp_port = new_value;
+			sctp_udp_sock_stop(net);
+			if (new_value) {
+				ret = sctp_udp_sock_start(net);
+				if (ret)
+					net->sctp.udp_port = 0;
+			}
+
+			/* Update the value in the control socket */
+			lock_sock(sk);
+			sctp_sk(sk)->udp_port = htons(net->sctp.udp_port);
+			release_sock(sk);
 		}
-
-		/* Update the value in the control socket */
-		lock_sock(sk);
-		sctp_sk(sk)->udp_port = htons(net->sctp.udp_port);
-		release_sock(sk);
 		mutex_unlock(&sctp_sysctl_mutex);
 	}
 
@@ -564,8 +570,9 @@ static int proc_sctp_do_probe_interval(const struct ctl_table *ctl, int write,
 {
 	struct net *net = container_of(ctl->data, struct net,
 				       sctp.probe_interval);
+	int new_value = net->sctp.probe_interval;
 	struct ctl_table tbl;
-	int ret, new_value;
+	int ret;
 
 	memset(&tbl, 0, sizeof(struct ctl_table));
 	tbl.maxlen = sizeof(unsigned int);
-- 
2.56.1.708.g77570a6a1d-goog

