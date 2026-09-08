Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FEE245005
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830106; cv=none; b=D2coc4X7kNjiCCedw9E3RtMlG6ud+gfrCKPigu8q3zCD4sKRhXKgALzk234VRWbCi+feOlWh4SUauj9J/viYBq6fODIi7SEmUTRd8HPQXxRg0NaRGWvfYlgFqz/gsnVmbgUa3gKY5KLo2VEAAkRMv+f2pPg6GkmydWMzFpq8388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830106; c=relaxed/simple;
	bh=Df3c3pZAGbbibAIILTdBqxvWtZ4tbPD8pFTsseGh8OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8KJiRhemBoNyXCpKD5l0L+MOdSCiozxNSscFZW5hCM26jIvQvNlLvllnvLjKCM0jVg6/mCBJlZA9z2o0Ci8TbwaFsXN8lOGzfU7r+OfK3NMKI5HaUFSSpIEpNp5jVoGf+JIG7CGyW6orCsWs9uxnQxUXdNoDnWyf9usGwWOZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFFLl59q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BB3iyeph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFFLl59q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BB3iyeph"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlDpj1329956
	for <llvm@lists.linux.dev>; Tue, 8 Sep 2026 01:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=; b=gFFLl59qdtXv1PBi
	LuXDnupIYXgbSW/PMEzRAbdnlkMK5xvBNgo0sS2x/4wbARDP3tPtKO3GWT+tOZLZ
	TV0zg52HstfOcskNBd4B8M028h8nbQlyw6dzvHuW9aNQWph5a1gazSPcZpuj758B
	XTiYfWn101zcuYS98c0cQ3atJ5OC4a4et0z5Nz4KXJ/MrDw08Te/8qRCAx7IQrB6
	H1Upz7QIa14Mjwm/hSuilIY9BNc5x4hjCOJTBsnNAko9IC1r/tiN7AouA2wZYJ1l
	uNrH4Mfz1gT9aM+n+JBY40XydlPuNFvZTPNxXpxdLEnfYMtXh5F4HLuAfRqse2g6
	AFauSQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrh239-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 01:15:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso2869106b3a.1
        for <llvm@lists.linux.dev>; Mon, 07 Sep 2026 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788830104; x=1789434904; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=BB3iyeph2LGZbWCKe4Ky4GNrDvxqlPVs1hbb+xGQVt8onc/SPZTdUJ6b4o4jzp1fNR
         nbaXmDWeJCBOZyH8UGDoB34n4SJmls6oJFqbrTDG80VfDt8nnSifcPtEfhX5YrT1TBRk
         dEu1EsWhEpN10QYUfPnfRGas9XPPRskbu/+iYizmSPmtJPEGKrlhUQqNFAI39Jxrrq4N
         BGztocPfgpT0VvuYe3gZtImViSH4nzYLIoDCA+ze3bkIFxeUQV/8WaBmamLt5deL4mzX
         nL47EuHrD5pc/OrFGbTl4asxFEGwU/++Vm+CjjeKslDcMCYkxGvsCpYdQgUJoXu1cmvJ
         M4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830104; x=1789434904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=NLpGjXt4uL8oKRYWREa5S2S8RSBg72gZCaHjJLG6lgcP84giMErStigf7XHW91JK2T
         WslIQ6tGyaa7i5bh+lBsgTfpYau2cUO6CXodxRK16sadnR3dgOV1M6GtPrXhG9up0gjR
         67dyljgfFq+zw4/rIm/Y5B2s2km47VQZeRV7DpxtJGu/3N8xjvp3CeFHaOdHoWH/SqMy
         azPTMW6ZRH3twx+7JGeyleCdluvrj0DSEudFM+LNu/G9TEWwnQST+jT8sjB3daq+7o9u
         oe37CI+1OrIcMVlNRvOOFk7O6BcXARQ7pCYv9NNPrGtNxtmUnIs+HRRC9eK9uQnkLAFl
         xs7w==
X-Forwarded-Encrypted: i=1; AKwUvBw3JzzVxA4xfgR9p+0VdwzBJ3nvnxCO/ut2MJhHdc03y5E3j8nTPre6WratxXFFWo+YQDNJ@lists.linux.dev
X-Gm-Message-State: AFuF++n5Jf2rbW8wLp9gZJj+2Qq9p8SNWNEY3rDWYHtniDUFGFKpLaHt
	IVWtU0YyZFVTHje+oB2q7LOK3n2jMsrwp+mQ+s9Ch0xDICMMoV5lLsgf91vyAfb2bSogLuRPMEg
	TPWDwqWFcgXwFWl1RPunSsMkjsQT0vx9zDOkAcYLi18QsHYBd7PxFhTC6
X-Gm-Gg: AYBFou1yAEhbq1gziKvd9rCRUhqO984h+99zCVjxSVQARnTmPb85NU6I2p8mf7taGzo
	GdAqvR9yVaBDvicUcXC1PWGq5naSgfQEMFmZh3aQT3GBPLn3fEe2cE+VXe3xk1gr+tzCCPsVH0D
	NEL8vEgVeO7rWoMOiUMVBdCmF5gY+ZcPciMptlBI7chLX8emF73VODKdE0ZpUNJu/jIAjdKJ3sq
	IBvwjHbsw50NLsLVIT5ttgsqg+m+hmHFQLGox4GUfpN5Z+VvuMfiHkOYaToUmooSg7JpeMkzkw1
	MXQ+iCRS3tMEJTU5vTkiZXg1NIOunqWZJQsaqnAiym10dWnWox0NxS1AY2gOhESsRVNZmUp9cg5
	DFYO0CfLUxNq+xUOnDCzmtDsPRtU+98G6HW2giviNPKOCGIryUhq25Ggsz5KNN1LL4foZ
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740620b3a.1.1788830103529;
        Mon, 07 Sep 2026 18:15:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740563b3a.1.1788830102926;
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615204904fsm4838475b3a.19.2026.09.07.18.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Message-ID: <ec3caf91-ac62-4d2b-8a70-f369a0c64e62@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:14:55 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfX4HOoSotW6y3P
 LuMtK0462/wn36yXjQmQnyTzEwcIXxHqmoitzpPf+ftINTH5q/7Mmeg6UDJwS/0EGGqsREWtGjN
 93XLFhpTnU/AtIzNEBRfejlH+TR0PAc=
X-Proofpoint-GUID: Mvp0w5_fWDl7CK_Tp0dk7w4lTAMAZ1wB
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9f6198 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MF1PGFG3WILMoXgy2akA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfXzgblKJ+lao1D
 GRF7CbwQqjXKf9oDd0LRDri3e3xqPSrmUnU6c838pn2k2Xb941bB1E14mMteTZS5YAX2kQe+0hT
 RBSlaB1fMzAJZD5lwTQyv5PriA9jZtBC6u0pomCeC5BIAjj51ELsAATvjy+w8hQxabUz9zCghI5
 duwtu7mc/+gId50NEASebKUHpCZi5a7eqiV/qzOl78CwNZAjsX7Av/3spAJFZLBMNiOxZPP8q9G
 Kr/BApUQ/Ngmrduudg16hzzu/RZNzqAJhYMpc8xUgtULWrUaz8G1ALqLyn4jivyiXuEn/ts8WKY
 KZiT2tw1VmjVfC/v8RmJneQmRYPC3tXno2LYS8UPOUaAXRPKzQOfQl5el/r++j3S4cpLzjQu85G
 QmzODkJvZrx41Wd6b5Ci5uuLrSPxAPgR7TRk/HxmhK9iIlkUZur805VUgvaUsi0/PlspyqX5bsb
 rb8JcWDrn09st5eIiUg==
X-Proofpoint-ORIG-GUID: Mvp0w5_fWDl7CK_Tp0dk7w4lTAMAZ1wB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080010



On 9/3/2026 7:27 PM, Konrad Dybcio wrote:
> On 7/17/26 6:41 AM, Fenglin Wu wrote:
>> Currently, when the LED is configured as a RGB LED or a multi-color
>> LED device, the same pattern is programmed for all LED channels
>> regardless of the sub-led intensities when triggered by HW pattern.
>> It results that the LED device is always working in a white-balanced
>> mode regardless of the intensity settings.
>>
>> To fix this, scale the pattern data according to the sub-led intensity
>> and program the HW pattern separately for each LPG channel.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
>> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
> 
> GPT came up with the following fixes/suggestions:
> 
> 1] This one makes sense at a glance:
> 
>     leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
>     
>     Multicolor hardware pattern setup programs a separate LUT range for every
>     component. A component with zero calculated brightness is disabled before
>     the pattern is applied, so its all-zero range is never used.
>     
>     Skip allocating it to preserve the shared LUT capacity.
>     
>     Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 24b1f570f524..e32388a16537 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>                 chan = led->channels[i];
>                 scale = mc->subled_info[i].brightness;
>  
> +               /* An off component neither needs nor uses a LUT range. */
> +               if (!scale) {
> +                       chan->pattern_lo_idx = 0;
> +                       chan->pattern_hi_idx = 0;
> +                       continue;
> +               }
> +

Thanks. I can add this one even though it is not related with function
correctness; it does help save the LUT with a simple check on the
sub-LED brightness. The sub-LED would just be turned off by gating the
current sink so the setting of pulse generator doesn't matter in such case.

>                 for (j = 0; j < pattern.len; j++) {
>                         scaled[j].brightness = DIV_ROUND_CLOSEST(
>                                 (u32)prep_data[j].brightness * scale, LED_FULL);
> 
> 
> 2] This one.. I'm not convinced..
> 
>     leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
>     
>     Multicolor hardware patterns with equal nonzero component brightnesses
>     produce identical LUT data. Reuse their LUT range instead of allocating
>     and programming duplicate data.
>     
>     Free each shared range once when clearing a pattern or unwinding a failed
>     allocation.
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index e32388a16537..1c4d550c1ed0 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
>  	return 0;
>  }
>  
> +static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
> +{
> +	struct lpg_channel *chan;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
> +			continue;
> +
> +		for (j = 0; j < i; j++) {
> +			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
> +			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
> +				break;
> +		}
> +
> +		if (j == i)
> +			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
> +				     chan->pattern_hi_idx);
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		chan->pattern_lo_idx = 0;
> +		chan->pattern_hi_idx = 0;
> +	}
> +}
> +
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
> @@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			continue;
>  		}
>  
> +		for (j = 0; j < i; j++) {
> +			if (scale == mc->subled_info[j].brightness) {
> +				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
> +				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
> +				break;
> +			}
> +		}
This is based on a wrong assumption that all sub-LEDs are using the same
pattern, so this is not correct.
> +
> +		if (j != i)
> +			continue;
> +
>  		for (j = 0; j < pattern.len; j++) {
>  			scaled[j].brightness = DIV_ROUND_CLOSEST(
>  				(u32)prep_data[j].brightness * scale, LED_FULL);
> @@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
>  
>  		if (ret < 0) {
> -			/* Free LUT slots already allocated for previous channels */
> -			while (i-- > 0) {
> -				chan = led->channels[i];
> -				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> -				chan->pattern_lo_idx = 0;
> -				chan->pattern_hi_idx = 0;
> -			}
> -
> +			lpg_pattern_free(led, i);
>  			return ret;
>  		}
>  
> @@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
>  
>  	mutex_lock(&lpg->lock);
>  
> +	lpg_pattern_free(led, led->num_channels);
> +
>  	for (i = 0; i < led->num_channels; i++) {
>  		chan = led->channels[i];
> -		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
>  		lpg_sdam_configure_triggers(chan, 0);
>  		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
> -		chan->pattern_lo_idx = 0;
> -		chan->pattern_hi_idx = 0;
>  	}
>  
>  	mutex_unlock(&lpg->lock);

