Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446022;
	b=FKFk+2xYOa/SlTCU5UNIplbIbsopm9ebOUD4fzhh+gLSobeDMBV2CYJ+ABeeoualwy0N
	 1zjDa/2GOfbZsoJgfDnDJQhUrWzzMfTc6YYCyQ/x4T/HZx2wI0IPPnQjaAz7+B+cTmI7A
	 andVWPyUNoiP4FUFTzvxNGDmRSyGKexhWR6xMFfI3Y4Idv5EtBX0jFQUindWoTxem7JeL
	 9Bh149kmAHmF5OkX7IaIVCZpmRvtYvmMkij5uv7zgnU4yMzAZ53mYuhyOJf6IIYHXWtr7
	 xXkdf/NDKd0PD//QV9In1wrJAOs/Jo3Y7huiP4HDH7RMhbL3eEacVSmNKCfKGwF30fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446022;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=byP1kMDVZHEXOHaPsdzqxrOuK3QLySv9pjAZMI2VCWQ=;
	b=dlydmwAXNvE93eNkQXl5slsZt6BzjY4krHnIFTEfDgrT0wtlwTKth6bELGEMrgtWlmWy
	 I237jo0OsMUF39/sTRzqHChL/akEGkqO9sWVSzLBmW/NWdtJauuh3QVUnt7j/+E8Tl4MJ
	 btxoPBN78Al97Wl624grbDXDfC2//zTDgPqBJs2AbQxj45jcc2diAyPEyjxDOMckuPsjx
	 0wDrh1XinLvnkYa6ZjWAnC3AbPq8UsRqf5a2k4SOMTSSpOWJT0DBxymNKKVOjn6dPb5i6
	 0IZFpQF7Pj6qjxZyOP3SqAXG93ZRlLUgQIRsTpB/oB43q9EXpGA1qHK6UXYS9ORr76g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9RoxlwF;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4C606A321
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9RoxlwF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF6111A1795;
	Mon, 23 Nov 2026 15:00:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 952C0601E1;
	Mon, 23 Nov 2026 15:00:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D950811E68EB8;
	Mon, 23 Nov 2026 16:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795446015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=byP1kMDVZHEXOHaPsdzqxrOuK3QLySv9pjAZMI2VCWQ=;
	b=Q9RoxlwFV/d7u3pieMNnWNcAZHglsNUae4Eh1WJnS0nCUIFvoSZB3cmzBOOr0ZH99awg+T
	islPHguKhHYqVdkKu4dooqt+kDfirixH6wFTZ3FY73v0hvN1c7zO2JeQqVX5SWMP8JsUYg
	g0lGE5MYSQZMJhLLZsUa36jmO7AnlgjUjQuHDGAalDYCnqga6HG0PdAbMKsL/9vuaWV21R
	5pc6tph3UobKuaiAjjI2ENhlOri/5EQU3qdyFgcoyGWnmqnfstRRXwRK838byy5hmadLQz
	fdIB10/niK5sJ8IcgVAKvTt4o65XAJUmJD8yjAb/PShd/XHlOg0S68ltfAFrqA==
Message-ID: <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
Date: Mon, 23 Nov 2026 16:00:04 +0100
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
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
To: Oarora Etimis <oaroraetimis@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
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
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
 <awRQxKxzVyw10pFr@ArchOarora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <awRQxKxzVyw10pFr@ArchOarora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 15:56, Oarora Etimis wrote:
>> @@ -265,7 +266,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>>   					   &vkms_plane_funcs,
>>   					   vkms_formats, ARRAY_SIZE(vkms_formats),
>>   					   NULL, vkms_config_plane_get_type(plane_cfg),
>> -					   NULL);
>> +					   "%s", vkms_config_plane_get_name(plane_cfg));
>>   	if (IS_ERR(plane))
>>   		return plane;
>>
> 
> Small one: with no name configured,every plane ends up as "null",so they all look the same in the debugfs listing. Before this patch, the core named: "plane-d", which was pretty handy.
> 
> Could we keep that fallback when the name is missing, as it can improve readability? :)
> 

Make sense, I will do it for the next iteration:

if (get_name())
	init(... %s, get_name())
else
	init(..., NULL)

Can I keep your R-by with this change?

> 
> Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
> 
> Thanks,
> Oarora Etimis

