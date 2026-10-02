Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082E2773E4
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926664; cv=none; b=aPwlAOX7AjLcCygnr39ganWNuuZt/35CglxJNvg/ZfuPI3BzbJz2dDC1g/pOXc9zZ4XXJLjeivIIsIqaKMgB4CWEhEaJ8DHjZ+DIDNPPOseWuXBnRPYiCHZQ/PH4kSwN9ipI1IZuglYmKgM1yGAwUIkG5tbi2pYGJM0hkcmC2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926664; c=relaxed/simple;
	bh=sYAyqQ6f9bRmVhsxj1veuLunk3nA6ckSjNhuKUxpq88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rS0YeXo3BiwooZ23XUWjRe7o/BFLj59iW75UZAn6oVUiOsOlqZM72dHddtbiN8i1gbiuba7D9prkn2Z+ZbmUblu7m/2zOZDWeWhh2H41WbviD0tnrBSMoNWgfUWGdJFMylth4Gx0DQQ7fd9jIVOKz5h71b4u6r9aXQgoJU8Tmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWZxQ6cU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWZxQ6cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790926662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
	b=EWZxQ6cUE+CJ2uDDFjubjrlIYY3GLy1X3MSekZmdFl5YK8f/4AjYbqTi4QyihkvNhqF8sI
	dhhodhftzhl+TX36Gv3/kWKRlQgDqmYo0wLHC6ncbliWu0yr/wWoLTOkmp2rRYM4qY+M4Q
	SveOuTxdK2aI3nfi2aaXSjWMBZM0gao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-O9YUhLx9MqCHJq5ivDVO0Q-1; Fri, 02 Oct 2026 03:37:41 -0400
X-MC-Unique: O9YUhLx9MqCHJq5ivDVO0Q-1
X-Mimecast-MFC-AGG-ID: O9YUhLx9MqCHJq5ivDVO0Q_1790926660
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so27697015e9.3
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926660; x=1791531460;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=Od3ZlFyAySrlGXo9mUJjbSUs4rcsXx0YeZ3FGF8vfnxLIA706ZM0LE7o4JsYJQkoNh
         gqVbi9f5ZQstK0xhpiFbcMwAp7JsiHU/C8+Pm2Z4citzwWbOq3Iwm7PGTBCwiovwTw3/
         XCFDOP8/E9Yp4oQkl3e70RspyoMSZatZE+gK87B3TdZheGq8tdaBEXkSqoIjlWHn1fU3
         HozkQouRp8RGBx631mz6Y17qRRuNTzNA7bSh8Eg+41oNWEoxwP+nyV3gMl57e7UaVrgP
         YQSWEROqXyQTbaHXd7eWTgw7sJAjXGMl5+LW5lUZ6AWN4c7m00muSN69XHkyfsBBWViG
         e1Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwkh1PErMNa8/CpILC4P0pM3JojIHopcyDEcXwMXd39HrW6m9bDgLTkNdAPTneoEyHlbYlZ@lists.linux.dev
X-Gm-Message-State: AFuF++kq/+eZJTgqB62Pf7Kx5Cqrs9PBNgmsttECXXrJ9yKdiFfIGdwe
	2wUt8jKkqeGWGn7wHyfUkDcci0+W06vfR6t/AmxHCr05yUtKMAgiiu6S6jcw4r1XkqVgD78JxUE
	0u1lA0SOSpa4I93wBqF+WM/zGpr9E9RDd2RlLvSUV2n+Qin1RKcN2rys=
X-Gm-Gg: AYBFou3+7F0t43wHhr7wgfk1jsxXdlcPC2fLOEAiaYuPZW9jbTEVoKk6P0/U+f/bN9J
	WzZRSJ7n2LPOdegosKBO4LmW8GqyfTcfUkdoSF6ulexbMlcAfZvwj3+f4Adhzl0/KHtt9/FHW+m
	vQXmxjht6DadlK/OcR1HjfcBS9f/yfv5PSzikH2zCdz6krM/4cWFuFTI6j83+NNnA3UHvN6u9Ef
	8gA7XRPPrifrlG3xs66Td2Ww3iKmoXynSnfMtq38Ix4Wts7c+PmIihN7xmEYrRLGJh4ig8gYKMD
	a6xxxTay/Ry3MfLsSdXBcAABK8jE3aForr3XCExNKvsPa3L1flpfsTcJt8wRp7eHAKwBs5idz1l
	b0YmzXQgf20Lf2qvH/cJMCtFWWIGCwDcz2KUpktxlpzJ+jPCncd3XTWAh0/r7wVJ9XA==
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34251215e9.25.1790926659487;
        Fri, 02 Oct 2026 00:37:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34250535e9.25.1790926658971;
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm63581875e9.0.2026.10.02.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
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
In-Reply-To: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 02 Oct 2026 09:37:37 +0200
Message-ID: <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z9ZXES1o7cS5bpAx6QLOL35jCtN4g9lAe4PlmpiGOZA_1790926660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Neil Armstrong <neil.armstrong@linaro.org> writes:

Hello Neil,

> On 10/1/26 08:50, Maxime Ripard wrote:

[...]

>>>
>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>> really cool.
>> 
>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>> you can have a built-in panel driver that works without user-space
>> intervention. So this is not a topic of discussion anymore.
>
> It will still have users-space dependency, meaning the BPF files will need to
> exist in the fs when drivers probes.
>

It doesn't have to AFAIU. The BPF programs could be built into the kernel
image, just like firmware binaries could be built-in as well.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

