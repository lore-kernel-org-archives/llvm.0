Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF7221DAD
	for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 05:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773122078; cv=none; b=YhdGheVM0MPpHx4FBpU8zTnO6tCvsdOWj4L3tdcmIfBoK2M8HTvqUrawx9ugdz5M5btbeRFbfX3UWGBX4atjUSIvQT9LCQ+j95h8oueENLjCKLiu/tloDFgVKii91zAGR/S18gM1T/vOS/8aBQLSa6Kr+GhMMFh0P6DUbxIfoDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773122078; c=relaxed/simple;
	bh=JyTQ7i6UZ2tNPCpkX7jXZN++9nJuzQO+zAv+qhCEUKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmXjmJLa7Tgzmv+NlUbRUbRy0OThJ6iuLUBaucmsZW+GZhF2RdT0CxeBqzkL/+FOBjyDVXDPPblf2QnnFYxTqCV4l5Etrb3+04xTwdKXvsH2PjVYCvkJZR1Cb0gfrsPpN+z0hdrAlJc6bQHp8ielKQJVffmYDiXKQRB9CgMEgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=NZARS2os; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="NZARS2os"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128d2e3082eso1181681c88.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1773122075; x=1773726875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZrje2kJSd9Bh+vOqAe83fHEY512zOk+rc8eCAn6ioA=;
        b=NZARS2osT56aGyMjLiruWSn2ncmVvPlMyPVgIHPbpXn/zaI5iDp6EnNd4BI+ble7rQ
         GM3lIXJ/sMJfGD5KcBBFeS44+RWocnyL85HYa7OeSYr9aX63dDXb2mTjnGWhzGy8omFB
         ik4EtZHIo6Ep1juJ+uKub15lgVAycrOk/wAVN1AFQGsi4w/zN9p0BR/aNsMD8z/aNcKC
         MceS9WE3wEa85wl6uYKRFhowgtrmkR22WuN32Ar+yqrzRPKRR3LD8ZYQs94p2IP6UOQq
         /f5pQ/SR9Yu6F7oad6IQVMRhciM4+63rtPojwcqAZNrpurUwUeqDbsFd5rs6PhjADbSD
         DObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773122075; x=1773726875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZrje2kJSd9Bh+vOqAe83fHEY512zOk+rc8eCAn6ioA=;
        b=Z483bpk7BjqCQXVCv9m4cTKlxl6lFittcVlHUlGUazJ9IobxXJIz3ckb7Z9XOvDJbc
         gWbAVegyIBn7dJKv0M3cs2yoDNtuAruMrYsRvGPAoKucXJe6XnTzBXS32/0ZDAwqAv7Z
         bBEmAsy71HnnNmlkLMvsCgpPDa27N8trbroGbWbzF6OnDwN3oRxR4oIgXDbJsJKeZjTk
         XzQrS5ft6ikcEr2A7ZZLfhDE7wFZjAqmsTVEXfFCtvyeykDAcVK1BBpSJ5HLNG28ZB03
         qskpbnBMQ0glTzda9FJvzGk5PgT9dE6zp+d58RCvQnWGC1mfLHH6p8NPaWVUfVebm77Q
         jLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdbUCRXOmehRqp2A7lNvX3OIL5A7Bm7GNckWSiFdSBG9EXYKaPDDMkx1P4KzK272coRzth@lists.linux.dev
X-Gm-Message-State: AOJu0YwLb7P5zX9lHgJJxyw4gmVBpwsrG7/c1MnfOpZC/QSxGE7gMhUF
	kXcc6xtkja+kbcsxHFazlHm65cS9tWIvYVkjpQRCz/L9exeCbi90yq/Ox7Gc187qyHM=
X-Gm-Gg: ATEYQzzBM22Y2dZCHup3y+7KfdmWHDshMZoKmX1COC6yqpddS4+ahLsg73qwuGpLKCu
	Xo3sqBaT7L0Ad1yBEMbRXFZPXQeHCrkT/K7pQbxGkYYTiozc0TgFs4Yk//37zsK1e0Ml7ftGxRL
	kpcM1XqcrUmm4tDM919JuyPpskvvtKyp7k3egih8VG8imyWlL6/rZSEds5Go+zQuj2QGx5a2fqu
	MlCy6mq3V1jCIAYE4mP+aEMYQsH7dwNhj/QUcXZH5eMRjhwQHdatf+I7c5FfjPEjkDRSzDoikbK
	7x+7veHHvpFrw9VNLiyHvxnWF88YEDuk5kf0GFugXC5WaGtkmGvj4ARsLnkvW/wF8tNtsRyj41A
	fgMfasbQlPqg8QkZ02Tj3efPCr//woN7MDAFsevCmLN0kOkZd8khiINvfcjFE6t11V2BKmycngm
	kilnCufWt0nur9GDFpDBzmlqui
X-Received: by 2002:a05:7022:23a9:b0:11a:49bd:be28 with SMTP id a92af1059eb24-128c2d8ff9fmr6043992c88.4.1773122075270;
        Mon, 09 Mar 2026 22:54:35 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:d3b:fdd6:c26e:df86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128d989cd36sm7603986c88.1.2026.03.09.22.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 22:54:34 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:54:32 -0700
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
Subject: Re: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable
 which breaks full LTO
Message-ID: <aa-yGMPCWwkjXNAb@mozart.vkv.me>
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

On Monday 03/09 at 21:24 -0700, Calvin Owens wrote:
> Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
> footer size") introduced a use of an uninitialized stack variable
> in dm_dmub_sw_init() (region_params.bss_data_size).
> 
> Interestingly, this seems to cause no issue on normal kernels. But when
> full LTO is enabled, it causes the compiler to "optimize" out huge
> swaths of amdgpu initialization code, and the driver is unusable:
> 
>     amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
>     amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
>     amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
>     amdgpu 0000:03:00.0: Fatal error during GPU init

In case anybody wants to poke around, I uploaded the binaries here:

    https://github.com/jcalvinowens/lkml-debug/releases/tag/000001

You can see in the diff of the disassembly that the "missing" piece of
dm_sw_init() reappeared after reverting e1b38572:

    https://github.com/jcalvinowens/lkml-debug/blob/main/amdgpu-lto/not-working-to-working.diff

This is my bisect log:

    bad: [1f318b96cc84d7c2ab792fcc0bfd42a7ca890681] Linux 7.0-rc3
    good: [05f7e89ab9731565d8a62e3b5d1ec206485eeb0b] Linux 6.19
    bad: [1c2b4a4c2bcb950f182eeeb33d94b565607608cf] Merge tag 'pci-v7.0-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
    good: [6589b3d76db2d6adbf8f2084c303fb24252a0dc6] Merge tag 'soc-dt-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
    bad: [a60f627cf4ab474aebf15f62c55eadabab9780da] Merge tag 'amd-drm-next-6.20-2026-01-30' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
    good: [83675851547e835c15252c601f41acf269c351d9] drm/xe: Cleanup unused header includes
    bad: [71573db5ad74b2087a4688cd1dda73ff082620f6] drm/amd/display: switch to drm_dbg_ macros instead of DRM_DEBUG_ variants
    bad: [3235a5b72317be613b69e22c3b2c9f2bec546253] drm/amdgpu: Update MES VM_CNTX_CNTL for XNACK off for GFX 12.1
    bad: [e1b73b64271d706079370b58b81292dafd373163] amdkfd: remove DIQ support
    good: [2634ef1b8c00207dde5101e926241957aa5652b8] drm/amdkfd: Fix PTE clearing during SVM unmap on GFX 12.1
    bad: [af441be8b75deb93ded51c54b9a2ba1e048b1c91] drm/amdgpu: add support for sdma v7_1
    good: [69249b477b95f91e56bb19ec53707253899458c4] drm/amd/display: Move dml2_validate to the non-FPU dml2_wrapper
    bad: [ec62b7ded978957ec74add4c1feccc986e2baeef] drm/amdkfd: Uninitialized and Unused variables
    good: [c7062be3380cb20c8b1c4a935a13f1848ead0719] drm/amd/display: Correct DSC padding accounting
    bad: [d28e92093ceffb424b9b0e36bbd391c83b1cfe78] drm/amd/display: [FW Promotion] Release 0.1.37.0
    bad: [e1b385726f7f7fc75b6cd3c2216430de8a625a2d] drm/amd/display: Add additional checks for PSP footer size
    first bad commit: [e1b385726f7f7fc75b6cd3c2216430de8a625a2d] drm/amd/display: Add additional checks for PSP footer size

Thanks,
Calvin
