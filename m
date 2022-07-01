Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E871C2B
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656679493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+o5MyxcdFm69IVhspSeG0AkjywTJdVF99yclwN4/5Q=;
	b=Ijld7IVESORa/lyTsNOrWiwkyb1GdP/A/t2iP2tDe4iVQTSFfB2B/147LO/QdgqcwtDG+2
	7NXsNy6olrtmoGdQesMLa+D4Lf/hkJu0azO6PfpGhfXcBmOGFhnnILWRgdqbzHZZ3IVC/i
	KSF+kZJudyie1ovZ6rzAjtE2q4p2PZw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-8hYwEncRMSy8Km2-Ekx7fQ-1; Fri, 01 Jul 2022 08:44:52 -0400
X-MC-Unique: 8hYwEncRMSy8Km2-Ekx7fQ-1
Received: by mail-qt1-f199.google.com with SMTP id d4-20020ac86144000000b00319586f86fcso297032qtm.16
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 05:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I+o5MyxcdFm69IVhspSeG0AkjywTJdVF99yclwN4/5Q=;
        b=2TfA6ASDKvqYrpLamUdRyaA1bK51P6usOLIFb2nc61O6EfC8vBc85K93OpG/b4XXYA
         5H92vGdcE80JXrhuU8oZ5VZWJscwZZfi/xMdDE4aHF7Mlb/7vSLdVuK0BrBOEeu7Sl7R
         HxUMc6qn/lNqI254hecpJ8K9xAKaP7pk9eCnVkXJc6/A5vMB/gcdBbkgZ0Z0tKItqh/H
         R1fjeq0EjZPM4OCdsoP9ZEHJkEIufzXozwpWmCxY0WhfXrBgX1SAk01dZgnUNzOdm7ht
         vP6H0Nexw3DwiGC6KD2cNKs9wM2R9PRHEZtlQU5ezH2jEuAixphYpyA6iNpQEY1qftuc
         DgPA==
X-Gm-Message-State: AJIora8KAuzi7HrLwfsh2sGlqseSm6gxtTLJ1Wqy0/SmfQ8dZhR6ys7p
	QwUc8x3rcUhC8nOgItI8I+74LskkBxSuCJGTvc5octaowq3lu8IiOHKXeV6SX7X0tSBOWigJ2SA
	LKr/hscbSNVARDA==
X-Received: by 2002:ad4:5bc2:0:b0:470:4c7d:db56 with SMTP id t2-20020ad45bc2000000b004704c7ddb56mr15998253qvt.90.1656679492048;
        Fri, 01 Jul 2022 05:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viqT6xeFd0NMURnXk6opeDjr9vD5bRyRLn8iOY+Kor2kuqlGnPO3IzIZsmjH53M8mj5JDEUA==
X-Received: by 2002:ad4:5bc2:0:b0:470:4c7d:db56 with SMTP id t2-20020ad45bc2000000b004704c7ddb56mr15998236qvt.90.1656679491792;
        Fri, 01 Jul 2022 05:44:51 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bl34-20020a05620a1aa200b006af34a1a897sm11029924qkb.65.2022.07.01.05.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 05:44:51 -0700 (PDT)
Subject: Re: [PATCH] HID: core: remove unneeded assignment in
 hid_process_report()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220701112720.13452-1-lukas.bulwahn@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <fd94d2dc-04ed-f041-f148-8f361f215441@redhat.com>
Date: Fri, 1 Jul 2022 05:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220701112720.13452-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/1/22 4:27 AM, Lukas Bulwahn wrote:
> Commit bebcc522fbee ("HID: core: for input reports, process the usages by
> priority list") split the iteration into two distinct loops in
> hid_process_report().
>
> After this change, the variable field is only used while iterating in the
> second loop and the assignment of values to this variable in the first loop
> is simply not needed.
>
> Remove the unneeded assignment during retrieval. No functional change and
> no change in the resulting object code.
>
> This was discovered as a dead store with clang-analyzer.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Benjamin, Jiri, please pick this minor non-urgent clean-up patch.
>
>   drivers/hid/hid-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 00154a1cd2d8..b7f5566e338d 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1662,7 +1662,7 @@ static void hid_process_report(struct hid_device *hid,
>   
>   	/* first retrieve all incoming values in data */
>   	for (a = 0; a < report->maxfield; a++)
> -		hid_input_fetch_field(hid, field = report->field[a], data);
> +		hid_input_fetch_field(hid, report->field[a], data);
>   
>   	if (!list_empty(&report->field_entry_list)) {
>   		/* INPUT_REPORT, we have a priority list of fields */
Reviewed-by: Tom Rix <trix@redhat.com>

