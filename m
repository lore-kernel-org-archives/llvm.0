Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B9158D8E
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826182; cv=none; b=Od+5mSIOSGxMCl4gW14O6cUnScQFwtJpp0VAOnceha6TLR6uEb+AvnTt7A3BO+9V/dN9q4eIwXVRqJ//5LI6WGIorXXx1O7yxDS1hmG7nPTZNXtWuFheLCj+nh3O2Wmsnx44gu0gMOWl5DUzt5O5jErxtXRPL2PWJp800wj1UMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826182; c=relaxed/simple;
	bh=RPFHFz3hpsN5tMG4wffZXi8/Z05Ut3ZtFOKLumDvNZM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=creCjWjhbU/gBrXuyIipACWT6StvX8x7xSMehk9lu7WPJIIapfUmfdZU1q55SlqYLp4Si0E1gltREjorkSVR98VG1HgRevHdo2pSWUrY7Y8igUFZwc/gTyrKAm5mHfkVZPRk3SdxNxvar4MAfTgNAtAChD0iKCIQZLPGffB01P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsJU5z6/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsJU5z6/"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so2591381fa.0
        for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718826179; x=1719430979; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkZSOkSPahdZHn8JI5dimsWllP89om40N55o60JwQmY=;
        b=fsJU5z6/FVo86kjFmHcsWZAAjfuiAUKwJyKa9PK2P60qL9mFGH2VaT3bUReBM+ByXD
         sNI1eVCaL6Vo5bju2VTzGJ8+oPPx57/xzslUKPesvGOjlvPdTOxaziRg3pSKSUg9pz2u
         8UbfZUR6CBZlyT35ei3+pAQOEjXqVRnphuxuFcthQLBaY4I5eGHWnzWOSLPlAK1iGCYp
         YYdIySVEo0gNwGFU9pKP44vLyaLoMJjaP98V5+ubq6ApUQmDGpONUvI/kaCSH9fsvROJ
         ffBXOgHjg9WiIy9x7W6ltaugqp01Q0kfbQHLHLUb4zvjbFlYQji9TbPhesCrMxuHI+mM
         TaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718826179; x=1719430979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkZSOkSPahdZHn8JI5dimsWllP89om40N55o60JwQmY=;
        b=P1B0j2yKRgRLDAQxuP//4Ahyh0/LMjUyoNlqOacgqU0QJeVfpjyiJ3xs6OdlKxYlge
         KeDy4zWEjEztJMqE5bo4BntWLDaxeSqkypmbWYpWQ3dSlXfGjyU1coQ8Jh3CfmnPPpfS
         tZoaMWXaTwqoHb935eTEPzJesp/E8nCvGfu7q+OLljJcgKWLPnwDlVB5MfqTvWvRMbAt
         nj5rEsrnf90hHMUHArbjGHiS0pCjWG7qHIe4h5fjXiakpX3bQPQJyyGwUKtNBU6Q2GVe
         32T63OHoI7Dan4ovMuoL/l15zXtKzLAs1QdRMZu5lhDSkeFmHxIH8oPgI0z8smFV3wfC
         n+WA==
X-Forwarded-Encrypted: i=1; AJvYcCUThWB3b8faHAjufkT9OSGk5H0ZXZo60ifjP9Whmt2GLbdaFkIgIzb21H1ORCSLH/rQMAoitIEWGN5cqDli4uxmC0JDAQ==
X-Gm-Message-State: AOJu0YwBS5oNyDoBjJZNY0L5LXIxxBqGJv93O5QrP42CxkMrTP/8fUq2
	HLIcXXlM5cV9SWJJtPNnq4W+dtYzKYnrQFnlSl/1ZU4XFk8y/FjD
X-Google-Smtp-Source: AGHT+IGyqn6xLxGFzypHRcMERwE0GETopxzfKJdXrZd/qyoYhK5JaEdSX5/xfwSNK+EiOuKtxn5g/g==
X-Received: by 2002:a2e:9e16:0:b0:2ea:e74c:40a2 with SMTP id 38308e7fff4ca-2ec3cec1131mr26359601fa.20.1718826178504;
        Wed, 19 Jun 2024 12:42:58 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3385sm688365766b.24.2024.06.19.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 12:42:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/2] USB: serial: garmin_gps: annotate struct
 garmin_packet with __counted_by
Date: Wed, 19 Jun 2024 21:42:43 +0200
Message-Id: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALM0c2YC/4WNWw6DIBQFt2Lud2l4CFW/uo/GECuIN6lgwJoa4
 95L3UA/Z5IzZ4dkI9oETbFDtCsmDD4DvxTQj513lqDJDJzykipWE9fFCb12c9J9ePvFGv3ciLg
 pWcpaUSEF5O0c7YCfs/toM4+YlhC382ZlP/uvuDLCiKlMxdRAK2nqu5s6fF37MEF7HMcX4LYtc
 boAAAA=
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718826176; l=861;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=RPFHFz3hpsN5tMG4wffZXi8/Z05Ut3ZtFOKLumDvNZM=;
 b=3/zjs5wxOVSxBs19jGPc31t4NmwvbD6NNbmq5XpelJXoJUStFM17xgLTVl+lBNvwlUVlolAZm
 3meROjeEl5yCTdrFvGNkpZCcWoShqYvwlkJf+VIN7g9EAM8DfbPC39P
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The size is assigned before the first reference to the flexible array
(see pkt_add()), which allows for a straightforward annotation without
further modifications.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Use struct_size to calculate the size of pkt.
- Link to v1: https://lore.kernel.org/r/20240619-garmin_gps_counted_by-v1-1-d8d816f085d9@gmail.com

---
Javier Carrasco (2):
      USB: serial: garmin_gps: annotate struct garmin_packet with __counted_by
      USB: serial: garmin_gps: use struct_size to allocate pkt

 drivers/usb/serial/garmin_gps.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
change-id: 20240619-garmin_gps_counted_by-376545960353

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

