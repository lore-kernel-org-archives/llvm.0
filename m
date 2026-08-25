Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706C42BEAA
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661204; cv=none; b=enHzceSr5h16eR4dA05Frgq8qCVaQ+P9JNZ9WH8jdpDjcj2mwk2oHiL0iPh+B8F2m2kToPS4wuQ3VBfz5d0fIp5Z2tB5uItV64rW9SwrLC+GEq6ddHdYKwAG/173gBFa1VUGvFqYVL7UdI78y3sy2pcbxWwuxneoazjIL3gwm3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661204; c=relaxed/simple;
	bh=/hVJ/GngUFEIrJj1pneqvp6NsIAhEby7tVzeKhTVwaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=G6sUoZDRaTRyK+BdWMeX4ks1wNaStlzk5q5UBQcWqh9QWPmgD6NNxEN3sFUU/uMH8s97jbU+7eLwoP90IkI1nLniWcABmnSvyi3hexOv1Y0UCNJgIVjRKokdVFdHAR/UudkegXTNWG9UoZcGd65dH1pN5ncL2sRjc2NFpzeQ4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f5d5dbf80so318567f8f.2
        for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661197; x=1788265997;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH+6UZUFe1kcLgyiyl2NSfgn3mf+CtObHj9vjku3NFM=;
        b=qakeAlL8Moqo67sQBhulGreEvD8GjR/JIcN3ykxqTmfB17Db2Otwo07CyM4gpJpAPG
         NqMRRvSKSPQJ+WxYmOWswLkOwrAzz+hxUv3vBig3i5LEHkCvRazqFOneC1w0b9zGSO8H
         ILWxSHlZlE3xLNzbbXCZWUlsuxv4ItLV4t8huN7Wv/zO4V/Bi/BRKU+voMTVe1+BFJR+
         P+xyhT5/ztZbyOjuTnXTyNXy/gKZBFgew7T7jSsX2p2ii6wJoqa+KeIEGwA+enWiamaw
         ifQoLldtZdbMtU5d5iolzhgD4kC3uPi6OLTvmHSeO/UjsdiAIFDF1SYifXr4VfLk3We8
         nyIw==
X-Forwarded-Encrypted: i=1; AHgh+RpAmrHteWmbQVgn0JLSrgk44LUXzCvJiQfuzSSm3sBXOqj65zATMGvMoEi+pNDxEO0ppjn2@lists.linux.dev
X-Gm-Message-State: AFuF++lP3CI2/Y0XRoYlOU8nE+KvkgKd8Nw48wMX5KXmBuNDZdF1Z0ei
	hRdViHgPe/rlQH4hz7e8mChAteU6L5SYw7w8+ayG04BXiJpHMw9GMp7A
X-Gm-Gg: AR+sD11gO7IrNJ0eQ3HXreR+zinm6H59AOG65CYQXCdxiFL4g6qc4ZaWzubNQr0Abyk
	HRNrnUr2KxWh6nroWiDOM57+V5L++JTzZzgO63NixsZkm8AKbyxLJ144RHXWQIzjfudomE+OVZM
	g71ovKVXyxjVeTvUYDUC9jGEIFxiUyj1cYqGLlr0X4TxnslpPukiqqasxaZWaLrdH37D7vYnesS
	bjsGSUlAxGWA9TNgN/PXR0rR6XbuRjld7KIEYRoAqJAFw9dZYowpLFJq2B85TGP28XazScHzg0N
	BBSvaYDRRDW6VeG+DzxfcyOUnP/hVUqhUaFfzjQFdnxwh1vdcrnbRLVTbnfOnA+tIg8ENc6bPXE
	jtorwuDKkc/rEQjxDVaO6mtu7hXF7aHc/OiPq84eqlwSXx6iAszH1iGhd14dCvDBqoMWmfhq8Le
	OEFwJ5p4YtaM5y1F5mDDZeOINt8vfqKpfp+T9N6PCKZXSfAuYR3JcMy+OVaSnFM+DcTukmqMJyR
	KXppJbfpQcV0RFvOOd5GmCmtF1z37M/mOle/K+LahNcmzCtIN56XmkWVc4bbO85t4Pj4y7bG4cC
	1X77
X-Received: by 2002:a05:600c:871b:b0:499:77de:78ba with SMTP id 5b1f17b1804b1-499b8458e54mr229842105e9.2.1787661197060;
        Tue, 25 Aug 2026 05:33:17 -0700 (PDT)
Received: from [10.147.179.235] ([192.176.1.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0869bsm11778877f8f.25.2026.08.25.05.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:33:16 -0700 (PDT)
Message-ID: <61f8b60e-3477-465c-b6e9-c5a76de210f3@kzalloc.com>
Date: Tue, 25 Aug 2026 14:33:14 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 28/40] dept: assign unique dept_key to each distinct
 dma fence caller
To: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "kernel_team @ skhynix . com" <kernel_team@skhynix.com>
References: <20260706061928.66713-1-byungchul@sk.com>
 <20260706061928.66713-29-byungchul@sk.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Marco Elver <elver@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Yeoreum Yun <ppbuk5246@gmail.com>,
 Byungchul Park <byungchul@sk.com>,
 Byungchul Park <max.byungchul.park@gmail.com>
In-Reply-To: <20260706061928.66713-29-byungchul@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

After reading your thoughtful comments, I tested the Clang build issue
related to "indirect goto" on a v7.2 kernel with DEPT enabled:

 $ clang -v
 Debian clang version 21.1.8 (10)

 $ vng --arch arm64 --build LLVM=1 --configitem CONFIG_DEPT=y \
       --configitem CONFIG_DRM_XE=m --configitem CONFIG_ARCH_QCOM=y \
       --configitem CONFIG_DRM_MSM=m

Tested branch is here: https://github.com/yskzalloc/linux-dept/tree/dept19_v7.2

Since the update to the dma_fence_wait() usage in the 7.2 rc, Clang has no
longer reported the "indirect goto" issue.

Link: https://github.com/llvm/llvm-project/issues/138272#issuecomment-5404767476
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e28aa8f7ee26d67a4addee6e3980f1cbf861b49
Tested-by: Yunseong Kim <yunseong.kim@est.tech>

On 06/07/2026 8:19 am, Byungchul Park wrote:
> dma fence can be used at various points in the code and it's very hard
> to distinguish dma fences between different usages.  Using a single
> dept_key for all the dma fences could trigger false positive reports.
> 
> Assign unique dept_key to each distinct dma fence wait to avoid false
> positive reports.
> 
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  drivers/dma-buf/dma-fence.c | 18 ++++-----
>  include/linux/dma-fence.h   | 74 +++++++++++++++++++++++++++++--------
>  2 files changed, 68 insertions(+), 24 deletions(-)
> 
[snip...]
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d4c92fd35092..3732849a30b7 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -370,8 +370,22 @@ bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
>  void dma_fence_signal_locked(struct dma_fence *fence);
>  void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>  void dma_fence_signal_timestamp_locked(struct dma_fence *fence, ktime_t timestamp);
> -signed long dma_fence_default_wait(struct dma_fence *fence,
> +signed long __dma_fence_default_wait(struct dma_fence *fence,
>  				   bool intr, signed long timeout);
> +
> +/*
> + * Associate every caller with its own dept map.
> + */
> +#define dma_fence_default_wait(f, intr, t)				\
> +({									\
> +	signed long __ret;						\
> +									\
> +	sdt_might_sleep_start_timeout(NULL, t);				\
> +	__ret = __dma_fence_default_wait(f, intr, t);			\
> +	sdt_might_sleep_end();						\
> +	__ret;								\
> +})
> +
>  int dma_fence_add_callback(struct dma_fence *fence,
>  			   struct dma_fence_cb *cb,
>  			   dma_fence_func_t func);
> @@ -628,12 +642,37 @@ static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
>  	return fence->timestamp;
>  }
>  
> -signed long dma_fence_wait_timeout(struct dma_fence *,
> +signed long __dma_fence_wait_timeout(struct dma_fence *,
>  				   bool intr, signed long timeout);
> -signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
> +signed long __dma_fence_wait_any_timeout(struct dma_fence **fences,
>  				       uint32_t count,
>  				       bool intr, signed long timeout,
>  				       uint32_t *idx);
> +/*
> + * Associate every caller with its own dept map.
> + */
> +#define dma_fence_wait_timeout(f, intr, t)				\
> +({									\
> +	signed long __ret;						\
> +									\
> +	sdt_might_sleep_start_timeout(NULL, t);				\
> +	__ret = __dma_fence_wait_timeout(f, intr, t);			\
> +	sdt_might_sleep_end();						\
> +	__ret;								\
> +})
> +
> +/*
> + * Associate every caller with its own dept map.
> + */
> +#define dma_fence_wait_any_timeout(fpp, count, intr, t, idx)		\
> +({									\
> +	signed long __ret;						\
> +									\
> +	sdt_might_sleep_start_timeout(NULL, t);				\
> +	__ret = __dma_fence_wait_any_timeout(fpp, count, intr, t, idx);	\
> +	sdt_might_sleep_end();						\
> +	__ret;								\
> +})
>  
>  /**
>   * dma_fence_wait - sleep until the fence gets signaled
> @@ -649,19 +688,24 @@ signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
>   * fence might be freed before return, resulting in undefined behavior.
>   *
>   * See also dma_fence_wait_timeout() and dma_fence_wait_any_timeout().
> + *
> + * Associate every caller with its own dept map.
>   */
> -static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
> -{
> -	signed long ret;
> -
> -	/* Since dma_fence_wait_timeout cannot timeout with
> -	 * MAX_SCHEDULE_TIMEOUT, only valid return values are
> -	 * -ERESTARTSYS and MAX_SCHEDULE_TIMEOUT.
> -	 */
> -	ret = dma_fence_wait_timeout(fence, intr, MAX_SCHEDULE_TIMEOUT);
> -
> -	return ret < 0 ? ret : 0;
> -}
> +#define dma_fence_wait(f, intr)						\
> +({									\
> +	signed long __ret;						\
> +									\
> +	sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);	\
> +	__ret = __dma_fence_wait_timeout(f, intr, MAX_SCHEDULE_TIMEOUT);\
> +	sdt_might_sleep_end();						\
> +									\
> +	/*								\
> +	 * Since dma_fence_wait_timeout cannot timeout with		\
> +	 * MAX_SCHEDULE_TIMEOUT, only valid return values are		\
> +	 * -ERESTARTSYS and MAX_SCHEDULE_TIMEOUT.			\
> +	 */								\
> +	__ret < 0 ? __ret : 0;						\
> +})

Thank you all! :)

Best regards,
Yunseong
