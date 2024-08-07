Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA51B32A8
	for <llvm@lists.linux.dev>; Wed,  7 Aug 2024 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723012000; cv=none; b=qtCBlkTGYaC5o0s3kWyYe9QZctn0JHtXyu+z3S3mQg+54M8W3jo8T899MBPzfXb14wT0MuPhtuQlJWxILysbPHLWwOYZ/1VCTr7y2ITLe2WVXM7p8hoM5CdQDkZsi5jC6yvyWXXqX9MFoAPpVe11nme559YQBupfJHb64sQHXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723012000; c=relaxed/simple;
	bh=SmflkcuMDJIW8naPbm/v9DBM5XF4zog+gRlw/8dQf7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gW/uJCugUwGO52OYduTK23IWwqlD+nfT9IJamIX7d3zANIICqJl/owVFlPnk1YL4tKr7/9hzNMLH9HxwkODI0ddg7ZhbDMQRzomI1WW1naA6G5gGrEdm6igGxYqQVsHJjuWz5NVCFm92VAOWUqJxJ0eg56RGjOkBB0hHpgNmYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+YX0VAG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+YX0VAG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7107b16be12so1148235b3a.3
        for <llvm@lists.linux.dev>; Tue, 06 Aug 2024 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723011997; x=1723616797; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xgv4Lz4y4hdpusu1y11h6gCcVe+Xzav2jc2y5Yt+/PU=;
        b=K+YX0VAGQ6LOjkS2ygdbaAL1wWPIMGVTlAt29GE9i5YixsvVi0Wc3GDSCK0Io4m93I
         I3Qij0dJDEU5gsTzmHWKYikb1DMk457aKleKWUjaueaZYY/TmhX0+aMLhERuGa3oNsjt
         j8O0WHKGnd3Y4sfhMROxKelXXEgm410deIm0MpF3XU+j9LXHBX0Bq4/XaJCRHDlayae5
         K97RTc2AADTYSB8hI52PWqCUoCFowyFKR+tJB0xSo6G2k2k0XcvmuTJQycMOFEFnJBBr
         SDxFJEBYJlx+pUzTW9oFYQ33lNUQ+l0Lj0cYyspA96lmnp3fTe/gfRDPzRMwDLdPbvmp
         Qw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723011997; x=1723616797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xgv4Lz4y4hdpusu1y11h6gCcVe+Xzav2jc2y5Yt+/PU=;
        b=gg515yCDGR98CLyisvxtNFSY9BDv8L2nmKMfu9sC71kE2WBhUw7j8UpptT79/Pu+lT
         2+FPbKJyVkI7BKz7ZSMAOHJ3LN/h9Igm691rikY6N9zvyCdTVrvz0bdDMVIJcR0IIpbE
         5zAXuBrVfiPbKjxt9h4w0ARb+SzoXNP0B0nqKCR1aqZlS0nBcThXTH/xO0a1PvuvrRqV
         lixK+HFLMVWj0dE0TPwXF/71p25ugZnffugQmp0ZXtwmUwanr3kE712EPWyJfgrOF9gf
         mOpL02sKoUY2oRl44VtIIciaXdLcVrCUgfnWnWCOh7kD7ZtD+/c9bvU5kodjteNkOBA9
         actQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmLv7IMCNWC8smbpvqLMEDfNqGS/BFafez3teI6s+3H4V4Dh9UDYIE3HKAh3V4hYvinTyYovMX6Iq1bdSh+4k0Gouz7Q==
X-Gm-Message-State: AOJu0YziB1lD8gZvFFUYUKeeCVBxIggSHlbRiR0mkbza0SjwFCEaf7K+
	zaP6NsSu6uNGnm+29MeZdB/CgP2Y7+i1ZprzS2BEPOJaBtZ9Pko2ZBh9HUT9Ww0=
X-Google-Smtp-Source: AGHT+IG20fXp71pe3D6UGQgRh1rVmAZGcmBn1yO/PMuCn4PndSdnVchYjgLooIp6izXKPApmK0kzPg==
X-Received: by 2002:a05:6a20:4323:b0:1c4:8492:88a8 with SMTP id adf61e73a8af0-1c699580a57mr19116232637.19.1723011997207;
        Tue, 06 Aug 2024 23:26:37 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b372e028sm640455a91.45.2024.08.06.23.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 23:26:36 -0700 (PDT)
Date: Wed, 7 Aug 2024 11:56:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	kernel test robot <lkp@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] cpufreq: spear: Fix uninitialized variable "i"
Message-ID: <20240807062634.egqwyeqwjpvwjwsb@vireshk-i7>
References: <20240805202042.3229190-1-robh@kernel.org>
 <20240806044928.2j6z2ucnzk6lg5y3@vireshk-i7>
 <CAL_JsqLVj2sCuQFYFwR8QnB9jHq_9z4axeNzid1d7+ZrWzmgYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLVj2sCuQFYFwR8QnB9jHq_9z4axeNzid1d7+ZrWzmgYA@mail.gmail.com>

On 06-08-24, 10:08, Rob Herring wrote:
> On Mon, Aug 5, 2024 at 10:49 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > We don't increment 'i' anymore, don't we need an i++ in:
> >
> >         freq_tbl[i].frequency = val;
> >
> > ?
> 
> Sigh. Yes.

Fixed the original commit with this, hope this doesn't add any new
bugs:

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 777f7f5b3671..d8ab5b01d46d 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -173,7 +173,7 @@ static int spear_cpufreq_probe(struct platform_device *pdev)
        struct device_node *np;
        struct cpufreq_frequency_table *freq_tbl;
        u32 val;
-       int cnt, i, ret;
+       int cnt, ret, i = 0;

        np = of_cpu_device_node_get(0);
        if (!np) {
@@ -199,7 +199,7 @@ static int spear_cpufreq_probe(struct platform_device *pdev)
        }

        of_property_for_each_u32(np, "cpufreq_tbl", val)
-               freq_tbl[i].frequency = val;
+               freq_tbl[i++].frequency = val;

        freq_tbl[cnt].frequency = CPUFREQ_TABLE_END;

-- 
viresh
