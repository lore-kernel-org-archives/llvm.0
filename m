Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614A3321A2
	for <llvm@lists.linux.dev>; Tue,  9 Dec 2025 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285566; cv=none; b=XTmKczV5QGwRKUuVufD38LDRgC4h1MIB06kHrvHJXcj4TEgIZSWXKDmm+TltuIJrSWdpZm0dalW755JQra0PVdxYJ/hECLymM4vSBnWZpcChCW2Tqmutnm9ZgTh4uj9E/UDa5ar1vLNVHgSraFEUQT9r21T0R2Yn/dB8ItsnUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285566; c=relaxed/simple;
	bh=5bEfNbrVrbCSOM4MufNJJgr8UqeswnkNURaK3gVvleE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fu+dpXvbZajfCMFSI5l1gRNUGqwyC3LzbCTuXbi93OWk+3qQECzbm9GKVcdyeE/XVR0Qnw+TlEBZrji0xAmcE8Nr23hO/HT0HEN1ksYGBabB6rLtKl0N/3bMayyMZDeaSMYkUNIBSjN+d1SquWGfqg78wEaAZ5AIuZKg2ILIPWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUW2y1T3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUW2y1T3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so39497315e9.1
        for <llvm@lists.linux.dev>; Tue, 09 Dec 2025 05:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765285563; x=1765890363; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5XfE5K4iEaC0LFtxMogcKT/LpGujZVN83mgtnotves=;
        b=tUW2y1T3au1oxzvvsYUmxXwGri1G0fHHxR0puUqiu32dafzDOnm9g2J9bqpqsNOnDm
         2m74ou+3TEfNgpAw2DQdCAIf+sXMv9VRpIFIzMuhyehCU46HmW5pFP5d/QP0NM35mkJo
         s+CpehuRqs/zcdfQqWa5LhVWCMpTI6h1iY4TxNFFdT9ITqselHJtYyO3bL4PpWe0f1ND
         j6si7oBqaYwXLOecmHCMycf3xwADku+70g6w70WhzJFWhgZYeWilsvBkPMIIRBAWWejV
         nnFtahqqgxTkIBSxppBKBqyQaspRhw8cTc4b0u/3VdeVOHuEqOenyQp8fnhFBNpQtEEy
         7aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765285563; x=1765890363;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5XfE5K4iEaC0LFtxMogcKT/LpGujZVN83mgtnotves=;
        b=dEMd1KySccKoquXOn1vYmc7x2XseLFu1EWDw+ygxN8j3fnCyfCSh4WtZ88qNvwmymU
         8+0Eu4vs6VIH5DID/4J5Mc3Q39hPyJ4UUulA0FYYt2wIFyScHvAxP0tq4xqLkPh7RvVK
         PWTOXzscG7+MpQ9gP94E3YlHKt2mL+8BM6JQv0CdUZ/Z4kIk+OoUubknqrFVcbdSu8qn
         0j8z4bUfDFFVilLG/ZmpS3gvEdKnf4XF3GCkFDsgS2GPWGlr8IiHd/0Q04CEQXLkX4o2
         SeRZO7KjmdSQqWlHT15OKX4c9QLEUZOyWLThTlNYh2xOEbErVWxsKzbHKq6I6Dg7rTuz
         ey0w==
X-Forwarded-Encrypted: i=1; AJvYcCVBmRnARbEkEwttkU/eBaoIMN46hcptB8PmvJUg2zM2IMbfLbtXYIvdyj5Zm/2JGu8JzPQ8@lists.linux.dev
X-Gm-Message-State: AOJu0YziWOEbXEvmB4x/3Wuq7yXMr0BYnvMDkZ7E8As2zSDsUFEA9pdU
	Sp6jVIjwpFsH1pUwjzKtM8W4+ebJb4WnH6ZADkwdIbAWytw8hmPtg7Ve3WFFjGw9yCJ6vBdl4JQ
	rJULa
X-Gm-Gg: ASbGnct+uQQwuEcTrAWLnGNZ2CuIf/O2+LDQ+56dX+Lo0ozMUdstPVblJaMfF+CDSmd
	QxzNCBfKtdjyMac7dxzXvJJlv1bixAJrfVtoLLbk4Iy3yzbXlDE2a4zSElBbQnM/q7CcG3lSE4F
	d7UVLXiT0+jp7yjhCOaCz/+82Y28zVKpi0s9KNxvO8Cl8K/CCIFvVUX/3+ZrlvKkindIjjjjHis
	yxrW1i8asXsiThBh3yzzOMhHa8sNJHVYiMKGnljVctBGYQIsGHxJregXMPIHAl9sbyPHZ4OJm02
	LZ17a8dOZoXu6Qlct6B1Qk0TtSeU3QUHcmVlwfvHtRkuluG987ArdtXSwfwpJcN4qZIUUcCEq5t
	r6LrDkA4PY6ttdrepaOtL/vFavB1IYIkF+hFus/2knUWkq4rjs1a6GrFZwpv060GjvO8v8TpFNv
	LuBxMKDwtqul2zM+S+
X-Google-Smtp-Source: AGHT+IHWmUePB12RnPZIMlyymiQnecyOrGf54NEwAysFPvL4/oTjTx6tdoRiHeSlPVbl55vaudVk/w==
X-Received: by 2002:a05:600c:8b52:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47939df3089mr90298785e9.5.1765285562509;
        Tue, 09 Dec 2025 05:06:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d58609esm39608895e9.0.2025.12.09.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:06:02 -0800 (PST)
Date: Tue, 9 Dec 2025 16:05:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-hardening@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	llvm@lists.linux.dev
Subject: [bug report] clk: visconti: Add support common clock driver and
 reset driver
Message-ID: <aTgetqy8BGerPGTl@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kernel Hardenning developers,

Commit b4cbe606dc36 ("clk: visconti: Add support common clock driver
and reset driver") from Oct 25, 2021 (linux-next), leads to the
question:

drivers/clk/visconti/clkc.c
    187 struct visconti_clk_provider *visconti_init_clk(struct device *dev,
    188                                                 struct regmap *regmap,
    189                                                 unsigned long nr_clks)
    190 {
    191         struct visconti_clk_provider *ctx;
    192         int i;
    193 
    194         ctx = devm_kzalloc(dev, struct_size(ctx, clk_data.hws, nr_clks), GFP_KERNEL);
    195         if (!ctx)
    196                 return ERR_PTR(-ENOMEM);
    197 
    198         for (i = 0; i < nr_clks; ++i)
--> 199                 ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
    200         ctx->clk_data.num = nr_clks;

ctx->clk_data.hws[] is __counted_by() ctx->clk_data.num.  Don't we have to
set the .num before we fill initialize the array?  Or does the checker
code allow us to access the array when the counted by variable is zero?
I seem to remember this used to be a common false positive with the counted
by checking.

    201 
    202         ctx->dev = dev;
    203         ctx->regmap = regmap;
    204 
    205         return ctx;
    206 }

regards,
dan carpenter
