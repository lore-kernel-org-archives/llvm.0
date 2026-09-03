Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0594078C3
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428163; cv=none; b=BCtqD5B9QWola2LfeqOz26spvDZsV5yZtjlaEgq1R9dWa7EeSDyJNGg2I5FT8r0Focv9l7ieZh7zHYqCgxeN1GNnZoMaSXQ+UGQpUlxcvi0fbHDbmkbZcmhcDfSWq0/LhFlShHBCjqlpp4AMnwcwlITTM5kBbcOPFPh4X6ixUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428163; c=relaxed/simple;
	bh=oPVsqXoZyPeTg36URmaN5Iw3DnLJlzjYxHnkAlYg7Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gjiw+bVD7vCKuYGieAJ4D2+pVLeIuUCMQzuF207725+3b9NtNIlQwww5bUNvML8pHIbp+uB2TdQ65gcxCPBDP2o1+cICz1ES/NRcXwovfXzU0RUEulLTgHuktnDadSBhUBwlkk9Pq/DnKnL9UQrqAndTGf6pOxaY+PVl514dfCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLkOi2Mp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLkOi2Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788428160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIVrwf02TP+O59kLnBOVNF6PWYsBEmmPNbrz+e5p2HQ=;
	b=PLkOi2MplsqDOUDIt7pNf4JE3Pofp6e6YbLbn5ZhCqJO/lBWX/crAx4TZmmQCDbxA6xsqq
	/nHovelAvRBjwmlTUEA6aDfUVlgL3GydKQcxyAQUwSOcrrl1X++DxVZOdGb5StE8qJkbci
	POcEtiw5rymYys3Pyp5v9BFGt8/LJ2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-XWfRrTY9OVaRhwiYzrty8A-1; Thu, 03 Sep 2026 05:35:59 -0400
X-MC-Unique: XWfRrTY9OVaRhwiYzrty8A-1
X-Mimecast-MFC-AGG-ID: XWfRrTY9OVaRhwiYzrty8A_1788428158
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495529a93f9so20015345e9.3
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 02:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428158; x=1789032958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIVrwf02TP+O59kLnBOVNF6PWYsBEmmPNbrz+e5p2HQ=;
        b=G1hgUgU0ZjRK+TaMQHRaERdTjHZ4/+1rLch/fIcFZ+f/NotsW4TbfmL8OpH9KsbQrE
         LIgfrkycImuwXCCPiZxQ5vTN4+1DZ54fZStCs6MoRBqHGrvr0SDujIkwyVORKkfu1JjC
         sH3mn4pzJDPocIDMebRLvyJji1eiAINjDPoF4rGlIvlReV4dTfv1zU6dUAB0YHAMw8O+
         Rkb84GC3lcGPnpXyfbJ4NKz3kJxp1NtQv+I+/lnmCQo8zDKaHIzGpH3aeC/iR9RbzTFI
         hk7zNkgPozAaV9NSfSyBXg+PVNEN2YWaivwhgngvixMF9pa08pUgxQGHRKCU+T5HE1gk
         Q8HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLGZ8Fs/wKRUS2byQwU6/z709a2vyZACqnay0QEeM6rlUh4kZV4gaiNxZ4TvKBPyLAw/Tp@lists.linux.dev
X-Gm-Message-State: AFuF++lw3NgyBuzCKxrEiqFRWvzRQvygGU5vzbTy/pNCMRdVUFsc2ZlM
	4kGXP3O8JgVg6L8FjDsTaU6UrNkOErSN5SQYWpyvI/+bPCKy4s2wzyk5VUYNvCKFqN2+gAxtpKt
	6/iLQffOpaZhitf8xNyW+F1aUXtMnCYoXJssBo1RB5WOygoYBiHkvE94=
X-Gm-Gg: AYBFou0hKdX87fD0lCTb7xRQNFbVlrC3se/txzErQVFs26T6/LuJZQn/BUN/7bVbXoA
	xlG/Ia+rh3iEZqZDbnARRmWpIbm2W8wEef+xZAi63FBtIoCs4R1oXHol8c90M890kmz12aWxxY9
	N6OpjN8nrjF5hsCXKSUV+QdPHv7zK/IX0zuO+/PLdCaeBaAE2erR1eD5cne8Kqthvii8b54Rrdy
	jo31vCaGfJq8ovQd7JuPsjEJZu/MtR4hLHFN9I9XLAzfjImapUEfs3Oc0I22NOqNHibTZWBemOz
	74+TKN706UZS33MDoTua51f5o86LMya7Acs1JK+INi1gn1oScQwUrheUCdjjWbBwCK+BBx9jlIB
	vk2FdrawraCNoL87Bxp10PygJ29PXQTmHHXKA3VxCRGtia+SlBpnQc5Hd8ioGkSfbLuzrjE8cxQ
	==
X-Received: by 2002:a05:600c:4693:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49ce5817d63mr163904785e9.9.1788428158022;
        Thu, 03 Sep 2026 02:35:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4693:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49ce5817d63mr163904005e9.9.1788428157541;
        Thu, 03 Sep 2026 02:35:57 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm81914915e9.2.2026.09.03.02.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:35:56 -0700 (PDT)
Message-ID: <8f1c4df1-726e-4bcb-addc-b1fcf329013f@redhat.com>
Date: Thu, 3 Sep 2026 11:35:55 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
 colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
 raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
 <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
 <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>
 <apbpWrfu3VQu+CUz@devvm20253.cco0.facebook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <apbpWrfu3VQu+CUz@devvm20253.cco0.facebook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7QKG9__rv8SoMYgMQVStoDVMxGezyQpCiglfXlRirWs_1788428158
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

sorry for the latency here.

On 9/1/26 5:03 PM, Joe Damato wrote:
> On Tue, Sep 01, 2026 at 02:10:04PM +0200, Paolo Abeni wrote:
>> On 9/1/26 1:57 PM, Joe Damato wrote:
>>> On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
>>>> On 8/28/26 9:08 PM, Joe Damato wrote:
>>>>>   - Moved bp->max_tpa_roundup_size init out of the early return path and
>>>>>     documented that TPA is unsupported there, as suggested by Michael.
>>>>
>>>> Clashiko quite convincingly elaborates that the above is not enough:
>>>>
>>>> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
>>>>
>>>> Could you please have a look?
>> [...]
>>> 3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
>>> device whose firmware reports max_aggs_supported == 0, does
>>> bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."
>>>
>>> Michael commented in the v3 that this is a false positive, hence why I changed
>>> the code from what it was in the v3 to this.
>>
>> This is the comment I referred to.
>>
>> AFAICS the problem is that the driver sets
>>
>> 	bp->dev->hw_features |= NETIF_F_LRO;
>>
>> regardless of the supported capabilities, and that seams to disagree
>> with Michael.
> 
> OK, after re-reading this here's what I see: NETIF_F_LRO gets added with no
> capability check and bnxt_fix_features() won't strip it afterwards. I think
> the fix there is to add a BNXT_SUPPORTS_TPA() test, as a Fixes for
> f0aa6a37a3db ("eth: bnxt: always recalculate features after XDP clearing, fix
> null-deref").
> 
> I can send a separate patch for that, but it is unrelated to this patch which
> fixes a crash on boot for Thor2 devices.

With my limited knowledge of this driver, I thought the report being
more strictly related to this patch, and the fix for them should land
together.

I'm fine with v5 approach.

/P

