Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A833CE9A
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281383; cv=none; b=pRGukepS9n/2KvDu93TdO7J5xa++YhxabbRtOY0R3STPO3yMEUmnoLwGzqhQjjHDQETmaQi92zcAtVIMUlKolk0iBD5V7FLPA0aH+88P83zum37UA5xwrtvCqOhPnz5NF2uu2iCgNz0kBB2wWXmPD+OLB3RzMTtY1GZ/S1cTUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281383; c=relaxed/simple;
	bh=pKfPiN1SoREaDtMVpYwx/3pzZSUnmNLg5e4nX/AEchc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k+3DJcGSY+lc5pmrgO9psrumNktKz38wG9BtjhSmuUx+xwIbG8aI8JUtXiw6ckE8REl+0V1aBvfoElzbOjDut7IS1asiFFy/DZNYQis+wm+XS8vbua2tC8H36g5nMIO5j9ulDorgCuyV0Qwo7trIgT37rUoMgx/5ofY9BSLGjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bEy8SmVx; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bEy8SmVx"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-138156c0492so4318407c88.1
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781281381; x=1781886181; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jmyGTpqRWm3i/d6BFzXV54G7OiBKpqEwqVzt3Shrq+o=;
        b=bEy8SmVxGrXV7z2rI+MDAXCL6JIviOWdFQuwPmPIsvUm4aegaLiKcYsTxJ8is59JWJ
         CYY3QHgc409kPFlW5GWKnysIagqgtSY3RbyYAL02YkHI84jM7w/qgmYfrNzlswKKaxBk
         kfZrPx+qVevN8zNnfp/nNw3N3si734GAQNCd8hXfwEGJ1V8Er3N0Ny0Z/gbeKzwY/Cad
         OcSyiocOM0taIhv7P1RI795X7DNFmzztinoBIVZ22RoLe8bQmH8hs3//7mj3osuSV+Tg
         ofB8JfWuXid3/JVwiU9b0SfUWSIn2S/jLyQIEPI6bgmQZ6L6m4Egm6M9rCfUt4G9SRDN
         l3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281381; x=1781886181;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmyGTpqRWm3i/d6BFzXV54G7OiBKpqEwqVzt3Shrq+o=;
        b=POejKAVda9J6niG6SDjGGEb/LoQ13P0dS2CT7KRjb8eRT6SBggA08YA8duJE4D7nt5
         +8PQZSDpLB/zl+GF6JVMVTZh3Xa1XerWRVL1UyF9g+d06YnxDy0wtpXufYIHg0+w1Zoe
         AQcIT7aEYd+TM7Q8Ma/1T18hZ1uE9rg0W2hwU10uIKF9Ct9vyuTWATrs09inJu2hsPnv
         1jXnadtXQLN1KnLHlbiw83s869cZF9KyGgh1TWlQ9/XZvJu5DE/KIW99ZkT6/B56YWAs
         mttGrXR4tVz+kbLavkIeyCUenr2/ajggbI7WEpHg04LN8pXSiYfR55zFZ260eYS/HOmX
         QNeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7VqKeApijYDpRa/gpDDJXE2VkQ+z+RHUPh3uG/XFMJbnPEm7XxAIMxt+ateDBHCKw+gGa@lists.linux.dev
X-Gm-Message-State: AOJu0YyTLfZ56Wzcz8F98t31bkuH6F4ESuPekPw2UJIpG1jjB7NmGsHT
	zrFod33IfD4Je/J3ZhkCasLdrtK3HYOJxqqlZo4J9zVWPScRv2IjqSx794nktQt1qAW0kQ==
X-Received: from dlww16.prod.google.com ([2002:a05:7022:ea30:b0:137:e705:d114])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:43a9:b0:138:507b:30fd
 with SMTP id a92af1059eb24-138507b3401mr616605c88.6.1781281380261; Fri, 12
 Jun 2026 09:23:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:22:57 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612162257.896792-1-xur@google.com>
Subject: [PATCH] net: correcting section tags for .init and .exit data/functions
From: xur@google.com
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, "=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Yue Haibing <yuehaibing@huawei.com>, 
	Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Rong Xu <xur@google.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Fix modpost warnings that have surfaced during Clang's distributed ThinLTO
builds.

  WARNING: modpost: vmlinux: section mismatch in reference: tcp4_net_ops.llvm.4527429266264891517+0x8 (section: .data) -> tcp4_proc_init_net (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: udp4_net_ops.llvm.17425824324074326067+0x8 (section: .data) -> udp4_proc_init_net (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: ping_v4_net_ops.llvm.5641696707737373282+0x8 (section: .data) -> ping_v4_proc_init_net (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: if6_proc_net_ops.llvm.7870945277386035298+0x8 (section: .data) -> if6_proc_net_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: ipv6_addr_label_ops.llvm.5745897517271459135+0x8 (section: .data) -> ip6addrlbl_net_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: ndisc_net_ops.llvm.8806210167060761094+0x8 (section: .data) -> ndisc_net_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: raw6_net_ops.llvm.3743523335772203324+0x8 (section: .data) -> raw6_init_net (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: igmp6_net_ops.llvm.7071106350580158050+0x8 (section: .data) -> igmp6_net_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_net_ops.llvm.17505177970592326146+0x8 (section: .data) -> tcpv6_net_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: ip6_flowlabel_net_ops.llvm.6051723423336054316+0x8 (section: .data) -> ip6_flowlabel_proc_init (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: ipv6_proc_ops.llvm.7829948594772821810+0x8 (section: .data) -> ipv6_proc_init_net (section: .init.text)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 net/ipv4/ping.c          |  6 +++---
 net/ipv4/tcp_ipv4.c      |  6 +++---
 net/ipv4/udp.c           |  6 +++---
 net/ipv6/addrconf.c      |  6 +++---
 net/ipv6/addrlabel.c     |  6 +++---
 net/ipv6/ip6_flowlabel.c |  6 +++---
 net/ipv6/mcast.c         | 10 +++++-----
 net/ipv6/ndisc.c         | 10 +++++-----
 net/ipv6/proc.c          |  6 +++---
 net/ipv6/raw.c           |  6 +++---
 net/ipv6/tcp_ipv6.c      |  6 +++---
 11 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/net/ipv4/ping.c b/net/ipv4/ping.c
index d36f1e273fde..1dda6d661ad8 100644
--- a/net/ipv4/ping.c
+++ b/net/ipv4/ping.c
@@ -1144,17 +1144,17 @@ static void __net_exit ping_v4_proc_exit_net(struct net *net)
 	remove_proc_entry("icmp", net->proc_net);
 }
 
-static struct pernet_operations ping_v4_net_ops = {
+static struct pernet_operations ping_v4_net_ops __net_initdata = {
 	.init = ping_v4_proc_init_net,
 	.exit = ping_v4_proc_exit_net,
 };
 
-int __init ping_proc_init(void)
+int __net_init ping_proc_init(void)
 {
 	return register_pernet_subsys(&ping_v4_net_ops);
 }
 
-void ping_proc_exit(void)
+void __net_exit ping_proc_exit(void)
 {
 	unregister_pernet_subsys(&ping_v4_net_ops);
 }
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index fdc81150ff6c..9caca5879466 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -3317,17 +3317,17 @@ static void __net_exit tcp4_proc_exit_net(struct net *net)
 	remove_proc_entry("tcp", net->proc_net);
 }
 
-static struct pernet_operations tcp4_net_ops = {
+static struct pernet_operations tcp4_net_ops __net_initdata = {
 	.init = tcp4_proc_init_net,
 	.exit = tcp4_proc_exit_net,
 };
 
-int __init tcp4_proc_init(void)
+int __net_init tcp4_proc_init(void)
 {
 	return register_pernet_subsys(&tcp4_net_ops);
 }
 
-void tcp4_proc_exit(void)
+void __net_exit tcp4_proc_exit(void)
 {
 	unregister_pernet_subsys(&tcp4_net_ops);
 }
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 70f6cbd4ef73..87f4cced2114 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -3600,17 +3600,17 @@ static void __net_exit udp4_proc_exit_net(struct net *net)
 	remove_proc_entry("udp", net->proc_net);
 }
 
-static struct pernet_operations udp4_net_ops = {
+static struct pernet_operations udp4_net_ops __net_initdata = {
 	.init = udp4_proc_init_net,
 	.exit = udp4_proc_exit_net,
 };
 
-int __init udp4_proc_init(void)
+int __net_init udp4_proc_init(void)
 {
 	return register_pernet_subsys(&udp4_net_ops);
 }
 
-void udp4_proc_exit(void)
+void __net_exit udp4_proc_exit(void)
 {
 	unregister_pernet_subsys(&udp4_net_ops);
 }
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c9e5d3e48ab9..73d9439bd408 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4527,17 +4527,17 @@ static void __net_exit if6_proc_net_exit(struct net *net)
 	remove_proc_entry("if_inet6", net->proc_net);
 }
 
-static struct pernet_operations if6_proc_net_ops = {
+static struct pernet_operations if6_proc_net_ops __net_initdata = {
 	.init = if6_proc_net_init,
 	.exit = if6_proc_net_exit,
 };
 
-int __init if6_proc_init(void)
+int __net_init if6_proc_init(void)
 {
 	return register_pernet_subsys(&if6_proc_net_ops);
 }
 
-void if6_proc_exit(void)
+void __net_exit if6_proc_exit(void)
 {
 	unregister_pernet_subsys(&if6_proc_net_ops);
 }
diff --git a/net/ipv6/addrlabel.c b/net/ipv6/addrlabel.c
index f4b2618446bd..50f6c1b1edaa 100644
--- a/net/ipv6/addrlabel.c
+++ b/net/ipv6/addrlabel.c
@@ -340,17 +340,17 @@ static void __net_exit ip6addrlbl_net_exit(struct net *net)
 	spin_unlock(&net->ipv6.ip6addrlbl_table.lock);
 }
 
-static struct pernet_operations ipv6_addr_label_ops = {
+static struct pernet_operations ipv6_addr_label_ops __net_initdata = {
 	.init = ip6addrlbl_net_init,
 	.exit = ip6addrlbl_net_exit,
 };
 
-int __init ipv6_addr_label_init(void)
+int __net_init ipv6_addr_label_init(void)
 {
 	return register_pernet_subsys(&ipv6_addr_label_ops);
 }
 
-void ipv6_addr_label_cleanup(void)
+void __net_exit ipv6_addr_label_cleanup(void)
 {
 	unregister_pernet_subsys(&ipv6_addr_label_ops);
 }
diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index b1ccdf0dc646..f6980c403c68 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -903,17 +903,17 @@ static void __net_exit ip6_flowlabel_net_exit(struct net *net)
 	ip6_flowlabel_proc_fini(net);
 }
 
-static struct pernet_operations ip6_flowlabel_net_ops = {
+static struct pernet_operations ip6_flowlabel_net_ops __net_initdata = {
 	.init = ip6_flowlabel_proc_init,
 	.exit = ip6_flowlabel_net_exit,
 };
 
-int ip6_flowlabel_init(void)
+int __net_init ip6_flowlabel_init(void)
 {
 	return register_pernet_subsys(&ip6_flowlabel_net_ops);
 }
 
-void ip6_flowlabel_cleanup(void)
+void __net_exit ip6_flowlabel_cleanup(void)
 {
 	static_key_deferred_flush(&ipv6_flowlabel_exclusive);
 	timer_delete(&ip6_fl_gc_timer);
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index d9b855d5191b..eef5bab1ee13 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -3209,12 +3209,12 @@ static void __net_exit igmp6_net_exit(struct net *net)
 	igmp6_proc_exit(net);
 }
 
-static struct pernet_operations igmp6_net_ops = {
+static struct pernet_operations igmp6_net_ops __net_initdata = {
 	.init = igmp6_net_init,
 	.exit = igmp6_net_exit,
 };
 
-int __init igmp6_init(void)
+int __net_init igmp6_init(void)
 {
 	int err;
 
@@ -3231,18 +3231,18 @@ int __init igmp6_init(void)
 	return err;
 }
 
-int __init igmp6_late_init(void)
+int __net_init igmp6_late_init(void)
 {
 	return register_netdevice_notifier(&igmp6_netdev_notifier);
 }
 
-void igmp6_cleanup(void)
+void __net_exit igmp6_cleanup(void)
 {
 	unregister_pernet_subsys(&igmp6_net_ops);
 	destroy_workqueue(mld_wq);
 }
 
-void igmp6_late_cleanup(void)
+void __net_exit igmp6_late_cleanup(void)
 {
 	unregister_netdevice_notifier(&igmp6_netdev_notifier);
 }
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index e7ad13c5bd26..3a83280db29d 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1994,12 +1994,12 @@ static void __net_exit ndisc_net_exit(struct net *net)
 	inet_ctl_sock_destroy(net->ipv6.ndisc_sk);
 }
 
-static struct pernet_operations ndisc_net_ops = {
+static struct pernet_operations ndisc_net_ops __net_initdata = {
 	.init = ndisc_net_init,
 	.exit = ndisc_net_exit,
 };
 
-int __init ndisc_init(void)
+int __net_init ndisc_init(void)
 {
 	int err;
 
@@ -2027,17 +2027,17 @@ int __init ndisc_init(void)
 #endif
 }
 
-int __init ndisc_late_init(void)
+int __net_init ndisc_late_init(void)
 {
 	return register_netdevice_notifier(&ndisc_netdev_notifier);
 }
 
-void ndisc_late_cleanup(void)
+void __net_exit ndisc_late_cleanup(void)
 {
 	unregister_netdevice_notifier(&ndisc_netdev_notifier);
 }
 
-void ndisc_cleanup(void)
+void __net_exit ndisc_cleanup(void)
 {
 #ifdef CONFIG_SYSCTL
 	neigh_sysctl_unregister(&nd_tbl.parms);
diff --git a/net/ipv6/proc.c b/net/ipv6/proc.c
index 813013ca4e75..c59bade608cd 100644
--- a/net/ipv6/proc.c
+++ b/net/ipv6/proc.c
@@ -298,17 +298,17 @@ static void __net_exit ipv6_proc_exit_net(struct net *net)
 	remove_proc_entry("snmp6", net->proc_net);
 }
 
-static struct pernet_operations ipv6_proc_ops = {
+static struct pernet_operations ipv6_proc_ops __net_initdata = {
 	.init = ipv6_proc_init_net,
 	.exit = ipv6_proc_exit_net,
 };
 
-int __init ipv6_misc_proc_init(void)
+int __net_init ipv6_misc_proc_init(void)
 {
 	return register_pernet_subsys(&ipv6_proc_ops);
 }
 
-void ipv6_misc_proc_exit(void)
+void __net_exit ipv6_misc_proc_exit(void)
 {
 	unregister_pernet_subsys(&ipv6_proc_ops);
 }
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index 3cc58698cbbd..fe399675b8fc 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -1256,17 +1256,17 @@ static void __net_exit raw6_exit_net(struct net *net)
 	remove_proc_entry("raw6", net->proc_net);
 }
 
-static struct pernet_operations raw6_net_ops = {
+static struct pernet_operations raw6_net_ops __net_initdata = {
 	.init = raw6_init_net,
 	.exit = raw6_exit_net,
 };
 
-int __init raw6_proc_init(void)
+int __net_init raw6_proc_init(void)
 {
 	return register_pernet_subsys(&raw6_net_ops);
 }
 
-void raw6_proc_exit(void)
+void __net_exit raw6_proc_exit(void)
 {
 	unregister_pernet_subsys(&raw6_net_ops);
 }
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 36d75fb50a70..d0737f16076b 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -2335,12 +2335,12 @@ static void __net_exit tcpv6_net_exit(struct net *net)
 	inet_ctl_sock_destroy(net->ipv6.tcp_sk);
 }
 
-static struct pernet_operations tcpv6_net_ops = {
+static struct pernet_operations tcpv6_net_ops __net_initdata = {
 	.init	    = tcpv6_net_init,
 	.exit	    = tcpv6_net_exit,
 };
 
-int __init tcpv6_init(void)
+int __net_init tcpv6_init(void)
 {
 	int ret;
 
@@ -2378,7 +2378,7 @@ int __init tcpv6_init(void)
 	goto out;
 }
 
-void tcpv6_exit(void)
+void __net_exit tcpv6_exit(void)
 {
 	unregister_pernet_subsys(&tcpv6_net_ops);
 	inet6_unregister_protosw(&tcpv6_protosw);

base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
-- 
2.54.0.1136.gdb2ca164c4-goog

