Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651484;
	b=VvglikOsbJSL0Ku2N9hKz0uPk0SQ3lF0gdSPh8/rW9I0DdVnJCsKbXapxkJYB8C2LXnO
	 rLpjaRYJ8ySFKuY4sjH9L5AjOlxXivFs+gTzlsj2tXtEoQMUdoV4pxUKVzn+lsHfiIMf5
	 gSGaAVmVUY3jC65RfZTx/ptk1hGYyAF5VqByGTNivjZvSk1IxIKDRjy0ZXhWFhDK6xu7o
	 EIOGimsfxquxXRsQayp+Ex6CSwS/rUpC1xsLSWGZmutrBVG7eVmTw4Ttf+XFYmlUiv2H/
	 8vSB0Juius43Vj6QaA/WD5JXhYB7WaBEAp6XOxkqB/xHo7i4+k/hE5urVoGvjajUX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=temVQvDVu+s05Df0IBCe5kNFmrbC8OpyvSIXnzE63yo=;
	b=x5qlvm0DP3HqFIRusFqUbsr70Nice907c0RWkcaOZDLNXt9+zSX88zvKdBvLCPVpDecx
	 twn3sR0LZJhacjkMvvvKUBshOS/mfoVB/4JsN0FBVTm8E8uHplnb2+5f36QBrCoil9N2a
	 XJCmm9AqGtUWrB0ANwM6cWez/nPgvldZyh7M46vwI54l2qD4fKEQHnFa1hATSZBSYpvM0
	 MO0o7ucHLK6c55CC5PsoQYpsdXT27Qkdng3k0LqYjSiXUvQz23cjAzhnYK3DikNyjs5sn
	 XmRAzBF4mn1y3B7BRkEO32h4/aL5bzjfWMeIaH7vra7eKc7a6IeK40e9K/55gZwFGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQ+KhmK6;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96017606A31E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96017606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQ+KhmK6
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd69954c755so4690078a12.3
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795651483; x=1796256283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=temVQvDVu+s05Df0IBCe5kNFmrbC8OpyvSIXnzE63yo=;
        b=WQ+KhmK6wTAP9deFARybwLjEeCaXxGasEbrAE3lqPrg5ks2WGuXA4sw6GQRNsQuYo/
         B3VbvHWvi9a7IcLpg9Qpb674pHQ4rkzTOmxjTGpeeTs1k3AUG/BCSFcZmRQqqXKt8BbK
         Jm64Eycjbs5S6Citq+5IW4JG6qCsFo5c6xqsuOfG+b6/fECkBTlQujB95JqjVSbQ0iuh
         S9cH1ZMr3DFYPwfx4Nc4qIw9fCQ+NR9X/HH+Bv3gRf96JcAL41DjE4icXMLu0NRYuXXb
         rTaUKk3ledoWDXzZROdUv56Oiof9DInCV+8tykQ8X0NFAYiC6z/jUoxyUwX39jtQVsC+
         NqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651483; x=1796256283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=temVQvDVu+s05Df0IBCe5kNFmrbC8OpyvSIXnzE63yo=;
        b=WaCWptQ8qQuZOqWGIgwqvmSJGhC/0dSHCs9w+66EHAQy3l412MR7EGV1mFzQavcJr/
         Xf6JBhvjeHMJbF/hxbM0hxlS3jpuKZrZFF3yAAN0Iin+fuMyJeoBjJKs/rGyOHuNV7Wu
         hXgX3tT/Hi/d+jrzh0KH2cDKVked3gdFao5PoBWDz+JoInMJfRmwBSrVI1SmyLJZ2NXl
         lwn0MDD0oPsMl1EWxVuQNKjQcFDjUa+gQamMksyGafGdjlENq1fln9kWxIEszigy4E0u
         VPtwuxRsCcMTHc32LHKkLc8SJRvmFRjp7IPJSJJBLt6EiRqrGVmtOAa/WVl8bA3l2aEd
         6RNg==
X-Forwarded-Encrypted: i=1; AL+hErG2limPZpiK2vQxNiGxBlMbG3Bbo8grr42hC7hrtAYWge5tND0F+XVkx6SxNunNGOAI7Peb@lists.linux.dev
X-Gm-Message-State: APuU4Z9p0xIsM5eHzAWWScESJdfMmRRILVPOQLFxpKenEyiJT8ammN82
	dNDq/HcJYJH+WNt+YT8hvIaTzodAEtErzBZRcxM2ZcO5/EMlHU5WJjcd
X-Gm-Gg: AZFdTZdDhXCGY5Kxcg+gBPedLi7O+ppzS4TTVahra5KpGJRv+agZHAGnpdyzm+P1Soi
	ar6ALJEKzWuoZIlp7sZdWjpUIhoSHoinIESQK5v4jji08zR3UeYIv0ANdjsKgbJplF9BejXFz8A
	XAQyK4NTg/STnV5eP1P2dLPdHwbGi5TTCiq+dKRg4jjCiMZJbz1VBsIEs2Qlw7XQcq0/YdChjcD
	Dp4mLppR8G0dITaQTxHiptNk0COZ+hzS2EUIZZJYx9hpgBlRIm5GUz0sI5LSDNlQQLcpREe4TqK
	M0laeG5loeFzXZCq/Hk84MBLSc6N/3V4VNC4tGQhCfAa/knnaHZGiFvUmdye6bFRz9/9k3+HU/8
	yAxJJg1dIILLzNWha9UYNiLO9IHMpUwGzbG+5Gfkob+67q+GYSjlQn+y6d7nU0af1JWu1/Lc4rS
	SqVUYUJJc9WC/FKlD/cI8JABQdqlGYAizFUj80Ml+I5KD9iL+XWEiqN2Sf48qMJ+bCtOiXnSQdP
	YNkPKlqDhvtNIOe24ZF9r5ykG8fSrlRB7iq4uA2scV4loAhKXyC2OZqsdohJMg6lORP3+/PkW+M
	soj1pbxrumVjAb4u0zLtq1U94xuK5tz9lhn8VZ/Maa8dDnMAOKARcNSHprxvJJDZTsO7RUfMl9e
	XSUtr8r4nxp2TbSm0kuHsyPFS5TUp4/tvh3p+/UM3sndPivO5YUxdPRY037cvLq2yFU+Es2MU3t
	xQVg==
X-Received: by 2002:a17:90a:d444:b0:3b4:15e3:3a53 with SMTP id 98e67ed59e1d1-3b41cb53acbmr18503178a91.66.1795651482731;
        Wed, 25 Nov 2026 16:04:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm29613845a91.15.2026.11.25.16.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:04:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kiran K <kiran.k@intel.com>,
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] Bluetooth: btintel_pcie: fix context analysis error in YoYo config sets
Date: Wed, 25 Nov 2026 16:04:39 -0800
Message-ID: <20261126000439.318058-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

btintel_pcie_apply_yoyo_config_sets() takes mac_access_lock only for
PERIPH_MAC and DEVICE_MEM config sets, writes the pairs, and later drops
the lock under a second, identical type check. Clang's context analysis
cannot correlate the two conditions, so with CONTEXT_ANALYSIS enabled for
drivers/bluetooth the build fails:

  drivers/bluetooth/btintel_pcie.c:1052:12: error: mutex 'data->mac_access_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  drivers/bluetooth/btintel_pcie.c:1110:4: error: releasing mutex 'data->mac_access_lock' that was not held [-Werror,-Wthread-safety-analysis]

Move the pair-writing loop into a helper and take and release the lock
within a single switch case for the indirect config set types. No
functional change.

Fixes: 5bf3a9b6b720 ("Bluetooth: btintel_pcie: Serialize MAC access requests")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/bluetooth/btintel_pcie.c | 159 +++++++++++++++----------------
 1 file changed, 79 insertions(+), 80 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index d7d0e890dfbb..7cbf6d2df491 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -997,6 +997,70 @@ static void btintel_pcie_yoyo_send_hcmds(struct btintel_pcie_data *data,
 	mutex_unlock(&data->yoyo.lock);
 }
 
+static void
+btintel_pcie_yoyo_write_pairs(struct btintel_pcie_data *data,
+			      struct btintel_pcie_yoyo_config_set *config_set,
+			      resource_size_t bar0_len)
+{
+	u32 pair_addr, addr, value;
+	u32 i;
+
+	for (i = 0; i < config_set->num_pairs; i++) {
+		pair_addr = get_unaligned_le32(&config_set->pairs[i].address);
+
+		/* Calculate the effective address by adding the address offset */
+		if (check_add_overflow(pair_addr, config_set->addr_offset, &addr)) {
+			BT_WARN("YoYo: config set address overflow (0x%08x + 0x%08x)",
+				pair_addr, config_set->addr_offset);
+			continue;
+		}
+
+		value = get_unaligned_le32(&config_set->pairs[i].value);
+
+		switch (config_set->config_set_type) {
+		/* Direct Address Access (CSR) */
+		case BTINTEL_PCIE_CFGSET_CSR:
+			/* Validate the effective address for CSR access (Direct Address)
+			 * addr not aligned to 4 bytes or exceeds the BAR0 length
+			 */
+			if ((addr & (sizeof(u32) - 1)) ||
+			    bar0_len < sizeof(u32) ||
+			    addr > bar0_len - sizeof(u32)) {
+				BT_WARN("YoYo: bad CSR address 0x%08x for BAR0 length %llu",
+					addr, (unsigned long long)bar0_len);
+				continue;
+			}
+
+			BT_DBG("YoYo: CSR write [0x%08x] = 0x%08x", addr, value);
+			/* addr may be PRPH_DEV_* or HBUS_TARG_WRPTR */
+			spin_lock(&data->dev_mem_lock);
+			btintel_pcie_wr_reg32(data, addr, value);
+			spin_unlock(&data->dev_mem_lock);
+			break;
+		/* Indirect Address Access (Peripheral MAC and Device Memory) */
+		case BTINTEL_PCIE_CFGSET_PERIPH_MAC:
+		case BTINTEL_PCIE_CFGSET_DEVICE_MEM:
+			/* The config-set TLV comes from an untrusted external file;
+			 * reject null or unaligned targets.
+			 */
+			if (!addr || (addr & (sizeof(u32) - 1))) {
+				BT_WARN("YoYo: bad indirect address 0x%08x for type %u",
+					addr, config_set->config_set_type);
+				continue;
+			}
+
+			btintel_pcie_wr_dev_mem(data, addr, value);
+			BT_DBG("YoYo: indirect write type %u addr 0x%08x value 0x%08x",
+			       config_set->config_set_type, addr, value);
+			break;
+		default:
+			BT_WARN("YoYo: unknown config_set type %u",
+				config_set->config_set_type);
+			break;
+		}
+	}
+}
+
 static void
 btintel_pcie_apply_yoyo_config_sets(struct btintel_pcie_data *data,
 				    u32 time_point)
@@ -1004,7 +1068,6 @@ btintel_pcie_apply_yoyo_config_sets(struct btintel_pcie_data *data,
 	struct btintel_pcie_yoyo_config_set *config_set;
 	resource_size_t bar0_len;
 	int ret;
-	u32 i;
 
 	if (!data)
 		return;
@@ -1016,98 +1079,34 @@ btintel_pcie_apply_yoyo_config_sets(struct btintel_pcie_data *data,
 		return;
 
 	list_for_each_entry(config_set, &data->yoyo.config_set_list, list) {
-		u32 pair_addr, addr, value;
-
 		if (config_set->time_point != time_point)
 			continue;
 
 		switch (config_set->config_set_type) {
 		case BTINTEL_PCIE_CFGSET_CSR:
+			btintel_pcie_yoyo_write_pairs(data, config_set, bar0_len);
+			break;
 		case BTINTEL_PCIE_CFGSET_PERIPH_MAC:
 		case BTINTEL_PCIE_CFGSET_DEVICE_MEM:
-			break;
-		default:
-			BT_WARN("YoYo: unknown/unsupported config_set type %u, skipping",
-				config_set->config_set_type);
-			continue;
-		}
-
-		if (config_set->config_set_type == BTINTEL_PCIE_CFGSET_PERIPH_MAC ||
-		    config_set->config_set_type == BTINTEL_PCIE_CFGSET_DEVICE_MEM) {
 			mutex_lock(&data->mac_access_lock);
 			ret = btintel_pcie_get_mac_access(data);
-			if (ret) {
+			if (ret)
 				BT_WARN("YoYo: MAC access failed for config set (%d), skipping",
 					ret);
-				/* get_mac_access() asserts MAC_ACCESS_REQ before it
-				 * polls, and leaves it set on timeout; drop it so the
-				 * request bit is not leaked.
-				 */
-				btintel_pcie_release_mac_access(data);
-				mutex_unlock(&data->mac_access_lock);
-				continue;
-			}
-		}
-
-		for (i = 0; i < config_set->num_pairs; i++) {
-			pair_addr = get_unaligned_le32(&config_set->pairs[i].address);
-
-			/* Calculate the effective address by adding the address offset */
-			if (check_add_overflow(pair_addr, config_set->addr_offset, &addr)) {
-				BT_WARN("YoYo: config set address overflow (0x%08x + 0x%08x)",
-					pair_addr, config_set->addr_offset);
-				continue;
-			}
-
-			value = get_unaligned_le32(&config_set->pairs[i].value);
-
-			switch (config_set->config_set_type) {
-			/* Direct Address Access (CSR) */
-			case BTINTEL_PCIE_CFGSET_CSR:
-				/* Validate the effective address for CSR access (Direct Address)
-				 * addr not aligned to 4 bytes or exceeds the BAR0 length
-				 */
-				if ((addr & (sizeof(u32) - 1)) ||
-				    bar0_len < sizeof(u32) ||
-				    addr > bar0_len - sizeof(u32)) {
-					BT_WARN("YoYo: bad CSR address 0x%08x for BAR0 length %llu",
-						addr, (unsigned long long)bar0_len);
-					continue;
-				}
-
-				BT_DBG("YoYo: CSR write [0x%08x] = 0x%08x", addr, value);
-				/* addr may be PRPH_DEV_* or HBUS_TARG_WRPTR */
-				spin_lock(&data->dev_mem_lock);
-				btintel_pcie_wr_reg32(data, addr, value);
-				spin_unlock(&data->dev_mem_lock);
-				break;
-			/* Indirect Address Access (Peripheral MAC and Device Memory) */
-			case BTINTEL_PCIE_CFGSET_PERIPH_MAC:
-			case BTINTEL_PCIE_CFGSET_DEVICE_MEM:
-				/* The config-set TLV comes from an untrusted external file;
-				 * reject null or unaligned targets.
-				 */
-				if (!addr || (addr & (sizeof(u32) - 1))) {
-					BT_WARN("YoYo: bad indirect address 0x%08x for type %u",
-						addr, config_set->config_set_type);
-					continue;
-				}
-
-				btintel_pcie_wr_dev_mem(data, addr, value);
-				BT_DBG("YoYo: indirect write type %u addr 0x%08x value 0x%08x",
-				       config_set->config_set_type, addr, value);
-				break;
-			default:
-				BT_WARN("YoYo: unknown config_set type %u",
-					config_set->config_set_type);
-				break;
-			}
-		}
-
-		if (config_set->config_set_type == BTINTEL_PCIE_CFGSET_PERIPH_MAC ||
-		    config_set->config_set_type == BTINTEL_PCIE_CFGSET_DEVICE_MEM) {
+			else
+				btintel_pcie_yoyo_write_pairs(data, config_set,
+							      bar0_len);
+			/* get_mac_access() asserts MAC_ACCESS_REQ before it
+			 * polls, and leaves it set on timeout; drop it in both
+			 * cases so the request bit is not leaked.
+			 */
 			btintel_pcie_release_mac_access(data);
 			mutex_unlock(&data->mac_access_lock);
+			break;
+		default:
+			BT_WARN("YoYo: unknown/unsupported config_set type %u, skipping",
+				config_set->config_set_type);
+			break;
 		}
 	}
 }
-- 
2.56.1

