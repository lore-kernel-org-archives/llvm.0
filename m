Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3834A26
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 19:40:55 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id i194-20020a253bcb000000b00676d86fc5d7so8057412yba.9
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 12:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=W9p0zgnz9HiTB/0UdjjdirPbtTvGNOenVCLlAeF5/ks=;
        b=kIb9mKHmh4VQUbwYfXIeufs0L7HoYm3h9bYoHWm+YV/YM7E2S/kT/MuCBTJZhvsFUN
         Y9bE2nnTCELd6Uo5Yb0KZV6NJYg4VmwjsPKZf24YSXT0fN1sJ7YNzv5LW4IvYS41tEMU
         OImAFif75ZIAry74Xs/FhQVBm+/YKcNT0FevROVA26L/Ca0YSjMlfBRJjjGuEOSZijRp
         T/oOJjfZtZ+z7WwqOR3IW2awHC2aQ93LrxI2nDWUjvBq7hzurTfhaYQXZfQE5NHYGXtk
         npwMfzAwfFoFGUd4Cox7D4F100e0zQUkv5uRq8ocq1AzOMqg2wXE0/r+aD6W0S+hpfqh
         KCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=W9p0zgnz9HiTB/0UdjjdirPbtTvGNOenVCLlAeF5/ks=;
        b=V9SOjDYcZ6ixnI0l0PELc7mYUYhp82slQVGoS36V3TGs4yt/X9odYhKMDmK2zSe6jA
         JOR/ulD+V8Y6Pn75SI0sK9u3HgodGqWxX8SCACKlzwK6dPxIcLM6fJ0F3eVON4qGqoat
         2H4qHshDQWtjx0BtwASRPj1oV91S4D2amYtOhRM60Mgb5oKAylOA5LTMH6zHEqV6Qjav
         cugYkiKWk+sSvq962OvPpJ/HCxI98MWQOfMy/xe2464AieqACLvGXM0tlU061L9CTio6
         0clIvhyszBr9FIFIzshjF08GbFBoQabEBHk01qdmEnI7/c4j2AWxjP+a8Ipw3+UPpr0Y
         7J5g==
X-Gm-Message-State: ACgBeo3nDF2RXYhY6jETBE3aDeoPfrWyk9Ham3ianHUMzmDtFn2SF4GX
	q4r+gnVG5JnRvKZMb2lHjhC0Du5XAw==
X-Google-Smtp-Source: AA6agR5tT07BLedJkk78QlwL8aAcT2zOwZ+TyghN3uTLRGF5Uit5WEI7B1ycrzrVCbXp9ca7l8J/GIJPlg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:690c:812:b0:345:27dc:56e2 with SMTP id
 bx18-20020a05690c081200b0034527dc56e2mr23623616ywb.313.1663011654220; Mon, 12
 Sep 2022 12:40:54 -0700 (PDT)
Date: Mon, 12 Sep 2022 12:40:30 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912194031.808425-1-nhuck@google.com>
Subject: [PATCH] net: ax88796c: Fix return type of ax88796c_start_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	"=?UTF-8?q?=C5=81ukasz=20Stelmach?=" <l.stelmach@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of ax88796c_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/asix/ax88796c_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/asix/ax88796c_main.c b/drivers/net/ethernet/asix/ax88796c_main.c
index 6ba5b024a7be..f1d610efd69e 100644
--- a/drivers/net/ethernet/asix/ax88796c_main.c
+++ b/drivers/net/ethernet/asix/ax88796c_main.c
@@ -381,7 +381,7 @@ static int ax88796c_hard_xmit(struct ax88796c_device *ax_local)
 	return 1;
 }
 
-static int
+static netdev_tx_t
 ax88796c_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct ax88796c_device *ax_local = to_ax88796c_device(ndev);
-- 
2.37.2.789.g6183377224-goog

