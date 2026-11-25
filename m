Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645538;
	b=EOO5k16lmRMuD1+psyirnuCQ+vtfowgXzhFwyKE0vI5jN+hduDYCyVmRkOEM8y9l+kYx
	 aVQRsFdJFN3jp9BKok5HSzeeYoEbQQhih97rQR8qOd0hV6jFbrZXKRSUVPZPGGhcHspux
	 rt2c0TMs0z3LyfQGuZwHm3M+aoaCmtI+XP0zu5x9lJFzwFzWjc7lEMSdJLyvv34GHJVpI
	 jwMXUbhjTkHhjEQwQzILNFaJ1nQ0CCVowY1r/WEt6H7cPyZHhZo0lIoFJAo8JYbnfbHhH
	 3ENNPDaTFux8f4cq1rvcY5jDlX//V2DCg3qQE4+chYCo3puB/7nwWACkA8PjHVDylPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
	b=WzUvseO/kw83aLKKQhnAK9N68dOM9Y9tMlZcj7VdDwUDrJirooUJwdO80/Nuxq3Vd8Tg
	 /EFvjJCyd/k2oUKUE4h3OliyRegj2+8h4ELTGg897qhNMnCPQDzQMfXFBwfFFyCTAtVIR
	 lEWiG9LhW/HxHxQ8FwtdEbl5SsnXA7tdio7PVTI3+lZfYvwKbq1YT/HlXcaKxrFftqG5V
	 Dewu4uf0SPbxcfWb0gJR6ZmjBw4PFddyfHCEde8Asik737zVvHjn+ItTI9YmESu9knk3w
	 X/JuGuXPnJuyYx2UBdLQZlMOCJO0lQHxKfouBpVPFaydqgskRa4EML5379VYxYxqE2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PK01k5oj;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40451606A6A5
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40451606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PK01k5oj
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so486464eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645536; x=1796250336; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
        b=PK01k5oj5SVHUGrIXIIt95geBQMbcT4kAdgdQXJcxIIOVW4XKMdMS0IGqd7Io98o2g
         nE6XFZ/Z8puj73OHLyq9wuTEDlAjvetRLBY6IDzzXytXiiBfikGDq0G/67LxEW233H84
         zcJFGDs5iO5sMoI+VFjm9pkiUG2uMyGNMFkejn8fAyPbtcMWI96SuQTEWHERwTx5ZrQ8
         DULpSTe+1CM6leJt/Uz1NF++zDeTRw6XPWYXsZEDkpPvZvj/rnspjXHw4yShzzM2AQIp
         NA8JnztNhXZYfi3JW+T7Kqh1htGQ2pEbv3b3hIXHgCwry3A7wS87r+L7U5qux0PWSTjq
         P5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645536; x=1796250336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
        b=Fu2tAczuRuy9NI9ZAIGFlT/qvz2ijHTYzQeiepa2FGm0LrKHW7LbUxbXAVbeuOkRTW
         H8OJkYFgY8HvO+H7pTS7WnedrJ0OWk4/vrvm9Sdrojr6f8Hl0IN5zO3pGFYLn46zR+or
         4i4Jl5DRN/V9ruXHwRMgnzc+ApXpjttsda/LBhmIq/sh0iSCJ4u9vYe+yGKnYvhzUBx1
         4SmnfHYRRbUWJxRkqhdh6jSPsCfSE0HlNjE+qCzCZEvFmafeCvk3JwzIWHEwSVw7aAQo
         TuFXcyrrK2huaNtSIgzq+ZvZWw26se4rFxa1PB65+ptVK4rJ4FEIglc2hL2lD9IdUFnK
         XL5w==
X-Forwarded-Encrypted: i=1; AL+hErHasS6y3XjR+ckZ2n7hmwr14jM54nOs273kNX2Bewyc5I02CDWQvsQM36fnRhC+/vL62OIT@lists.linux.dev
X-Gm-Message-State: APuU4Z8q7SkvQIzTyo7c38ryNuGEuKaDnEdNxUS2NwhroQycxCIp3vY9
	Gr7lZp7xVLuLjZj3wasyX2uWibjmsC/VaUBEV6U8uS43ph7lzD+AYEcNFRf8Kc3CBFSCS3KAlY7
	mTA==
X-Received: from dybpk12.prod.google.com ([2002:a05:7301:428c:b0:377:a5e3:b669])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00f:10b0:381:1eb7:938e
 with SMTP id 5a478bee46e88-3856c9a61c1mr23535009eec.4.1795645535979; Wed, 25
 Nov 2026 14:25:35 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:13 +0000
In-Reply-To: <20261125222513.1446099-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222513.1446099-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-4-elkin@google.com>
Subject: [PATCH 3/3] drm/sitronix: st7920: Pass u8 row address when setting
 GDRAM address
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st7920_update_rect() passes &i (int *) as the data pointer for
SET_GDRAM_ADDRESS, whereas st7920_store_gdram_address() reads a single
u8 byte. On big-endian systems this reads the most significant byte (0)
instead of the row index.

Store the row index in a u8 variable and pass its address to
st7920_spi_write().

Fixes: 88b09229f34a ("drm: Add driver for Sitronix ST7920 LCD displays")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/gpu/drm/sitronix/st7920.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
index ea4566009c4b..005994a8f87f 100644
--- a/drivers/gpu/drm/sitronix/st7920.c
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -309,7 +309,9 @@ static int st7920_update_rect(struct st7920_device *st7920,
 			data_array[array_idx++] = line_buffer[j];
 		}
 
-		st7920_spi_write(st7920, SET_GDRAM_ADDRESS, &i, 72, &err);
+		u8 y = i;
+
+		st7920_spi_write(st7920, SET_GDRAM_ADDRESS, &y, 72, &err);
 		st7920_spi_write(st7920, SET_GDRAM_DATA, line_buffer, 72, &err);
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

