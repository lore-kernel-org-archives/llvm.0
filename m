Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323203;
	b=VPcl/iKedluBjHflFuHdv0Rnj7UKB3q+2oP405hvYyhV6toxM0LONlxJiUqjPom1hlP5
	 6czoWBVydBJ0FeKKpH5Sj2qMImDS3t9FwEDrFudATNpesrEGHmuihGdHnNy1JuruCWLmS
	 V84NSzs4NkW7Dydm9yU0PKByDFiM02xIsm5jEASU6KRAfnOduiswAfujXSRqEChc1ku7i
	 Tz91kMQ9kf650E1jr9NJVvennnU5CVvXwqfQAdjmg/hiXH/oVym4mbDgmfX05FY/tq0pR
	 31pqOXxGxC9OY6nyp66RPKidRc+EJEbQjNWKT73F6Y4UEslWL9uGs7enp8AxRsOmR2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
	b=ahrUNEKegCy8KAPny/UHcfp6RP+ui7K9K+bLNxoRq+iC7jgrFe+c65MMex+UOecLoQWw
	 aAHa7oaltCMs7zBswXRlRt6cCxh7gWgliSb3TXwnsK1uR6k2lsk8oce8iTnoSrrMReWeo
	 Vlt4Kys3A7rdMuJAiVDIcgKc4CyU6njPwD+hALL/fnsVHud+84l+U0piUXFgZBg7PIuso
	 9RYq8cDJpPcSEqT4ElG/NnA6jNCsDzIL4EWzjOi3SIHJ48kwhiEf9H4iO7fAovNDVt95R
	 oLxE87KvTUJTo7BFKUc5OPM0NWfFHw2Xi3NIFPZiLvbGngcUw5gkzI6+EjnJJAlifpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEFrpgoD;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151DC606A32C
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151DC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEFrpgoD
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso3231844eec.1
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323202; x=1795928002; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
        b=mEFrpgoDFERnZG0C2bC9+AAIfBypHMHWhwJJb5x/epPT1jnS9seARdaGGfHrcAtY88
         1YxgwQ9AjcsNnzkw6d2P9e0v3ZcwNbFz70oMYeb3wiGjxtYYXExvPdb/DEF7zcpajlxr
         5d/S9zoAcojalyF1MbBOOmcBrUfRiSB8bO2PI4SkwHIYuBeU4MqDKDbS7TuDtw1UuZR7
         LTpRTbn0xfgmEvuHtSU/3IcJYzKoTgZFLso5ng4uozAK01nyHg1s/kxQn/E0U5I2/yQx
         IerGcLuM9QyjlPJ/dWCjDrf5gdFqmRwHmIvEYj9f2zu2kK9WbeR/ffXk7Df5/671V3/Y
         YfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323202; x=1795928002;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7Bdw0hKj9JbfhPi9A4wuP68QPesnRTG6G8CMRtqhng=;
        b=27jsRc7FaXtOvtD10nJx94A3thvabRB0DuL84XUA2BofF2ViY9OHDS9koc7x0yvpwZ
         e/T0uaSXICU1Dw7AiOufOSORnzQgW5q3P6KYeOIK4iz7uj+8d97K3tuJW3yvm0swrS/Q
         81mienBDkiPqIgdpBFK5kHUqGhJZVIl30CKW36ffpfDSfXcl0YV/pIHnqlP2cw+nx1ie
         1sgyW+PoeemkLfeLZytfAWv4GXl2NHYtOHhKWVBPAGhfaG0OPYDoO/mAzSmT13SylLFV
         L8uu3D2vAYRLtdCUhj3brrHSo4lmCDM9iBvfVl1B0HHP4qnwHhRdndKanaQsM/kVDjpm
         OQ6Q==
X-Forwarded-Encrypted: i=1; AL+hErH0y2fjp4rfSl89cGU56lyCvkek4QllSh5IMZsFPkrUGLlILqdK8ahxqGmaE+8yfFkDZIko@lists.linux.dev
X-Gm-Message-State: APuU4Z9+SL+5jLaxAenEysMa2AIHU9mMQ2oT95ak7wpC6QY9C2OA2Zlt
	vJanKKhtMCiIb1TLKlJbhxYnvN9JLm7QPA/rZxBs8OjFn2rbLw4E3OVanmEeDk3hHoFc/vI9VHV
	03CIrgLILXA==
X-Received: from dlbsj12.prod.google.com ([2002:a05:7022:f90c:b0:1b2:4b7e:5356])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2319:b0:1b3:a8fc:6306
 with SMTP id a92af1059eb24-1b55247e725mr8008573c88.6.1795323201686; Sat, 21
 Nov 2026 20:53:21 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:15 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-1-irogers@google.com>
Subject: [PATCH v2 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Two fixes in drm/amdgpu for uninitialized return-value regressions
found via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build:

1. Set r =3D 0 in the 'else if (!bo)' branch of amdgpu_vm_bo_update().
2. Set r =3D 0 right after the while loop before 'error:' in
   amdgpu_ttm_clear_buffer().

Build-tested with LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitialized;
not runtime-tested on AMDGPU hardware.

v2:
  - Keep 'int r;' uninitialized at declaration in both functions so
    future missing-assignment paths are not masked; instead set 'r =3D 0;'
    inside 'else if (!bo)' in patch 1/2 and directly before 'error:' in
    patch 2/2 (Christian K=C3=B6nig).

v1: https://lore.kernel.org/r/cover.1795106955.git.irogers@google.com

Ian Rogers (2):
  drm/amdgpu: initialize r in amdgpu_vm_bo_update()
  drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 +
 2 files changed, 3 insertions(+)

--=20
2.56.1.750.gf70dc682cf-goog

