Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4101A460
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 20:47:55 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id n1so2862925ljg.3
        for <llvm@lists.linux.dev>; Thu, 08 Dec 2022 12:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E4OG3gIKhP9b6oDormQTANR9G0dEFN+Gu8sz+bmNZls=;
        b=GyiIPRyNAXEMxHFiqbUS7k8gnM0YtqOMoPMgDyNNYNSHQtPAjSH2tTQIuIMoGXVZ/q
         AkmD7PaBDkmCMxCDM9DvV/npcLQDeqdXJngC1JOaRo6Fes25E0BMPD+ITfi90U/oMDyR
         yUJD2rxFPoivP9sl/U8lfxKp/RoDY61tRte15Tcd55RLatKTnlBq7DonsHWPrKwfNYml
         aevbu7+Fk3F5x0GfbI7xdV8VjZoQCAo0sitM6VjuLYliQeGCWwCOzsr4JQVYAuFlKUuV
         h0+UngCqLYRE63u7lRU269/sFPxiPQJXVutKO+kaZD5+/wzRlEFDOUEFkWa2KYvWBBD5
         RBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4OG3gIKhP9b6oDormQTANR9G0dEFN+Gu8sz+bmNZls=;
        b=yg3oxo9eyYx+zMHA5ZeLQCmW/E+soA/XTsM7pDhFmIdxdWb00SvKAqizjQpeIopZG1
         4t0m8VrHW85yLzceDQdNgBQuV/CnvSX934OY1C1VdunBLMzHOtBlM3Azwu5ms0fY0GGQ
         Jq8Iq2Wq8esHBqJCfTTxMSoTIjMtj9BTyEskQny7zTVfK1O6cfqvAlwA2HPj6r8Rwnbl
         x4CBtA+rq8L+Bm+qiqWs8PUibU4J6w2fQ/9oCzvVK3ncNWb60buFf5h6hZZeqUE6aRan
         umaGYN2MjAQbG90e+XLgSNrroKmYfq/SlON3VQzAqNrqDiGPnRsAQ4emG5aYngZVPvGA
         q1Fw==
X-Gm-Message-State: ANoB5pkcjLxsySF0fc5qnkky7FvpXqw7TOdnMEzSPk3+gJ4+kD2b3ggv
	S5bcbFyYc1bmUHItA078PiY=
X-Google-Smtp-Source: AA0mqf5cA+KnSgMkBK+xmYdjKkrs0kuJ0sFQ5TsNPXSWCkaSAiqFExKhsM0FjyEkeUa3C0cdsnc+rw==
X-Received: by 2002:a2e:9b51:0:b0:27a:2225:ed74 with SMTP id o17-20020a2e9b51000000b0027a2225ed74mr1132642ljj.30.1670532473725;
        Thu, 08 Dec 2022 12:47:53 -0800 (PST)
Received: from [172.22.204.227] (ppp85-140-58-71.pppoe.mtu-net.ru. [85.140.58.71])
        by smtp.gmail.com with ESMTPSA id bf12-20020a2eaa0c000000b0027a2e0b8766sm286433ljb.9.2022.12.08.12.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 12:47:53 -0800 (PST)
Message-ID: <692bb076-dc42-8caa-3c02-c160a006e0e5@gmail.com>
Date: Thu, 8 Dec 2022 23:47:31 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Content-Language: en-US
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <8bf10097-519c-a3de-8a08-d0c5d7ddb2de@gmail.com>
Reply-To: 8bf10097-519c-a3de-8a08-d0c5d7ddb2de@gmail.com
In-Reply-To: <8bf10097-519c-a3de-8a08-d0c5d7ddb2de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi guys,

I'm sorry. I noticed that the patch below is broken. For some time now I can't send patches using git-send-mail since the gmail changed the authentication process and I have to use Thunderbird. The Thunderbird broke the line in the patch.  

I've already sent the PATCH v2.

Link:
https://lore.kernel.org/linux-mtd/805fe58e-690f-6a3f-5ebf-2f6f6e6e4599@gmail.com/

Have a nice day!

-- 
Best regards,
Mikhail

On 12/8/2022 9:59 PM, Mikhail Zhilkin wrote:

> This fixes the following compile error on mips architecture with clang
> version 16.0.0 reported by the 0-DAY CI Kernel Test Service:
>    ld.lld: error: undefined symbol: __udivdi3
>    referenced by scpart.c
>    mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a
> 
> As a workaround this makes 'offs' a 32-bit type. This is enough, because
> the mtd containing partition table practically does not exceed 1 MB. We
> can revert this when the [Link] has been resolved.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1635
> Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
> ---
>  drivers/mtd/parsers/scpart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
> index 02601bb33de4..6e5e11c37078 100644
> --- a/drivers/mtd/parsers/scpart.c
> +++ b/drivers/mtd/parsers/scpart.c
> @@ -50,7 +50,7 @@ static int scpart_scan_partmap(struct mtd_info
> *master, loff_t partmap_offs,
>  	int cnt = 0;
>  	int res = 0;
>  	int res2;
> -	loff_t offs;
> +	uint32_t offs;
>  	size_t retlen;
>  	struct sc_part_desc *pdesc = NULL;
>  	struct sc_part_desc *tmpdesc;

