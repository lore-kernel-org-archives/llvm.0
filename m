Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323205;
	b=ZENN3lsgltGQMIJm4byjpAkPOdWWd2KEiqj55uXRp6bespDPKKov/fA5+G3SIqUjrDei
	 I4vxnBWwcf54Q+clL56WMUCMwK91GZNzR2ZMOw/4q7OjvcmI0ZhSifq9cAu7+7XkOT6m6
	 t/+VBg5RnXd8hPlTnM6/L2cdGGSjM/G0+/ZOuL9vTpJWf1djECFdTqkc0DEaLtRWPpkH4
	 guR5GMdeRD6jNHR9+vVAcAAMIhC7w1KcfNfpsHTRcI13riGsnHWnecTGtINxqWzIVHSCM
	 s47kwRw5SVvx2o59abs6m+hYSlJRdNdUGFAiwpV+3ZKcXZ+AHdUbHNr42mkAjKU8avQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
	b=poxK1v//g4cLdbd35J76hBnRclpilcokP5dkWrvzaQY1AcGRYECtRmIyEObCRaScogqh
	 F3f9Nb1XiU+rv3KZLclmcYQkgL4xnc/OoEQJTpGx/Nk9EGuglGIbsbUCytjLwbK5vxsWF
	 6z7AZTpErBWwlZZrfD+z9vrle+evci1FG51Xk6Ao7n9NS4+nofXfp35vnZylA8FKeHySp
	 mxkxo3i4DapoXkngPjVjurh5mJWxfmhg3wj0HE1H/QZ58smx/S1f5ZWQ7NsydhjLr8eDo
	 Yd/Bul5CtpjC4LS8XWqnbVtmyifjs49ERo/kiAi4vpIwpRqC9rBCYOEZKl5kIpO0fhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a5DO2vA5;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F7606A320
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a5DO2vA5
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso2590103eec.1
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323204; x=1795928004; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
        b=a5DO2vA5GhONuuVG8BAH6l2IJfnG+dOAtbeMD6iOsfnQnZ3idvU+jcZ0TGmcKz2ybY
         kRIpO6UFJUjo+P2x1yNE8Jgyt5iyXYdvScG0jx7mLQzuaPB15faRVJO9oPoY4jY7eQGc
         coFNaxfQPI00LiOyQhFIwY+cKjvrpqEpguwIooOMt6t3cYu5YPAlTzYzoHnh61D5veZs
         LXTIKnXsLZLN0Pa6RRyqW85CD29oZIMBU9cAoxP+ZUqKEEcxLaIwg2xty50gnzCxq4VE
         sZqmoCKHUzqw8jR/vkrwzXMbpxD52W/dsS/he7CUV4oB0cQgksVAPGqexX6K9f03WFFJ
         0ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323204; x=1795928004;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
        b=m0+m6BAraUeX3rFWGkrL6ZAS1yZjolw11KQQ8Qb9UsuVj8iNKSrs57fbjl4iAKbYyU
         wC8sadR4lA1nSR9mmfVYPKNvsAfjIOdKXIPkrpf1lM3oWbQrcu9Ac7TrAF5lThEu58vH
         gs+6B2qUe/a+2mfdjSIm3lAYgoxiUOfmxZdcrWA3mOxW4mh2atwkGjH19qIO8IaICOel
         sVWNEaedJqfZ4M5gH5/DJFLwJPhVfUyn5s8uBHqu1OoGtTK7PIz9eBvA6Lp60T5p2TKK
         1qUiAIdNfjHOC1nQyu2aTLTbN7iej0+Q6oxgifUJcKY8sFBKuU/qx5MwYvKCXvW1ipY9
         6nXQ==
X-Forwarded-Encrypted: i=1; AL+hErGdlDfvxWXgv4YroT7kU6Pr2W4f74mtMUaYZ6xiqt5Nt16dHb+rXgHLDO9mLZVFY3/SQt8g@lists.linux.dev
X-Gm-Message-State: APuU4Z+3Zz7lHDoPqpwE48H/nDDXczrIz7RToea3TDz+rVMMI3r69hk7
	eIdjG/chQtGeZab+c9cQCD/lL+Cs9xB4cQGra/vHYLZ5qTZyl+CrYHpGSGlEAmQqeKjvm+oVEc0
	5Bjk7pk2T4g==
X-Received: from dycac15.prod.google.com ([2002:a05:7301:550f:b0:384:b800:2ab4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:1486:b0:383:6eb6:5730
 with SMTP id 5a478bee46e88-38570e24c0fmr9359658eec.32.1795323204068; Sat, 21
 Nov 2026 20:53:24 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:16 -0800
In-Reply-To: <20261122045319.18651-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-2-irogers@google.com>
Subject: [PATCH v2 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") added
an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
'r'. Because fpriv->prt_va has bo =3D=3D NULL and is updated on every comma=
nd
submission, userqueue validation, and KFD VM restore, calling
amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
empty skips the mapping loop and returns uninitialized stack variable 'r'.

Set 'r =3D 0' in the 'else if (!bo)' branch.

Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Set 'r =3D 0;' in the 'else if (!bo)' branch instead of initializin=
g 'r'
        at declaration (Christian K=C3=B6nig).

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.c
index 82b9b2d5d0cf..d36ce2748f72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1323,6 +1323,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, s=
truct amdgpu_bo_va *bo_va,
 		}
 	} else if (!bo) {
 		mem =3D NULL;
+		r =3D 0;
=20
 		/* PRT map operations don't need to sync to anything. */
=20
--=20
2.56.1.750.gf70dc682cf-goog

