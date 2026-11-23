Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433249;
	b=18Do/qebSo12MT54h7kJOx/7zeYU7YRkBlw7BtKAzCyZMDiMNa+1H76za2CXyOOzd8tN
	 QCYMIqWWJbwvJdydci8esDzzZEFu/nzy7kjHBbNH1pK+EbqU4WYLqEkiEDerLiWZPwniX
	 hdiL/RxmdDo8oCjFR4ylUofK19QD8mW57A127j7WES35khq8gOD5hhFcg1r5t9RjxmrZs
	 McenaDO/236yv32foMMvSwig/uLe81qLhAghwCfI0XJtw+jPIcNG2S4xtqFYr8m4PBIVy
	 5csj1QddECUPn1pp4d8AhwASewweRvoXLv9Yqg3Xv96IoMM9zmS2s5BuXIeBeEIm9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
	b=a3oDvbOAvYRxfkPZkcSPTA9i8Re8YeP1V07uhwaoHB5XStSePFAwX3q+RQksIl1IoInb
	 VzVXBt5bPPMd8h/AvaBztPo11hHKi4+6gONdMcQvBBRGYhxipas7TspM4+ieNMgJThGkG
	 8/Gs3LonmdJCvZFNnyg3SHU+yH1M4VUFZXSIMUwm8uhkBO224Q6hvizmIra+LnEktO9qd
	 rcvkDx0x+CzYO8jxmxh22pB96EVuAgpyhCy3E6VQXXb4p9l+mPlq/B+DC/h7qkSIQhkhh
	 9YIuXfYI3tv5vdxtoFf/OznB7Eby0nVFlo727hpjZQvW9V71SGNqDmelUdMMi9oKpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9ab+rl5;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C9606A31F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 11:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9ab+rl5
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so24466965e9.3
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433247; x=1796038047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=w9ab+rl5bHRElnQmH0snXRphNr6mDX+5tcaBX1PvBP/b+Qf40LZXjMkCP5eKKWUHh9
         A5EMN9HJlYPJbJtvujbhrQ73O2lDmUlzAFtIn+p4upMswRG/Oj6hgTGBlNWW/9rKp4Uc
         HnrnOmsWcZV/3GLxgK8n57aLPGFYiQnIL+Mi5ugY3lbQx+ex2HA46vfp0wwMWoIhGrSQ
         aNCFzz37yZjXyjz2Km8hmIhEv/V9BvfsYzZervVYA/QISBOjBRzzvmVM258p01GJM/cu
         LRjYU6I+20GcLwEiQI8/nB3Fkfjhv3xcECW34SNpbadU4efSpJ4tHrtdh/2EC3v3gsay
         +TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433247; x=1796038047;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=AwINM0qt5OVJjEcAijcMBbKl6ZsP3KO9LSJCjoNIkIMroUan3r54QXr3B5MyYykJ2Z
         5ly+TdV1fx1cuxcY+B2Wo4PePNYbPk8y3dff2IgdpmAKSum+bTPRgCNhI8445jLVt3e6
         F0hiVbbfNS4MBLIxbmWBTKJTrmtVZk+252QFHo5YuWopIIbjfwrmwSEU6EEc4ARJB+P6
         h/tbal0g0x6kqTUGY1FyVVEo48vEahWNSHYTmYeQPUcGjzZRc/cLYm8D6riZt+KtjKmd
         l26n29CFtNb+rUEDT/UJu/PLgrbMDKHl5/zmot/YE4Bp9dsVOICaNBkHN2JyUyTigMoS
         eLpg==
X-Forwarded-Encrypted: i=1; AL+hErF9PaPpBNqkNuViJ/GxHz7ncmR3X2pyxbyp8RuQIutQvLpmjk20sHfSNQd37/tzPmJy94op@lists.linux.dev
X-Gm-Message-State: APuU4Z/TYHV9k041PmQFF1KWP86dtkGAXgjo5POepK1VAOPsKacyfQ9l
	Vma+5ccPgu7c2ie8V1C7cNnkG+KsxGOG52KowoLeQ8AFAY9jqsvSl/Xr
X-Gm-Gg: AZFdTZfEGVbMhiKgk7D9Z2jq7MftvYVhGASH6PGayhECm1Wy46j9uu4Hh1H0RTGGSur
	pfch929HSgHrDzl/l7LvdSW+ZyVp/RQHEqZicB+zg7VY8D9xt1AovtBtWApLSu5wWL/e14KMTqj
	8SAhNH1KTVnpfO6xS5EVwGDLQeQ5apLmWReAV8iXywHJ9R7iUWrdYl/RFap/XzRm26EXe8ewLx5
	0KYIUyaXcLzb7boC3DZlQFwebBpD6DmHSJyI26xlq3ZzO7sNYhoPrgLxQyF3A6zIopl9kSn1Ehz
	rgxS0ONBTPSz4n5p84Mx7uDP9kVY4tsKV9o8HsnVlaw4N/HSySzsW6T4J8zmLDnWcRcHAGIs6ho
	7gW0H6ZwVy8q31+9ynPQ8vfxC7QUh/e376YF7SfmFxU9NHoAXntT47UnMXQVulVigS5h01PL9NB
	BPcnAFr8skiEJtNDafMRBTXU08d7a8xTUss9dMUd9C2CLg2XX/TyWCmvYn+qpBV2ihjqEjejt3K
	W8lZhRnD8DUfujnlwzKn0Xpw1D/zqWsCQ7J5YhKbEYA9SVmQ9ANRFF4I8IHcrzIp+bcjRwHBTjc
	z5KlozWB3cJZDdk1ZSuejoQxDoUmOydMyPPYxgiIZxyZT89Q77MBuMPRhwvyE8j1c01QrAT35RI
	KlAwkMd+TdVv6wRyHk2ZxPo8F
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr221650055e9.35.1795433246798;
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Received: from ?IPV6:240e:47e:509a:b87f:26b:b35a:8dbf:81dd? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm336307275e9.5.2026.11.23.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Message-ID: <2f885fbf-1887-4740-a7ee-0189d74260a3@gmail.com>
Date: Mon, 23 Nov 2026 12:27:12 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: Re: [PATCH v6 02/43] drm/vkms: Lock the config dump against
 concurrent configfs changes
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Louis,

 > The vkms_config debugfs dump iterates the configuration lists while
 > configfs can concurrently mutate or free them, which leads to a
 > use-after-free. Move the configuration lock into struct vkms_config and
 > run the dump under it.
 >
 > Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via 
configfs")
 > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
 >
 > @@ -347,6 +349,14 @@ static int vkms_config_show(struct seq_file *m, 
void *data)
 >      struct vkms_config_crtc *crtc_cfg;
 >      struct vkms_config_encoder *encoder_cfg;
 >      struct vkms_config_connector *connector_cfg;
 > +    struct vkms_config *config = (struct vkms_config *)vkmsdev->config;
 > +
 > +    /*
 > +     * The configuration lists and fields are concurrently mutated by
 > +     * configfs (creation, removal, attribute stores); iterate under the
 > +     * configuration lock to keep the iteration coherent.
 > +     */
 > +    guard(mutex)(&config->lock);
 >
 > @@ -711,7 +709,7 @@ static ssize_t device_enabled_store(struct 
config_item *item, const char *page,
 >      if (kstrtobool(page, &enabled))
 >          return -EINVAL;
 >
 > -    scoped_guard(mutex, &dev->lock) {
 > +    scoped_guard(mutex, &dev->config->lock) {
 >          if (!dev->enabled && enabled) {
 >              if (!vkms_config_is_valid(dev->config))
 >                  return -EINVAL;

Now that the dump takes the same lock, holding it across
vkms_create()/vkms_destroy() closes a cycle. vkms_destroy() calls
drm_dev_unregister(), which removes the vkms_config debugfs file and
waits for its readers to drain, while a reader in vkms_config_show() is
waiting for that same lock:

     echo 0 > enabled : holds config->lock, waits for the debugfs readers
     cat vkms_config  : holds a debugfs read, waits for config->lock

Also, vkms_connector_detect() reads cfg->status without taking
config->lock, while connector_status_store() writes it under the lock
and still allows the write after the device is enabled. The kref in
detect only keeps the object alive, so these two are a data race on the
same field.

By the way, Fixes: 13fc9b9745cc looks wrong -- the device cannot be
enabled at that commit, 64229b846a7e looks like the first reachable
point.

Thanks,
Oarora Etimis

