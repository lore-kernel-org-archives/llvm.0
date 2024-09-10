Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5D1850A4
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957413; cv=none; b=NQyR3UIQ6PTvb5/YHdc72lXRemRR1FNpKJiazrB9/KWH+nfwryoizste3mXCALMYt3IqEdqBy3IPNXvv3mPPK4son3ey5HYUVy7z+o7h6QVMxUo+LYXYjod+475RmNDR/JjVju6MfZXF1QPu6ZdUfg98zkkFf+FfxUKcfFPGWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957413; c=relaxed/simple;
	bh=BQGYlJ0DC8YIrx6+Mr6rYMoYhXFpvP8CHsOYUrBmHzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snusoxDv/XJh0TpTGzVCFelAKyPVtwDM6l9Q2movLiUjVWMhQI9tAg1b2epAg51eG3dO4r8aZvjFCn/dJ4USZvTV/wgr5oR4KgOs0EUq60M1e1jtLS0VK97sIiG3trBR+ooonPDjWtRgFX5gKY3W0/ao5FPdBxYByyvV3P2X2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzSocXtO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzSocXtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725957412; x=1757493412;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BQGYlJ0DC8YIrx6+Mr6rYMoYhXFpvP8CHsOYUrBmHzs=;
  b=WzSocXtOCtrivzjnKoYxIK1wuFVcsLae+isrEzSP4n8TuTKqxXecl6WX
   0flZJ4PKiCL9tvv0XnuphR8KrC6AfKNXNWZoSaTGLckgFnsgdBg6Hfr/1
   idVt+bpMSwBzGSG97hI6hjI9CoLd10dPNKpOC1dqQImCRkMd6QdALGpOE
   GwhTs9qRm8aVryd8LoRZ/GxbR9NkQ9NawudvxZUCt8urzcEldLvApOOdX
   D08ox3v0Y6iKi64FNsyKtdR5qyc7g6gsHNKxhR3Uf+sJe70c9OaZbZWU4
   Av+qWAci66ZMTLdGupSo/Lac87P7z32ipsipyigMs+7C5z+/586Fsj9of
   Q==;
X-CSE-ConnectionGUID: qNrKddlXQgi0wjvGAnN9kQ==
X-CSE-MsgGUID: /DQDvj7kT92sjqYQ2KtXbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36070489"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="36070489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:36:48 -0700
X-CSE-ConnectionGUID: U1aMLAZkQXabRNzWsVv1fA==
X-CSE-MsgGUID: SkRnGgpBTkykZc253NDaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71357816"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2024 01:36:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EC0E520B; Tue, 10 Sep 2024 11:36:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Felix Huettner <felix.huettner@mail.schwarz>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH net-next v3 1/1] netfilter: conntrack: Guard possible unused functions
Date: Tue, 10 Sep 2024 11:35:33 +0300
Message-ID: <20240910083640.1485541-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the functions may be unused (CONFIG_NETFILTER_NETLINK_GLUE_CT=n
and CONFIG_NF_CONNTRACK_EVENTS=n), it prevents kernel builds with clang,
`make W=1` and CONFIG_WERROR=y:

net/netfilter/nf_conntrack_netlink.c:657:22: error: unused function 'ctnetlink_acct_size' [-Werror,-Wunused-function]
  657 | static inline size_t ctnetlink_acct_size(const struct nf_conn *ct)
      |                      ^~~~~~~~~~~~~~~~~~~
net/netfilter/nf_conntrack_netlink.c:667:19: error: unused function 'ctnetlink_secctx_size' [-Werror,-Wunused-function]
  667 | static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
      |                   ^~~~~~~~~~~~~~~~~~~~~
net/netfilter/nf_conntrack_netlink.c:683:22: error: unused function 'ctnetlink_timestamp_size' [-Werror,-Wunused-function]
  683 | static inline size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~

Fix this by guarding possible unused functions with ifdeffery.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: explicitly mentioned the configuration options that lead to issue (Simon)
v2: fixed typo, dropped Fixes (Simon), optimised by reusing existing ifdeffery

 net/netfilter/nf_conntrack_netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 4cbf71d0786b..39430f333f05 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -652,7 +652,6 @@ static size_t ctnetlink_proto_size(const struct nf_conn *ct)
 
 	return len + len4;
 }
-#endif
 
 static inline size_t ctnetlink_acct_size(const struct nf_conn *ct)
 {
@@ -690,6 +689,7 @@ static inline size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
 	return 0;
 #endif
 }
+#endif
 
 #ifdef CONFIG_NF_CONNTRACK_EVENTS
 static size_t ctnetlink_nlmsg_size(const struct nf_conn *ct)
-- 
2.43.0.rc1.1336.g36b5255a03ac

