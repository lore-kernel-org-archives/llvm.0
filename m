Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE372
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632179301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g7bKpAyTX7x8C8f1trrgcEx0ZWLT6lt0pjDqefZ3l1Q=;
	b=cUUCOQBPp7qvCYC3jNreTBXpqaRii9HJevcSaWTudoIGPsaMYj78EAgjcRDrYndzGdrpEw
	0LinJMBc27NcLAXaaby3qT1IM4BFYq8xVj0hz/eeshGBd60t7riEUdjyQdY1z070eST4XP
	3c6jT1MxWsQPNUMvowxw/C5b25C2UQA=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-JOtgCN1QPV-Or6pGtlK_Aw-1; Mon, 20 Sep 2021 19:08:20 -0400
X-MC-Unique: JOtgCN1QPV-Or6pGtlK_Aw-1
Received: by mail-oo1-f71.google.com with SMTP id s20-20020a4aead40000b029028b41986b27so45266086ooh.14
        for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 16:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g7bKpAyTX7x8C8f1trrgcEx0ZWLT6lt0pjDqefZ3l1Q=;
        b=58R32Io+ZDSn7jCBO+KenUg3E56hR3Mwgld//LpFuEBcJzWLbXPEe6Yk/N87IluaAm
         NoND0/GQx9lqzpvoSig+/ly4L/5mUAV0Y5k4k42TRoGbyPgPWnzrIE7vzhgKak8KEsGG
         FPlrKewV+SH/mXvuHkupUW9JyLkSSzNsWnVrpGRKi4ddy89enJSS4G9KVMLwOuSfSp0/
         REJP81tww9jsbiBgneQyhbJR6BNFslrAjUszSleaBc6WUpeqJTKtNgb/GQJK7K+D3JXc
         JpSgPhXEXftVoewdEeqjYdK+PZGo5ZGs94hE3lCUalY2YH+J9LJRif/lg3SsIG5Bms52
         J1vg==
X-Gm-Message-State: AOAM53138jYWjwSmI1ol8IacMG5Vb7WykurkszOtSnpbVeliFZcMISE7
	yDlLwiqd3MljvFrUOyS1nmSaXD+yn8LVVnViPcW5fWXUvjruPiEW+HX2iRMCy1AJuYsWnEC/Y5z
	LyVShbWoqoWhDxg==
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr21991979otp.159.1632179299857;
        Mon, 20 Sep 2021 16:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLp/e5IRrlOF0BrSHhE7BuQByvaS73fu5gWXW17CjzvDKE8uc/ZdiPcjOkFCctyn4D2drE1g==
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr21991968otp.159.1632179299636;
        Mon, 20 Sep 2021 16:08:19 -0700 (PDT)
Received: from ibm-p8-rhevm-15-fsp.mgmt.pnr.lab.eng.rdu2.redhat.com ([12.183.173.244])
        by smtp.gmail.com with ESMTPSA id d26sm837804oij.49.2021.09.20.16.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 16:08:19 -0700 (PDT)
Subject: Re: [PATCH] octeontx2-af: fix uninitialized variable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
 jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
 davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 schalla@marvell.com, vvelumuri@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Colin Ian King <colin.king@canonical.com>
References: <20210920165347.164087-1-trix@redhat.com>
 <CAKwvOdkSt5VymxtJ4jmOe9LM1rdy+CV7yYXhjCgOFAgbKGEPfQ@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <9926e65d-6083-8d9d-efa2-a755c411ea03@redhat.com>
Date: Mon, 20 Sep 2021 16:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkSt5VymxtJ4jmOe9LM1rdy+CV7yYXhjCgOFAgbKGEPfQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/20/21 3:22 PM, Nick Desaulniers wrote:
> On Mon, Sep 20, 2021 at 9:54 AM <trix@redhat.com> wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Building with clang 13 reports this error
>> rvu_nix.c:4600:7: error: variable 'val' is used uninitialized whenever
>>    'if' condition is false
>>                  if (!is_rvu_otx2(rvu))
>>                      ^~~~~~~~~~~~~~~~~
>>
>> So initialize val.
>>
>> Fixes: 4b5a3ab17c6c ("octeontx2-af: Hardware configuration for inline IPsec")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks for the patch, but it looks like Colin beat you to the punch.
> In linux-next, I see:
> commit d853f1d3c900 ("octeontx2-af: Fix uninitialized variable val")

No worries, those allyesconfig breaks are easy to find :)

Tom

>
>> ---
>>   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
>> index ea3e03fa55d45c..70431db866b328 100644
>> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
>> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
>> @@ -4592,7 +4592,7 @@ static void nix_inline_ipsec_cfg(struct rvu *rvu, struct nix_inline_ipsec_cfg *r
>>                                   int blkaddr)
>>   {
>>          u8 cpt_idx, cpt_blkaddr;
>> -       u64 val;
>> +       u64 val = 0;
>>
>>          cpt_idx = (blkaddr == BLKADDR_NIX0) ? 0 : 1;
>>          if (req->enable) {
>> --
>> 2.26.3
>>
>

