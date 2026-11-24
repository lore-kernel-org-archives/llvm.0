Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557044;
	b=c1ozdVXYYsbSZnGiC5DjsDBdTw+TixeIkLpT+qg631rtDkT1CFWMdWpd5bRfAYMXsC0i
	 qicbS98jZ6SLf6ZbfSYj+BtlDnnQlpg1OShjg/2zDoMSDk4NxkaPYK8Qsm3Nc+peGighd
	 HYPbdiCNICz5g3kM1DiVAgdk/RQ8y02KZrzJCS7QFugMq7S/9EISOsuwS/2rwaNRWaeW8
	 M7BlcRk2B0jLRlBETKMnkYGJTH76Gb0JYZcdaWKTLOkpgucvk41N6w8zmfERlWw6rNHGn
	 pbJNsEfhPTxWYl3ZmDF/2WTnbhqlHV2Ik20sRjhWoF3VZwpUGmbIPq+72olBV98q5qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
	b=Sur05K6tqJHJYWzpECo4kewySqyEYgHpsGsbXH/AkwJi2N7ziUFjYAf/ROQKg5ehh6En
	 VKjJnMhZtiF6F2nRzX7qLXBWZRRkS8XUMZTe5XmZb58t+SFih5/7gSBKW1T+nYE2fnWT5
	 8LR1pCsawy07LjoCDcy2jPnvXiDkO3H7ehRBgE7LXtmufHZkSLrmWTb01zukr11fykqA6
	 PTbVzv8BJj6+QfX1Sj89LVe6XoKkCm7wHaWamI6UwEhh99/t1rW1d85HzMxEXxugvnGAZ
	 msiT92pl0CcZRFOqtHfXKcvZG+a08mi5QSb7OrGADdjjZ0M2YdpbtPINNaupLSLX9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StUpVOkN;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE52606A32A
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE52606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StUpVOkN
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f041f88577so27822605ad.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557043; x=1796161843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=StUpVOkNxDHKJAwuzaSdLx2TZcHDw2AWxJncXu9+l/EFnvU2VacLwBkisJBTOP9lAr
         Hk2UGzryvCK24OtsTLJ6BpAXIomqkwI1C1e2m/5AEuoZUgsCabfPjVrN3HyudEQBxzGQ
         Hv8hIdrHC8/NeZs4ymVFeBekj8Wki2ocFGT9Zbq68iwGkNxu/pH75h6UPgaCeyN3DOsx
         n9JSQbg0sL429yZaVZONJMylxTfLxhnZrr7LSsI970rIHpVbr9HUKw/yp36bx9upbKWt
         ZmWJMU1s++nFI2qtrMjcaPskF3OrLYJyza38mlgqRKvUqzMjhs2pLPz5TS/N4XE6ZzwI
         m8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557043; x=1796161843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=GVzLHvt0bhRJZeJ9OrjvSX5JQE7gZ1JXTC2FMVUnFAxLkIYuKOqYP+29k6p5fxA5zj
         13XZR0h55EvL5X1wobNBPMqAgMWmYgMps4zfU6bEIaw2OrykT394EnTgD9tAqNctnJad
         uqtxYMwD3R5apC73v2PUhWU99nLGF9dN1qPlxpz7UBVZwQZIJ0MzP3LbRMowBk3rYo4q
         XIXTIBfaSpstlc3WzuVMIH9o6Exkb2Y3gBdVUIX+0Pd95S2ZllVuECmhMlXQli9B1nmB
         VYYATsiPp1bhZ4FBSu357uJeOtEmvrJmneNhFbOAp7w7CmA0OSOzvZzaWRmsIt8X42H6
         XxMA==
X-Forwarded-Encrypted: i=1; AL+hErHZ570et84S1kWRradavIoJ77Gsz3ojoPQi7+iFoo1U1DKDjNoAC4UyFUUytDIsjGraRHGA@lists.linux.dev
X-Gm-Message-State: APuU4Z+F4ny3MLCf3JwYo1CG+jXIz3puNFumIQmIi6rTEfcIcNbOYpoE
	Rs7rBq9hBfBXFp23Kc1jTBYA5vO7GI1XTjtxsn30exR7P8WeZim5e3ln
X-Gm-Gg: AZFdTZdkt6fshdbMsOOvpWpXIZgFgjTHrbYIkdLqIDQ2b4LltjM659w4WoPGKom6cIx
	6Pul30iErug/o1KSy5SOeFqkvxFNnlRnxvfn3jaKLS8sojqfcxV3hSpnzCjfL78guzkhnKXWmd5
	RBuVcSDUb8mFn6cUxQStl+agwXu+jDk/k/NIh/hPowLjWD5qDa3uZzCOrVQwguXqxthJ3EUz0an
	SKovW2dRdjA6OKCPoyxrhvNPaOb20VfFyZIP6y481+N5iIYlUYHAsnFgsli8BogapJygrDQzZed
	77k6deXtH7ca2/qNaTXI28sThtHFXGJU4UVANI//AcmKvZZXBohnqyDMlWcb0hVXUKdBZIDPNmW
	Nm9zBk+9juadWJzhvFyDuFx5hYTSIQVnSNOBlj9q1/bpyqpgwAQNLc4OjuCDNtvlxhGhm1HG9n4
	r3nOIx/lNngjggWWIxSNmlBlgxRwc/ZNY3Ad+Hi9f8XoapBX7PSECcA8a1+Edqv8C9QJ54HCZev
	GqK2aC9LpEQRSJwdz1fno2O3QyOJKoeTM1HxM7EhcCcBlhs8hQn4tE2yg+wkY0eI9uNEgp4+9iX
	+M1EWpw/rwW/jLMwFL6/CuSr0U1erUYutf+bQUwL1mHx/gtJKAc27ZoNVryJF5pMUcRjlLnyBWy
	u8JYvDBBBemCh/FzcDoc94YS/6Tvo7BtHbZdPA4d55YsrjbtMTzIlz8tnLrHgmjuvEez/uLvRJS
	w/9w==
X-Received: by 2002:a17:902:c942:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2f03f1bfa64mr148507965ad.36.1795557043298;
        Tue, 24 Nov 2026 13:50:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:33 -0800
Message-ID: <20261124215040.1261999-1-rosenp@gmail.com>
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

brcms_c_attach_malloc() allocates struct brcms_c_info and then a number
of fixed-size structures that live exactly as long as it does, each with
its own kzalloc(GFP_ATOMIC), error code and kfree(). This series embeds
seven of them in their parent structures. That removes the allocations
and their OOM error paths and, for the per-band state, the open-coded
pointer arithmetic that carved two arrays out of one allocation.

Patch 1 embeds the per-band state arrays of brcms_c_info and
brcms_hardware. Patches 2-7 embed the module callback array, the MAC
statistics snapshot, the default BSS info, the protection settings, the
core state and the BSS configuration. Patch 6 also drops the
brcms_c_info::core pointer, which always pointed at the embedded core
state. Patch 7 moves the definition of struct brcms_bss_cfg, unchanged,
above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Changes in v2:
- Patch 6: remove the redundant core pointer and use corestate
  directly (Arend).
- Collect Arend's Acked-by on patches 1-7.
- Link to v1: https://lore.kernel.org/linux-wireless/20261111042554.232998-1-rosenp@gmail.com/

Each patch builds with W=1 (arm64, clang) and passes checkpatch.
Compile-tested only.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, resolve rebase conflicts, write patches 5-7, and draft the
commit messages and this cover letter.

Rosen Penev (7):
  wifi: brcmsmac: embed bandstate arrays instead of separate allocation
  wifi: brcmsmac: embed modulecb array instead of separate allocation
  wifi: brcmsmac: embed macstat_snapshot in brcms_core
  wifi: brcmsmac: embed default_bss in brcms_c_info
  wifi: brcmsmac: embed brcms_protection in brcms_c_info
  wifi: brcmsmac: embed brcms_core in brcms_c_info
  wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info

 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/channel.c     |  14 +-
 .../broadcom/brcm80211/brcmsmac/debug.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |   4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 229 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  83 ++++---
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 139 insertions(+), 217 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
--
2.56.1

