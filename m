Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB47C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 13:06:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s21so6072509wrb.8
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lEv5+jYrj0q7Pl/6hwb1B3vffo3o9jubOYC/onWE6DY=;
        b=AUo6XnV+thU0M2HffAvNKN3RXHqvj9b2wX7+yY/B7PmYGPvGH8BODt0RBPPvAW3DRM
         I9eKpcz2UTpvIuJPl9n9OYGIrM5sSfh4kfYSe8yB0MWSQbXYdlLM3u8FXS6dvS+3dvNL
         7+VdknJxYxBns9CRVgWyBfjwIuKJK+VWIJ4iA1vUQUHwk8sfGRfVD9ztdF6LYHlapgT6
         dtgeKvaTElS2q/DDyMRwgBQTJB9vj04FjMq+rVbegSDlaoNX5p2/ZqYXSwnWecKVZrN4
         cdyVcXok9e2pkdVhrmLmijbgS3sB07EZUdQvKxPjGYOQRidiR7U5mpHeBGjJa2YDIa2X
         5+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lEv5+jYrj0q7Pl/6hwb1B3vffo3o9jubOYC/onWE6DY=;
        b=Jyk6hnnVeWFIe7CHtbMA8bqcMK0nI3y7Cx5QAQ8pe39A/ME/1PfDXDkVCMAnknbiFJ
         1uzqmavnrTYXK0e2H50WxjOAXf3MtbMghxz1fOd/ujtzjUeJNgRYBJDgrBX7CQuIsXq5
         aUG0Uhnh8FUp69+BWWwzUH4PJSUaHBCa2Vz+CK9+/KMb2p8NzUf4YY6A/0vDNewEVsZR
         fY4we2QxUZzjko2jg5Qz5m7YXluDmzss3taPz29wFcbh9aUUejRGFd/eDomLfZtjOR0x
         heygcIBabFeLVeUvZvTLBFRjKBESXz1n+x4J0LpcOcEj+NGrgI/MNN0LHVCEREnwB0J1
         S1NA==
X-Gm-Message-State: AOAM533smvWuTolhWEs+0LNubHyz9bBAX2dsPLAiy/JCh7f3qrWx21hC
	fpNa2gDqgUl4wZUhJGClOOM=
X-Google-Smtp-Source: ABdhPJzFFaBx8LnydOc9WLE53TfXFxku7x50G2R5+TUJO7xCAHgAq61t/xgkhesT9w4bTgw17mw9aQ==
X-Received: by 2002:a5d:6806:0:b0:20a:db0b:ad9b with SMTP id w6-20020a5d6806000000b0020adb0bad9bmr4347423wru.294.1650891982346;
        Mon, 25 Apr 2022 06:06:22 -0700 (PDT)
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id e16-20020a05600c2dd000b0038ed449cbdbsm11984698wmh.3.2022.04.25.06.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:06:21 -0700 (PDT)
Message-ID: <d9bc3dd2-e33e-6756-8493-50788057d172@gmail.com>
Date: Mon, 25 Apr 2022 14:06:20 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] kernel/irq/matrix.c: remove redundant assignment to
 variable 'end'
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220422110418.1264778-1-colin.i.king@gmail.com>
 <87sfq11fkb.ffs@tglx>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <87sfq11fkb.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2022 14:02, Thomas Gleixner wrote:
> Colin,
> 
> On Fri, Apr 22 2022 at 12:04, Colin Ian King wrote:
> 
> can you please stop using file paths as subsystem prefix in the patch
> subject?
> 
>    https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
> 
> I fixed it up once more, but you can really spare me the effort.
> 

Apologies. Will do next time.

Colin

> Thanks,
> 
>          tglx

