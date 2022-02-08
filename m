Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDD2F21
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 15:44:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218AXaZg001203;
	Tue, 8 Feb 2022 16:44:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ddNKQeBNsufwtCR82T3hW0VvpqNHVS9IOC40mmH+H4Y=;
 b=r7xz+kjguAgrfwFsWKvHgj8PszyLfubCiP0Sm9Ix80tW1MFjXbvTFgXLqOTb7v6CwgdB
 oCSg34AYk0aNVKnfP3wIlIM/vbiYxBTIcgevTazRr8y0P7jh7PskiqSjKQF6l8KlR0Ql
 kxt9VIzRQQ7jN3sKzPe7AUgjqcslVHx5lRerGl5Pxj8YS61QlE242zVsdyTSOss2myJT
 dtgjyEKvMhFwkjXAU1wgO9oVMLqUNPJ+trprw16r+NFf9dMrnoRu46SDsNsYIwQrXTMh
 c3gAdRYfYxom5aFLtg00gc4BeWUM9ZXD9CU3X82sAI1lDAI4UVzjr9PJTwK40GKW0vQo +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e37nk5n3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Feb 2022 16:44:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E317F10002A;
	Tue,  8 Feb 2022 16:44:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D584E221778;
	Tue,  8 Feb 2022 16:44:17 +0100 (CET)
Received: from [10.129.7.146] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 8 Feb
 2022 16:44:17 +0100
Message-ID: <aea58d59-9b1c-608b-7212-1d64ce2f07db@foss.st.com>
Date: Tue, 8 Feb 2022 16:44:16 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Benjamin Gaignard
	<benjamin.gaignard@linaro.org>
CC: Nick Desaulniers <ndesaulniers@google.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>
References: <20220207165304.1046867-1-nathan@kernel.org>
From: yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_05,2022-02-07_02,2021-12-02_01

Hi Nathan,
Thenks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Best regards

On 2/7/22 17:53, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>            default:
>            ^~~~~~~
>    drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>            val |= LxPCR_YCEN;
>            ^~~
>    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>            u32 val;
>                   ^
>                    = 0
>    1 warning generated.
> 
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
> 
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..447ddde1786c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>   		break;
>   	default:
>   		/* RGB or not a YCbCr supported format */
> -		break;
> +		drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
> +		return;
>   	}
>   
>   	/* Enable limited range */
> 
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
