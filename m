Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775121;
	b=nZC/cj3iRri6oJGnIdIsVTkZAmLAHogPmMGBE0J6TAb/qJ9trKQTzt+dQySD8tNgfRsj
	 lEYtO7VsmNmVM7IpvoCGiepg87x6NtuPv7U7OuFWlLEpRCCD0AFSCfo06xEonU4G1a8rH
	 sVJ2Yxzwf/S09wMYx5Lbm73TkqC+CF1yl151rvuRVU+5ZTrLiXhDqfn5LmSHfuseJ76FR
	 GVnxO47y6Rj1wFSrwnBqoYwyLof1EtVQBLjAcrxF7Ihwnp9dXR9dfPR6Z+/Uo9WpfwYnP
	 stTIQSfoEkjBNgR4M5zGXm5XxEP/CNF/FB1p06nybyKqhGVJz/U+daoMLNaEV+ghMUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
	b=EDdS0jodgYEKLTUHxEpp13nnPgG6ZPrNBV3hluaQGNoW9YzG93091AVwBHIctdI/eUl+
	 hp8Wxo5ldOD22YfiYzYA5aJyobTQfhvPZhQqv9Re6vlnmAEzhjLHL53ysG3D0OHgWogGr
	 OBTIl0s9agXJrmsFLMTeWddCqHiNHrk9+Npgk9DnsUPLRE3KE7efUET+HzoXSe+ZFW7MX
	 FJaJh2/x07EKnCDzdxyddQRN32wUgcR1k3dZm9egsghvhSIa5uFhCNg5KSe3gF/KevLSu
	 QalBp+N9i5hok2sB01thqeKgGks4ocp3YPgRfSlqhMKxZTNlg4V9G049YWYK44Ff4ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k7Z/VMXd";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23384606A321
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23384606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k7Z/VMXd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3631164f8f.1
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795775118; x=1796379918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
        b=k7Z/VMXdDPfBMDfXk1TT6iwXCaoCXP1oR/Cx+ko82GXT3DtrbZ4GNP+preXLs0Bd00
         xpatlcS30Xd2uFB/gBhyW7YrXc8SUd15si4uu52V+/aTD+ztM70DpStUQmdbnHREgyxq
         oF2m3q4sctOcoPfvqYPjGcdU+H5otmltA+GwPSRhyFZhghkcZ7sPm0LzcX5jewGaP4/y
         ZgBBj5y822HsfbLcLek56CYssVmrM5b8ZVy8BisQJH1KZOTZvR68NCZKqtG8FgxJL55K
         mta67ztd2HumTwByD3cPqdJgPomou9WUBpABg3YvryA+iTx2Ndyn4FlcYvzYaQEPv1/p
         MIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775118; x=1796379918;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
        b=AX38zuhcmlKyZ592+sSshTC3R6NZuBRxXOx48mYJA5KGKCuNp0kpNSMzu3zXdSDRY5
         DH/1dd0YNR5gktRz4atLWBNLFUNSyNnzATcr0iYaFSpVYMkMq/LmdN/tHXoQnHpesLw1
         FMqyMTXLS3P2L+oeq4QyN2eIZcCWNk9xqxbC7Xr+oy4LRXOFJ4PwXmXBzBpSJ4HzeLxW
         D9zenpNPNP9oeuZgVt3CMs+kUQOmkIwnsUTS4HzYuFLoVVSmsGobV5xmxpIYHfHG4o4r
         KQl0bADryCo35k9YxW63O9T5LEOdn0Serki10YtUxEB7H51E+F/uaZubK1nePlMHLorh
         8hcg==
X-Forwarded-Encrypted: i=1; AL+hErF4rHJGi/fXrlFBCrf5RqJMjHIEIbPYjjFa27T+WBo7Eso9wNM/zkNc5GZ47dtn6KOmP111@lists.linux.dev
X-Gm-Message-State: APuU4Z+RvLOODktkrBLxe4+R8RygbIiksiHJ6ydmudQDI5nU4z/mvupT
	5ooQ5UZlGbojkcgLU/YPSqnY/kMbtS/r0ljxlDMS4L5/SgRTysejD1x/
X-Gm-Gg: AZFdTZeA5b++mhdgXhKTdao+sC4wWpuU7mVZtzqgxIR7m7D9R4RbWr1yP68hcUjLgo3
	7baEjS8VF5H0mnIDZPo/GNWINb603SkrPdDbkssP0fdeRv7shuKutXK78pkH2cjB2OcIPePnJiA
	yxWrNM2gNH2InL1JGfkabYSwGESXnZ2sjgJjw2bNXPqiDheQINnAJuygE7W6UOIbvxgjloB0+d7
	6BQBLkkdsI1KijqSdvRUmHOea+nphUtUvJMwK4ARs4R1ee1vbMH3i/t1V99tv4ezBBp/fQ0LoWT
	U3CtKWoOJJawlpq3cb7CwoiYfjwciHRGJ/1enbFsBU4haT4kt9laJDmjCSrqmilsFJPoIGYwE0m
	ErxK+1B2yRX7vcncvSPx3mUnKwrSL3LmD+RE03QK2CVC3WNvEA9eQHrirKMCeD0hW5PpJK+fKyn
	+DfNyxxO9J9db15Y7oa7VzXM1DS3JZNM0dKRpYUjzy6k5lC6j4dATTy9FZ2ZzQ0va2fEwEdwHqd
	YNUmLV55xsy0Uri21H7WzLkbWq3HetGIBtXIzolukTUmzx7J2XrxbrfBWTQygnXl1pX5c5uTN4S
	2tbi5nYhVZmVbXxaVbuxbGK7UJ2A5mg=
X-Received: by 2002:a5d:6f13:0:b0:4a7:a7d2:eb45 with SMTP id ffacd0b85a97d-4abb6d04777mr42212072f8f.44.1795775118151;
        Fri, 27 Nov 2026 02:25:18 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm46450608f8f.41.2026.11.27.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:25:17 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 12/43] drm/vkms: Add KUnit test for device lifecycle
Date: Fri, 27 Nov 2026 11:24:57 +0100
Message-ID: <awlZ_hnb32taepmt@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-12-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-12-21194cda2468@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 12:28:55PM +0100, Louis Chauvet wrote:
> The configuration objects are now reference-counted and their lifetime is
> driven by explicit get/put calls. Add tests aiming to spot UAF and leaks
> using KASAN.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/.kunitconfig          |  10 +
>  drivers/gpu/drm/vkms/tests/Makefile              |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c | 280 +++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c                  |   3 +
>  4 files changed, 295 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> index 6a2d87068edc..c9752bde8487 100644
> --- a/drivers/gpu/drm/vkms/tests/.kunitconfig
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -2,3 +2,13 @@ CONFIG_KUNIT=y
>  CONFIG_DRM=y
>  CONFIG_DRM_VKMS=y
>  CONFIG_DRM_VKMS_KUNIT_TEST=y
> +CONFIG_KASAN=y
> +CONFIG_KASAN_INLINE=y
> +CONFIG_KASAN_VMALLOC=y
> +CONFIG_KUNIT_ALL_TESTS=n
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_OBJECTS_FREE=y
> +CONFIG_DEBUG_OBJECTS_TIMERS=y
> +CONFIG_PAGE_POISONING=y
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index d4d9ba8d4c54..a7810a12c9c8 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -3,6 +3,7 @@
>  vkms-kunit-tests-y := \
>  	vkms_config_test.o \
>  	vkms_format_test.o \
> -	vkms_color_test.o
> +	vkms_color_test.o \
> +	vkms_lifecycle_test.o \
>  
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
> new file mode 100644
> index 000000000000..7f7b31368710
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +#include <linux/string.h>
> +
> +#include "../vkms_config.h"
> +#include "../vkms_drv.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +#define LIFECYCLE_ITERATIONS 50
> +#define STRESS_ITERATIONS    500
> +
> +/*
> + * vkms_init() may already have registered a device named DEFAULT_DEVICE_NAME,
> + * so give each test configuration its own name: vkms_create() fails with
> + * -EEXIST otherwise.
> + */
> +static void vkms_lifecycle_test_set_unique_name(struct kunit *test,
> +						struct vkms_config *config,
> +						const char *name)
> +{
> +	const char *new_name = kstrdup_const(name, GFP_KERNEL);
> +
> +	KUNIT_ASSERT_NOT_NULL(test, new_name);
> +	kfree_const(config->dev_name);
> +	config->dev_name = new_name;
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_default(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_with_overlay(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_with_pipeline(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, true);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_minimal(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(false, false, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_writeback(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(false, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_stress_many_cycles(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < STRESS_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_interleaved_create_destroy(struct kunit *test)
> +{
> +	struct vkms_config *configs[5];
> +	char name[64];
> +	int ret, i, j;
> +
> +	for (j = 0; j < 20; j++) {
> +		for (i = 0; i < 5; i++) {
> +			configs[i] = vkms_config_default_create(i & 1, i & 2, i & 4, false);
> +			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, configs[i]);
> +
> +			snprintf(name, sizeof(name), "%s-%d", test->name, i);
> +			vkms_lifecycle_test_set_unique_name(test, configs[i], name);
> +
> +			ret = vkms_create(configs[i]);
> +			KUNIT_ASSERT_EQ(test, ret, 0);
> +		}
> +
> +		for (i = 4; i >= 0; i--) {
> +			vkms_destroy(configs[i]);
> +			vkms_config_destroy(configs[i]);
> +		}
> +	}
> +}
> +
> +static void vkms_lifecycle_test_destroy_uncreated_device(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	KUNIT_ASSERT_NULL(test, config->dev);
> +
> +	vkms_config_destroy(config);
> +}
> +
> +static void vkms_lifecycle_test_double_destroy(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +	ret = vkms_create(config);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	vkms_destroy(config);
> +	KUNIT_ASSERT_NULL(test, config->dev);
> +
> +	vkms_config_destroy(config);
> +}
> +
> +static void vkms_lifecycle_test_create_after_destroy(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < 20; i++) {
> +		config = vkms_config_default_create(true, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_connector_ref_outlives_config(struct kunit *test)
> +{
> +	struct vkms_config_connector *connector_cfg;
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(false, false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	KUNIT_ASSERT_FALSE(test, list_empty(&config->connectors));
> +
> +	connector_cfg = list_first_entry(&config->connectors,
> +					 struct vkms_config_connector, link);
> +
> +	/* Simulate the rmdir while DRM hold the device */
> +	vkms_config_connector_get(connector_cfg);
> +	vkms_config_destroy_connector(connector_cfg);
> +	vkms_config_destroy(config);
> +
> +	/* The connector must survive, detached from the configuration. */
> +	KUNIT_EXPECT_EQ(test, kref_read(&connector_cfg->refcnt), 1);
> +	KUNIT_EXPECT_TRUE(test, connector_cfg->unlinked);
> +
> +	/* Last reference: connector and configuration are freed here. */
> +	vkms_config_connector_put(connector_cfg);
> +}
> +
> +static void vkms_lifecycle_test_connector_static_drmm_release(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +	KUNIT_ASSERT_EQ(test, vkms_create(config), 0);
> +
> +	/* vkms_destroy() runs the drmm action, which frees and detaches the connector. */
> +	vkms_destroy(config);
> +	vkms_config_destroy(config);
> +}
> +
> +static struct kunit_case vkms_lifecycle_test_cases[] = {
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_default),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_overlay),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_pipeline),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_minimal),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_writeback),
> +	KUNIT_CASE(vkms_lifecycle_test_stress_many_cycles),
> +	KUNIT_CASE(vkms_lifecycle_test_interleaved_create_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_destroy_uncreated_device),
> +	KUNIT_CASE(vkms_lifecycle_test_double_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_create_after_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_connector_ref_outlives_config),
> +	KUNIT_CASE(vkms_lifecycle_test_connector_static_drmm_release),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_lifecycle_test_suite = {
> +	.name = "vkms-lifecycle",
> +	.test_cases = vkms_lifecycle_test_cases,
> +};
> +
> +kunit_test_suite(vkms_lifecycle_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit test for VKMS device lifecycle, aiming to catch UAF and memory issues");
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 24572bc779b4..f73f136e5588 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_colorop.h>
> +#include <kunit/visibility.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_file.h>
> @@ -252,6 +253,7 @@ static int __init vkms_init(void)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_create);
>  
>  void vkms_destroy(struct vkms_config *config)
>  {
> @@ -271,6 +273,7 @@ void vkms_destroy(struct vkms_config *config)
>  
>  	config->dev = NULL;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_destroy);
>  
>  static void __exit vkms_exit(void)
>  {
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
