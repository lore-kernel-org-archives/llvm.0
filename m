Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB801494A8
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604221; cv=none; b=HjnLjj86L/sfmVLJOurK+BcyZhjJidMIXRkPGguIULSHXEdzgJ+CAWvAo8LtLSPWaodjL3WqzmGbngAEsiqcXHKsVuSMVr5zfmaOBOuzrvyOLNYAv72iGgg++G1yzazfIREMUMeLPyXm7RLSyezdJPM9jMiXGZqBt/EKNBeQ7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604221; c=relaxed/simple;
	bh=cHY9Abcv4JeQfjc0VTlYZepQDXj06t3VGMBSC/q49yI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/Rf1cSJ+ZKzI/6uw8k4iWF58mLte/Ll7jS6xPNBT8pXY+1IjC4kAZ5xGfeb/8hRLXyqUajmaHlQ76FV08us6gz14ZiAYpWz/SMYrtwPeXiWkVxKzLhS0xu5ZNtg7DawbPETkBrmtvTkpW7FFpwjwqDFccG/Ov5IFwjFMfhOvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso2033896f8f.0
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 03:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604217; x=1782209017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3J3dF/rleitNHrIVaZmT+xGJuXa5FDx3AO/xzdX7Ng=;
        b=WBs0xp/uXh067E0VcrhH9qnvbDYJCjKXpnLAS+Tl8BBIzge2n1e6k8ndPijECYyCW1
         mGsvZrn54WWqtE98ZhM2nYXxBZvXbKom+ogd6p7I/wt8QDiC9QCUb66VXIIrHA98z/Sl
         oxykHHrXIqJEjdN5tAYyA8ShV1a2GU+61t8yQDrqbkTrweOGNIEaS6Ofe1oXPw+bNfoI
         wrFZiyPAgis54mCFDTH+SImU/1DBFcxXs6+Xsr3k1+PIRQJbjbJByyndmosnSgwur+Dz
         X15X/jJzXvZ7A0AZ2zg/Z6pV7TmgI5MFSZo315HgwLFhPdkyGjTdiMwoJbKHvmHC1Tse
         OIjw==
X-Forwarded-Encrypted: i=1; AFNElJ9nPbQDQFnCUqeoaLD6zCj/6xzCQbXCz/OSq3deV0pTvaEDZyGVokhdvYTSNuedMDUrIJjf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi1TNqrna/j1u1O6oSuS8VCeYvD7NvSCbPpGprsMp76sQbdFxV
	8wjnenTpvp+cx406xJKVavqffT2KB0DVTapdYttjg1FUzskYlhejm7WI
X-Gm-Gg: Acq92OF+ktXHtDtfY0VHOYlgspEUfHKcPZmuRJ6dxLqhuY3T+8jH9NeYAdjtuIDTI2Y
	3No/rUt1IKcqoHdSbqZdC+pdwSHCIOhMXQnq1Q0qxfS5k1stez1zMMoPgW22ESnCYNd26B1Mueo
	HjoWxoAq651qAVYTHIkdk8lla5+QZ+GZHfpAaLKeogJtnbYMJbuY/0o9yZbNZdFwNOwy1zifAoJ
	hA37DI1UYy+vkXlg7Nlf45uzKIdE82+gLoz5jfyUP+VzRa+iIFfS2TEKuGE5NPYe4Umxkd4CQ++
	ZF2Jd43fKTgFK8g2/V6T1WhlPtCQJRMtTJHpuqPYPCp3WXsJw1lvuU/1PrAgmBxzibSWTEPcHcr
	q9zXhjYLs3NQERh4UKgY9Dip/jOYmfbJ/BT8i/XmzJ/gEzuNHMVlHwaetJECWqslVjcvQtw2c14
	wa+YleOxBgHXkVtiPw+/UiW/UgEyNUOI4f79bDUvn/HhrVtEf9beqZToFlrzn8kBGzYvFjww==
X-Received: by 2002:a5d:5906:0:b0:460:3233:beed with SMTP id ffacd0b85a97d-4619f31b6ddmr3918817f8f.41.1781604216985;
        Tue, 16 Jun 2026 03:03:36 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-35-102.nat.epc.tmcz.cz. [89.24.35.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm46870652f8f.24.2026.06.16.03.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:03:36 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Ilya Maximets <i.maximets@ovn.org>,
	Johan Thomsen <write@ownrisk.dk>
Subject: [PATCH net] net: dst_metadata: fix false-positive memcpy overflow in tun_dst_unclone
Date: Tue, 16 Jun 2026 12:03:29 +0200
Message-ID: <20260616100332.1308294-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmalloc_flex() in metadata_dst_alloc() sets __counted_by for the
structure to the options_len, which is then initialized to zero.
Later, we're initializing the structure by copying the tunnel info
together with the options, and this triggers a warning for a potential
memcpy overflow, since the compiler estimates that the options can't
fit into the structure, even though the memory for them is actually
allocated.

 memcpy: detected buffer overflow: 104 byte write of buffer size 96
 WARNING: CPU: X PID: Y at lib/string_helpers.c:1036 __fortify_report
  skb_tunnel_info_unclone+0x179/0x190
  geneve_xmit+0x7fe/0xe00

The issue is triggered when built with clang and source fortification.

Fix that by doing the copy in two stages: first - the main data with
the options_len, then the options.  This way the correct length should
be known at the time of the copy.

It would be better if the options_len never changed after allocation,
but the allocation code is a little separate from the initialization
and it would be awkward and potentially dangerous to return a struct
with options_len set to a non-zero value from the metadata_dst_alloc().

Another option would be to use ip_tunnel_info_opts_set(), but it is
doing too many unnecessary operations for the use case here.

Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
Reported-by: Johan Thomsen <write@ownrisk.dk>
Closes: https://lore.kernel.org/netdev/CAKv6aAM8_EWgXScnKmKYm_4SwGDVBK++dzfP+Y6msUXbp99QUw@mail.gmail.com/
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---

Johan, if you can test this one in your setup as well, that would
be great.  Thanks.

 include/net/dst_metadata.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/net/dst_metadata.h b/include/net/dst_metadata.h
index 1fc2fb03ce3f..f45d1e3163f0 100644
--- a/include/net/dst_metadata.h
+++ b/include/net/dst_metadata.h
@@ -164,8 +164,11 @@ static inline struct metadata_dst *tun_dst_unclone(struct sk_buff *skb)
 	if (!new_md)
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(&new_md->u.tun_info, &md_dst->u.tun_info,
-	       sizeof(struct ip_tunnel_info) + md_size);
+	/* Copy in two stages to keep the __counted_by happy. */
+	new_md->u.tun_info = md_dst->u.tun_info;
+	memcpy(ip_tunnel_info_opts(&new_md->u.tun_info),
+	       ip_tunnel_info_opts(&md_dst->u.tun_info), md_size);
+
 #ifdef CONFIG_DST_CACHE
 	/* Unclone the dst cache if there is one */
 	if (new_md->u.tun_info.dst_cache.cache) {
-- 
2.54.0

