Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CC107A7
	for <llvm@lists.linux.dev>; Tue, 16 May 2023 17:53:06 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6aaf52ff35bso10407824a34.2
        for <llvm@lists.linux.dev>; Tue, 16 May 2023 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684259585; x=1686851585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tOI1hYW67SjZXfGOAMASjvbTwzn47DF5rYlXPgVWPpM=;
        b=VVHHTpRXqC3V+VFxXYETdejgUe3qThzYQe2uCdWp6NI61RxmRjSneqHbHEWIYh+29L
         WY+IAveCsBjw/t9lowHvkFDGfPuz8xmO2+nTC9SdEOoCjeQ0UFk8XklDCw2Vq/5PZePu
         rBBelLWarDf7lKhGEmA1BvWwhgeWbh7sQuzpKw4iq2CwKrPmbXCSVGHeGZACCyHTSTJh
         scIQVUOG7SJVEhBOqVFFES8Q8rMaK+69ueLAo1Lfn+h3HA6pkbkkgrC6TTGj7aRF79dT
         kzsy0t8rZgrkmFG79+CcwGQ/gij6ASjeURcVOGpj9f43PO1bK+vs/5eAm/TjyPMHdUmN
         XJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684259585; x=1686851585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOI1hYW67SjZXfGOAMASjvbTwzn47DF5rYlXPgVWPpM=;
        b=URNnPcowGXHT6nrCyBi7xcN3DI2c+UVIQVofqA//BKX+sqdIaRtQLgyr2h1ZBNro30
         r+/UDUMG5x9JnAfshRIYtJWVrONwP82tjabGevNK/XkhgKz++Vtk1CtrV0cOkBy5Ai+e
         u2cY/RLhn0Mk40Ui5zq0gXGglk1CyTUref2gGct9GLIaZShELKZzoXNJXN0cwahJGRoG
         GmD3TFo030J4xiCgw3m9HbGhZAyLC3dFa0D8NVPEQ26VL/E+AWfJ+Y84kT//RRs1aB4C
         zreOLsYHymsPCzV3AW4uo0LrQzG88MIAK0VEkdobZxsYEwlhaFZkCag90fSbM8m/9Z/c
         QWOQ==
X-Gm-Message-State: AC+VfDydu0e3qqHRfIUHS7LSFm4/vzUFyNsINEw/nduS1mw+B3CD7EMN
	feCejipP1nYnSvCux8tyVnA=
X-Google-Smtp-Source: ACHHUZ5ZRxQEd6piT85OMVZwtPep8hK0vyFbEtWIgfKfIATKxhHVJs7wQvmtMQTt3s6kfkezMYepPQ==
X-Received: by 2002:a05:6830:3a8f:b0:6ab:30f3:6e69 with SMTP id dj15-20020a0568303a8f00b006ab30f36e69mr10718110otb.15.1684259585284;
        Tue, 16 May 2023 10:53:05 -0700 (PDT)
Received: from [192.168.0.200] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id g26-20020a9d6b1a000000b006a647f65d03sm4402113otp.41.2023.05.16.10.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 10:53:04 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <b8e61f82-bb1d-4778-3624-157890b1b8dd@lwfinger.net>
Date: Tue, 16 May 2023 12:53:03 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] wifi: b43: fix incorrect __packed annotation
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230516074554.1674536-1-arnd@kernel.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20230516074554.1674536-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/23 02:45, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about an unpacked structure inside of a packed one:
> 
> drivers/net/wireless/broadcom/b43/b43.h:654:4: error: field data within 'struct b43_iv' is less aligned than 'union (unnamed union at /home/arnd/arm-soc/drivers/net/wireless/broadcom/b43/b43.h:651:2)' and is usually due to 'struct b43_iv' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> 
> The problem here is that the anonymous union has the default alignment
> from its members, apparently because the original author mixed up the
> placement of the __packed attribute by placing it next to the struct
> member rather than the union definition. As the struct itself is
> also marked as __packed, there is no need to mark its members, so just
> move the annotation to the inner type instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/net/wireless/broadcom/b43/b43.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/b43/b43.h b/drivers/net/wireless/broadcom/b43/b43.h
> index 9fc7c088a539..67b4bac048e5 100644
> --- a/drivers/net/wireless/broadcom/b43/b43.h
> +++ b/drivers/net/wireless/broadcom/b43/b43.h
> @@ -651,7 +651,7 @@ struct b43_iv {
>   	union {
>   		__be16 d16;
>   		__be32 d32;
> -	} data __packed;
> +	} __packed data >   } __packed;

This change works on a BCM4306 and BCM4318=.

Tested-by: Larry Finger <Larry.Finger@lwfinger.net>

To answer Michael's question, b43legacy has the same issue.

Larry


Larry


