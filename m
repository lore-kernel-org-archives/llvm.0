Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E653AE1BC
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668562; cv=none; b=ZD+NRXdWXKiEX8I6DWsvQqyWmvSJ0nWJqBkcPW4R9Hv78m9NSg3RFKMTk4lR7WwlM1eZknTA4Y96+x2vdJSV2ckFV+b/zN2HIMFZtiaudIxsP1cEXltFIE1tVHs8+ClN4HCS1PITO2sYZjJOcBy+LWknBkbJM0RuoyDgK2B/o1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668562; c=relaxed/simple;
	bh=FZSe8HgfY7ih+9qZIOV1xDysbmaDeK5MObFJHVmEAsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VkjgQ7uQU66irOxvJLZ/O3Rg6uIzb/UoNT225PYaz3V26TECRDFPlb7RB4WXexDhWdfi3rv+hwVGBMkJ0mZKfDpThs7Y16+Xzi/Fy6+9GPuhTJdntXfkXyArXSxLhylv/0C2ugmo+jRRfSTImcHoQp4iKRNWXDhB58EjtUIwYP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFe/6gBz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFe/6gBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790668558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
	b=QFe/6gBzFuc+XqWjyQ4UHHj5MNYd5nY1wwrGFbHxJsdZPswNvKMSawZxnvfzIYOYnf4KKS
	TzQhxl23NVbrGV9ykJyF8GDZW0ZZjlczmgNvB4jRDIGhIfnAvZ1QouwKXLbNpOVrcnQJxG
	j9SR8GGnpnIIWDxT5k8rjuBI794u7ZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-VZP83KShMpO07y5DKVNNPg-1; Tue, 29 Sep 2026 03:55:57 -0400
X-MC-Unique: VZP83KShMpO07y5DKVNNPg-1
X-Mimecast-MFC-AGG-ID: VZP83KShMpO07y5DKVNNPg_1790668556
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f9d150c3so2169675f8f.3
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668556; x=1791273356;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
        b=X3QM7aIZn71zsb8tPzt6dCswnc1hmXh+nPfZl88BezA1P6SXGDOxOOyq3kfoVY2jE+
         NR/xRxgg3kItbvPNmEe9EW2BVoGM4VoXp8mUzn5PhfbitcSgdScaO5OBr4yhpV8sxRtD
         OwekLVbwWXPCDgxPp9wSR0r1ub1MWCK79TsPAnN/h/6n8+93VrSEc5q+XSmVJ2CSbfcF
         ZtT+tfXevHBfJvIJ7HuPu4ZaDF+6oEfOp5ndYfOiDZSZ7NSJoJCCfnSE659axVLjhGiv
         POQisS4GGvV6eAPEFtoqrZFZaJvHNmY54i4gv8Hf5O7ubRGcc+oXOhcsSqfvZw8l5WkE
         YHyA==
X-Forwarded-Encrypted: i=1; AKwUvBzWC5Fl0unlB37yJhOiQfjXCHfgtDRdBGL/IfTCCcdtp8j06RLA25NdAzEYow9fMVBatbLH@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7vCcUl8PxmjBK/kaj4FqEenhSYZxcSY7wfSML3ryFr4wzj4ld
	nsYCH3DG4yp+/b0ReWFKgKLBT9RFMm+5Qvg6JxVcYAR89Oa90QHDDzRXMfxHAaXuqw/dfQiI1XA
	aftxWRzRpSPX8ZzD7z/GH2BpZOa28dRmeORwqrphRyDr/ALVXd0YLGwc=
X-Gm-Gg: AYBFou2wHO7SDapFBH0UAZC9BNBFhbuOpzDVulQjjX2d+NHN6grk2kbrbk1IuppfykE
	UJX+1EbWxDiJEr3u99rTOndSkjZWHo5kgAqRERjm7exBvsaJL5ROoE5cYfnZD1VzJSAblvu7jr4
	rw+1ni/ODpAcIW+2z6oQMS8lxRCjiCjo8TCWDKI/uMjsEFaFBynUU8gkEoOogEqrDktzYWDR8aS
	lMwbietiAiExIP+EaMnJwZC86/wUTVZ7qz5zbK2nUtPerZEdCB4wnY+j3ox7TIyurR7tpVnH00Y
	PRD79WyuU7TAWBCi2E4NKWuT6gnN5JYN7RTJmWW2OicxPGde5ccd0fwA9sSmWEjvKdSWsbjqsht
	T2za+7cz2aT8kGorVkOMQJsshKtm64zBxhvbfB3P9J/aQ2UixDlGRyAIjeJGpy2Nqow==
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549844f8f.8.1790668555912;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549769f8f.8.1790668555384;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f88352sm2268962f8f.4.2026.09.29.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <artpBMeM13Dd0lLy@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
Date: Tue, 29 Sep 2026 09:55:53 +0200
Message-ID: <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_9drI1njbtEIrfzaoFa1gIOJR7W4m7Gw52Pgz7RF6Q_1790668556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>> > On Sep 28 2026, Neil Armstrong wrote:
>> > > On 9/28/26 19:24, Benjamin Tissoires wrote:
>> > > > On Sep 28 2026, Neil Armstrong wrote:
>> > > > > Hi,
>> > > > > 
>> > > > > On 9/28/26 18:22, Maxime Ripard wrote:
>> > > > > > Hi,
>> > > > > > 
>> > > > > > Panels in general, and MIPI-DSI panels in particular, are pretty
>> > > > > > difficult to support and require pretty much a panel driver for each
>> > > > > > panel produced. Most of them are pretty simple, and require an opaque
>> > > > > > initialization sequence that is usually poorly documented.
>> > > > > > 
>> > > > > > This creates a tension between OEMs and distros because OEMs will
>> > > > > > typically get a new panel to react to a sourcing issue during
>> > > > > > production, and thus need some swift turnaround between getting their
>> > > > > > new panel and it being operational in the OS. Distributions on the other
>> > > > > > hand can take years to ship a kernel with that new panel driver.
>> > > > > > 
>> > > > > > To solve this, I followed the example of HID-BPF and wrote a panel
>> > > > > > driver that will rely on BPF programs to perform the panel
>> > > > > > initialization. That way, we can ship the programs separately from the
>> > > > > > kernel, and with a different lifecycle. If this driver is accepted, the
>> > > > > > plan is to have a userspace component started by udev to identify and
>> > > > > > load the right BPF program for the panels found on the device.
>> > > > > 
>> > > > > This is kind of late for serious applications except if we manage to
>> > > > > solve the bootloader to Linux display engine transition.
>> > > > > 

Besides what Maxime already mentioned (that most general purpose Linux distributions
built the drivers as modules anyways), it doesn't have to be mutually exclusive.

A simple panel could be supported using this BPF-based driver and then a panel driver
added to the kernel, if is found that some applications need to have it built-in and
earlier in the boot path.

I don't see why this would be any different than HDI-BPF or other BPF-based infra,
such as sched_ext.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

