Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7FF2E0914
	for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 04:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116711; cv=none; b=cwN7Xy8bN/V0dAA9v2ZfU4IDtjYR4S11mzZhiqcuwn/2B6K0Oqwx/1z4Y3IEUHeMoVnnNGeuKQzbpbEyENUeX9+jQFIlXG+gHuAeI5DKe1E/4Iobgoxjx9934JYW1yaJg1WfyEPWezUSR42aWgEIwOKYOUNzaxD6TPS9dKEcOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116711; c=relaxed/simple;
	bh=UToTWkADz2konqxXLNRFKBpRT8+jAoOYOmICiB35LYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xg0/mgq0lxIG5wNPDu0kjiNBszgSlkEBfG//w7BAeSuU9RgEKCxoDppRQAwWxHs3fKYvjoTCpn57PVYT+FIGOgnpCZQoVjvZRwktNPcQiuZ6IlszPNwfoeeTLlBDjxFWUeB1/BUGQjP+Gu3AlDM26h5um3v2HUV9ik4e0faMq7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=IHwpFrLq; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="IHwpFrLq"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso414623c88.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 21:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1773116708; x=1773721508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPa4uc736wUZG7p1hT7+UQGgiHHzlxFbUs+tG5i8A9g=;
        b=IHwpFrLq8T5EA9IKGbOiipbuhXQJ50qajvNOnRxHKNBc6tu6spdoL1Fl67DEKkR1mB
         +xPJEenoxy/Uzx+DBSbLYqyp00LIpk9ZPlMpan8BEZClpJ6K+RvDbYGHN7rdw6Us67P3
         rtlvW5GzDM1Tv3h8XdE4krXOUxXrrBX7KtdJuLbAl82hEeoYtuojw1LJDv3g8x0L30Tr
         JxxwHyhaI5kPoBECmD0PZvls4xXegrUldDu6hT8YAZblFeQcHaDiUB1YCuZ8vq4L0+Yq
         y/tJGVQRkE/q9iWm1bFT1ADPXnxz+9Ml48SZrx55ZuQ/7mWvxfSxJ/+cjT0EDrdqVHpf
         bMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773116708; x=1773721508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPa4uc736wUZG7p1hT7+UQGgiHHzlxFbUs+tG5i8A9g=;
        b=b7c86I2w0FDObXtjBOfsAV0yYb+nQpeD/sUZtClQzQheCfDWH7ot1dIshdfLx5v0m0
         +WLHxfmk8NzxFadE0C4TqBrxu17Nhu/solD12slwix0TbpipX6m2TaR33i95jLrbGw99
         CXlBFUT6iznHcypvmkDpVcvOgGYgo7GG2tfc1btxL2uJi3uYaiP+AMYZ/YUIbNpBayp8
         ZE82NiZxwSa+iTPXC7gtZ5EnlYcyn+f29lVNl3V6Sy5PICOQ92aMMKGtZ/gYCbGRf1cp
         TTHkbOEI+PW1dfpeYWKmxBxXaxgd62Wb1Gh3GZjvGES7k9U4MElhxKTVoahT2RHkG1wy
         r+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU0My3WhPT1+iGbC7nUY6Ocfj18qDrbCK1i6wJsd8OjLARePKt0S2Gm1LTkikq6xTxrKhgY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5SylgR4GpY6/no85bfIcr05ElP0o2ZOFdTR6i7cEfZSedZX5Y
	8fK3F5/Iqc/zJnVdYVS2RQPDLsp80P8UEHnQKCuLlQpavAO42LoIRQurs9hIlIE6nrE=
X-Gm-Gg: ATEYQzy0UjA+4HxTALDjVWPwAcNb9LuZoT+KzOSl2VUnN7YsSMYnqjWbPbFa0+Lvut7
	lV6hxqu0RfqX/QAGOwHanm8BEAKhI+Uaeg4ibkan5hIwChBeJmTVcKWM9hp/SfSR8/e8/6OPME3
	yjfgXvwSOP/CDxShjjdrRHZN4H/Ufe1mmqrJx9w7VlaL58Evb3eypI5jw41x9v9DnH3TmBGsLBw
	qNLrdhPgKg3/ju6oyNnsBxnDZgJHNCfT8V+bSmBTSBG/hV46mmersol8ZT54lAlt6H34ERQhjPo
	qc6A8wQhI7pWud7Zv0ghETKBuHnp7ZDHujCdjFSvQfZfL4ma/F2k0m7DkYskAcg3/unY5ACkjF5
	Ixxb1f5n1P3+wj4XR18KxT4yOjW5TdYGivjN0V0pcBwprYvbK7tjkAvaQpyoDbqIdP72ogc9gG8
	yScrI44GcvhSbW8DsjYzfG0OVQqA==
X-Received: by 2002:a05:7022:6081:b0:128:dbbf:fd35 with SMTP id a92af1059eb24-128dbbffee6mr1751213c88.28.1773116708236;
        Mon, 09 Mar 2026 21:25:08 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:eea6:1f6d:5163:10ae])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm12925551eec.33.2026.03.09.21.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:25:07 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	Charlene Liu <charlene.liu@amd.com>,
	Ovidiu Bunea <ovidiu.bunea@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	llvm@lists.linux.dev
Subject: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable which breaks full LTO
Date: Mon,  9 Mar 2026 21:24:57 -0700
Message-ID: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Fix by using the old value for region_params.bss_data_size in place of
the uninitialized reference, which makes amdgpu work with LTO again.

Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3d6f2cd8ab6..e69e61163ae9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2554,7 +2554,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
 					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					    PSP_HEADER_BYTES_256;
-	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
+	fw_meta_info_params.fw_bss_data = le32_to_cpu(hdr->bss_data_bytes) ? adev->dm.dmub_fw->data +
 					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
 	fw_meta_info_params.custom_psp_footer_size = 0;
-- 
2.47.3

