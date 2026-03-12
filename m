Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E73F1661
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335622; cv=none; b=dyGgtaCQYVrV5b/SxAoWC1GdfuakPbSvnRToMztAATLEZ/DQtexTCocutvnLbvbQIy0wV132ZmtvvIMkeJsSOExyhD8Jmw6EHgmCcvUhi9qfBbMH1shOEqLhqk2AXzSWALfLGZY+P/iMzvJFEBJwsDHjQi0AsSW11NsqocfjOlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335622; c=relaxed/simple;
	bh=HzyYpLWYdwjltSy6DaeuRCXQcwAKcINf1pQHnVARD1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJFUSjYR4s+q0tmn7to3s5yEKUHWZrW6bHWj87sZ4nM/sLV59Lijc4ylAXuvqdA/d92Iyk1KELSla6PBQSLhwvQ7DaubE/kEFBTIPIDbjqQBGVeOPnv6vqIZcTuhPZGbgpnxQkh72/+SCuRBOclqt5SlEkQ3TzimWjqPPKyTGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=Nmx/ZJ5Z; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="Nmx/ZJ5Z"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso119198c88.0
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1773335617; x=1773940417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2G1AlBOtI0pVNQJ415mQN+VxqBlOoCSVpFjY0Duwoo=;
        b=Nmx/ZJ5ZB80erNpaubBP+xUE2Ymecvwv+Iy+0TT4MIRr06SxGRipII6HjyB65q8NTK
         m1UUj8hOVrl9RORYZ4dRELYni50tghmf15H3B4vHpfAPNSuefeVoY2PwSWimqrgxbB+I
         ggG/ST8fK+h+ryJU48OJJgvxtG56UosGWTTOujnEeWm+7K/eMia9bnAwtTkbmZPA4YRs
         10eN7oEyUSEZVlD77/Uxftr9O7PKrpe0Kmknb14j2THTLJVPjIlKAYu+gXKhscJt05bZ
         O3CetCNo/JonzjzzI+vlfPitu+rIFxHvDoZ47ZgrKhwP1q1ZHErxLp/0IjT+nrtKuCHT
         F7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335617; x=1773940417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2G1AlBOtI0pVNQJ415mQN+VxqBlOoCSVpFjY0Duwoo=;
        b=pTwsCDlO5SX8nyQrTGJIkUGEGVh6SyMRZNUm4KXloSvAlwAuglSuZzFGYExhCSoA+3
         cwRXFPZQDvNHK1EuqFxdtURB74aboz4bigPbsBJM2gOuDt0SK1vNfdQ137GqRoq21huM
         eUgqKxPUiKPlpZu+EmesA63FCGHOtflovlJ4SLWeouehsfxDoILpEzF2dJaxOROfkNfH
         llEh5iCBl4BOWI166rj/gggmpDMN6VAbkFlVOHc8hn1ft4Ut0H8gil2axN3atObrtliQ
         xhcYIuY26Lnewf4o5UtsUuIzlcuzzZQSmRZOF6tgrySPQ930YwEU1439ykogY+Y2/6Ml
         xIRw==
X-Forwarded-Encrypted: i=1; AJvYcCUxmMtDeBYFhjrwS53DK/2ZImqGXoPojkso5UBrHAjaLQacs52anUsRu8M2gUVOH2QgwB+Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8T9DOAhk9vS7y/5v0Jk4srRBSNJstN95kZrv/JPmyfOVyGHMT
	szmtSHJr4QwzrZI1RU/rHovc3N5RzcK0k+vGYI/gotwoK5owwGYND/zZrGk0MCeM/oA=
X-Gm-Gg: ATEYQzxiQokonM20xs9hFZrYQD62FZBm3n1mFEH+9KdLEiaItMuBl9FIqUYf5EjbnP4
	0Y4SQGEAMGRVz4i6p8MKCJpmHUcr9ul0tqaRSukMUzNpOPtoNThYVYxyIc+dwW8DAg4uqMSDLXN
	ji8NBpBdYITA3Nfh/8/8ZQ0lfDNrqAdUbhH/DgFOGqyi0JhVU4k2TuRcGkLtH7BEaWhoAV8DCWr
	+rFZVNo2qYW8GGgkR8wysVk3EoGMYGDYgxHxfe8RZZyBU4N8DKcxDJqw5wN0BCmzdh9RE8Fl691
	Ipj9wo1Yh7N0uOhoNqV7ck1bEKWED/y0bxEpJdXqPSavKcBeA23s6TpJVYXDn77lKvCD0gHdeZ3
	JsUhO/38y1+eM1hSdDW+PgBVxuqsXnLjgk/C0kMl/dJbmeTtnk4UwIW6klEaXrohVIZyhGQaP06
	7hll2M9TNvUlSQYj8LwzrQ1Eax
X-Received: by 2002:a05:7022:4397:b0:127:345c:439c with SMTP id a92af1059eb24-128f3e29d9dmr154759c88.45.1773335617192;
        Thu, 12 Mar 2026 10:13:37 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:b160:d8b0:a73a:3f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7ce52aasm9466780c88.15.2026.03.12.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:13:36 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:13:34 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	Charlene Liu <charlene.liu@amd.com>,
	Ovidiu Bunea <ovidiu.bunea@amd.com>, Alex Hung <alex.hung@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	llvm@lists.linux.dev
Subject: [PATCH v2] drm/amd/display: Fix uninitialized variable use which
 breaks full LTO
Message-ID: <abL0PlD1FDnfrX4o@mozart.vkv.me>
References: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>

Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
footer size") introduced a use of an uninitialized stack variable
in dm_dmub_sw_init() (region_params.bss_data_size).

Interestingly, this seems to cause no issue on normal kernels. But when
full LTO is enabled, it causes the compiler to "optimize" out huge
swaths of amdgpu initialization code, and the driver is unusable:

    amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
    amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
    amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
    amdgpu 0000:03:00.0: Fatal error during GPU init

It surprises me that neither gcc nor clang emit a warning about this: I
only found it by bisecting the LTO breakage.

Fix by using the bss_data_size field from fw_meta_info_params, as was
presumably intended.

Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
Changes in v2:
* Use fw_meta_info_params.bss_data_size instead of repeating the load
  from the payload header field [Nathan]

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3d6f2cd8ab6..0d1c772ef713 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2553,9 +2553,9 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	fw_meta_info_params.bss_data_size = le32_to_cpu(hdr->bss_data_bytes);
 	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
 					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					    PSP_HEADER_BYTES_256;
-	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
+	fw_meta_info_params.fw_bss_data = fw_meta_info_params.bss_data_size ? adev->dm.dmub_fw->data +
 					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
 	fw_meta_info_params.custom_psp_footer_size = 0;
 
-- 
2.47.3

