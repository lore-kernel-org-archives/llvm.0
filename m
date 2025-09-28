Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B988233136
	for <llvm@lists.linux.dev>; Sun, 28 Sep 2025 23:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759102164; cv=none; b=anJ++DvFXw05dwnLKFQnUh4IssioBwU6QS85mNWbInJ0js/ufe+Hg/rL42+G96ITtAXXWabV66mESm4Lg/5eQvPtxSxzpwi6x1/FEGlY9nBDWa24xc87ihkSLV6S8UUYe9oNFSxTX2DFf0Yh8DENjWn7FsT36THtA9/H5fPAEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759102164; c=relaxed/simple;
	bh=V/jzRpqEcOhYwBw3Dnxdh4YkMwhb3CbO4cM8jjUKGXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kbw1dChUh/1rshLXrDmpppnP4WxwWSWw9nJZzmOpUTAi6+4UVZ9DaUPt4Fapw43/NI2bp5B76S3F9dtlDRv5aNjaVDXV1+BZc0+GiibJDXaDUWoABdL7cQAbDSC+URMCb4k+rESHgaUgbKinrwOJwZ+wfHiq5hmQHI148vdZfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Do2WFVRI; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Do2WFVRI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-72e565bf2feso41083517b3.3
        for <llvm@lists.linux.dev>; Sun, 28 Sep 2025 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759102162; x=1759706962; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
        b=Do2WFVRIiY0u3xe8VbDOkmH9W3ygjvmSvvub4umq3vsGAaIgt45So5cCkt+w161JYr
         BmSif0ycWGOOkeamTu7vjk+uFTxERUG9QrB88lpN3ptuiY1ZGoRAI6RN6KyknsSlg3PE
         S6IhVRaU1AxClhVuOnwbjrdWdRgoWLa5nNvqt6UXVMqKpwVTnf0c8XClUtYJrnHG+V8J
         WR/wCxuPJTGU1kZQ9lMHHPamADA0vUaTh3vF8Z3KACqkuJ5Gq4ZlkigBsjRZ5RTwyfD8
         GlxDShyWw3VAx1vVl1/OYdCmKAr62JXeCd6TFL8g33KtzI/qglfZat/MzcW5XG49A2pn
         49GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759102162; x=1759706962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
        b=c6edh+xw7Tzm6NfWDpMmA7DN5DPw7/tGjzoZpu2+DlASAWQTvr+6cosV4XzS71tWod
         8Pmr51HjBODovIAfOgnSmwliYP34QoWI/GhScxxzLJMMOmnG++Dn06egcAU6dTa87/9L
         HqX1w38oXwJ1tcEOBD9yL+CvXL0zIB0goEGthz/XXD7lfF9TPsvp2otb6LnSAvyVCnrB
         6GlfmC/f5wgK/sJJ+VN1I7IKDrzVzLhZsmF7SS65QpOEhZ+P2aZKjxrKTEOfoQ1R0i37
         w0Vpzk6xRLASVKwHe1o3g5m+36yBlWMc4hzA6eFGukUWrR0M4AKFFNtGI3EwIAxTpJSS
         zkdA==
X-Gm-Message-State: AOJu0YxBtnzceW4OUvL6BmnlVDrmtA6EQs+MnwLZ8Ch6YYBvEBJOphC9
	P+3YcWm6Odsmq2gLDZsy+opi7enGTrsHcZA9hg4lJWzEN5XN/o5sdfOw
X-Gm-Gg: ASbGncsXQg9tTHgHkPxjHQI5tSpiMpfEZYHLKvXbdgvXe3czm4AjmVfeOVt7VByduD3
	iaXQHziKhEhxKqU0GIM6KXEeWNKPI7urvbwLi/5ChvY7Ouphy8GV4+/gNpB8KTWo0tK/BvD1iy7
	b/CBj/TynpfNBuIhhzGDA7cKQyT0N/+/Hr4/ais5OZr5U7kBaJJFEGi0d/5xuqscCGJPb7cWFN8
	kBqohtAFMYYh5kgQWea9O3jFlbxPk6m9s56nLu/CgWr1IKFTy0AHPCrGktQi7ck/vifO+H5Z0B1
	0gk6+wae4k4HLJjZ1BUrNsO+1K3tY1MlclmsRSaX8ojrwzgUrIS57TCLfGgpolCI46KBDQUpF2k
	hPgG5xm868ENWujP7DJd7qRniYSdd6wGpnQWW4LoV
X-Google-Smtp-Source: AGHT+IHskYhayDwfzsV8lkE/Uops7xgSMHfw6Sw7Fk1JVYa5Q3Ma+PAZWIZOs7Aj8ggB//5BDs9q8w==
X-Received: by 2002:a05:690c:6f85:b0:727:1d96:46aa with SMTP id 00721157ae682-76405202175mr180066857b3.53.1759102162293;
        Sun, 28 Sep 2025 16:29:22 -0700 (PDT)
Received: from [192.168.201.155] ([76.200.76.117])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d960sm2016142d50.31.2025.09.28.16.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:29:21 -0700 (PDT)
Message-ID: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
Date: Sun, 28 Sep 2025 19:29:15 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: kernel test robot <lkp@intel.com>, Sukrut Heroorkar <hsukrut3@gmail.com>,
 Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <202509272320.3K8kdDCw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/25 12:12, kernel test robot wrote:
> Hi Sukrut,
> 
> kernel test robot noticed the following build errors:
> 

Did you compile and test this code before submitting this patch?


