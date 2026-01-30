Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7E2BE04B
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785623; cv=none; b=Qhd3Gq3gifb8gsmC/k/bzVs4wvmkAjdfdAPsmGbafF6W2OhQ6laxAKyuCjM66ujRKbO9kLXAoyUkj82Nl3MPGJBKDCkbAlbhOM+sPCkhT9KXGtT4HK0cKaBvg4Up74pX0IodvaY2vnLi4H17txxzixG0tnJU/xNUdEuOuLrPuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785623; c=relaxed/simple;
	bh=8J/ffOpUqzqBEMKpZf6ikhEkgDDSWtVMQo8Xj/m34vk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxU8WGuOBrVCKCklSxoZvtu3EgbPMS/hhvG+bfiJBd5sblhjiB1cmam7CSQkiASFM0UEhc8AxcqV+EMatnXZ6jPrtmJ9+F2FdTVKAYBc255r0ox+NK68w44nB8fe+rp+MwD5qT+9A775azXCSFhAT39qJci2r2La99iFGXqLafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjUkBmyZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjUkBmyZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48068127f00so18964195e9.3
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785620; x=1770390420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zONlo3vJkBl5ujY/5KUHB9vDfxClAt4ztGCRSwPclIk=;
        b=AjUkBmyZN4YqhjzQzpIjEU1XUB44qSlXEShVvy0oZCrDr6ng590jNefEFnxeSFfXmY
         o/gx5AgPkFbnH4rGj7sPCrG3ZI7Q5yYLGwedM33WSfRZP1SIAhN3qYp5u8mDpYoQba/T
         ZQbMBeVcYOybGPoDF9UQ8R6t5Zien/qxPwqWmfNfxON4Dmc4snHS6eRG/2cjcIYykj/T
         9RwlWtUwHWXVNXiaVBOzCX6hmwKBl9r25Vle2vBxwkYD67pPGQAIyJEJZS5rkuLcbdyE
         c++Jp7CGcule8gVcvytxKa77Bz60a8RWQ2FQAl33naLwQsr5VY2P/3en6VwhKRJLuPCL
         SzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785620; x=1770390420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zONlo3vJkBl5ujY/5KUHB9vDfxClAt4ztGCRSwPclIk=;
        b=GWzuuCYIqtmEXwTgJa9oX6PlsTV0Lfdtx8GanmnRvL8xHlKRIrOuplJVwmsHVNfRhU
         ii+2BMrXUlkc57ofB5QbEren+ocuSdDSmuC1BdNv0+OpDmbPznXV5IPZQ7uIoirqMbU9
         +5hyCv2I7k8SQk2NMD2CInOuhtY3yuDoM9n81NsA1OuWF9yw0+V/tGV6vplje5b93Qek
         J5+KenoWCwMT98Jv5Ank8VVL0yCmob5UUDX/bHAx5denX/k7/VGJh/5ai2vwYQoh/uJ6
         lB6zml9TUBvtnGuGdqZbPG/Dhl8DhgS93IV7b9d3J0lppc//cb+HExRbM8YrcPqZDSuL
         T17Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMH7KYDC8dlfEE7QhqTqkEn0Ed0sh6/aCsCnyX5JJSzNqp+5Sl4gbqp0LvKnXiNzmjwFt1@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8pr3fq4BFZ7rF7mlLBSGlYaFbuLG5D1vV7JLr1d53hJIKiAZK
	16B3GA8fcgnFWJIwQEKPzzEQx/+UEtq3vcjkbbdcdZ6BJA/AA8u5O2rQ
X-Gm-Gg: AZuq6aIklQeLzffF9aUISMh7v+XxrFCVn1XvQM4bGLFvUBZ+6+Iv2QhR/Oji8C0RNR+
	atJ1ZY/Cz0/0bNqieEH7WBBS4R9wl6XpR0tjsAFbaHKdb7iL/QkcA+pQDJzhDOULh16JmG2nj0Z
	Fz5yTSHU+OsfI4TnPIOOcPD16KplRAT6TMEVqKBtVyry4D57bgdldI8oKerILw8sXvCozXZcwIU
	NFPMsRDHIu2Kf6o+DSWbflHlEkimw0OA5uxfc9bulvGtpou3zfXgh7psX3PQU9xHdZmzYTsEXc0
	sEMT/6t9E97NYrAepeeOXf7/UuLakP++xmsbxU7gGqBz2K0PYQl7G6uXgNBVAdoN3HH4Jpz0WHt
	B7L2LfaCYTTteAk2caBhYYbGz9YwRtM4ldJ22ilAlB8ofp6xAd3gcvWBWXOiA7x4yTRgTKseFnH
	0/TszV+7cn3Ey36KS1Qq2EGR/bFKdY6S84v8kO17+iu00xIjlFeq4J
X-Received: by 2002:a05:600c:4443:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-482db4a0fb8mr41870345e9.30.1769785619829;
        Fri, 30 Jan 2026 07:06:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm22183847f8f.6.2026.01.30.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:06:59 -0800 (PST)
Date: Fri, 30 Jan 2026 15:06:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 1/3] arm64: Fix non-atomic __READ_ONCE() with
 CONFIG_LTO=y
Message-ID: <20260130150658.617b65ad@pumpkin>
In-Reply-To: <20260130132951.2714396-2-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-2-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Jan 2026 14:28:24 +0100
Marco Elver <elver@google.com> wrote:

> The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
> qualified the fallback "once" access for types larger than 8 bytes,
> which are not atomic but should still happen "once" and suppress common
> compiler optimizations.
> 
> The cast `volatile typeof(__x)` applied the volatile qualifier to the
> pointer type itself rather than the pointee. This created a volatile
> pointer to a non-volatile type, which violated __READ_ONCE() semantics.
> 
> Fix this by casting to `volatile typeof(*__x) *`.
> 
> With a defconfig + LTO + debug options build, we see the following
> functions to be affected:
> 
> 	xen_manage_runstate_time (884 -> 944 bytes)
> 	xen_steal_clock (248 -> 340 bytes)
> 	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs
> 
> Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>

I found this in some testing (on godbolt), so:

Tested-by: David Laight <david.laight.linux@gmail.com>

> ---
>  arch/arm64/include/asm/rwonce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 78beceec10cd..fc0fb42b0b64 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -58,7 +58,7 @@
>  	default:							\
>  		atomic = 0;						\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
>  })
>  
>  #endif	/* !BUILD_VDSO */

