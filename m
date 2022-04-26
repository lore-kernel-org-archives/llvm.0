Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53D17B
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650997002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVgIa5VojhJQmFpaigVxKBbsCXWJBMH1RAn1ujk7PRM=;
	b=IHYEa6DzsU9l7eEvp5qJgb0VMvRnH+7v2ZReN+/xlSknx5eZxpD+vfEMFR25rIxttanlWr
	ph5dfhDKPdFBHw8gsiO73c2oyMKffUnP4tfqunOAjQ/ilVESjdMpvXDkgLdOHSZpY8C+2J
	0pc+TOH19mM8KT6+wHVPYHYYi1+rpSA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-yfhEGJD4NKOCfI_pBeIjtg-1; Tue, 26 Apr 2022 14:16:39 -0400
X-MC-Unique: yfhEGJD4NKOCfI_pBeIjtg-1
Received: by mail-qt1-f199.google.com with SMTP id ay26-20020a05622a229a00b002f20573a0faso10449971qtb.13
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 11:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fVgIa5VojhJQmFpaigVxKBbsCXWJBMH1RAn1ujk7PRM=;
        b=Y0WmvbfntpWagh2I4LFJ0UYLHQsYoQnod+TrZ+EkiELll4spHBbK20KB+S5etsgMHN
         w1OsUiENWB4HuMdhwEHo+n5+j85ueI0u8WrVXy+CI5hy/XyYCpFtm2L5HBrqPuKYo1gI
         EY5RJH8CvB6ESn072lv2SQqYD/4oC2Y1EFta5BA4vwmLZU7UHSJJWws7xm9L20Kuo7xQ
         Lnn7cH8I5QAsYzJWErtNsFLH/KOaX3HweC65l6+moHNE0JytuMvOT5CHjIWFFfoZd8WV
         MuEC3APYbRl4238u3oVcVGC85rgbovd8G5M5Ns3J6e2WcaBupdmESG453CnJY5ReL8iu
         cmSw==
X-Gm-Message-State: AOAM533m3LB4QlF4PG78A7myH4b+r47/3hhwc1ceyfCncy0G1RwuusJS
	dq6O/tcJRkVC2QuZtwz4vddHxS/C1jETmdQPv5Uppr9epJkS3OmDjBE9dqhL54b4S4GjZyD6EL9
	C84rYW+r6eHoFBZUf2fEWYK6gbc6G7cJWQjRqG+2qFiOtVoyO/bUDsv2Qf8b6
X-Received: by 2002:a37:8d46:0:b0:69e:6b77:f4c9 with SMTP id p67-20020a378d46000000b0069e6b77f4c9mr14005931qkd.96.1650996998584;
        Tue, 26 Apr 2022 11:16:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzerrK0bIUs13gQCY8RmGVefmuG6cHRoTRh0nUnFq7Yi9W2qY/3jruZ+Z2t3dFRiI2Xbx2aAg==
X-Received: by 2002:a37:8d46:0:b0:69e:6b77:f4c9 with SMTP id p67-20020a378d46000000b0069e6b77f4c9mr14005906qkd.96.1650996998279;
        Tue, 26 Apr 2022 11:16:38 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m4-20020ac85b04000000b002f363eccb2csm5954200qtw.89.2022.04.26.11.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:16:37 -0700 (PDT)
Subject: Re: [PATCH] tty: n_gsm: return -EINVAL when adaption is not supported
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220426120554.1120585-1-trix@redhat.com>
 <Ymfhtv5b9M33AQuc@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <4789ae7a-64a2-566b-d445-b8433d3f867a@redhat.com>
Date: Tue, 26 Apr 2022 11:16:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Ymfhtv5b9M33AQuc@kroah.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/26/22 5:12 AM, Greg KH wrote:
> On Tue, Apr 26, 2022 at 08:05:54AM -0400, Tom Rix wrote:
>> The clang build fails with
>> n_gsm.c:940:13: error: variable 'size' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>          } else if (dlci->adaption == 2) {
>>                     ^~~~~~~~~~~~~~~~~~~
>>
>> The else should return an error, so return -EINVAL.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> What commit id does this fix?  Any reason you didn't cc: the author of
> the recent changes to this code?
Sorry missed this part.
> Is this the same issue that 0-day reported?

Maybe, it was part of next's update today.  Where is 0-day reported ?

Tom

>
> thanks,
>
> greg k-h
>

