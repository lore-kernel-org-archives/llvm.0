Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E812625
	for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590650; cv=none; b=Rp+ymweftEVRVsg+VAtZS3pr54dCfg4Bk4incu+usthi4yM1mWzwuWWmTLlGTQYaH5W/++9guMvUMKUJyrr6GOXEmBISbEdMoSIsMvFOSxNEHlk/HFXOuD9DX9BYYX8KCXBvwqRhHL/d4Eg+wgolQqSxEhg3BwXS+VZGBf1kREQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590650; c=relaxed/simple;
	bh=PH8LxbIrb2Kq9AS8sl24KAaDNIbUwoOmj7D4FMfbdgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MrhNmeyb5z4oipw6pCN+77kH7L3uFvzS0eibv9dPYIWxJqgiFUD4Zl6IlJzykdJDGBEZIpE1JsyquZpcGeVT1oIEiYKmweNAyu/WqlLq9tpBbKOTDVgIgzvHjJDn0IT7UnDjsoUfIUO5YThSHrWaU1tXrvRZGklB3mC8gnwgpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21636268e43so5513515ad.2
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 16:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737590648; x=1738195448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY8ZVk2Uf7HppO8+gzzWHK3AIfhiQMvTEXF+Lh4vqR4=;
        b=cjY8Jr8eqQizTUPuRRnBRup39jUmr9Ap8WbsmBqJe7LXCCmRJprTNDd0+18L/FUm4X
         T+cor7PTAP5RaDgDK5mv5cmVWTB0pg6NYK58hDU/aFHYZu/7XcE/cU1SO1WLgaMbSrqw
         F52NGcMJbBCOJG0uZxmRs5wZoiAcV0BZnWMzkAw+2gtjmZXBGs5Dku/4FS8K/pLMuYQL
         lXPFtgXwqOaw5XGqtaM2br888QTbw3hejnO5mH4v9U+puNePmWLESe60UM+8KalSCoMI
         EPrMQuoPtKH/lyH4xoIBPvYl6iR1NeoNAvGXWDiPsVwRkHCF68KNYCVKJZnX8HKv44ee
         J8HA==
X-Forwarded-Encrypted: i=1; AJvYcCWsiUlIZprqRn/mhyic8uIEyDjj3KmzY3UnmaYrOeXTsGhXt4BoTs9jtWHpBDzpQI0Ls7N5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7oMSRRiGTojTZQWjPSQbfuuZsxKb9xWvvVpOHs/8Nn6j1Uhqz
	u+T5OfSa12djIDEsR9ug59LAlpanlfrj3iLgk+llmMkg5dGSfTY=
X-Gm-Gg: ASbGncu0Mop1K9NXrtBAAjHbVrH4C9owl9T885vsv0ZvjuixQ8xdD17b+fnwXZo9XL0
	nMZGyKfgoe9NQn/dKOQwZI6KStiRLoqHjgLy1qZiA/PyOGeUxtOE9WtdV4FHqtKgqV18LyH0C+e
	fVweiMGLHj+lSrOkwVQ0OFIzUU2e8OgQEfc7BlJ+gkMMoU9STKIzBssqEp97Min0iwV2ALGHq39
	yzthGmgnIJVumqJm6f8RznLsyYKT4hHpQ0aXw/84kAP1YBCPwQFXynNQtie6fy/tmxWvA==
X-Google-Smtp-Source: AGHT+IE7dxxpYn3JHZUsJEN8kIdACZ5n8A0bzXRZzD93uctIb4hINpZXVpaiSir5eGOs1NpJU+HmYg==
X-Received: by 2002:a05:6a20:9144:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1eb215ec11cmr43812181637.30.1737590648353;
        Wed, 22 Jan 2025 16:04:08 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f510a2e24sm5293718b3a.47.2025.01.22.16.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 16:04:07 -0800 (PST)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	leon@kernel.org,
	andrew+netdev@lunn.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	witu@nvidia.com,
	parav@nvidia.com
Subject: [PATCH net] net/mlx5e: add missing cpu_to_node to kvzalloc_node in mlx5e_open_xdpredirect_sq
Date: Wed, 22 Jan 2025 16:04:07 -0800
Message-ID: <20250123000407.3464715-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvzalloc_node is not doing a runtime check on the node argument
(__alloc_pages_node_noprof does have a VM_BUG_ON, but it expands to
nothing on !CONFIG_DEBUG_VM builds), so doing any ethtool/netlink
operation that calls mlx5e_open on a CPU that's larger that MAX_NUMNODES
triggers OOB access and panic (see the trace below).

Add missing cpu_to_node call to convert cpu id to node id.

[  165.427394] mlx5_core 0000:5c:00.0 beth1: Link up
[  166.479327] BUG: unable to handle page fault for address: 0000000800000010
[  166.494592] #PF: supervisor read access in kernel mode
[  166.505995] #PF: error_code(0x0000) - not-present page
...
[  166.816958] Call Trace:
[  166.822380]  <TASK>
[  166.827034]  ? __die_body+0x64/0xb0
[  166.834774]  ? page_fault_oops+0x2cd/0x3f0
[  166.843862]  ? exc_page_fault+0x63/0x130
[  166.852564]  ? asm_exc_page_fault+0x22/0x30
[  166.861843]  ? __kvmalloc_node_noprof+0x43/0xd0
[  166.871897]  ? get_partial_node+0x1c/0x320
[  166.880983]  ? deactivate_slab+0x269/0x2b0
[  166.890069]  ___slab_alloc+0x521/0xa90
[  166.898389]  ? __kvmalloc_node_noprof+0x43/0xd0
[  166.908442]  __kmalloc_node_noprof+0x216/0x3f0
[  166.918302]  ? __kvmalloc_node_noprof+0x43/0xd0
[  166.928354]  __kvmalloc_node_noprof+0x43/0xd0
[  166.938021]  mlx5e_open_channels+0x5e2/0xc00
[  166.947496]  mlx5e_open_locked+0x3e/0xf0
[  166.956201]  mlx5e_open+0x23/0x50
[  166.963551]  __dev_open+0x114/0x1c0
[  166.971292]  __dev_change_flags+0xa2/0x1b0
[  166.980378]  dev_change_flags+0x21/0x60
[  166.988887]  do_setlink+0x38d/0xf20
[  166.996628]  ? ep_poll_callback+0x1b9/0x240
[  167.005910]  ? __nla_validate_parse.llvm.10713395753544950386+0x80/0xd70
[  167.020782]  ? __wake_up_sync_key+0x52/0x80
[  167.030066]  ? __mutex_lock+0xff/0x550
[  167.038382]  ? security_capable+0x50/0x90
[  167.047279]  rtnl_setlink+0x1c9/0x210
[  167.055403]  ? ep_poll_callback+0x1b9/0x240
[  167.064684]  ? security_capable+0x50/0x90
[  167.073579]  rtnetlink_rcv_msg+0x2f9/0x310
[  167.082667]  ? rtnetlink_bind+0x30/0x30
[  167.091173]  netlink_rcv_skb+0xb1/0xe0
[  167.099492]  netlink_unicast+0x20f/0x2e0
[  167.108191]  netlink_sendmsg+0x389/0x420
[  167.116896]  __sys_sendto+0x158/0x1c0
[  167.125024]  __x64_sys_sendto+0x22/0x30
[  167.133534]  do_syscall_64+0x63/0x130
[  167.141657]  ? __irq_exit_rcu.llvm.17843942359718260576+0x52/0xd0
[  167.155181]  entry_SYSCALL_64_after_hwframe+0x4b/0x53

Fixes: bb135e40129d ("net/mlx5e: move XDP_REDIRECT sq to dynamic allocation")
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index bd41b75d246e..a814b63ed97e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -2087,7 +2087,7 @@ static struct mlx5e_xdpsq *mlx5e_open_xdpredirect_sq(struct mlx5e_channel *c,
 	struct mlx5e_xdpsq *xdpsq;
 	int err;
 
-	xdpsq = kvzalloc_node(sizeof(*xdpsq), GFP_KERNEL, c->cpu);
+	xdpsq = kvzalloc_node(sizeof(*xdpsq), GFP_KERNEL, cpu_to_node(c->cpu));
 	if (!xdpsq)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.48.0

